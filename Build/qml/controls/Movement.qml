import QtQuick 2.0
import Felgo 3.0
import ".."
import "../entities"

Item {
    id: movement

    property var player
    property var character
    property variant playerTwoAxisController: character.getComponent("TwoAxisController")
    property alias movementController: movementController

    TwoAxisController {
        id: movementController


        onXAxisChanged: {
            var normalizedxAxis = (movementController.xAxis)/(Math.sqrt(movementController.xAxis*movementController.xAxis+movementController.yAxis*movementController.yAxis))
            playerTwoAxisController.xAxis = normalizedxAxis

            var normalizedyAxis = (movementController.yAxis)/(Math.sqrt(movementController.xAxis*movementController.xAxis+movementController.yAxis*movementController.yAxis))
            playerTwoAxisController.yAxis = normalizedyAxis
        }

        onYAxisChanged: {
            var normalizedxAxis = (movementController.xAxis)/(Math.sqrt(movementController.xAxis*movementController.xAxis+movementController.yAxis*movementController.yAxis))
            playerTwoAxisController.xAxis = normalizedxAxis

            var normalizedyAxis = (movementController.yAxis)/(Math.sqrt(movementController.xAxis*movementController.xAxis+movementController.yAxis*movementController.yAxis))
            playerTwoAxisController.yAxis = normalizedyAxis
        }
    }
    function normalizeVectorX(x,y){
        var normalizedxAxis = (x)/(Math.sqrt(x*x+y*y))
        return normalizedxAxis
    }

    function normalizeVectorY(x,y){
        var normalizedyAxis = (y)/(Math.sqrt(x*x+y*y))
        return normalizedyAxis
    }
}
