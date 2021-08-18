import QtQuick 2.0
import Felgo 3.0
import "../common"

BaseScene {
    id: gameOverScene

    property alias scoreText: gameOverScore.text

    Rectangle {
        id: bg
        anchors.fill: parent
        color: "green"
    }

    Text {
        text: "Game Over"
        anchors.verticalCenterOffset: -30
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        color: "black"
        anchors.centerIn: parent
    }

    Text {
        id: gameOverScore
        text: ""
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        color: "black"
        anchors.centerIn: parent
    }

    MenuButton {
        text: "Back to menu"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            backButtonPressed()
        }
    }

}
