import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/app_exception.dart';
import 'package:instagram_challenge_manager/challenge/presentation/widgets/challenge_details_view.dart';
import 'package:instagram_challenge_manager/challenge/providers/challenge_provider.dart';

class ChallengeDetailsPage extends ConsumerStatefulWidget {
  const ChallengeDetailsPage({
    required this.challengeId,
    super.key,
  });

  final String challengeId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChallengeDetailsPageState();
}

class _ChallengeDetailsPageState extends ConsumerState<ChallengeDetailsPage> {
  String get challengeId => widget.challengeId;

  @override
  Widget build(BuildContext context) {
    return switch (ref.watch(challengeProvider(challengeId))) {
      AsyncData(valueOrNull: final challenge?) =>
        ChallengeDetailsView(challenge: challenge),
      AsyncError(:final error) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text(error.errorMessage(context)),
          ),
        ),
      _ => Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    };
  }
}
