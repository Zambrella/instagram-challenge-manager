import 'package:flutter/foundation.dart';

/// Represents the user's data privacy choices.
@immutable
class DataPrivacySettings {
  /// Represents the user's data privacy choices.
  DataPrivacySettings({
    required bool ads,
    required bool analytics,
    required bool crashes,
    required bool basic,
    this.deviceAdId,
  }) : choices = {
          PrivacyOption.ads: ads,
          PrivacyOption.analytics: analytics,
          PrivacyOption.crashes: crashes,
          PrivacyOption.basic: basic,
        };

  /// All choices are set to false by default.
  DataPrivacySettings.none({
    this.deviceAdId,
    bool ads = false,
    bool analytics = false,
    bool crashes = false,
    bool basic = false,
  }) : choices = {
          PrivacyOption.ads: ads,
          PrivacyOption.analytics: analytics,
          PrivacyOption.crashes: crashes,
          PrivacyOption.basic: basic,
        };

  /// All choices are set to true by default.
  DataPrivacySettings.all({this.deviceAdId})
      : choices = {
          PrivacyOption.ads: true,
          PrivacyOption.analytics: true,
          PrivacyOption.crashes: true,
          PrivacyOption.basic: true,
        };

  /// Only the basic choice is set to true by default.
  DataPrivacySettings.basic({this.deviceAdId})
      : choices = {
          PrivacyOption.ads: false,
          PrivacyOption.analytics: false,
          PrivacyOption.crashes: false,
          PrivacyOption.basic: true,
        };

  /// Converts a map to a [DataPrivacySettings] object.
  factory DataPrivacySettings.fromMap(Map<String, dynamic> map) {
    return DataPrivacySettings(
      ads: map['ads'] as bool? ?? false,
      analytics: map['analytics'] as bool? ?? false,
      crashes: map['crashes'] as bool? ?? false,
      basic: map['basic'] as bool? ?? false,
    );
  }

  /// Whether the user has accepted all data privacy settings.
  final Map<PrivacyOption, bool> choices;

  /// The device's advertising ID.
  final String? deviceAdId;

  /// Gets the value of the [PrivacyOption.ads] choice;
  bool get ads => choices[PrivacyOption.ads] ?? false;

  /// Gets the value of the [PrivacyOption.analytics] choice;
  bool get analytics => choices[PrivacyOption.analytics] ?? false;

  /// Gets the value of the [PrivacyOption.crashes] choice;
  bool get crashes => choices[PrivacyOption.crashes] ?? false;

  /// Gets the value of the [PrivacyOption.basic] choice;
  bool get basic => choices[PrivacyOption.basic] ?? false;

  @override
  String toString() {
    return 'DataPrivacySettings{choices: $choices, deviceAdId: $deviceAdId}';
  }
}

/// Represents the user's data privacy choices.
enum PrivacyOption {
  /// Whether the user has accepted ads.
  ads,

  /// Whether the user has accepted analytics.
  analytics,

  /// Whether the user has accepted crashes.
  crashes,

  /// Whether the user has accepted basic choice.
  basic;
}
