import QtQuick 2.15
Image{
    source:"Images/rotation_image.png";
    states: [
        State{
            name: "portrait" ;
            PropertyChanges {target:orientID;x:700;y:850;}
        },
        State{
            name: "landscape" ;
            PropertyChanges {target:orientID;x:700;y:850;}
        }
    ]
    MouseArea{
        id:mouseID;
        anchors.fill: parent;
        onClicked: {
            mainrectID.state= (mainrectID.state==="landscape"?"portrait":"landscape")
            columnID.state= (columnID.state==="landscape"?"portrait":"landscape")
            itemrectID.state=(itemrectID.state==="landscape"?"portrait":"landscape")
            orientID.state=(orientID.state==="landscape"?"portrait":"landscape")
        }
    }
}
