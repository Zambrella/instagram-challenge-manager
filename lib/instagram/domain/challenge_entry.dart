import 'package:flutter/foundation.dart';

/// {@template challenge_entry}
/// Represents an Instagram post that is an entry to a challenge.
/// {@endtemplate}
@immutable
class ChallengeEntry {
  /// {@macro challenge_entry}
  const ChallengeEntry({
    required this.id,
  });

  final String id;

  //? Other relevant fields
}
