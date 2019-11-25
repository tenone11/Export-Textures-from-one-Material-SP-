import AlgWidgets 2.0

AlgButton {
    id: toolbarIcon
    text: "Head_Export"
    width: 100
    height: 5
    onClicked:{
        var ch_materials= alg.mapexport.documentStructure().materials;
        var head_path = alg.settings.value("HeadTexturePath");
        var a=0;
        for (var i=0; i<ch_materials.length; i++){
            if ((ch_materials[i].name).search("Head") != -1){
                alg.mapexport.exportDocumentMaps("FN Player",head_path,"tga",[],[ch_materials[i].name])
                a++
            }
        }
        if (a==0){
            alg.log.warning("no \"Head\" materials in this project")
        }
    }
}