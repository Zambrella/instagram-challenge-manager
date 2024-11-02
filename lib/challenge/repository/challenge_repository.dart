import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:instagram_challenge_manager/challenge/repository/challenge_dto.dart';
import 'package:instagram_challenge_manager/common/appwrite_ids.dart';

class ChallengeRepository {
  const ChallengeRepository(
    this._account,
    this._db,
  );

  final Account _account;
  final Databases _db;

  Future<ChallengeDto> createChallenge(ChallengeDto challenge) async {
    log(
      'Creating new challenge: $challenge',
      name: 'ChallengeRepository',
    );
    final user = await _account.get();
    final newDoc = await _db.createDocument(
      databaseId: AppwriteIds.mainDatabaseId,
      collectionId: AppwriteIds.challengeCollectionId,
      documentId: challenge.$id,
      data: challenge.toJson()
        ..addEntries(
          [
            MapEntry('owner', user.$id),
          ],
        ),
      permissions: [
        Permission.read(Role.user(user.$id)),
        Permission.write(Role.user(user.$id)),
        Permission.update(Role.user(user.$id)),
        Permission.delete(Role.user(user.$id)),
      ],
    );
    final newChallenge = ChallengeDto.fromJson(newDoc.data);
    log(
      'Created new challenge: $newChallenge',
      name: 'ChallengeRepository',
    );
    return newChallenge;
  }

  /// Get all challenges created by the logged in user.
  Future<List<ChallengeDto>> getChallenges() async {
    log(
      'Getting all challenges',
      name: 'ChallengeRepository',
    );
    final user = await _account.get();
    final docList = await _db.listDocuments(
      databaseId: AppwriteIds.mainDatabaseId,
      collectionId: AppwriteIds.challengeCollectionId,
      queries: [
        Query.equal('owner', user.$id),
      ],
    );
    final docs = docList.documents;
    final challenges = docs
        .map(
          (doc) => ChallengeDto.fromJson(doc.data),
        )
        .toList();
    log(
      'Got ${challenges.length} challenges',
      name: 'ChallengeRepository',
    );
    return challenges;
  }

  /// Get a challenge by its [id].
  Future<ChallengeDto> getChallenge(String id) async {
    log(
      'Getting challenge with id: $id',
      name: 'ChallengeRepository',
    );
    final doc = await _db.getDocument(
      databaseId: AppwriteIds.mainDatabaseId,
      collectionId: AppwriteIds.challengeCollectionId,
      documentId: id,
    );
    final challenge = ChallengeDto.fromJson(doc.data);
    log(
      'Got challenge: $challenge',
      name: 'ChallengeRepository',
    );
    return challenge;
  }

  /// Delete a challenge by its [id].
  Future<void> deleteChallenge(String id) async {
    log(
      'Deleting challenge with id: $id',
      name: 'ChallengeRepository',
    );
    await _db.deleteDocument(
      databaseId: AppwriteIds.mainDatabaseId,
      collectionId: AppwriteIds.challengeCollectionId,
      documentId: id,
    );
    log(
      'Deleted challenge with id: $id',
      name: 'ChallengeRepository',
    );
  }

  /// Update a challenge.
  Future<ChallengeDto> updateChallenge(ChallengeDto challenge) async {
    log(
      'Updating challenge: $challenge',
      name: 'ChallengeRepository',
    );
    final updatedDoc = await _db.updateDocument(
      databaseId: AppwriteIds.mainDatabaseId,
      collectionId: AppwriteIds.challengeCollectionId,
      documentId: challenge.$id,
      data: challenge.toJson(),
    );
    final updatedChallenge = ChallengeDto.fromJson(updatedDoc.data);
    log(
      'Updated challenge: $updatedChallenge',
      name: 'ChallengeRepository',
    );
    return updatedChallenge;
  }
}
