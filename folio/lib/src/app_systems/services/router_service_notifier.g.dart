// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_service_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerServiceNotifierHash() =>
    r'd3bc2512f8c2bc3f939381dca441eae095a30d81';

/// This notifier is meant to implement the [Listenable] our [GoRouter] needs.
///
/// We aim to trigger redirects whenever's needed.
/// This is done by calling our (only) listener everytime we want to notify stuff.
/// This allows to centralize global redirecting logic in this class.
/// In this simple case, we just listen to auth changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   3. It allows for listening to multiple providers if needed (we do have a [Ref] now!).
///
/// Copied from [RouterServiceNotifier].
@ProviderFor(RouterServiceNotifier)
final routerServiceNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterServiceNotifier, void>.internal(
  RouterServiceNotifier.new,
  name: r'routerServiceNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routerServiceNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RouterServiceNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
