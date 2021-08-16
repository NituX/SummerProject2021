import QtQuick 2.0
import Felgo 3.0
import ".."

EntityBase {
    id: singleMonsterBullet
    entityType: "singleMonsterBullet"
    property int damage: 20

    Component.onCompleted: {
        applyForwardImpulse();
    }

    Image {
        id: singleMonsterBulletPic
        anchors.centerIn: circleCollider
        source: "../../assets/MonsterBullet.png"
        width: 10
        height: 10
    }

    CircleCollider {
        id: circleCollider
        radius: singleMonsterBulletPic.width / 2
        body.bullet: true
        body.fixedRotation: false

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;

            if(otherEntityId.substring(0,4) === "char" || otherEntityId.substring(0,4) === "enem") {
                singleMonsterBullet.destroy();
                collidedEntity.getHit(damage);
            }

            else {
                singleMonsterBullet.destroy();

                //animation here?
            }
        }
    }
    function applyForwardImpulse() {
        var power = GameSettings.monsterBulletSpeed
        var rad = singleMonsterBullet.rotation / 180 * Math.PI

        //can't use body.toWorldVector() because the rotation is not instantly
        var localForward = Qt.point(power * Math.cos(rad), power * Math.sin(rad))
        circleCollider.body.applyLinearImpulse(localForward, circleCollider.body.getWorldCenter())
    }
}
