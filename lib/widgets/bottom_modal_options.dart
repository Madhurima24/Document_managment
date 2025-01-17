import 'package:document_management_main/data/file_class.dart';
import 'package:flutter/material.dart';

import '../data/create_fileStructure.dart';
import 'folder_dialog.dart';

class BottomModalOptions extends StatelessWidget {
  final FileItemNew itemData;
  final Function(FileItemNew)? onStarred;
  final Function(String, FileItemNew item) renameFolder;
  const BottomModalOptions(this.itemData, {this.onStarred, super.key, required this.renameFolder});

  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    void _renameFolder(String newName) {
      print("Rename folder called");
      itemData.name = newName;
    }

    return Container(
      decoration: BoxDecoration(
        color: isLightTheme ? Colors.white : Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar for visual cue
          Container(
            width: 40.0,
            height: 5.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          // Options
          Text(
            itemData.name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),

          ListView(
            shrinkWrap: true,
            children: [
              if (itemData.isFolder)
                _buildOption(
                  context,
                  icon: Icons.drive_file_rename_outline,
                  label: "Rename",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => FolderDialog(
                        // onFolderCreated: renameFolder,
                        folderData: itemData,
                        renameFolder: renameFolder,
                        
                      ),
                    );
                    Navigator.pop(context); // Close the modal
                    print("Rename option selected");
                  },
                ),
              // _buildOption(
              //   context,
              //   icon: Icons.delete_outline,
              //   label: "Delete",
              //   onTap: () {
              //     Navigator.pop(context); // Close the modal
              //     print("Delete option selected");
              //   },
              // ),
              // _buildOption(
              //   context,
              //   icon: Icons.share_outlined,
              //   label: "Share",
              //   onTap: () {
              //     Navigator.pop(context); // Close the modal
              //     print("Share option selected");
              //   },
              // ),
              _buildOption(
                context,
                icon: itemData.isStarred ? Icons.star : Icons.star_border,
                label: itemData.isStarred
                    ? "Remove from Starred"
                    : "Add to Starred",
                onTap: () {
                  // itemData.isStarred = true;
                  if (onStarred != null) {
                    onStarred!(itemData);
                  }
                  Navigator.pop(context); // Close the modal
                  print("Add to Starred option selected");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade700),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
