class IdGenerator {
  static int _counter = 0;

  static String generateFoundItemId() {
    final year = DateTime.now().year;
    _counter++;
    return 'LF-$year-${_counter.toString().padLeft(6, '0')}';
  }

  static String generateClaimId() {
    _counter++;
    return 'CLM-${DateTime.now().millisecondsSinceEpoch}-$_counter';
  }

  static String generateQrValue(String itemId) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return 'LF|$itemId|$timestamp';
  }

  static void reset() {
    _counter = 0;
  }
}

