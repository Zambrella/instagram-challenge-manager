// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instagram_post.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$instagramPostHash() => r'd8bc6de177bfa7bffb6d2c0e5781a9b588b45cf1';

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

/// See also [instagramPost].
@ProviderFor(instagramPost)
const instagramPostProvider = InstagramPostFamily();

/// See also [instagramPost].
class InstagramPostFamily extends Family<AsyncValue<InstagramPost>> {
  /// See also [instagramPost].
  const InstagramPostFamily();

  /// See also [instagramPost].
  InstagramPostProvider call(
    String postId,
  ) {
    return InstagramPostProvider(
      postId,
    );
  }

  @override
  InstagramPostProvider getProviderOverride(
    covariant InstagramPostProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'instagramPostProvider';
}

/// See also [instagramPost].
class InstagramPostProvider extends FutureProvider<InstagramPost> {
  /// See also [instagramPost].
  InstagramPostProvider(
    String postId,
  ) : this._internal(
          (ref) => instagramPost(
            ref as InstagramPostRef,
            postId,
          ),
          from: instagramPostProvider,
          name: r'instagramPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$instagramPostHash,
          dependencies: InstagramPostFamily._dependencies,
          allTransitiveDependencies:
              InstagramPostFamily._allTransitiveDependencies,
          postId: postId,
        );

  InstagramPostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    FutureOr<InstagramPost> Function(InstagramPostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: InstagramPostProvider._internal(
        (ref) => create(ref as InstagramPostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  FutureProviderElement<InstagramPost> createElement() {
    return _InstagramPostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InstagramPostProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InstagramPostRef on FutureProviderRef<InstagramPost> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _InstagramPostProviderElement extends FutureProviderElement<InstagramPost>
    with InstagramPostRef {
  _InstagramPostProviderElement(super.provider);

  @override
  String get postId => (origin as InstagramPostProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
