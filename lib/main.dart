import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:match_trip/pages/admin_pages/admin_home_page.dart';
import 'pages/admin_pages/admin_account_page.dart';
import 'pages/admin_pages/admin_alerts_page.dart';
import 'pages/admin_pages/admin_all_recycle_bins_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_account_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_alerts_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_history_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_map_page.dart';
import 'pages/scrap_dealer_pages/scrap_dealer_home_page.dart';
import 'pages/user_pages/user_account_page.dart';
import 'pages/user_pages/user_alerts_page.dart';
import 'pages/user_pages/user_history_page.dart';
import 'pages/user_pages/user_home_page.dart';
import 'utilities/google_sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
  }

  void runToUserHomePage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ToUserHomePage(),
    ));
  }

  void runToAdminHomePage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ToAdminHomePage(),
    ));
  }

  void runToScrapDealerHomePage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => ToScrapDealerHomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFirebaseInitialized
            ? ElevatedButton(
                onPressed: () async {
                  await signInWithGoogle();
                  String? name = FirebaseAuth.instance.currentUser!.displayName;
                  String? email = FirebaseAuth.instance.currentUser!.email;
                  String uid = FirebaseAuth.instance.currentUser!.uid;
                  DocumentSnapshot<Map<String, dynamic>> toCheckUserData =
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .get();
                  DocumentSnapshot<Map<String, dynamic>> toCheckUserExists =
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .get();
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(uid)
                      .set({
                    'name': name,
                    'email': email,
                    'uid': uid,
                    if (toCheckUserExists.exists == false ||
                        toCheckUserData['role'] == 'user')
                      'role': 'user',
                    'isUserSignIn': true,
                    'lastLoginTime': FieldValue.serverTimestamp(),
                  }, SetOptions(merge: true));
                  DocumentSnapshot<Map<String, dynamic>> userData =
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .get();
                  if (userData['role'] == 'user' &&
                      FirebaseAuth.instance.currentUser != null) {
                    return runToUserHomePage();
                  } else if (userData['role'] == 'admin' &&
                      FirebaseAuth.instance.currentUser != null) {
                    return runToAdminHomePage();
                  } else if (userData['role'] == 'scrap_dealer' &&
                      FirebaseAuth.instance.currentUser != null) {
                    return runToScrapDealerHomePage();
                  }
                },
                child: Text('Sign in with Google'))
            : CircularProgressIndicator(),
      ),
    );
  }
}

class ToUserHomePage extends StatefulWidget {
  const ToUserHomePage({Key? key}) : super(key: key);

  @override
  State<ToUserHomePage> createState() => _ToUserHomePageState();
}

class _ToUserHomePageState extends State<ToUserHomePage> {
  int _selectedIndex = 0;
  final List screens = [
    const UserHomePage(),
    const UserHistoryPage(),
    const UserAlertsPage(),
    const UserAccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}

class ToAdminHomePage extends StatefulWidget {
  const ToAdminHomePage({Key? key}) : super(key: key);

  @override
  State<ToAdminHomePage> createState() => _ToAdminHomePageState();
}

class _ToAdminHomePageState extends State<ToAdminHomePage> {
  int _selectedIndex = 0;
  final List screens = [
    const AdminHomePage(),
    const AdminRecycleListPage(),
    const AdminAlertsPage(),
    const AdminAccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}

class ToScrapDealerHomePage extends StatefulWidget {
  const ToScrapDealerHomePage({Key? key}) : super(key: key);

  @override
  State<ToScrapDealerHomePage> createState() => _ToScrapDealerHomePageState();
}

class _ToScrapDealerHomePageState extends State<ToScrapDealerHomePage> {
  int _selectedIndex = 0;
  final List screens = [
    const ScrapDealerHomePage(),
    const ScrapDealerHistoryPage(),
    const ScrapDealerMapPage(),
    const ScrapDealerAlertsPage(),
    const ScrapDealerAccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          label: 'Alerts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts_outlined),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }
}
