import 'package:dio_networking/home_page.dart';
import 'package:dio_networking/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Networking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        DetailPage.routeName: (context) => const DetailPage(),
      },
      home: const UserListPage(),
    );
  }
}
