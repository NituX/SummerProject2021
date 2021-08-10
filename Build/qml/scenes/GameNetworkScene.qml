import QtQuick 2.0
import Felgo 3.0
import "../common"

BaseScene {
        id: gameNetworkScene

        property alias gnView: myGameNetworkView

        GameNetworkView {
          id: myGameNetworkView
          onBackClicked: gameWindow.state = 'menu'
          gameNetworkItem: gameNetwork
          state: "leaderboard"
        }

}
