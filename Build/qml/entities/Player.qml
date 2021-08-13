import QtQuick 2.0
import Felgo 3.0
import"../common"
import".."

EntityBase {
    id: player

    property alias character: character
    property alias charCirlce: character.circleCollider
    property alias muzzle: character.characterBody
    property int hitPoints: GameSettings.playerLife


    Character{
        id: character
        rotation: 0
    }

    function getHit(dmg) {
        hitPoints = hitPoints - dmg
    }

}
