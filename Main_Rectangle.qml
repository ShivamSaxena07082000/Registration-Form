import QtQuick 2.15
Rectangle{
states: [
        State{
            name: "portrait" ;
            PropertyChanges {target:window;width:830;height:mainrectID.height;}
        },
        State{
            name: "landscape" ;
            PropertyChanges {target:window;}
        }
    ]
}
