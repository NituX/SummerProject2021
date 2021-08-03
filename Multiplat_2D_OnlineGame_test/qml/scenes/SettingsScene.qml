import QtQuick 2.0
import Felgo 3.0
import"../common"

// EMPTY SCENE

BaseScene {
    id: settingsScene

    Text {
        text: "Felgo"
        color: "blue"

        anchors.centerIn: parent
    }

    MenuButton {
        text: "Back"
        anchors.right: settingsScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: settingsScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }
}
