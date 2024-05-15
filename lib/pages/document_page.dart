import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/hive/hive_service.dart';

import '../hive/model.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {


  HiveService hiveService = Get.put(HiveService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        // Use the tasksList value to display the tasks for the selected date
        return ListView.builder(
          itemCount: hiveService.tasksList.length,
          itemBuilder: (context, index) {
            // Display each task in the list
            return ListTile(
              title: Text(hiveService.tasksList[index].taskName),
              subtitle: Text(hiveService.tasksList[index].startDate),
              // Add more details as needed
            );
          },
        );
      }),
    );
  }
}
