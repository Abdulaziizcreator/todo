import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:todo/hive/model.dart';
import 'package:todo/hive/service.dart';

class AddPage extends StatefulWidget {
  static const String id = "add_new_task";

  const AddPage({
    super.key,
  });

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  DateTime today = DateTime.now();
  TimeOfDay atTheMoment = TimeOfDay.now();

  String selectedValue = 'Office Project';
  IconData leadingIcon = Iconsax.bag_timer;
  String subtitleText = 'Office Project';
  Color? backgroudColor;

  void onValueChanged(String value) {
    setState(() {
      selectedValue = value;
      if (value == 'Personal Project') {
        leadingIcon = CupertinoIcons.person_crop_rectangle_fill;
        subtitleText = 'Personal Project';
        backgroudColor = Colors.deepPurpleAccent;
      } else if (value == 'Office Project') {
        leadingIcon = Iconsax.bag_timer;
        subtitleText = 'Office Project';
        backgroudColor = Colors.pinkAccent.shade400;
      } else if (value == 'Daily Study') {
        leadingIcon = CupertinoIcons.book_circle_fill;
        subtitleText = 'Daily Study';
        backgroudColor = Colors.orange.shade700;
      }
    });
  }

  TextEditingController _projectNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TimeOfDay selectedTimeNow = TimeOfDay.now();

  void saveObj() {
    String projectName = _projectNameController.text.trim();
    String taskGroup = subtitleText.toString();
    String description = _descriptionController.text.trim();
    String startDateString = startDate.toString();
    String selectedTime = selectedTimeNow.toString();
    String endDateString = endDate.toString();

    if (projectName.isNotEmpty &&
        description.isNotEmpty &&
        taskGroup.isNotEmpty &&
        startDateString.isNotEmpty &&
        endDateString.isNotEmpty &&
        selectedTime.isNotEmpty) {
      Project project = Project(
        projectName: projectName,
        description: description,
        startDate: startDateString,
        endDate: endDateString,
        taskGroup: taskGroup,
        selectedTime: selectedTime,
      );
      HiveService.storeObject(obj: project, objKey: startDateString);
    } else {
      print(
          'Errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    }
  }

  void makeClear() {
    setState(() {
      _projectNameController.clear();
      _descriptionController.clear();
      startDate = today;
      endDate = today;
      selectedTimeNow = atTheMoment;
    });
  }

  void getObj() {
    Project project =
        HiveService.getProjectObject(projectKey: startDate.toString());
  }

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        selectedTimeNow = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(IconlyBold.notification))
        ],
      ),
      body: ListView(children: [
        //Select
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                    child: Icon(
                  leadingIcon,
                  color: backgroudColor,
                )),
              ),
              title: Text(
                'Task Group',
                style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
              ),
              subtitle: Text(
                subtitleText,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: PopupMenuButton<String>(
                icon: Icon(IconlyBold.arrow_down_2),
                onSelected: onValueChanged,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Office Project',
                    child: Text('Office Project'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Personal Project',
                    child: Text('Personal Project'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Daily Study',
                    child: Text('Daily Study'),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        //Project Name
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer),
            ], borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                controller: _projectNameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  counter: const SizedBox(),
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                  labelText: "Project Name",
                  labelStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            )),
        SizedBox(height: 20),
        //Description
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer),
            ], borderRadius: BorderRadius.circular(20)),
            child: TextField(
              maxLength: 1000,
              maxLines: 4,
              controller: _descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                counter: const SizedBox(),
                alignLabelWithHint: true,
                border: InputBorder.none,
                labelText: "Description",
                labelStyle: TextStyle(color: Colors.grey.shade400),
              ),
            )),
        //Select Start Date
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                    child: Icon(
                  IconlyBold.calendar,
                  color: Colors.deepPurple,
                  size: 35,
                )),
              ),
              title: Text(
                'Start Date',
                style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
              ),
              subtitle: Text(
                DateFormat('d MMMM, yyyy').format(startDate),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: IconButton(
                icon: Icon(IconlyBold.arrow_down_2),
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: startDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (dateTime != null) {
                    setState(() {
                      startDate = dateTime;
                    });
                  }
                },
              ),
            ),
          ),
        ),
        //select Time
        TextButton(
          onPressed: () {
            _showTimePicker();
          },
          child: Text(selectedTimeNow.format(context).toString()),
        ),
        //Select EndDate
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Center(
                    child: Icon(
                  IconlyBold.calendar,
                  color: Colors.deepPurple,
                  size: 35,
                )),
              ),
              title: Text(
                'End Date',
                style: TextStyle(color: Colors.grey.shade800, fontSize: 13),
              ),
              subtitle: Text(
                DateFormat('d MMMM, yyyy').format(endDate),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: IconButton(
                icon: Icon(IconlyBold.arrow_down_2),
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: endDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(3000));
                  if (dateTime != null) {
                    setState(() {
                      endDate = dateTime;
                    });
                  }
                },
              ),
            ),
          ),
        ),
        //add button
        // Padding(
        //   padding: const EdgeInsets.only(left: 15, right: 15),
        //   child: ElevatedButton(
        //     onPressed: () {},
        //     style: ElevatedButton.styleFrom(
        //       minimumSize: Size(MediaQuery.of(context).size.width, 50),
        //       foregroundColor: Colors.white,
        //       backgroundColor: Colors.deepPurple,
        //       shape: const StadiumBorder(),
        //     ),
        //     child: Text('Add Project'),
        //   ),
        // )
        GestureDetector(
          onTap: () {
            saveObj();
            getObj();
            makeClear();
          },
          child: Container(
            height: 48,
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 70),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: const Color(0xff5f33e1),
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add Project",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        //Select End Date
      ]),
    );
  }
}
