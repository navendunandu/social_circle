import 'package:flutter/material.dart';
import 'package:social_circle/add_post.dart';
import 'package:social_circle/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Session? session = supabase.auth.currentSession;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ));
            },
          )
        ],
      ),
      body: ListView(
        children: [Text("User Home Page")],
      ),
    );
  }
}
