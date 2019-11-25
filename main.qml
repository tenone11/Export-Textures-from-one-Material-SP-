import QtQuick 2.2
import Painter 1.0

PainterPlugin {

    Component.onCompleted: {
        // create a toolbar widget
      alg.ui.addToolBarWidget("hair_button.qml");
      alg.ui.addToolBarWidget("head_button.qml");
      alg.ui.addToolBarWidget("body_button.qml");
    }
    onConfigure: {
        configurePanel.open()
      }
    ConfigurePanel {
        id: configurePanel
    }
}