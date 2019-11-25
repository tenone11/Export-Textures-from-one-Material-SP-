import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import AlgWidgets 2.0

AlgDialog {
  id: configureDialog
  visible: false
  title: "Charactor Texture Path Config"
  width: 500
  height: 220
  minimumWidth: 400
  minimumHeight: 250

  function reload() {
    content.reload()
  }
  onAccepted: {
    if (hair_path.text != "...") {
        alg.settings.setValue("HairTexturePath", hair_path.text);
        }
    if (head_path.text != "...") {
        alg.settings.setValue("HeadTexturePath", head_path.text);
    }
    if (body_path.text != "...") {
        alg.settings.setValue("BodyTexturePath", body_path.text);
		}
  }

  Rectangle {
    id: content
    parent: contentItem
    anchors.fill: parent
    anchors.margins: 12
    color: "transparent"
    clip: true

    function reload() {
      hair_path.reload()
      head_path.reload()
      body_path.reload()
    }

    AlgScrollView {
      id: scrollView
      anchors.fill: parent

      ColumnLayout {
        spacing: 18
        Layout.maximumWidth: scrollView.viewportWidth
        Layout.minimumWidth: scrollView.viewportWidth

        ColumnLayout {
          spacing: 6
          Layout.fillWidth: true

          AlgLabel {
            text: "Hair Path"
            Layout.fillWidth: true
          }

          RowLayout {
            spacing: 6
            Layout.fillWidth: true

            AlgTextEdit {
              id: hair_path
              borderActivated: true
              wrapMode: TextEdit.Wrap
              readOnly: true
              Layout.fillWidth: true
              
              function reload() {
                text = alg.settings.value("HairTexturePath", "...")
              }

              Component.onCompleted: {
                reload()
              }
            }

          AlgButton {
            text: "Select directory"
            onClicked: {
              hair_fileDialog.open()
            }
          }
          }
        }
        
        ColumnLayout {
          spacing: 6
          Layout.fillWidth: true

          AlgLabel {
            text: "Head Path"
            Layout.fillWidth: true
          }

          RowLayout {
            spacing: 6
            Layout.fillWidth: true

            AlgTextEdit {
              id: head_path
              borderActivated: true
              wrapMode: TextEdit.Wrap
              readOnly: true
              Layout.fillWidth: true
              
              function reload() {
                text = alg.settings.value("HeadTexturePath", "...")
              }

              Component.onCompleted: {
                reload()
              }
            }

          AlgButton {
            text: "Select directory"
            onClicked: {
              head_fileDialog.open()
            }
          }
          }
        }
        
        ColumnLayout {
          spacing: 6
          Layout.fillWidth: true

          AlgLabel {
            text: "Body Path"
            Layout.fillWidth: true
          }

          RowLayout {
            spacing: 6
            Layout.fillWidth: true

            AlgTextEdit {
              id: body_path
              borderActivated: true
              wrapMode: TextEdit.Wrap
              readOnly: true
              Layout.fillWidth: true
              
              function reload() {
                text = alg.settings.value("BodyTexturePath", "...")
              }

              Component.onCompleted: {
                reload()
              }
            }

          AlgButton {
            text: "Select directory"
            onClicked: {
              body_fileDialog.open()
            }
          }
          }
        }
      }
    }
  }

  FileDialog {
    id: hair_fileDialog
    title: "Please choose a directory"
    folder: alg.documents_directory
    selectFolder: true
    selectMultiple: false
    selectExisting: true
    onAccepted: {
      hair_path.text = alg.fileIO.urlToLocalFile(fileUrl.toString())
      //alg.log.info(path.text)
    }
  }
  FileDialog {
    id: head_fileDialog
    title: "Please choose a directory"
    folder: alg.documents_directory
    selectFolder: true
    selectMultiple: false
    selectExisting: true
    onAccepted: {
      head_path.text = alg.fileIO.urlToLocalFile(fileUrl.toString())
      //alg.log.info(path.text)
    }
  }
  FileDialog {
    id: body_fileDialog
    title: "Please choose a directory"
    folder: alg.documents_directory
    selectFolder: true
    selectMultiple: false
    selectExisting: true
    onAccepted: {
      body_path.text = alg.fileIO.urlToLocalFile(fileUrl.toString())
      //alg.log.info(path.text)
    }
  }
}
