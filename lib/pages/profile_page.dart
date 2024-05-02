import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hive/model.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var box = await Hive.openBox('mybox');
    setState(() {
      for (var key in box.keys) {
        var data = box.get(key!.toString());

        if (data != null) {
          Map<String, dynamic> objMap = jsonDecode(data!);
          Project project = Project.fromJson(objMap);
          projects.add(project);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          Project project = projects[index];
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(
                  top: 18, right: 24, left: 24, bottom: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    blurStyle: BlurStyle.outer,
                    color: Colors.grey.withOpacity(0.35),
                  )
                ],
              ),
              height: 120,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        project.taskGroup.toString(),
                        style: const TextStyle(color: Color(0xffbab8c1)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        height: 36,
                        width: 36,
                        margin: const EdgeInsets.only(right: 15, top: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            deleteProject(index);
                          },
                          icon: Icon(Icons.disabled_by_default_rounded),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      child: Text(
                        project.projectName.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.timer_rounded,
                            color: const Color(0xff9260f4).withOpacity(0.4),
                          ),
                          Text(
                            project.selectedTime.toString(),
                            style: TextStyle(
                              color: const Color(0xff9260f4).withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void deleteProject(int index) async {
    // Remove the project from the list
    setState(() {
      projects.removeAt(index);
    });

    // Remove the project from Hive
    var box = await Hive.openBox('mybox');
    box.deleteAt(index);
    await box.close();
  }
}
