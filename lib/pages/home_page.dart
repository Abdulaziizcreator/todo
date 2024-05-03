import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  static const String id = 'sd';

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6FBF9FF),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topLeft,
            tileMode: TileMode.clamp,
            radius: 2,
            colors: [
              Colors.white,
              Colors.white,
              Colors.purpleAccent.shade100.withOpacity(0.1),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.yellowAccent.shade100.withOpacity(0.1),
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.white,
              Colors.blueAccent.shade100.withOpacity(0.1),
            ],
          ),
        ),
        child: ListView(
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
                        Text(
                          'Hello!',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Abdulhamidov Abdulaziz',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 28,
                        ),
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
                    color: Color(0xff5f33e1),
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
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "almost done!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(bottom: 20, left: 20),
                              width: 128,
                              height: 36,
                              child: const Text(
                                "View task",
                                style: TextStyle(
                                    color: Color(0xff5f33e1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xffeee9ff)),
                            ),
                          ),
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
                        fillColor: Color(0xff5f33e1),
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
                  Text(
                    'In Progress',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    child: Center(child: Text('6')),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
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
                          color: Color(0xffe7f3ff),
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
                                      fontWeight: FontWeight.w500,
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
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                                Text('design',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
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
                                      fontWeight: FontWeight.w500,
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
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
                                Text('challenge',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
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
                              valueColor: AlwaysStoppedAnimation<Color>(Colors
                                  .deepOrange), // Color of the progress bar
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
                                      fontWeight: FontWeight.w500,
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
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500)),
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
                              valueColor: AlwaysStoppedAnimation<Color>(Colors
                                  .deepPurple), // Color of the progress bar
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
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(width: 10),
                  Container(
                    height: 20,
                    width: 20,
                    child: Center(child: Text('4')),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Container(height: 30, child: Text('Daily Study')),
                      subtitle: Container(height: 30, child: Text('23 tasks')),
                      trailing: SizedBox(
                        child: CircularPercentIndicator(
                          animation: true,
                          percent: 0.8,
                          progressColor: Color(0xffff9142),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Color(0xffffe6d4),
                          radius: 25,
                          lineWidth: 5,
                          center: Text(
                            '85%',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
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
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Container(
                          height: 30, child: Text('Personal Project')),
                      subtitle: Container(height: 30, child: Text('30 tasks')),
                      trailing: SizedBox(
                        child: CircularPercentIndicator(
                          animation: true,
                          percent: 0.8,
                          progressColor: Color(0xff9260f4),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Color(0xffede4ff),
                          radius: 25,
                          lineWidth: 5,
                          center: Text(
                            '52%',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
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
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title:
                          Container(height: 30, child: Text('Office Project')),
                      subtitle: Container(height: 30, child: Text('23 tasks')),
                      trailing: SizedBox(
                        child: CircularPercentIndicator(
                          animation: true,
                          percent: 0.8,
                          progressColor: Color(0xfff478b8),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Color(0xffffe4f2),
                          radius: 25,
                          lineWidth: 5,
                          center: Text(
                            '85%',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
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
            ),
          ],
        ),
      ),
    );
  }
}
