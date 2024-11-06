// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_form_state_controller.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChallengeFormStateCWProxy {
  ChallengeFormState hashtags(List<String> hashtags);

  ChallengeFormState accounts(List<String> accounts);

  ChallengeFormState prizes(List<Prize> prizes);

  ChallengeFormState title(String? title);

  ChallengeFormState description(String? description);

  ChallengeFormState startDate(DateTime? startDate);

  ChallengeFormState endDate(DateTime? endDate);

  ChallengeFormState prizeJustAdded(bool prizeJustAdded);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChallengeFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChallengeFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChallengeFormState call({
    List<String>? hashtags,
    List<String>? accounts,
    List<Prize>? prizes,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    bool? prizeJustAdded,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChallengeFormState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChallengeFormState.copyWith.fieldName(...)`
class _$ChallengeFormStateCWProxyImpl implements _$ChallengeFormStateCWProxy {
  const _$ChallengeFormStateCWProxyImpl(this._value);

  final ChallengeFormState _value;

  @override
  ChallengeFormState hashtags(List<String> hashtags) =>
      this(hashtags: hashtags);

  @override
  ChallengeFormState accounts(List<String> accounts) =>
      this(accounts: accounts);

  @override
  ChallengeFormState prizes(List<Prize> prizes) => this(prizes: prizes);

  @override
  ChallengeFormState title(String? title) => this(title: title);

  @override
  ChallengeFormState description(String? description) =>
      this(description: description);

  @override
  ChallengeFormState startDate(DateTime? startDate) =>
      this(startDate: startDate);

  @override
  ChallengeFormState endDate(DateTime? endDate) => this(endDate: endDate);

  @override
  ChallengeFormState prizeJustAdded(bool prizeJustAdded) =>
      this(prizeJustAdded: prizeJustAdded);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChallengeFormState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChallengeFormState(...).copyWith(id: 12, name: "My name")
  /// ````
  ChallengeFormState call({
    Object? hashtags = const $CopyWithPlaceholder(),
    Object? accounts = const $CopyWithPlaceholder(),
    Object? prizes = const $CopyWithPlaceholder(),
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? startDate = const $CopyWithPlaceholder(),
    Object? endDate = const $CopyWithPlaceholder(),
    Object? prizeJustAdded = const $CopyWithPlaceholder(),
  }) {
    return ChallengeFormState(
      hashtags: hashtags == const $CopyWithPlaceholder() || hashtags == null
          ? _value.hashtags
          // ignore: cast_nullable_to_non_nullable
          : hashtags as List<String>,
      accounts: accounts == const $CopyWithPlaceholder() || accounts == null
          ? _value.accounts
          // ignore: cast_nullable_to_non_nullable
          : accounts as List<String>,
      prizes: prizes == const $CopyWithPlaceholder() || prizes == null
          ? _value.prizes
          // ignore: cast_nullable_to_non_nullable
          : prizes as List<Prize>,
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      startDate: startDate == const $CopyWithPlaceholder()
          ? _value.startDate
          // ignore: cast_nullable_to_non_nullable
          : startDate as DateTime?,
      endDate: endDate == const $CopyWithPlaceholder()
          ? _value.endDate
          // ignore: cast_nullable_to_non_nullable
          : endDate as DateTime?,
      prizeJustAdded: prizeJustAdded == const $CopyWithPlaceholder() ||
              prizeJustAdded == null
          ? _value.prizeJustAdded
          // ignore: cast_nullable_to_non_nullable
          : prizeJustAdded as bool,
    );
  }
}

extension $ChallengeFormStateCopyWith on ChallengeFormState {
  /// Returns a callable class that can be used as follows: `instanceOfChallengeFormState.copyWith(...)` or like so:`instanceOfChallengeFormState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChallengeFormStateCWProxy get copyWith =>
      _$ChallengeFormStateCWProxyImpl(this);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formHashtagsHash() => r'c5cb5ca5ec74e70ab4636e755da11a61c9ab8518';

/// See also [formHashtags].
@ProviderFor(formHashtags)
final formHashtagsProvider = AutoDisposeProvider<List<String>>.internal(
  formHashtags,
  name: r'formHashtagsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$formHashtagsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormHashtagsRef = AutoDisposeProviderRef<List<String>>;
String _$formAccountsHash() => r'5c35d00b3ccfc58025efc86c0df1112f3a4440be';

/// See also [formAccounts].
@ProviderFor(formAccounts)
final formAccountsProvider = AutoDisposeProvider<List<String>>.internal(
  formAccounts,
  name: r'formAccountsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$formAccountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormAccountsRef = AutoDisposeProviderRef<List<String>>;
String _$formPrizesHash() => r'436bcc5ddbf3d29ea345aee5861d2a2cedf6c2fa';

/// See also [formPrizes].
@ProviderFor(formPrizes)
final formPrizesProvider = AutoDisposeProvider<List<Prize>>.internal(
  formPrizes,
  name: r'formPrizesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$formPrizesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FormPrizesRef = AutoDisposeProviderRef<List<Prize>>;
String _$challengeFormStateControllerHash() =>
    r'6734d7ff00c877a961ad9667bf1f4ee06ef5df07';

/// See also [ChallengeFormStateController].
@ProviderFor(ChallengeFormStateController)
final challengeFormStateControllerProvider =
    NotifierProvider<ChallengeFormStateController, ChallengeFormState>.internal(
  ChallengeFormStateController.new,
  name: r'challengeFormStateControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$challengeFormStateControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChallengeFormStateController = Notifier<ChallengeFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
