import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';
import '../data/create_fileStructure.dart';
import '../data/file_class.dart';
import 'package:document_management_main/apis/ikon_service.dart';

final uuid = Uuid();

String getFileIcon(String? extension) {
  switch (extension?.toLowerCase()) {
    case "pdf":
      return "assets/pdf-file.svg";
    case "png":
    case "jpg":
    case "jpeg":
      return "assets/png-file.svg";
    case "txt":
      return "assets/file-file.svg";
    case "xlsx":
    case "xls":
      return "assets/excel-file.svg";
    default:
      return "assets/default-file.svg";
  }
}

String getResourceType(String extension) {
  switch (extension.toLowerCase()) {
    case 'pdf':
      return 'application/pdf';
    case 'png':
      return 'image/png';
    case 'jpg':
      return 'image/jpg';
    case 'jpeg':
      return 'images/jpeg';
    case 'xlsx':
      return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
    default:
      return 'text/plain';
  }
}

List<FileItemNew> processFiles(
    List<PlatformFile> files, bool isFolderUpload, String folderName, String processId) {
  // files.map((file) {
  //   final fileSize = File(file.path!).lengthSync();
  //   final Map<String, dynamic> extractData = {
  //     "uploadResourceDetails": [
  //       {
  //         "resourceName": file.name,
  //         "resourceSize": fileSize,
  //         "resourceType": "image/png",
  //         "resourceId": "d0bcc9e5-708c-4e76-9877-ab1619f1b713",
  //         "uploadedBy": "b3683fff-4a28-4949-b9f0-48155df0ee59",
  //         "uploadedOn": DateTime.now().toIso8601String(),
  //         "fileName": file.name.split('.').first,
  //         "fileNameExtension": file.extension ?? 'unknown'
  //       }
  //     ]
  //   };
  // });

  return files.map((file) {
    String fileId = uuid.v4();
    String identifier = uuid.v4();
    // final fileSize = File(file.path!).lengthSync();
    // final Map<String, dynamic> extractData = {
    //   "uploadResourceDetails": [
    //     {
    //       "resourceName": file.name,
    //       "resourceSize": fileSize,
    //       "resourceType": getResourceType(file.extension!),
    //       "resourceId": fileId,
    //       "uploadedBy": "b3683fff-4a28-4949-b9f0-48155df0ee59",
    //       "uploadedOn": DateTime.now().toIso8601String(),
    //       "fileName": file.name.split('.').first,
    //       "fileNameExtension": file.extension ?? 'unknown'
    //     }
    //   ],
    //   "resource_identifier": identifier,
    //   "folder_identifier": null,
    //   "createdBy": "b3683fff-4a28-4949-b9f0-48155df0ee59",
    //   "createdOn": DateTime.now().toIso8601String(),
    //   "updatedBy": "b3683fff-4a28-4949-b9f0-48155df0ee59",
    //   "updatedOn": DateTime.now().toIso8601String(),
    //   "isCreated": true,
    //   "userDetails": {
    //     "folderViewUserAccess": [],
    //     "removedFileUserAccess": [],
    //     "folderEditUserAccess": [],
    //     "editFileUserAccess": [],
    //     "folderOwnerUserAccess": [],
    //     "viewFileUserAccess": [],
    //     "ownerFileAccess": ["b3683fff-4a28-4949-b9f0-48155df0ee59"]
    //   },
    //   "groupDetails": {
    //     "folderViewGrpAccess": [],
    //     "removedFileGrpAccess": [],
    //     "editFileGrpAccess": [],
    //     "ownerFileGrpAccess": [],
    //     "folderOwnerGrpAccess": [],
    //     "viewFileGrpAccess": [],
    //     "folderEditGrpAccess": []
    //   },
    //   "extraDetails": {}
    // };

    return FileItemNew(
      name: file.name,
      icon: getFileIcon(file.extension),
      isFolder: false,
      isStarred: false,
      filePath: file.path,
      fileId: fileId,
      identifier: identifier,
    );
  }).toList();
}
