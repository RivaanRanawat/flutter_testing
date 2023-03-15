import 'package:flutter/material.dart';
import 'package:users_example/home_screen.dart';
import 'package:users_example/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        futureUsers: UserRepository().fetchUsers(),
      ),
    );
  }
}
