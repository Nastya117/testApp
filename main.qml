import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

Window {
    visible: true
    width: parent.width
    height: parent.height

    StackView
    {
        id: stack
        anchors.fill: parent
        initialItem: Qt.resolvedUrl("MainPage.qml")
    }
}
