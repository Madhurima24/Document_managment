import 'package:document_management_main/data/file_data.dart';

import 'create_fileStructure.dart';


List<FileItemNew> createFileStructureForTrash(trashInstances){
  List<FileItemNew> trashData = [];

  for(int i=0;i < trashInstances.length;i++){
    // print(trashInstances[i]);
    var data = trashInstances[i].data;
    // allItems.map()
    if(data["folder_identifier"] != null){

    }
    
  }

  return trashData;
}