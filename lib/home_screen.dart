import 'package:flutter/material.dart';
import 'package:local_notify/demo.dart';
import 'package:local_notify/local_notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    listenToNotification();
    super.initState();
  }

  listenToNotification() {
    LocalNotifications.onClickNotification.stream.listen((event) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Demo(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("notification"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // LocalNotification.scheduleDailyNotification();
              LocalNotifications().showScheduleNotification(
                title: "Simple Notification",
                body: "This is simple Notification",
                payload: "This is simple data",
              );
            },
            child: const Text("simple notification"),
          ),
        ],
      ),
    ));
  }
}
