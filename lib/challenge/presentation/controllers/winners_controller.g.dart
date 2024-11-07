// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winners_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$winnersControllerHash() => r'ffbd4b28003b26c3c82b927d165a01af5700da3f';

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

abstract class _$WinnersController
    extends BuildlessAutoDisposeAsyncNotifier<ChallengeWinners> {
  late final Challenge challenge;

  FutureOr<ChallengeWinners> build(
    Challenge challenge,
  );
}

/// See also [WinnersController].
@ProviderFor(WinnersController)
const winnersControllerProvider = WinnersControllerFamily();

/// See also [WinnersController].
class WinnersControllerFamily extends Family<AsyncValue<ChallengeWinners>> {
  /// See also [WinnersController].
  const WinnersControllerFamily();

  /// See also [WinnersController].
  WinnersControllerProvider call(
    Challenge challenge,
  ) {
    return WinnersControllerProvider(
      challenge,
    );
  }

  @override
  WinnersControllerProvider getProviderOverride(
    covariant WinnersControllerProvider provider,
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
  String? get name => r'winnersControllerProvider';
}

/// See also [WinnersController].
class WinnersControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    WinnersController, ChallengeWinners> {
  /// See also [WinnersController].
  WinnersControllerProvider(
    Challenge challenge,
  ) : this._internal(
          () => WinnersController()..challenge = challenge,
          from: winnersControllerProvider,
          name: r'winnersControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$winnersControllerHash,
          dependencies: WinnersControllerFamily._dependencies,
          allTransitiveDependencies:
              WinnersControllerFamily._allTransitiveDependencies,
          challenge: challenge,
        );

  WinnersControllerProvider._internal(
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
  FutureOr<ChallengeWinners> runNotifierBuild(
    covariant WinnersController notifier,
  ) {
    return notifier.build(
      challenge,
    );
  }

  @override
  Override overrideWith(WinnersController Function() create) {
    return ProviderOverride(
      origin: this,
      override: WinnersControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<WinnersController, ChallengeWinners>
      createElement() {
    return _WinnersControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WinnersControllerProvider && other.challenge == challenge;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, challenge.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WinnersControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ChallengeWinners> {
  /// The parameter `challenge` of this provider.
  Challenge get challenge;
}

class _WinnersControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<WinnersController,
        ChallengeWinners> with WinnersControllerRef {
  _WinnersControllerProviderElement(super.provider);

  @override
  Challenge get challenge => (origin as WinnersControllerProvider).challenge;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
