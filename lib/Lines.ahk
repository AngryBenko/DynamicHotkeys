
/*
Current list of active shortcuts:
    Crosswalk Crosswalk-RF
    Dashed White
    Dashed Yellow
    Dashed Solid Yellow Suicide-RF
    Double Solid Yellow Bidirectional
    Inferred Parking
    Short Dashed White
    Short Dashed White Bike-RA
    Short Dashed White Shoulder-RA
    Solid Red Parking-RF
    Solid Red Shoulder-RF
    Solid Red Shoulder/Parking
    Solid White Bike-RA
    Solid White Bike/Shoulder
    Solid White Crosswalk-RF
    Solid White Shoulder-RA
    Solid White Stop-Semantic
    Solid Yellow Shoulder-RA
*/

/*
Program Reference keys:
Appearance              .1
    unknown         1
    crosswalk       2
    dashed          3
    dashed_solid    4
    dotted          5
    double_dashed   6
    double_dotted   7
    double_solid    8
    inferred        9
    short_dashed    0
    solid           a
    triangle        b
    zigzag          c
    pavement        d
Color                   .2
    unknown         1
    white           2
    yellow          3
    blue            4
    red             5
Semantics               .3
    unknown         1
    intersection    2
    stop            3
    tl-stop         4
    cw-stop         5
    yield           6
    rr-stop         7
    keep clear      8
Direction               .4
    unknown         1
    aligned         2
    cross           3
    neither         4
Traffic Direction       .5
    unknown         1
    unidirectional  2
    bidirectional   3
    ambiguous       4
    reversible      5
Region Facing           .6
Region Away             .7
    unknown         1
    normal          2
    bike            3
    parking         4
    suicide         5
    cw              6
    keep clear      7
    shoulder        8
    int-island      9
*/

crosswalkCW() { ; crosswalk appearance crosswalk-facing
    SendInput, .12
    SendInput, .22
    SendInput, .43
    SendInput, .51
    SendInput, .66
    SendInput, .72
    return
}


dashedWhite() { ; Dashed White
    SendInput, .13
    SendInput, .22
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .62
    SendInput, .72
    return
}

dashedYellow() { ; Dashed Yellow
    SendInput, .13
    SendInput, .23
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .72
    return
}

dashedSolidYellowSuicide() { ; dashed solid yellow suicide-facing
    SendInput, .14
    SendInput, .23
    SendInput, .42
    SendInput, .65
    SendInput, .72
    return
}

doubleSolidYellowBi() { ; double solid yellow bidirectional
    SendInput, .18
    SendInput, .23
    SendInput, .42
    SendInput, .53
    SendInput, .62
    SendInput, .72
    return
}

infParking() { ; Inferred Parking
    SendInput, .19
    SendInput, .52
    SendInput, .62
    SendInput, .74
    return
}

shortDashedWhite() { ; short dashed white normal
    SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .72
    return
}

shortDashedWhiteBike() { ; short dashed white bike-away
    SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .73
    return
}

shortDashedWhiteShoulder() { ; short dashed white shoulder-away
    SendInput, .10
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .78
    return
}

solidRedParking() { ; Solid Red Parking Region
    SendInput, .1a
    SendInput, .25
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .74
    return
}

solidRedShoulder() { ; Solid Red Parking Region
    SendInput, .1a
    SendInput, .25
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .78
    return
}

solidRedShoulderParking() { ; Solid Red Shoulder Parking
    SendInput, .1a
    SendInput, .25
    SendInput, .42
    SendInput, .52
    SendInput, .68
    SendInput, .74
    return
}

solidWhiteBike() { ; solid white bike-away
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .62
    SendInput, .73
    return
}

solidWhiteBikeShoulder() { ; solid white bike/shoulder
    SendInput, .1a
    SendInput, .22
    SendInput, .42
    SendInput, .52
    SendInput, .63
    SendInput, .78
    return
}
solidWhiteCW() { ; solid white crosswalk-facing
    SendInput, .1a
    SendInput, .22
    SendInput, .66
    SendInput, .72
    return
}

solidWhiteShoulder() { ; Solid White Shoulder
    SendInput, .1a
    SendInput, .22
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .62
    SendInput, .78
    return
}

solidWhiteStop() { ; Solid white Stop Semantic
    SendInput, .1a
    SendInput, .22
    SendInput, .33
    SendInput, .43
    SendInput, .51
    SendInput, .62
    SendInput, .72
    return
}

solidYellowShoulder() { ; Solid yellow Shoulder
    SendInput, .1a
    SendInput, .23
    SendInput, .42 ; Aligned, Uni, Normal/Normal
    SendInput, .52
    SendInput, .62
    SendInput, .78
    return
}
