import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.3
import QtQuick.LocalStorage 2.15
ApplicationWindow {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Registration form Details")

    property int a:0;
    property int user;
    property int atrate;
    property int dot;
    property int check_email:0;
    property bool res;
    property string str;
    property string radio_str;
    property string check_str;
    property string country_str;
    property string st;

    Item{
        id:itemrectID;
        x:650;y:50;
        states: [
            State{
                name: "portrait" ;
                PropertyChanges {target: itemrectID;x:0;y:0}
            },
            State{
                name: "landscape" ;
                PropertyChanges {target:itemrectID;x:650;y:50}
            }
        ]
        Main_Rectangle{
            id:mainrectID;
            width:830;
            height:900;
            anchors.centerIn: mainrectID;
            border.color: "black";
            Columns{
                id:columnID;
            }
            Orientation{
                id:orientID;
                width:100;
                height:30;
                x:700;
                y:850;
            }
        }
    }
}
