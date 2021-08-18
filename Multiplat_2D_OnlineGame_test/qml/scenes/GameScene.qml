import QtQuick 2.0
import Felgo 3.0
import"../common"
import"../entities"
import".."

BaseScene {
    id: gameScene
    //Keys.forwardTo: activeLevel.moveWithKeys
    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property var activeLevel
    property alias entContainer: loader
    property alias moveStick: movementStick
    property alias rotateStick: rotateStick
    property int score: 0

    sceneAlignmentX: "left"
    sceneAlignmentY: "top"


    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }

    Camera {
        id: camera
        gameWindowSize: Qt.point(gameScene.gameWindowAnchorItem.width, gameScene.gameWindowAnchorItem.height)
        entityContainer: entContainer
        //focusedObject: gameScene.activeLevel.player
        limitLeft: 0
        //limitRight: gameScene.activeLevel.width
        limitTop: 0
        //limitBottom: gameScene.activeLevel.height;
    }

    JoystickControllerHUD {
        id: movementStick
        joystickRadius: 20
        anchors.verticalCenter: gameScene.gameWindowAnchorItem.verticalCenter
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 50

        z: 10
        visible: system.debugBuild || system.isPlatform(System.IOS) || system.isPlatform(System.Android)
        source: "../../assets/joystick_background.png"
        thumbSource: "../../assets/joystick_thumb.png"
    }

    JoystickControllerHUD {
        id: rotateStick
        joystickRadius: 20
        anchors.verticalCenter: gameScene.gameWindowAnchorItem.verticalCenter
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 50

        z: 10
        visible: system.debugBuild || system.isPlatform(System.IOS) || system.isPlatform(System.Android)
        source: "../../assets/joystick_background.png"
        thumbSource: "../../assets/joystick_thumb.png"
    }

    Item {
        id: container

        Loader {
            id: loader
            source: gameScene.activeLevelFileName !== "" ? "../levels/" + gameScene.activeLevelFileName : ""
            onLoaded: {
                gameScene.activeLevel = item


                // since we did not define a width and height in the level item itself, we are doing it here
                //item.width = gameScene.width
                //item.height = gameScene.height

                //item.width =1500
                //item.height =1500

                //parent.width = item.width
                //parent.height = item.height
                // store the loaded level as activeLevel for easier access
                gameScene.activeLevel = item
                camera.entityContainer = item
                camera.focusedObject = gameScene.activeLevel.character
                camera.limitRight = gameScene.activeLevel.width
                camera.limitBottom = gameScene.activeLevel.height

                gameScene.Keys.forwardTo = activeLevel.moveWithKeys
                GameSettings.areaHeight = item.height
                GameSettings.areaWidth = item.width

                if(system.isPlatform(System.Windows)) {
                    item.mA.enabled = true
                }

                item.gameScene = gameScene
            }
        }
    }

    //    Binding {
    //        target: scoreText
    //        property: "text"
    //        value: "score: " + gameScene.score
    //    }

    Text {
        id: scoreText
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        color: "white"
        font.pixelSize: 10
        text: "Score:" + gameScene.score
    }

    MenuButton {
        text: "Back to menu"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: {
            gameOver();
        }
    }

    function gameOver() {
        //        var toRemove = ["singleBullet", "character", "enemy", "singleMonsterBullet"]
        //        entityManager.removeEntitiesByFilter(toRemove)
        //        entityManager.removeAllEntities()
        //        entityManager.removeAllPooledEntities()
        activeLevel = undefined
        activeLevelFileName = ""
        backButtonPressed()
    }
}
