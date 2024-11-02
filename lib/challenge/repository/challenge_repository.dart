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
      data: challenge.toJson(),
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
}
