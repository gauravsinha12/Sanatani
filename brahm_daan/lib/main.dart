import 'package:brahm_daan/screens/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('BramhDan'),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  )
                ],
                backgroundColor: Colors.blueAccent,
                elevation: 0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/temples-in-India_8th-jan.jpg')),
                  ),
                ))));
  }
}
