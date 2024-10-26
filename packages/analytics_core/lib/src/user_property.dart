/// {@template user_property}
/// A simple class that represents a user property.
/// {@endtemplate}
class UserProperty {
  /// {@macro user_property}
  UserProperty(
    this.name,
    this.value,
  );

  /// The name of the property.
  final String name;

  /// The value of the property.
  final dynamic value;
}
