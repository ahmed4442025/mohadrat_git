import 'dart:io';
import 'dart:convert';
import 'methods.dart';
import 'model.dart';

typedef X = Map<String, dynamic>;

// ==== statics ====
const String addsPath = "https://raw.githubusercontent.com/ahmed4442025/mohadrat_git/master/adds/";
// const String lecturesPath = "https://raw.githubusercontent.com/ahmed4442025/mohadrat_git/master/subjects/";
const String subjectsPath = "https://raw.githubusercontent.com/ahmed4442025/mohadrat_git/master/subjects/";

void main() {
  List<Adds> adds = getAddsJson();
  List<Subjects> subjects = getSubjects();

  responseData res = responseData(adds: adds, subjects: subjects);

  String str = json.encode(res.toJson());
  print(str);

  saveTextToFile(str,"data.json");
  // var r = listFilesInDirectory("../subjects/الحضارة الاسلامية/1__30_9_2023/");
  // print(r);
}

// =============== get al files ==========

List<Subjects> getSubjects() {
  List<String> listFiles = listFoldersInDirectory("../subjects");
  List<Subjects> l = listFiles
      .map((e) => Subjects(
            img: subjectsPath + e + "/icon.png",
            title: e,
            lectures: getLecture(e),
          ))
      .toList();
  return l;
}

List<OneLecture> getLecture(String lectureName) {
  List<OneLecture> l = [];
  List<String> listLecture = listFoldersInDirectory("../subjects/" + lectureName);
  l = listLecture
      .map((e) => OneLecture(
            title: e.split("__").first,
            date: e.split("__").last.replaceAll("_", "/"),
            // img: ,
            imgs: listFilesInDirectory("../subjects/" + lectureName + "/" + e + "/")
                .map((e2) => Images(
                      img: "$subjectsPath$lectureName/$e/$e2",
                      title: e2,
                    ))
                .toList(),
          ))
      .toList();
  // print(listLecture);
  return l;
}

List<String> listFoldersInDirectory(String sub) {
  try {
    // Specify the directory path
    String currentDirectory = Directory.current.path;

    String directoryPath = currentDirectory + "/" + sub;

    // Create a Directory object
    Directory directory = Directory(directoryPath);

    if (directory.existsSync()) {
      // Get a list of sub-directories in the directory
      List<Directory> subdirectories = directory
          .listSync()
          .where((entity) => entity is Directory)
          .map(
            (entity) => (entity as Directory),
          )
          .toList();

      // Extract the folder names from the list of subdirectories
      List<String> folderNames = subdirectories.map((subdirectory) => subdirectory.path.replaceAll("\\", "/").split('/').last).toList();
      return folderNames;
    } else {
      print('Directory not found: $directoryPath');
    }
  } catch (e) {
    print('Error listing folders: $e');
  }
  return [];
}
