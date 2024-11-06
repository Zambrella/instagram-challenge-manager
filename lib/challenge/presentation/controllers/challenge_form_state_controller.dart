import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_challenge_manager/challenge/domain/prize.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'challenge_form_state_controller.g.dart';

@CopyWith()
class ChallengeFormState extends Equatable {
  const ChallengeFormState({
    required this.hashtags,
    required this.accounts,
    required this.prizes,
    this.title,
    this.description,
    this.startDate,
    this.endDate,
  });

  const ChallengeFormState.empty()
      : title = null,
        description = null,
        startDate = null,
        endDate = null,
        hashtags = const [],
        accounts = const [],
        prizes = const [];

  final String? title;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> hashtags;
  final List<String> accounts;
  final List<Prize> prizes;

  @override
  List<Object?> get props => [
        title,
        description,
        startDate,
        endDate,
        hashtags,
        accounts,
        prizes,
      ];

  Map<String, dynamic> get initialValues => {
        'title': title,
        'description': description,
        'startDate': startDate,
        'endDate': endDate,
      };

  ChallengeFormState addHashtag(String hashtag) {
    if (hashtags.contains(hashtag)) {
      return this;
    }
    return copyWith(
      hashtags: [
        ...hashtags,
        hashtag.trim(),
      ],
    );
  }

  ChallengeFormState addHashtags(List<String> hashtags) {
    return copyWith(
      hashtags: [
        ...this.hashtags,
        ...hashtags
            .where((h) => !this.hashtags.contains(h))
            .map((h) => h.trim()),
      ],
    );
  }

  ChallengeFormState removeHashtag(String hashtag) {
    return copyWith(hashtags: hashtags.where((h) => h != hashtag).toList());
  }

  ChallengeFormState addAccount(String account) {
    if (accounts.contains(account)) {
      return this;
    }
    return copyWith(
      accounts: [
        ...accounts,
        account.trim(),
      ],
    );
  }

  ChallengeFormState addAccounts(List<String> accounts) {
    return copyWith(
      accounts: [
        ...this.accounts,
        ...accounts
            .where((a) => !this.accounts.contains(a))
            .map((a) => a.trim()),
      ],
    );
  }

  ChallengeFormState removeAccount(String account) {
    return copyWith(accounts: accounts.where((a) => a != account).toList());
  }

  ChallengeFormState addPrize(Prize prize) {
    if (prizes.contains(prize)) {
      return this;
    }
    return copyWith(prizes: [...prizes, prize]);
  }

  ChallengeFormState addPrizes(List<Prize> prizes) {
    return copyWith(
      prizes: [
        ...this.prizes,
        ...prizes.where((p) => !this.prizes.contains(p)),
      ],
    );
  }

  ChallengeFormState removePrize(Prize prize) {
    return copyWith(prizes: prizes.where((p) => p != prize).toList());
  }
}

@Riverpod(keepAlive: true)
class ChallengeFormStateController extends _$ChallengeFormStateController {
  @override
  ChallengeFormState build() {
    return const ChallengeFormState.empty();
  }

  void clear() {
    state = const ChallengeFormState.empty();
  }

  void saveFields(Map<String, dynamic> values) {
    state = state.copyWith(
      title: values['title'] as String?,
      description: values['description'] as String?,
      startDate: values['startDate'] as DateTime?,
      endDate: values['endDate'] as DateTime?,
    );
  }

  void addHashtag(String hashtag) {
    state = state.addHashtag(hashtag);
  }

  void addHashtags(List<String> hashtags) {
    state = state.addHashtags(hashtags);
  }

  void removeHashtag(String hashtag) {
    state = state.removeHashtag(hashtag);
  }

  void addAccount(String account) {
    state = state.addAccount(account);
  }

  void addAccounts(List<String> accounts) {
    state = state.addAccounts(accounts);
  }

  void removeAccount(String account) {
    state = state.removeAccount(account);
  }

  void addPrize(Prize prize) {
    state = state.addPrize(prize);
  }

  void addPrizes(List<Prize> prizes) {
    state = state.addPrizes(prizes);
  }

  void removePrize(Prize prize) {
    state = state.removePrize(prize);
  }
}

@riverpod
List<String> formHashtags(Ref ref) {
  return ref.watch(
    challengeFormStateControllerProvider.select((state) => state.hashtags),
  );
}

@riverpod
List<String> formAccounts(Ref ref) {
  return ref.watch(
    challengeFormStateControllerProvider.select((state) => state.accounts),
  );
}

@riverpod
List<Prize> formPrizes(Ref ref) {
  return ref.watch(
    challengeFormStateControllerProvider.select((state) => state.prizes),
  );
}
