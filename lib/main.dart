import 'package:flutter/material.dart';
import 'package:social_circle/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Ensures that the app is fully initialized before anything is executed
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the Supabase instance with your project URL and anon key
  await Supabase.initialize(
    url: 'https://wtqzqtnofaxczcpohdfw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind0cXpxdG5vZmF4Y3pjcG9oZGZ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzExNTcwODcsImV4cCI6MjA0NjczMzA4N30.9q09jTP1QuyrDNmIxSoafAnFbaQ70rhQhBBda-c4zGY',
  );

  // Run the app after Supabase initialization is complete
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, // Disables the debug banner
        home: LoginScreen());
  }
}
