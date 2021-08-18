import Felgo 3.0
import QtQuick 2.0
import "scenes"

GameWindow {
    id: gameWindow
    screenWidth: 960
    screenHeight: 640
    //    scaleMode: "letterbox"
    state: "menu"
    licenseKey: "D549735EF0DB707F285453B3C589759B69BCA867191BD95DA5A8BF1231E63AEE732EA9547D5F1E1BB5A8813D7466842EC688186B15D06A4F71D3A5C483816B6AF70E0D6546699E340A0F06405260F94A50B641FD37D59048AF6160CDF8086C9B8F80713CF695160B277969C5365B269DCF1BCFBAA2B7B358C97A56BB805CA66001B8F9BE6A308BFE21E8AA0E3B24C2505073B63077AD775ACBECF92328FF68F50B516B4A6E2142D867F47D2A7A67051D821992FC0E589C52C903ED1176E95E3633617400BEC67A2D3C9973D55A0E2E2D44A3304AC83812A084EDF726AE4BFB2940F3858DABB6747E7F20E3ECC264D842A66AE9E185EFE4F8B9D046673B02DDA7D8DFBC83470920D59440AC1DB69641CF4C1F20E6A43CC86FEEDA5A31D3A3A374BF1768358AFE8C8F7333775E236B2B518FD2BBA55FEA186A763583001438831F3ABBCF0ADFB32BEE100A2A9380993C5B"

    EntityManager {
        id: entityManager
        entityContainer: gameScene.entContainer
    }

    GameScene {
        id: gameScene
        onBackButtonPressed: {
            gameOverScene.scoreText = "Score:" + gameScene.score
            gameWindow.state = "gameover"
        }
    }

    GameOverScene {
        id: gameOverScene
        onBackButtonPressed: gameWindow.state = "menu"
    }

    MenuScene {
        id: menuScene
        onSelectWeaponPressed: gameWindow.state = "selectWeapon"
        onSettingsPressed: gameWindow.state = "settings"
        //        onNetworkPressed: gameWindow.state = "network"
        //        onMatchmakingPressed: gameWindow.state = "multiplayer"
        onBackButtonPressed: {
            Qt.quit()
        }
    }

    SelectWeaponScene {
        id: selectWeaponScene

        onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.setLevel(selectedLevel)
            gameWindow.state = "game"

        }

        onBackButtonPressed: gameWindow.state = "menu"
    }


    SettingsScene {
        id: settingsScene

        onBackButtonPressed: gameWindow.state = "menu"
    }

    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },
        State {
            name: "selectWeapon"
            PropertyChanges {target: selectWeaponScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: selectWeaponScene}
        },
        State {
            name: "settings"
            PropertyChanges {target: settingsScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: settingsScene}
        },
        //        State {
        //            name: "network"
        //            PropertyChanges {target: gameNetworkScene; opacity: 1}
        //            PropertyChanges {target: gameWindow; activeScene: gameNetworkScene}
        //        },
        //        State {
        //            name: "multiplayer"
        //            PropertyChanges {target: matchmakingScene; opacity: 1}
        //            PropertyChanges {target: gameWindow; activeScene: matchmakingScene}
        //        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        },
        State {
            name: "gameover"
            PropertyChanges {target: gameOverScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameOverScene}
        }

    ]
}
