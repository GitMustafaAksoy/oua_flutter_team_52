import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../utilities/google_sign_in_page.dart';

class AdminAccountPage extends StatefulWidget {
  const AdminAccountPage({Key? key}) : super(key: key);

  @override
  State<AdminAccountPage> createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends State<AdminAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(FirebaseAuth.instance.currentUser!.displayName.toString()),
            Text(FirebaseAuth.instance.currentUser!.email.toString()),
            Text(FirebaseAuth.instance.currentUser!.uid.toString()),
            TextButton(
              onPressed: () async {
                await signOutWithGoogle();
                await Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SplashScreen(),
                ));
              },
              child: Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
