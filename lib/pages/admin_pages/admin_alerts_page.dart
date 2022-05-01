import 'package:flutter/material.dart';

class AdminAlertsPage extends StatefulWidget {
  const AdminAlertsPage({Key? key}) : super(key: key);

  @override
  State<AdminAlertsPage> createState() => _AdminAlertsPageState();
}

class _AdminAlertsPageState extends State<AdminAlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Alerts Page'),
          ],
        ),
      ),
    );
  }
}
