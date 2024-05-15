
import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo/hive/model.dart';

class HiveService extends GetxController{
   var myBox = Hive.box('mybox');
   var tasksList =<Project>[].obs;

   storeObject({required var obj, required String objKey}) {
    String objString = jsonEncode(obj);
    myBox.put(objKey, objString);
    print("Project  object saved successfully");
  }

   List<Project> getObj() {
     tasksList.clear();
    for(var key in myBox.keys){
      String projectString = myBox.get(key);
      Map<String, dynamic> objMap = jsonDecode(projectString);
      Project project = Project.fromJson(objMap);
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
     myBox.delete(objKey);
   }
}
