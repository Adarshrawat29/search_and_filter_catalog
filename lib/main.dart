import 'package:flutter/material.dart';
import 'package:userstory_remote_data_fetching/features/post/presentation/pages/post_page.dart';
import 'injection/injection_container.dart';


/// App Entry
/// AC 11.4: Setup DI before app starts

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection(); 
  // Initializes all dependencies before app runs

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PostPage(),
    );
  }
}