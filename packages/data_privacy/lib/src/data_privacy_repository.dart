import 'package:data_privacy/src/data_privacy_choices.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template data_privacy_repository}
/// Repository for handling the data privacy settings.
/// {@endtemplate}
class DataPrivacyRepository {
  /// {@macro data_privacy_repository}
  const DataPrivacyRepository(this._sharedPrefereces);

  final SharedPreferences _sharedPrefereces;

  static const _hasSeenPrivacySettingsKey = 'PRIVACY_SETTINGS';

  /// Saves the privacy settings to the device.
  Future<void> savePrivacySettings(DataPrivacySettings settings) async {
    try {
      // Iterate through the settings and save them to the device.
      for (final setting in settings.choices.entries) {
        await _sharedPrefereces.setBool(setting.key.toString(), setting.value);
      }
      // Save that the user has seen the privacy settings.
      await _sharedPrefereces.setBool(_hasSeenPrivacySettingsKey, true);
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches the privacy settings from the device.
  /// Returns null if the settings are not found.
  Future<DataPrivacySettings?> fetchPrivacySettings() async {
    try {
      final hasSeen = _sharedPrefereces.getBool(_hasSeenPrivacySettingsKey);
      // If the user has not seen the privacy settings, return null as they won't have have settings saved.
      if (hasSeen == null || !hasSeen) {
        return null;
      }

      // Fetch the settings and convert them into a [DataPrivacySettings] object.
      final result = <String, dynamic>{};
      for (final setting in DataPrivacySettings.none().choices.entries) {
        final value = _sharedPrefereces.getBool(setting.key.toString());
        if (value != null) {
          result[setting.key.toString()] = value;
        }
      }
      final settings = DataPrivacySettings.fromMap(result);
      return settings;
    } catch (e) {
      rethrow;
    }
  }
}
