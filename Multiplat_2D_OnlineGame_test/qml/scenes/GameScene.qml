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
    property alias entContainer: container
    property alias moveStick: movementStick
    property alias rotateStick: rotateStick

    sceneAlignmentX: "left"
    sceneAlignmentY: "top"


    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }


    Camera {
        id: camera
        gameWindowSize: Qt.point(gameScene.gameWindowAnchorItem.width, gameScene.gameWindowAnchorItem.height)
        entityContainer: container
        //focusedObject: gameScene.activeLevel.player
        limitLeft: 0
        //limitRight: gameScene.activeLevel.width
        limitTop: 0
        //limitBottom: gameScene.activeLevel.height;
    }

    JoystickControllerHUD {
        id: movementStick
        width: 30
        height: 30
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.bottomMargin: 40
        anchors.leftMargin: 40

        z: 10
        visible: true
        source: "../../assets/joystick_background.png"
        thumbSource: "../../assets/joystick_thumb.png"
    }

    JoystickControllerHUD {
        id: rotateStick
        width: 30
        height: 30
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        anchors.right: gameScene.gameWindowAnchorItem.right
        anchors.bottomMargin: 40
        anchors.rightMargin: 40

        z: 10
        visible: true
        source: "../../assets/joystick_background.png"
        thumbSource: "../../assets/joystick_thumb.png"
    }

    Item {
        id: container
        transformOrigin: Item.TopLeft

//        PhysicsWorld {
//            id: world
//            running: true
//            z: 0
//            // these are performance settings to avoid boxes colliding too far together
//            // set them as low as possible so it still looks good
//            updatesPerSecondForPhysics: 60
//            velocityIterations: 5
//            positionIterations: 5
//            // set this to true to see the debug draw of the physics system
//            // this displays all bodies, joints and forces which is great for debugging
//            debugDrawVisible: true
//        }



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
                camera.focusedObject = gameScene.activeLevel.character
                camera.limitRight = gameScene.activeLevel.width
                camera.limitBottom = gameScene.activeLevel.height
                gameScene.Keys.forwardTo = activeLevel.moveWithKeys
                GameSettings.areaHeight = item.height
                GameSettings.areaWidth = item.width
                item.gameScene = gameScene
            }
        }
    }

    /*Text {
        anchors.left: gameScene.gameWindowAnchorItem.left
        anchors.leftMargin: 10
        anchors.top: gameScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        color: "white"
        font.pixelSize: 20
        text: activeLevel !== undefined ? activeLevel.levelName : ""
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
            activeLevel = undefined
            activeLevelFileName = ""
        }
    }*/
}
