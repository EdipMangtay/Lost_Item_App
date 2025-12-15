import 'package:flutter/material.dart';

class ColorTokens {
  static const Color primary = Color(0xFF6750A4);
  static const Color secondary = Color(0xFF625B71);
  static const Color tertiary = Color(0xFF7D5260);
  
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFBA1A1A);
  
  static const Color surface = Color(0xFFFFFBFE);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  
  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'instorage':
      case 'in storage':
        return const Color(0xFF2196F3);
      case 'pendingclaim':
      case 'pending claim':
        return warning;
      case 'delivered':
        return success;
      default:
        return secondary;
    }
  }
}

