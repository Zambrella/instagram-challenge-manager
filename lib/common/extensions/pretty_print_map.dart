import 'dart:convert';

extension PrettyPrintMapX<K, V> on Map<K, V> {
  /// Pretty print a map.
  String prettyPrintMap() {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(this);
  }
}
