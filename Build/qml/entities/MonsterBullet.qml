import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: singleMonsterBullet
    entityType: "singleMonsterBullet"
    x: start.x
    y: start.y

    Image {
        id: singleMonsterBulletPic
        anchors.fill: circleCollider
        width: 5
        height: 5
        source: "../../assets/MonsterBullet.png"
    }

    CircleCollider {
        id: circleCollider
        bodyType: Body.Dynamic
        radius: 3
        x: -radius
        y: -radius
        body.bullet: true
        body.fixedRotation: false
        collidesWith: Box.Category1 | Circle.Category1

        fixture.onBeginContact: {
            var collidedEntity = other.getBody().target;
            var otherEntityId = collidedEntity.entityId;
            var otherEntityParent = collidedEntity.parent;

            if(otherEntityId.substring(0,4) === "char") {
                singleMonsterBullet.destroy();
                otherEntityParent.getHit(damage);
            }

            else if (otherEntityId.substring(0,4) === "enem") {
                singleMonsterBullet.destroy();
                collidedEntity.getHit(damage);
            }

            else {
                singleMonsterBullet.destroy();

                //animation here?
            }
        }
    }
}
