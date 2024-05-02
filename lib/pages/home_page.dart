import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  static const String id = 'sd';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6FBF9FF),
      body: ListView(
        children: [
          SizedBox(height: 7),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 35,
                    child: Image(
                      image: AssetImage('assets/images/home.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello!',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text('Abdulhamidov Abdulaziz',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Expanded(
                    child: Icon(
                      Icons.notifications_rounded,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7, left: 20, right: 20, bottom: 20),
            child: Container(
              height: 160,
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              // Set a fixed width for the CircularPercentIndicator
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your today's task",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "almost done!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(20, 40),
                              foregroundColor: Colors.deepPurple,
                              backgroundColor: Colors.white,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              'View Task',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: CircularPercentIndicator(
                      animation: true,
                      percent: 0.8,
                      progressColor: Colors.white,
                      fillColor: Colors.deepPurple,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade600,
                      radius: 60,
                      lineWidth: 10,
                      center: Text(
                        '85%',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.more_horiz,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, bottom: 10),
            child: Row(
              children: [
                Text('In Progress',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 20,
                  child: Center(child: Text('6')),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 130,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue.shade50,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15),
                              child: Text(
                                'Office project',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 13),
                              ),
                            ),
                            SizedBox(width: 65),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                  height: 33,
                                  width: 33,
                                  decoration: BoxDecoration(
                                      color: Colors.pink.shade100,
                                      borderRadius: BorderRadius.circular(9)),
                                  child:
                                      Center(child: Icon(Iconsax.bag_timer))),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Grocery shopping',
                                  style: TextStyle(fontSize: 17)),
                              Text('design', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(20),
                            value: 0.7,
                            minHeight: 8,
                            // 60% progress
                            backgroundColor: Colors.grey[300],
                            // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.blue), // Color of the progress bar
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 130,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15),
                              child: Text(
                                'Personal Project',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 13),
                              ),
                            ),
                            SizedBox(width: 55),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                  height: 33,
                                  width: 33,
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue.shade50,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Center(
                                      child: Icon(
                                    CupertinoIcons.person_crop_rectangle_fill,
                                    color: Colors.deepPurpleAccent,
                                  ))),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Eating less sugar products',
                                  style: TextStyle(fontSize: 17)),
                              Text('challenge', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(20),
                            value: 0.52,
                            minHeight: 8,
                            // 60% progress
                            backgroundColor: Colors.grey[300],
                            // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepOrange), // Color of the progress bar
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    height: 130,
                    width: 230,
                    decoration: BoxDecoration(
                        color: Colors.lightGreen.shade300,
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, left: 15, right: 15),
                              child: Text(
                                'Daily Study',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45,
                                    fontSize: 13),
                              ),
                            ),
                            SizedBox(width: 55),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                  height: 33,
                                  width: 33,
                                  decoration: BoxDecoration(
                                      color: Colors.orange.shade50,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Center(
                                      child: Icon(
                                    CupertinoIcons.book_circle_fill,
                                    color: Colors.orange.shade700,
                                  ))),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Learn 100 vocabulary ',
                                  style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: LinearProgressIndicator(
                            borderRadius: BorderRadius.circular(20),
                            value: 0.52,
                            minHeight: 8,
                            // 60% progress
                            backgroundColor: Colors.grey[300],
                            // Background color of the progress bar
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.deepPurple), // Color of the progress bar
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15),
            child: Row(
              children: [
                Text('Tasks Groups',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 20,
                  child: Center(child: Text('4')),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Container(height: 30, child: Text('Daily Study')),
                  subtitle: Container(height: 30, child: Text('23 tasks')),
                  trailing: SizedBox(
                    child: CircularPercentIndicator(
                      animation: true,
                      percent: 0.8,
                      progressColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade600,
                      radius: 25,
                      lineWidth: 5,
                      center: Text(
                        '85%',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
                        CupertinoIcons.book_circle_fill,
                        color: Colors.orange.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Container(height: 30, child: Text('Personal Project')),
                  subtitle: Container(height: 30, child: Text('30 tasks')),
                  trailing: SizedBox(
                    child: CircularPercentIndicator(
                      animation: true,
                      percent: 0.8,
                      progressColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade600,
                      radius: 25,
                      lineWidth: 5,
                      center: Text(
                        '52%',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
                        CupertinoIcons.person_crop_rectangle_fill,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  title: Container(height: 30, child: Text('Office Project')),
                  subtitle: Container(height: 30, child: Text('23 tasks')),
                  trailing: SizedBox(
                    child: CircularPercentIndicator(
                      animation: true,
                      percent: 0.8,
                      progressColor: Colors.white,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade600,
                      radius: 25,
                      lineWidth: 5,
                      center: Text(
                        '85%',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
                      Iconsax.bag_timer,
                      color: Colors.pinkAccent.shade400,
                    )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
