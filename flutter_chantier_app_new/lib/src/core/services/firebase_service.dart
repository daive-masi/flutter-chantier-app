import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
    print('✅ Firebase initialisé avec succès');
  }

  static Future<bool> testConnection() async {
    try {
      // Test Firestore
      await FirebaseFirestore.instance.collection('test').doc('connection').set({
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'success'
      });
      
      // Test Auth
      final auth = FirebaseAuth.instance;
      print('🔥 Firebase UID: ${auth.currentUser?.uid}');
      
      return true;
    } catch (e) {
      print('❌ Erreur Firebase: $e');
      return false;
    }
  }
}