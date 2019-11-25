import AlgWidgets 2.0

AlgButton {
    id: toolbarIcon
    text: "Body_Export"
    width: 100
    height: 5
    onClicked:{
        var ch_materials= alg.mapexport.documentStructure().materials;
        var body_path = alg.settings.value("BodyTexturePath")
        var a=0;
        for (var i=0; i<ch_materials.length; i++){
            if ((ch_materials[i].name).search("Body") != -1){
                alg.mapexport.exportDocumentMaps("FN Player",body_path,"tga",[],[ch_materials[i].name])
                a++;
            }
        }
        if (a==0){
            alg.log.warning("no \"Body\" materials in this project")
        }
    }
}