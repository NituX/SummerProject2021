import QtQuick 2.0
import Felgo 3.0
import ".."

EntityBase {
    entityId: "character"
    entityType: "character"
    id: character
    transformOrigin: Item.TopLeft

    property int hitPoints: GameSettings.playerLife
    property int maxSpeed: GameSettings.playerMaxSpeed
    property alias controller: twoAxisController
    property var characterBodyImP: characterBody.imagePoints[0]
    property alias circleCollider: circleCollider
    property var world
    property real lastTime: 0


    TwoAxisController {
        id: twoAxisController
    }

    MultiResolutionImage {
        id: characterBody
        width: 30
        height: 30
        rotation: 90
        anchors.centerIn: parent
        source: "../../assets/Kypara.png"

        property list<Item> imagePoints: [
            Item {y: -characterBody.width/2-7
                x: +characterBody.width/2}
        ]
    }

    Text {
        id: hp
        anchors.centerIn: parent
        font.pixelSize: 10
        text: hitPoints
    }


    Image{
        id: characterMuzzle
        width: 5
        height: 40
        anchors.right: characterBody.right
        anchors.verticalCenter: characterBody.verticalCenter
        anchors.verticalCenterOffset: -6
        source: "../../assets/AK-47.png"
    }

    CircleCollider {
        id: circleCollider
        bodyType: Body.Dynamic
        radius: characterBody.width/2
        x: -radius
        y: -radius
        density: 1
        //        friction: 1
        fixedRotation: true
        linearDamping: 10
        bullet: true
        categories: Circle.Category1
        collidesWith: Box.Category1 | Circle.category1
    }

    function getHit(dmg){
        hitPoints -= dmg

        if(hitPoints <= 0) {
            gameScene.gameOver()
        }
    }

    function shoot() {

        var currentTime = new Date().getTime();
        var timeDiff = currentTime-lastTime

        if (timeDiff > 100) {
            lastTime = currentTime

            var start = mapToItem(world,characterBody.imagePoints[0].x,characterBody.imagePoints[0].y)
            console.log("shoot", start.x, start.y)
            entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("../entities/Bullet.qml"), {
                                                                "x" : start.x,
                                                                "y" : start.y,
                                                                "rotation" : character.rotation-90,})
        }
    }
}
