import 'package:flutter/material.dart';
import 'package:users_example/user_model.dart';
import 'package:users_example/user_repository.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<User>> futureUsers;
  const HomeScreen({
    super.key,
    required this.futureUsers,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder<List<User>>(
        future: widget.futureUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
