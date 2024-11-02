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
  Future<void> deleteChallenge(String id) async {
    await _challengeRepository.deleteChallenge(id);
  }

  @override
  Future<Challenge> getChallenge(String id) async {
    final challengeDto = await _challengeRepository.getChallenge(id);
    final challenge = challengeDto.toDomain();
    return challenge;
  }

  @override
  Future<List<Challenge>> getChallenges() async {
    final challengeDtos = await _challengeRepository.getChallenges();
    final challenges = challengeDtos.map((e) => e.toDomain()).toList();
    return challenges;
  }

  @override
  Future<Challenge> updateChallenge(Challenge challenge) async {
    final challengeDto = ChallengeDto.fromDomain(challenge);
    final updatedChallengeDto =
        await _challengeRepository.updateChallenge(challengeDto);
    final updatedChallenge = updatedChallengeDto.toDomain();
    return updatedChallenge;
  }
}
