import QtQuick 2.9
import QtQuick.Controls 2.2

Page {
    width: 600
    height: 400

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }

    Image {
        id: image
        x: 167
        y: 100
        width: 157
        height: 100
        source: "images/StatusBar/StatusBar_Logo.png"
    }
}
