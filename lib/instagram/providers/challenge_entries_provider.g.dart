// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_entries_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeEntriesHash() => r'103e4e1feb957fe55734a980f475e02fa0bcfd26';

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

/// See also [challengeEntries].
@ProviderFor(challengeEntries)
const challengeEntriesProvider = ChallengeEntriesFamily();

/// See also [challengeEntries].
class ChallengeEntriesFamily extends Family<AsyncValue<List<InstagramPost>>> {
  /// See also [challengeEntries].
  const ChallengeEntriesFamily();

  /// See also [challengeEntries].
  ChallengeEntriesProvider call(
    Challenge challenge,
  ) {
    return ChallengeEntriesProvider(
      challenge,
    );
  }

  @override
  ChallengeEntriesProvider getProviderOverride(
    covariant ChallengeEntriesProvider provider,
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
  String? get name => r'challengeEntriesProvider';
}

/// See also [challengeEntries].
class ChallengeEntriesProvider extends FutureProvider<List<InstagramPost>> {
  /// See also [challengeEntries].
  ChallengeEntriesProvider(
    Challenge challenge,
  ) : this._internal(
          (ref) => challengeEntries(
            ref as ChallengeEntriesRef,
            challenge,
          ),
          from: challengeEntriesProvider,
          name: r'challengeEntriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeEntriesHash,
          dependencies: ChallengeEntriesFamily._dependencies,
          allTransitiveDependencies:
              ChallengeEntriesFamily._allTransitiveDependencies,
          challenge: challenge,
        );

  ChallengeEntriesProvider._internal(
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
  Override overrideWith(
    FutureOr<List<InstagramPost>> Function(ChallengeEntriesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChallengeEntriesProvider._internal(
        (ref) => create(ref as ChallengeEntriesRef),
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
  FutureProviderElement<List<InstagramPost>> createElement() {
    return _ChallengeEntriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeEntriesProvider && other.challenge == challenge;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challenge.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChallengeEntriesRef on FutureProviderRef<List<InstagramPost>> {
  /// The parameter `challenge` of this provider.
  Challenge get challenge;
}

class _ChallengeEntriesProviderElement
    extends FutureProviderElement<List<InstagramPost>>
    with ChallengeEntriesRef {
  _ChallengeEntriesProviderElement(super.provider);

  @override
  Challenge get challenge => (origin as ChallengeEntriesProvider).challenge;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
