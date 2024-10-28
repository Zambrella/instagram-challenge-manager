import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';

abstract class ChallengeService {
  const ChallengeService();

  /// Create a new challenge.
  Future<Challenge> createChallenge(Challenge challenge);

  /// Get all challenges created by the logged in user.
  Future<List<Challenge>> getChallenges();

  /// Get a challenge by its [id].
  Future<Challenge> getChallenge(String id);

  /// Delete a challenge by its [id].
  Future<void> deleteChallenge(String id);

  /// Update a challenge.
  Future<Challenge> updateChallenge(Challenge challenge);
}
