import 'dart:developer';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ToolsFiles {
  Directory appDocumentDirectory;
  Directory appExternalStorageDirectory;

  //ToolsFiles();

  Future<bool> getDir() async {
    appDocumentDirectory = await getApplicationDocumentsDirectory();
    appExternalStorageDirectory = await getExternalStorageDirectory();
    log("Path application document directory: ${appDocumentDirectory.path}");
    log("Path externl storage directory: ${appExternalStorageDirectory.path}");
    return true;
  }
}
