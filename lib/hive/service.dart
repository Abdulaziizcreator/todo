import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:todo/hive/model.dart';

class HiveService {
  static var myBox = Hive.box('mybox');

  static storeObject({required var obj, required String objKey}) {
    String objString = jsonEncode(obj);
    myBox.put(objKey, objString);
    print("Project  object saved successfully");
  }

  static Project getProjectObject({required String projectKey}) {
    String projectString = myBox.get(projectKey);
    Map<String, dynamic> objMap = jsonDecode(projectString);
    Project project = Project.fromJson(objMap);
    return project;
  }
}
