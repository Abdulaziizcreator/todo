import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/hive/model.dart';



class HiveService extends GetxController {

  var objBox = Hive.box('Tasks');
  var tasksList = <Project>[].obs;

  ///Hive yordamida obj saqlash :date time now orqali key berish
  storedObj({required var obj, required String objKey}) {
    String stringUserObj = jsonEncode(obj);
    objBox.put(objKey, stringUserObj);

  }

  ///Hamma Tasks objni olish funksiyasi
  List<Project> getObj() {
    tasksList.clear();
    for (var key in objBox.keys) {
      String stringObj = objBox.get(key);
      Map<String, dynamic> map = jsonDecode(stringObj);
      Project project = Project.fromJson(map);
      tasksList.add(project);
    }

    return tasksList;
  }

  void getTasksForSelectedDate(DateTime date) {
    var allTasks = getObj(); // This fetches all tasks from Hive
    tasksList.value = allTasks.where((task) {
      DateTime startDate = DateTime.parse(task.startDate!);
      // Assuming 'startDate' is stored as a string in ISO format
      return startDate.year == date.year &&
          startDate.month == date.month &&
          startDate.day == date.day;
    }).toList();
    tasksList.value = tasksList.reversed.toList(); // Reverse the filtered list
  }

  deleteObj({required String objKey}) {
    objBox.delete(objKey);
  }
}