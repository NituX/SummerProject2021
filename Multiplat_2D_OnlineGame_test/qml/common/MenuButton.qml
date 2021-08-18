import QtQuick 2.0

Rectangle {
    id: button
    width: buttonText.width+ paddingHorizontal*2
    height: buttonText.height+ paddingVertical*2

    color: mouseArea.pressed ? "#29A721" : "#10660B"

    radius: 10

    property int paddingHorizontal: 5
    property int paddingVertical: 5

    property alias text: buttonText.text

    signal clicked

    Text {
        id: buttonText
        anchors.centerIn: parent
        font.pixelSize: 18
        color: "white"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: button.clicked()
        onPressed: button.opacity = 0.5
        onReleased: button.opacity = 1
    }

}
