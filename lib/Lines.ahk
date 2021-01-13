dashedWhite() { ; dashed white line
    SendInput, .13
    SendInput, .22
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .62
    SendInput, .72
}

solidWhiteShoulderRA() { ; solid white shoulder region away
    SendInput, .1a
    SendInput, .22
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .62
    SendInput, .78
}

solidYellowMRF() { ; solid yellow median region facing
    SendInput, .1a
    SendInput, .23
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .69
    SendInput, .72
}

infParkingRA() { ; inferred parking region away
    SendInput, .19
    SendInput, .52
    SendInput, .62
    SendInput, .74
}

solidWhiteCWRF() { ; solid white crosswalk region facing
    SendInput, .1a
    SendInput, .22
    SendInput, .66
    SendInput, .72
}

solidWhiteCWInt() { ; solid white crosswalk/intersection region
    SendInput, .1a
    SendInput, .22
    SendInput, .66
    SendInput, .70
}

shortDashedBikeRA() { ; short dashed bike regiona away
   SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .73
}

shortDashedShoulderRA() { ; short dashed shoulder region away
    SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .78
}

doubleSolidYellowMedianRF() { ; double solid yellow median region facing
    SendInput, .18
    SendInput, .23
    SendInput, .42
    SendInput, .52
    SendInput, .69
    SendInput, .72
}

doubleSolidYellowBid() { ; double solid yellow bidirectional
    SendInput, .18
    SendInput, .23
    SendInput, .42
    SendInput, .53
    SendInput, .62
    SendInput, .72
}

cwCWRF() { ; crosswalk appearance crosswalk region facing
    SendInput, .12
    SendInput, .22
    SendInput, .43
    SendInput, .51
    SendInput, .66
    SendInput, .72
}

cwCWInt() { ; crosswalk appearance crosswalk/intersection region
    SendInput, .12
    SendInput, .22
    SendInput, .43
    SendInput, .51
    SendInput, .66
    SendInput, .70
}

intGuidingLine() { ; intersectio guiding line (requires semantics update)
    SendInput, .10
    SendInput, .22
    SendInput, .32
    SendInput, .44
    SendInput, .51
    SendInput, .60
    SendInput, .70
}

dashedSolidYellowSuicideRF() { ; dashed yellow suicide region facing
    SendInput, .14
    SendInput, .23
    SendInput, .42
    SendInput, .65
    SendInput, .72
}

solidWhiteBikeRA() { ; solid white bike region away
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .73
}

solidWhiteBikeShoulder() { ; solid white bike/shoulder region
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .63
    SendInput, .78
}

solidWhiteInt() { ; solid white intersection region facing
    SendInput, .1a
    SendInput, .22
    SendInput, .43
    SendInput, .51
    SendInput, .60
    SendInput, .72
}

shortDashed() { ; short dashed white line
    SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .72
}

; triangle appearance yield semantic and int region facing (limited by FLIDE)
; solid white parking region
solidWhiteParking() { ; checking regions
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .64
    SendInput, .72
}
; inferred parking shoulder Facing parking away
infShoulderParking() {
    SendInput, .19
    SendInput, .21
    SendInput, .42
    SendInput, .52
    SendInput, .68
    SendInput, .74
}
; inferred parking with cross/unknown traffic directions
infCrossParking() { ; check regions?
    SendInput, .19
    SendInput, .21
    SendInput, .43
    SendInput, .51
    SendInput, .64
    SendInput, .72
}
; inferred parking with crosswalk facing/parking away
infCWParking() { ; should be cross?
    SendInput, .19
    SendInput, .21
    SendInput, .43
    SendInput, .51
    SendInput, .66
    SendInput, .74
}
; reversible line with parkign region facing
revParking() {
    SendInput, .42
    SendInput, .55
    SendInput, .64
    SendInput, .72
}
; bidirectional yellow dashed line
dashedYellowBid() {
    SendInput, .13
    SendInput, .23
    SendInput, .42
    SendInput, .53
    SendInput, .62
    SendInput, .72
}
; bidirectional solid white line
solidWhiteBid() {
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .53
    SendInput, .62
    SendInput, .72
}
; bidirectional solid yellow line
solidYellowBid() {
    SendInput, .1a
    SendInput, .23
    SendInput, .42
    SendInput, .53
    SendInput, .62
    SendInput, .72
}