import 'package:flutter_test/flutter_test.dart';
import 'package:campus_lost_found/core/utils/id_generator.dart';

void main() {
  group('IdGenerator', () {
    test('generates found item ID with correct format', () {
      final id = IdGenerator.generateFoundItemId();
      expect(id, startsWith('LF-'));
      expect(id.split('-').length, 3);
    });

    test('generates claim ID', () {
      final id = IdGenerator.generateClaimId();
      expect(id, startsWith('CLM-'));
    });

    test('generates QR value with item ID', () {
      const itemId = 'LF-2025-000001';
      final qrValue = IdGenerator.generateQrValue(itemId);
      expect(qrValue, contains(itemId));
      expect(qrValue, startsWith('LF|'));
    });
  });
}

