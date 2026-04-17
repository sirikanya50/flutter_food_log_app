import 'package:flutter/material.dart';
import 'package:flutter_food_log_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://lrbljirbacorjklejoue.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxyYmxqaXJiYWNvcmprbGVqb3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUxMTk3MTUsImV4cCI6MjA5MDY5NTcxNX0.IPx5mwGyFiYYS6kpEIC3l6Qkds_MJxIBtv5K4iIPd74',
  );
  runApp(const FlutterFoodLogApp());
}

class FlutterFoodLogApp extends StatefulWidget {
  const FlutterFoodLogApp({super.key});

  @override
  State<FlutterFoodLogApp> createState() => _FlutterFoodLogAppState();
}

class _FlutterFoodLogAppState extends State<FlutterFoodLogApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
          textTheme: GoogleFonts.promptTextTheme(Theme.of(context).textTheme)),
    );
  }
}