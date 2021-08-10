import QtQuick 2.0
import Felgo 3.0
import"../entities"

EntityBase {
    id: singleBullet
    entityType: "singleBullet"
    x: start.x
    y: start.y

    property point start
    property point velocity
    property int damage: 20
    //property int bulletType //pistol, rifle etc...

    Rectangle {
        color: "black"
        width: 4
        height: 4
        radius: width/2
        anchors.centerIn: parent
    }

    CircleCollider {
        id: bulletCollider
        //anchors.fill: parent
        radius: 2
        x: -radius
        y: -radius
        collisionTestingOnlyMode: true
        //        density: 0
        //        friction: 0
        //        restitution: 0
        body.bullet: true
        body.fixedRotation: false
        collidesWith: Box.Category1 | Circle.Category1

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;

            if(otherEntityId.substring(0,4) === "char") {
                singleBullet.destroy();
                otherEntityParent.getHit(damage);
            }

            else if (otherEntityId.substring(0,4) === "enem") {
                singleBullet.destroy();
                collidedEntity.getHit(damage);
            }

            else {
                singleBullet.destroy();

                //animation here?
            }
        }
    }

    MovementAnimation {
        target: singleBullet
        property: "x"
        velocity: singleBullet.velocity.x
        running: true
        onStopped: singleBullet.destroy()
    }

    MovementAnimation {
        target: singleBullet
        property: "y"
        velocity: singleBullet.velocity.y
        running: true
        onStopped: singleBullet.destroy()
    }
}
