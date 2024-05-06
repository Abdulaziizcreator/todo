import 'dart:convert';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hive/model.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<String> list1 = ["All", "To do", "In Progress", "Done"];
  String taskType = "All";
  PageController listController = PageController();
  DateTime? selectedDateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Project> projects = [];
  List<Project> projectDaily = [];

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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Today's Tasks",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  setState(() {
                    fetchData();
                    for (Project project in projects) {
                      DateTime time = DateTime.parse(project.startDate!);
                      if (selectedDate.month == time.month &&
                          selectedDate.day == time.day) {
                        projectDaily.add(project);
                      } else {
                        projectDaily.clear();
                        projects.clear();
                      }
                    }
                  });
                },
                headerProps: const EasyHeaderProps(
                  dateFormatter: DateFormatter.fullDateDMY(),
                ),
                dayProps: EasyDayProps(
                  width: 70,
                  height: 90,
                  dayStructure: DayStructure.dayStrDayNumMonth,
                  activeDayStyle: const DayStyle(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color(0xff5f33e1),
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                            color: const Color(0xff5f33e1).withOpacity(0.1),
                            width: 1)),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: projectDaily.length,
              itemBuilder: (context, index) {
                Project project = projectDaily[index];
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
                            margin: const EdgeInsets.only(
                                left: 15, top: 15, bottom: 15),
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
                            margin: const EdgeInsets.only(
                                left: 15, bottom: 15, top: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.timer_rounded,
                                  color:
                                      const Color(0xff9260f4).withOpacity(0.4),
                                ),
                                Text(
                                  project.startDate.toString(),
                                  style: TextStyle(
                                    color: const Color(0xff9260f4)
                                        .withOpacity(0.4),
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
          ),

          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.only(top: 40),
          //     height: 40,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: list1.length + 1,
          //       itemBuilder: (context, index) {
          //
          //         return index == list1.length
          //             ? const SizedBox(width: 24)
          //             : GestureDetector(
          //                 onTap: () {
          //                   setState(() {
          //                     taskType = list1[index];
          //                     Future.delayed(Duration(milliseconds: 100));
          //                     Future.delayed(const Duration(milliseconds: 100));
          //                     sortList();
          //                   });
          //                 },
          //                 child: Container(
          //                   margin: const EdgeInsets.only(left: 24),
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 30, vertical: 8),
          //                   decoration: BoxDecoration(
          //                     color: list1[index] == taskType
          //                         ? const Color(0xff5f33e1)
          //                         : const Color(0xff5f33e1).withOpacity(0.1),
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                   child: Text(
          //                     list1[index],
          //                     style: TextStyle(
          //                         color: list1[index] == taskType
          //                             ? const Color(0xffeee9ff)
          //                             : const Color(0xff5f33e1),
          //                         fontSize: 16,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 ),
          //               );
          //       },
          //     ),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     childCount: list2.length + 1,
          //     (context, index) {
          //       return index == list2.length
          //           ? const SizedBox(
          //               height: 40,
          //             )
          //           : TasksCard(typeOfTasks: list2[index]);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  void deleteProject(int index) async {
    // Remove the project from the list

    projects.removeAt(index);

    // Remove the project from Hive
    var box = await Hive.openBox('mybox');
    box.deleteAt(index);
    await box.close();
  }
}
