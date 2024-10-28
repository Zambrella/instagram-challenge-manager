// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChallengeCWProxy {
  Challenge title(String title);

  Challenge description(String description);

  Challenge hashtags(List<Hashtag> hashtags);

  Challenge hashtagsRequired(bool hashtagsRequired);

  Challenge accounts(List<Account> accounts);

  Challenge accountMentionRequired(bool accountMentionRequired);

  Challenge startDate(DateTime startDate);

  Challenge endDate(DateTime endDate);

  Challenge prizes(List<Prize>? prizes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Challenge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Challenge(...).copyWith(id: 12, name: "My name")
  /// ````
  Challenge call({
    String? title,
    String? description,
    List<Hashtag>? hashtags,
    bool? hashtagsRequired,
    List<Account>? accounts,
    bool? accountMentionRequired,
    DateTime? startDate,
    DateTime? endDate,
    List<Prize>? prizes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChallenge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChallenge.copyWith.fieldName(...)`
class _$ChallengeCWProxyImpl implements _$ChallengeCWProxy {
  const _$ChallengeCWProxyImpl(this._value);

  final Challenge _value;

  @override
  Challenge title(String title) => this(title: title);

  @override
  Challenge description(String description) => this(description: description);

  @override
  Challenge hashtags(List<Hashtag> hashtags) => this(hashtags: hashtags);

  @override
  Challenge hashtagsRequired(bool hashtagsRequired) =>
      this(hashtagsRequired: hashtagsRequired);

  @override
  Challenge accounts(List<Account> accounts) => this(accounts: accounts);

  @override
  Challenge accountMentionRequired(bool accountMentionRequired) =>
      this(accountMentionRequired: accountMentionRequired);

  @override
  Challenge startDate(DateTime startDate) => this(startDate: startDate);

  @override
  Challenge endDate(DateTime endDate) => this(endDate: endDate);

  @override
  Challenge prizes(List<Prize>? prizes) => this(prizes: prizes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Challenge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Challenge(...).copyWith(id: 12, name: "My name")
  /// ````
  Challenge call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? hashtags = const $CopyWithPlaceholder(),
    Object? hashtagsRequired = const $CopyWithPlaceholder(),
    Object? accounts = const $CopyWithPlaceholder(),
    Object? accountMentionRequired = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? prizes = const $CopyWithPlaceholder(),
  }) {
    return Challenge(
      title: title == const $CopyWithPlaceholder() || title == null
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String,
      description:
          description == const $CopyWithPlaceholder() || description == null
              ? _value.description
              // ignore: cast_nullable_to_non_nullable
              : description as String,
      hashtags: hashtags == const $CopyWithPlaceholder() || hashtags == null
          ? _value.hashtags
          // ignore: cast_nullable_to_non_nullable
          : hashtags as List<Hashtag>,
      hashtagsRequired: hashtagsRequired == const $CopyWithPlaceholder() ||
              hashtagsRequired == null
          ? _value.hashtagsRequired
          // ignore: cast_nullable_to_non_nullable
          : hashtagsRequired as bool,
      accounts: accounts == const $CopyWithPlaceholder() || accounts == null
          ? _value.accounts
          // ignore: cast_nullable_to_non_nullable
          : accounts as List<Account>,
      accountMentionRequired:
          accountMentionRequired == const $CopyWithPlaceholder() ||
                  accountMentionRequired == null
              ? _value.accountMentionRequired
              // ignore: cast_nullable_to_non_nullable
              : accountMentionRequired as bool,
      startDate: startDate == const $CopyWithPlaceholder() || startDate == null
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime,
      endDate: endDate == const $CopyWithPlaceholder() || endDate == null
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime,
      prizes: prizes == const $CopyWithPlaceholder()
          ? _value.prizes
          // ignore: cast_nullable_to_non_nullable
          : prizes as List<Prize>?,
    );
  }
}

extension $ChallengeCopyWith on Challenge {
  /// Returns a callable class that can be used as follows: `instanceOfChallenge.copyWith(...)` or like so:`instanceOfChallenge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChallengeCWProxy get copyWith => _$ChallengeCWProxyImpl(this);
}
