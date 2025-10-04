import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/core/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await FirebaseService.initialize();
  
  // Test connection
  final success = await FirebaseService.testConnection();
  print('Connection Firebase: $success');
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chantier App',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.construction,
                size: 64,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                'Flutter Chantier App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Firebase Configuré ✅'),
            ],
          ),
        ),
      ),
    );
  }
}