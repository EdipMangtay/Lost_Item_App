/*
 * Campus Lost & Found Management System - Demo App
 * 
 * HOW TO RUN:
 * 1. Ensure Flutter 3.x and Dart 3.x are installed
 * 2. Run: flutter pub get
 * 3. Run: flutter pub run build_runner build --delete-conflicting-outputs
 * 4. Run: flutter run
 * 
 * FEATURES:
 * - Found Item Registration (Officer role)
 * - Search & Claim (Student role)
 * - Claim Review & Handover (Officer role)
 * - Role-based access control
 * - QR code generation for items
 * - Audit logging
 * 
 * DEMO MODE:
 * - All data is stored in-memory (no persistence)
 * - Use Settings to toggle between Student/Officer roles
 * - Debug mode includes "Reset Demo Data" button
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:campus_lost_found/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:campus_lost_found/firebase_options.dart';
import 'dart:developer' as developer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // CRITICAL FIX: Check if Firebase is already initialized
  // This prevents "duplicate-app" error during hot reload/restart
  bool firebaseInitialized = false;
  String? firebaseError;

  try {
    // Check if Firebase default app already exists
    try {
      Firebase.app();
      // App exists, Firebase is already initialized
      developer.log('Firebase already initialized (default app exists)');
      firebaseInitialized = true;
    } catch (e) {
      // Default app doesn't exist, need to initialize
      // Check if apps list is empty as additional safety
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        developer.log('Firebase initialized successfully');
        firebaseInitialized = true;
      } else {
        // Apps exist but default app access failed - use existing
        developer.log('Firebase apps exist, using existing initialization');
        firebaseInitialized = true;
      }
    }
  } catch (e, stackTrace) {
    // Check if it's a duplicate app error - this means Firebase is already initialized
    final errorMessage = e.toString().toLowerCase();
    if (errorMessage.contains('duplicate') || 
        errorMessage.contains('already exist') ||
        errorMessage.contains('already initialized')) {
      // Firebase is already initialized, treat as success
      developer.log('Firebase duplicate app detected - treating as already initialized');
      firebaseInitialized = true;
    } else {
      // Real initialization error
      developer.log(
        'Firebase initialization failed: $e',
        error: e,
        stackTrace: stackTrace,
      );
      firebaseError = e.toString();
    }
  }

  runApp(
    ProviderScope(
      child: App(
        firebaseInitialized: firebaseInitialized,
        firebaseError: firebaseError,
      ),
    ),
  );
}
