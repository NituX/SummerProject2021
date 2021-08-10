import QtQuick 2.0
import Felgo 3.0
import "../common"


BaseScene {
    id: multiplayerScene

    property alias state: multiplayerview.state
    property alias mpView: multiplayerview


    MultiplayerView{
        gameNetworkItem: gameNetwork
        id: multiplayerview

        onBackClicked: backButtonPressed()
        onShowCalled: gameWindow.state = "multiplayer"
    }

    function show(state){
      multiplayerview.show(state)
    }
}
