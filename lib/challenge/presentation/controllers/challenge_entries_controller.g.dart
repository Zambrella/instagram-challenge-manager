// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_entries_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeEntriesControllerHash() =>
    r'05d57c749beeda4ee28c855a9d94b57db516ca5f';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChallengeEntriesController
    extends BuildlessAutoDisposeAsyncNotifier<ChallengeEntries> {
  late final Challenge challenge;

  FutureOr<ChallengeEntries> build(
    Challenge challenge,
  );
}

/// See also [ChallengeEntriesController].
@ProviderFor(ChallengeEntriesController)
const challengeEntriesControllerProvider = ChallengeEntriesControllerFamily();

/// See also [ChallengeEntriesController].
class ChallengeEntriesControllerFamily
    extends Family<AsyncValue<ChallengeEntries>> {
  /// See also [ChallengeEntriesController].
  const ChallengeEntriesControllerFamily();

  /// See also [ChallengeEntriesController].
  ChallengeEntriesControllerProvider call(
    Challenge challenge,
  ) {
    return ChallengeEntriesControllerProvider(
      challenge,
    );
  }

  @override
  ChallengeEntriesControllerProvider getProviderOverride(
    covariant ChallengeEntriesControllerProvider provider,
  ) {
    return call(
      provider.challenge,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'challengeEntriesControllerProvider';
}

/// See also [ChallengeEntriesController].
class ChallengeEntriesControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChallengeEntriesController,
        ChallengeEntries> {
  /// See also [ChallengeEntriesController].
  ChallengeEntriesControllerProvider(
    Challenge challenge,
  ) : this._internal(
          () => ChallengeEntriesController()..challenge = challenge,
          from: challengeEntriesControllerProvider,
          name: r'challengeEntriesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeEntriesControllerHash,
          dependencies: ChallengeEntriesControllerFamily._dependencies,
          allTransitiveDependencies:
              ChallengeEntriesControllerFamily._allTransitiveDependencies,
          challenge: challenge,
        );

  ChallengeEntriesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.challenge,
  }) : super.internal();

  final Challenge challenge;

  @override
  FutureOr<ChallengeEntries> runNotifierBuild(
    covariant ChallengeEntriesController notifier,
  ) {
    return notifier.build(
      challenge,
    );
  }

  @override
  Override overrideWith(ChallengeEntriesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChallengeEntriesControllerProvider._internal(
        () => create()..challenge = challenge,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        challenge: challenge,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChallengeEntriesController,
      ChallengeEntries> createElement() {
    return _ChallengeEntriesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeEntriesControllerProvider &&
        other.challenge == challenge;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challenge.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChallengeEntriesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ChallengeEntries> {
  /// The parameter `challenge` of this provider.
  Challenge get challenge;
}

class _ChallengeEntriesControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChallengeEntriesController,
        ChallengeEntries> with ChallengeEntriesControllerRef {
  _ChallengeEntriesControllerProviderElement(super.provider);

  @override
  Challenge get challenge =>
      (origin as ChallengeEntriesControllerProvider).challenge;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
