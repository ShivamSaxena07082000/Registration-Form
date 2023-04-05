import QtQuick 2.15
import QtQuick.Window 2.15
import TableModel 0.1
import QtQuick.Controls 2.4
ApplicationWindow {
    id: window
    minimumWidth:400
    minimumHeight:200
    visible: true
    title: qsTr("Table contents")

TableView {
    anchors.fill: parent
    columnSpacing: 1
    rowSpacing: 1
    clip: true

    model: TableModel {}

    delegate: Rectangle {
        implicitWidth: 100
        implicitHeight: 50
        border.width: 2;
        border.color: "black";
        Text {
            text: tabledata;
            font.pointSize: 12;
            anchors.centerIn: parent;
        }
    }
}
}
