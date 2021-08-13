import QtQuick 2.0
import Felgo 3.0
import ".."

EntityBase {
    id: singleBullet
    entityType: "singleBullet"
    property int damage: 20

    Component.onCompleted: {
        applyForwardImpulse();
    }

    Rectangle {
        color: "black"
        width: 4
        height: 4
        radius: width/2
        anchors.centerIn: bulletCollider
    }

    CircleCollider {
        id: bulletCollider
        radius: 2
        body.bullet: true
        body.fixedRotation: false

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
    function applyForwardImpulse() {
        var power = GameSettings.akBulletSpeed
        var rad = singleBullet.rotation / 180 * Math.PI

        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        bulletCollider.body.applyLinearImpulse(localForward, bulletCollider.body.getWorldCenter())
    }
}
//    MovementAnimation {
//        target: singleBullet
//        property: "x"
//        velocity: singleBullet.velocity.x
//        running: true
//        onStopped: singleBullet.destroy()
//    }

//    MovementAnimation {
//        target: singleBullet
//        property: "y"
//        velocity: singleBullet.velocity.y
//        running: true
//        onStopped: singleBullet.destroy()
//    }
