import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hive/model.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
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
        print('Data for key $key: $data');
        if (data != null) {
          Map<String, dynamic> objMap = jsonDecode(data!);
          Project project = Project.fromJson(objMap);
          projects.add(project);
        }
      }
    });
    await box.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
    );
  }
}
