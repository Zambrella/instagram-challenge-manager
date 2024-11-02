import 'package:instagram_challenge_manager/challenge/domain/challenge.dart';
import 'package:instagram_challenge_manager/challenge/domain/challenge_service.abs.dart';
import 'package:instagram_challenge_manager/challenge/repository/challenge_dto.dart';
import 'package:instagram_challenge_manager/challenge/repository/challenge_repository.dart';

class ChallengeServiceImpl implements ChallengeService {
  const ChallengeServiceImpl(this._challengeRepository);

  final ChallengeRepository _challengeRepository;

  @override
  Future<Challenge> createChallenge(Challenge challenge) async {
    final challengeDto = ChallengeDto.fromDomain(challenge);
    final newChallengeDto =
        await _challengeRepository.createChallenge(challengeDto);
    final newChallenge = newChallengeDto.toDomain();
    return newChallenge;
  }

  @override
  Future<void> deleteChallenge(String id) {
    // TODO: implement deleteChallenge
    throw UnimplementedError();
  }

  @override
  Future<Challenge> getChallenge(String id) {
    // TODO: implement getChallenge
    throw UnimplementedError();
  }

  @override
  Future<List<Challenge>> getChallenges() {
    // TODO: implement getChallenges
    throw UnimplementedError();
  }

  @override
  Future<Challenge> updateChallenge(Challenge challenge) {
    // TODO: implement updateChallenge
    throw UnimplementedError();
  }
}
