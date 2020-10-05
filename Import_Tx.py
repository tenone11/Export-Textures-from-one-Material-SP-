import sys, unreal

Unreal_Folder = '/Game/EGC_Bake/'
Tx = r'C:\Users\Yifei.Zhang\Desktop\Eternal\bake_normal.psd'


# import win32gui, win32con, socket

# # hld is window puid
# hld = win32gui.FindWindow(None, u"FortniteGame - Unreal Editor")
# if hld==0:
#     print "Open Main Editor"
# else:
#     print hld
#     win32gui.ShowWindow(hld, win32con.SW_SHOW)
#     win32gui.SetForegroundWindow(hld)

def texture_import(single_texture):
    # import
    import_task = unreal.AssetImportTask()
    import_task.automated = True
    import_task.replace_existing = True
    import_task.filename = single_texture
    import_task.destination_path = Unreal_Folder
    unreal.AssetToolsHelpers.get_asset_tools().import_asset_tasks([import_task])


texture_import(Tx)


def loadmap():
    current_map = unreal.EditorLoadingAndSavingUtils.load_map(
        '../../../FortniteGame/Content/FN_PublicTurntable/Turntable_gbuffers.umap')
    print current_map


loadmap()


def add_mesh_to_level():
    static_mesh_actor = unreal.StaticMeshActor()
    location1 = unreal.Vector(1000.0, 400.0, 0.0)
    rotation1 = unreal.Rotator(0.0, 0.0, 0.0)
    new_actor = unreal.EditorLevelLibrary.spawn_actor_from_object(static_mesh_actor, location1, rotation1)
    yourmesh = unreal.EditorAssetLibrary.load_asset('/Game/EGC_Bake/abc1.abc1')
    # static_mesh_ins = unreal.StaticMeshComponent()
    # static_mesh_ins.set_static_mesh(yourmesh)
    unreal.EditorLevelLibrary.replace_mesh_components_meshes_on_actors([new_actor], None, yourmesh)


add_mesh_to_level()


def create_material_instance():
    new_mt = unreal.AssetToolsHelpers.get_asset_tools().create_asset(asset_name="old_materials",
                                                                     package_path=Unreal_Folder,
                                                                     asset_class=unreal.MaterialInstanceConstant,
                                                                     factory=unreal.MaterialInstanceConstantFactoryNew())
    parent = unreal.EditorAssetLibrary.load_asset(
        '/Game/Packages/Fortress_SharedMaterials/MaterialInstances/CharacterShader_Male.CharacterShader_Male')
    unreal.MaterialEditingLibrary.set_material_instance_parent(new_mt, parent)


create_material_instance()

def clean_folder():
    pass
# unreal.StaticMeshActor.static_mesh_component(b)
