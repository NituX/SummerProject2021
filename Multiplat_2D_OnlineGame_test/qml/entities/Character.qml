import QtQuick 2.0
import Felgo 3.0
import".."

EntityBase {
    entityId: "character"
    entityType: "character"
    id: character
    x: originX
    y: originY

    property alias controller: twoAxisController
    property alias characterBody: characterBody
    property alias characterWeapon: characterWeapon
    property alias characterMuzzle: characterMuzzle
    property alias circleCollider: circleCollider
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

    Rectangle {
        id: characterWeapon
        x: characterBody.x + 20
        y: characterBody.y
        width: 1
        height: 1
        transformOrigin: Item.Left
        color: "transparent"

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
        collidesWith: Box.Category1
        bullet: true
        sleepingAllowed: false
    }

    BoxCollider {
        id: boxCollider
        bodyType: Body.Dynamic
        width: characterMuzzle.width
        height: characterMuzzle.height
        anchors.centerIn: characterWeapon
        categories: Box.Category2
        collidesWith: Box.Category1
        bullet: true
        sleepingAllowed: false
    }

    MovementAnimation {
        target: character
        property: "x"
        running: true
        velocity: twoAxisController.xAxis * 200

    }

    MovementAnimation {
        target: character
        property: "y"
        running: true
        velocity: twoAxisController.yAxis * (-200)
    }

}
