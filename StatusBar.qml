import QtQuick 2.11
import QtQuick.Controls 2.2

ToolBar {
    id: idStatusBar
    property int p_minHeight: 50
    contentHeight: window.height * 125/1080 > p_minHeight ? window.height * 125/1080 : p_minHeight
    background: Rectangle{
        id: idBackgroundStatusBar
        color: "#474C59"
    }

    ToolButton {
        id: idMenuButtonStatusBar
        height:parent.height
        width:parent.height
        background: Rectangle{
            id: idBackgroundMenuButtonStatusBar
            color:  "#474C59"
        }
        icon.source: stackView.depth > 1 ? "/StatusBar/images/StatusBar/StatusBar_PrevPage.png" : "/StatusBar/images/StatusBar/StatusBar_OpenMenuBar.png"
        icon.height: idMenuButtonStatusBar.height
        icon.width: idMenuButtonStatusBar.height
        MouseArea{
            id:idMouseAreaMenuButtonStatusBar
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }
        states:[
            State{
                name:"hovered"; when:idMouseAreaMenuButtonStatusBar.containsMouse==true
                PropertyChanges {
                    target: idBackgroundMenuButtonStatusBar
                    color:"#FF9500"
                }
            }
        ]
        transitions: [
            Transition {
                from: ""
                to: "hovered"
                reversible: true
                ColorAnimation{
                    duration: 10
                }
            }
        ]
    }

    ComboBox{
        id: idRecipeListStatusBar
        anchors.left: idMenuButtonStatusBar.right
        anchors.leftMargin: 30
        anchors.verticalCenter: parent.verticalCenter
        height: idStatusBar.height/3
        width: idStatusBar.width/5
        //displayText: "Size: " + currentText
        model: ["S", "je m'appelle hello", "L"]

        delegate: ItemDelegate {
            width: idRecipeListStatusBar.width
            contentItem: Text {
                text: modelData
                color: "#FF9500"
                font: idRecipeListStatusBar.font
                elide: Text.ElideRight
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            highlighted: idRecipeListStatusBar.highlightedIndex === index
        }
        indicator: Canvas {
            id: canvas
            x: idRecipeListStatusBar.width - width - idRecipeListStatusBar.rightPadding
            y: idRecipeListStatusBar.topPadding + (idRecipeListStatusBar.availableHeight - height) / 2
            width: 12
            height: 8
            contextType: "2d"

            Connections {
                target: idRecipeListStatusBar
                onPressedChanged: canvas.requestPaint()
            }

            onPaint: {
                context.reset();
                context.moveTo(0, 0);
                context.lineTo(width, 0);
                context.lineTo(width / 2, height);
                context.closePath();
                context.fillStyle = idRecipeListStatusBar.pressed ? "#CC7700" : "#ff9500";
                context.fill();
            }
        }

        contentItem: Text {
            text: idRecipeListStatusBar.displayText
            font: idRecipeListStatusBar.font
            color: idRecipeListStatusBar.pressed ? "#CC7700" : "#ff9500"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideRight

        }

        background: Rectangle {
            id : idBackgroundRecipeListStatusBar
            //color: hovered? "#555555" : idBackgroundStatusBar.color
            color: idRecipeListStatusBar.hovered ? "#595D69" : idBackgroundStatusBar.color
            implicitWidth: 120
            implicitHeight: 40
            border.color: "#ff9500"
            border.width: idRecipeListStatusBar.visualFocus ? 5 : 2
            radius: parent.height / 2
        }

        popup: Popup {
            y: idRecipeListStatusBar.height
            width: idRecipeListStatusBar.width
            //implicitHeight: idRecipeListStatusBar.count * contentItem.implicitHeight

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: idRecipeListStatusBar.popup.visible ? idRecipeListStatusBar.delegateModel : null
                currentIndex: idRecipeListStatusBar.highlightedIndex
                ScrollIndicator.vertical: ScrollIndicator { }
            }

            background: Rectangle {
                color: "#595D69"
                border.color: "#ff9500"
                radius: 5
            }
        }
    }
}
