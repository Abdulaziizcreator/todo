import 'package:flutter/material.dart';
import 'package:todo/pages/bottom_nav_bar_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.56,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/splash.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Task Management &',
                  style: TextStyle(fontSize: 24, fontFamily: 'splash2'),
                ),
                const Text('To-Do List',
                    style: TextStyle(fontSize: 24, fontFamily: 'splash2')),
                const SizedBox(height: 20),
                const Text(
                  'This productive tool is designed to help',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const Text(
                  'you better manage your task',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const Text(
                  'project-wise conveniently',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavBarPage()));
                  },
                  child: Container(
                    height: 48,
                    margin:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 70),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color(0xff5f33e1),
                    ),
                    child: Stack(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Let's start",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavBarPage()));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
