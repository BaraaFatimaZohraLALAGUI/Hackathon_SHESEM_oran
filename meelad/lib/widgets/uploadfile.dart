import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

Widget buildUploadDocument(String hint, String label, String uploadURL, Function(bool) onUploadStatusChange){
  return InkWell(
    onTap: () => _pickAndUploadFile(uploadURL, onUploadStatusChange),
    child: Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB2A4FF)),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(
                                      fontFamily: 'Baloo',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
          ),
          SizedBox(height: 8.0),
          Icon(Icons.add, color: Color(0xFFB2A4FF)),
          SizedBox(width: 12),
          Text(hint, style: TextStyle(color: Colors.grey, fontSize: 16, fontFamily: 'Baloo'),)
        ],
      ),
    ),
  );

}

Future <void> _pickAndUploadFile(String uploadURL, Function(bool) onUploadStatusChange,) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if(result != null) {
    PlatformFile file = result.files.first;
    try {
      await _uploadFile(uploadURL, file.path!);
      onUploadStatusChanged(true);
    }catch (e) {
      onUploadStatusChange(false);
    }
  }else {
    onUploadStatusChange(false);
  }
}



