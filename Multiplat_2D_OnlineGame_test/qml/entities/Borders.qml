import QtQuick 2.0
import Felgo 3.0


EntityBase{
    entityId: "border"
    entityType: "box"

    Rectangle {
        color: "black"
        anchors.fill:parent
    }

    BoxCollider {
        bodyType: Body.Static
        width: parent.width
        height: parent.height
        categories: Box.Category1
    }

}
