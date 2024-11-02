// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$challengeHash() => r'aecc303f7d40f0d4c73edb6b39d4690c69d5a62a';

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

/// See also [challenge].
@ProviderFor(challenge)
const challengeProvider = ChallengeFamily();

/// See also [challenge].
class ChallengeFamily extends Family<AsyncValue<Challenge>> {
  /// See also [challenge].
  const ChallengeFamily();

  /// See also [challenge].
  ChallengeProvider call(
    String challengeId,
  ) {
    return ChallengeProvider(
      challengeId,
    );
  }

  @override
  ChallengeProvider getProviderOverride(
    covariant ChallengeProvider provider,
  ) {
    return call(
      provider.challengeId,
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
  String? get name => r'challengeProvider';
}

/// See also [challenge].
class ChallengeProvider extends AutoDisposeFutureProvider<Challenge> {
  /// See also [challenge].
  ChallengeProvider(
    String challengeId,
  ) : this._internal(
          (ref) => challenge(
            ref as ChallengeRef,
            challengeId,
          ),
          from: challengeProvider,
          name: r'challengeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$challengeHash,
          dependencies: ChallengeFamily._dependencies,
          allTransitiveDependencies: ChallengeFamily._allTransitiveDependencies,
          challengeId: challengeId,
        );

  ChallengeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.challengeId,
  }) : super.internal();

  final String challengeId;

  @override
  Override overrideWith(
    FutureOr<Challenge> Function(ChallengeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChallengeProvider._internal(
        (ref) => create(ref as ChallengeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        challengeId: challengeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Challenge> createElement() {
    return _ChallengeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChallengeProvider && other.challengeId == challengeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challengeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChallengeRef on AutoDisposeFutureProviderRef<Challenge> {
  /// The parameter `challengeId` of this provider.
  String get challengeId;
}

class _ChallengeProviderElement
    extends AutoDisposeFutureProviderElement<Challenge> with ChallengeRef {
  _ChallengeProviderElement(super.provider);

  @override
  String get challengeId => (origin as ChallengeProvider).challengeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
