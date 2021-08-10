import QtQuick 2.0
import Felgo 3.0
import".."

EntityBase {
    entityId: "character"
    entityType: "character"
    id: character

    x: originX
    y: originY

    property int maxSpeed: GameSettings.playerMaxSpeed
    property alias controller: twoAxisController
    property alias characterBody: characterBody
//    property alias characterWeapon: characterWeapon
//    property alias characterMuzzle: characterMuzzle
    property alias circleCollider: circleCollider
    property alias velocityX: twoAxisController.xAxis * maxSpeed
    property alias velocityY: twoAxisController.yAxis * (-maxSpeed)
    property double originX
    property double originY


    TwoAxisController {
        id: twoAxisController
    }

    Image {
        id: characterBody
        width: 30
        height: 30
        anchors.centerIn: parent
        source: "../../assets/Kypara.png"
    }

    Text {
        id: hp
        anchors.centerIn: parent
        text: player.hitPoints
    }


    Rectangle {
        id: characterWeapon
        transformOrigin: Item.TopLeft
        color: "transparent"
        anchors.centerIn: player

        Image{
            id: characterMuzzle
            width: 5
            height: 40
            anchors.centerIn: characterWeapon
            source: "../../assets/AK-47.png"
        }
    }

    CircleCollider {
        id: circleCollider
        bodyType: Body.Dynamic
        radius: 15
        x: -radius
        y: -radius
        categories: Circle.Category1
        collidesWith: Box.Category1 | Circle.category2
        sleepingAllowed: false
    }

//    BoxCollider {
//        id: boxCollider
//        bodyType: Body.Dynamic
//        width: characterMuzzle.width
//        height: characterMuzzle.height
//        anchors.centerIn: characterWeapon
//        categories: Box.Category2
//        collidesWith: Box.Category1
//        bullet: true
//        sleepingAllowed: false
//    }

    MovementAnimation {
        target: character
        property: "x"
        running: true
        velocity: character.velocityX //twoAxisController.xAxis * maxSpeed

    }

    MovementAnimation {
        target: character
        property: "y"
        running: true
        velocity: character.velocityY//twoAxisController.yAxis * (-maxSpeed)
    }

}
