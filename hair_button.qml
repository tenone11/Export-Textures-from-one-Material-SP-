import AlgWidgets 2.0

AlgButton {
    id: toolbarIcon
    text: "Hair_Export"
    width: 100
    height: 5
    onClicked:{
        var ch_materials= alg.mapexport.documentStructure().materials;
        var hair_path = alg.settings.value("HairTexturePath");
        var a=0;
        for (var i=0; i<ch_materials.length; i++){
            if ((ch_materials[i].name).search("Hair") != -1){
                //alg.log.info([ch_materials[i].name])
                alg.mapexport.exportDocumentMaps("FN Player [Legacy]",hair_path,"tga",[],[ch_materials[i].name])
                a++
            }
        //alg.log.info(alg.settings.value("HairTexturePath"))
        //alg.log.info(alg.mapexport.exportDocumentMaps("FN Player",hair_path,"tga"))
        }
        if (a==0){
            alg.log.warning("no \"Hair\" materials in this project")
        }
    }
}