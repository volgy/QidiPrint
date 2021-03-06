import QtQuick 2.2

import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtQuick.Layouts 1.1

import UM 1.2 as UM
import Cura 1.0 as Cura


Item
{
    implicitWidth: parent.width
    implicitHeight: Math.floor(childrenRect.height + UM.Theme.getSize("default_margin").height * 2)
    property var outputDevice: null

    Connections
    {
        target: Cura.MachineManager
        onGlobalContainerChanged:
        {
            outputDevice = Cura.MachineManager.printerOutputDevices.length >= 1 ? Cura.MachineManager.printerOutputDevices[0] : null;
        }
    }

    Rectangle
    {
        height: childrenRect.height
        color: UM.Theme.getColor("setting_category")

        Label
        {
            id: outputDeviceNameLabel
            font: UM.Theme.getFont("large_bold")
            color: UM.Theme.getColor("text")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: UM.Theme.getSize("default_margin").width
            text: outputDevice != null ? outputDevice.activePrinter.name : ""
        }

        Label
        {
            id: outputDeviceAddressLabel
            text: (outputDevice != null && outputDevice.address != null) ? "IP:" + outputDevice.address : ""
            font: UM.Theme.getFont("default_bold")
            color: UM.Theme.getColor("text_inactive")
            anchors.top: outputDeviceNameLabel.bottom
            anchors.left: parent.left
            anchors.margins: UM.Theme.getSize("default_margin").width
        }
    }
}