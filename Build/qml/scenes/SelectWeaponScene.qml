import QtQuick 2.0
import Felgo 3.0
import"../common"

// EMPTY SCENE

BaseScene {
    id: selectWeaponScene

    signal levelPressed(string selectedLevel)

    Grid {
        anchors.centerIn: parent
        spacing: 10
        columns: 5
        MenuButton {
            text: "1"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level1.qml")
            }
        }
        MenuButton {
            text: "2"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level2.qml")
            }
        }
        MenuButton {
            text: "3"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level3.qml")
            }
        }
        Repeater {
            model: 10
            MenuButton {
                text: " "
                width: 50
                height: 50
            }
        }
    }

    MenuButton {
        text: "Back"
        anchors.right: selectWeaponScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectWeaponScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }
}
