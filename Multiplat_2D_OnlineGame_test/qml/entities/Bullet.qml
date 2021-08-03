import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: singleBullet
    entityType: "singleBullet"
    x: start.x
    y: start.y

    property point start
    property point velocity
    //property int bulletType //pistol, rifle etc...

    Rectangle {
        width: 2
        height: 2
        color: "black"
        anchors.centerIn: parent
    }

    BoxCollider {
        id: boxCollider
        anchors.fill: parent
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

            if(otherEntityId.substring(0,6) === "player") {
                singleBullet.destroy();
                //player damage function call once implemented
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
