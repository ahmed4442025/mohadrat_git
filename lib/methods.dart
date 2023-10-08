import 'dart:io';

import 'model.dart';
import 'run.dart';

List<Adds> getAddsJson() {
  List<String> listFiles = listFilesInDirectory("../adds");

  return listFiles.map((e) => Adds(img: addsPath + e, title: e.split(".").first)).toList();
}

List<String> listFilesInDirectory(String subPath) {
  try {
    // Specify the directory path
    String currentDirectory = Directory.current.path;

    // print("listFilesInDirectory $subPath");
    String directoryPath = currentDirectory + "/" + subPath;

    // Create a Directory object
    Directory directory = Directory(directoryPath);

    if (directory.existsSync()) {
      // Get a list of files in the directory
      List<FileSystemEntity> files = directory.listSync();

      // Extract the file names from the list of file paths
      List<String> fileNames = files.where((file) => file is File).map((file) => file.path.replaceAll("\\", "/").split('/').last).toList();
// print("fileNames $fileNames");
      return fileNames;
    } else {
      print('Directory not found: $directoryPath');
    }
  } catch (e) {
    print('Error listing files: $e');
  }
  return [];
}

// =============== readTextFile ==========
void readTextFile() async {
  try {
    // Get the current working directory
    String currentDirectory = Directory.current.path;

    // Specify the file name
    String fileName = 'test.txt';

    // Construct the file path by appending the file name to the current directory
    String filePath = '$currentDirectory/$fileName';

    // Open the file
    File file = File(filePath);

    if (await file.exists()) {
      // Read the contents of the file
      String fileContent = await file.readAsString();

      // Print the file contents
      print(fileContent);
    } else {
      print('File not found: $filePath');
    }
  } catch (e) {
    print('Error reading file: $e');
  }
}


void saveTextToFile(String text,subPath) {
  try {
    String currentDirectory = Directory.current.path;
    // Construct the file path by appending the file name to the current directory
    String filePath = '$currentDirectory/$subPath';

    // Create a File object
    File file = File(filePath);

    // Write the text to the file
    file.writeAsStringSync(text);

    print('Text saved to file: $filePath');
  } catch (e) {
    print('Error saving text to file: $e');
  }
}