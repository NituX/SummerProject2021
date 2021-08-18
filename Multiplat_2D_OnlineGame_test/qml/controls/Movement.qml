import QtQuick 2.0
import Felgo 3.0
import ".."
import "../entities"
import "../scenes"

Item {
    id: movement

    property var character
    property variant playerTwoAxisController: character.getComponent("TwoAxisController")
    property alias movementController: movementController
    property var moveStick

    //    property alias updateMovement: updateMovement()

    property real newPosX: 0.0
    property real newPosY: 0.0
    //    property real oldPosX: 0.0
    //    property real oldPosY: 0.0


    TwoAxisController {
        id: movementController

        xAxis: moveStick.controllerXPosition
        yAxis: moveStick.controllerYPosition

        onXAxisChanged: {
            newPosX = movementController.xAxis
            newPosY = movementController.yAxis
            //            updateMovement()
        }

        onYAxisChanged: {
            newPosX = movementController.xAxis
            newPosY = movementController.yAxis
            //            updateMovement()
        }
    }

    function updateMovement() {
        //        oldPosX = newPosX
        //        oldPosY = newPosY

        newPosX = newPosX * GameSettings.playerMaxSpeed
        newPosY = newPosY * GameSettings.playerMaxSpeed

        var velocity = Math.sqrt(newPosX * newPosX + newPosY * newPosY)
        var maxVelocity = GameSettings.playerMaxSpeed

        //        if (velocity > 0) {
        //            character.circleCollider.linearDamping = 0
        //        }

        //        else if (velocity === 0) {
        //            character.circleCollider.linearDamping = 1
        //        }

        if(velocity > maxVelocity){
            var shrinkFactor = maxVelocity / velocity
            newPosX = newPosX * shrinkFactor
            newPosY = newPosY * shrinkFactor
        }


        console.log("calcMoveRdy" + newPosX + "" + -newPosY)
        playerTwoAxisController.xAxis = newPosX
        playerTwoAxisController.yAxis = -newPosY
    }


}
