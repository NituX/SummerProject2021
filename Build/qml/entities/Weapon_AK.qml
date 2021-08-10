import QtQuick 2.0
import Felgo 3.0

EntityBase {
    entityType: "weapon"
    id: wpn
    width: 5
    height: 40

    transformOrigin: Item.TopLeft

    property alias akHead: akHead
    property alias akBody: akBody
    property int shotVelocity: 400

    Image {
        id: akBody
        anchors.fill: boxCollider
        source: "../../assets/AK-47.png"

    }

    Rectangle {
        id: akHead
        anchors {
            top: boxCollider.top
            horizontalCenter: boxCollider.horizontalCenter
        }
        width: 1
        height: 1
        color: "red"
        }

        BoxCollider {
            id: boxCollider
            bodyType: Body.Dynamic
            x: -width/2
            y: -height/2
            categories: Box.Category2
            collidesWith: Box.Category1
            sleepingAllowed: false
        }

    }
