import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueParams<T>{
  T param;

  AsyncValueParams({required this.param});
}

abstract class AsyncNotifierInterface<T, S> {
  AsyncValue<T> get state;
  set state(AsyncValue<T> value);
  AutoDisposeRef<AsyncValue<T>> get ref;
  FutureOr<T> build(S? param);
}

// This file has useful extensions, mixins and utilities for riverpod notifiers/async notifiers

mixin SideEffect<T, S> implements AsyncNotifierInterface<T, S> {
  /// Handles the loading success and error states of <[T]> of an AsyncNotifier.
  /// When performing side effects like updating, removing or editing an object or item in a collection
  /// its very common to have duplicate code handling, a loading state before the mutation (if [showLoading]),
  /// waiting for an async [mutation] response, and showing an error on failure. This method handles this boilerplate.
  /// It returns a bool if the [mutation] was successful.
  /// Sample usage:
  /// ```
  /// return mutation(mutation: () => ref.watch(repo).create(item));
  /// ```

  Future<bool> mutation(
      {bool showLoading = true,
      required AsyncValueGetter<bool?> mutation,
      S? param}) async {
    final initialState = state;

    if (showLoading) state = AsyncLoading<T>();

    try {
      final success = (await mutation()) ?? true;

      if (!success) return false;

      // if (param != null) {
      //   state = await AsyncValue.guard(() async => buildWithParam(param));
      // } else {
        // ignore: invalid_use_of_visible_for_overriding_member
        state = await AsyncValue.guard(() async => build(param));
      // }

      return success;
    } catch (e, st) {
      state = AsyncError<T>(e, st).copyWithPrevious(initialState);
    }

    return false;
  }
}

extension TimeKeepAlive<T> on AutoDisposeRef<T> {
  /// Caches a provider for a given [duration] after the last listener is removed.
  /// If the provider is watched again before being disposed the countdown resets.
  /// When the countdown reaches the [duration], the provider is disposed.
  void cache({required Duration duration}) {
    Timer? timer;

    final link = keepAlive();
    // When the provider is destroyed, cancel the timer
    onDispose(() {
      timer?.cancel();
    });
    // When the last listener is removed, start a timer to dispose the cached data
    onCancel(() {
      // start the countdown [duration]
      timer = Timer(duration, link.close);
    });
    // If the provider is listened again after it was paused, cancel the timer
    onResume(() {
      timer?.cancel();
    });
  }
}

class RiverpodLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('''
{ Disposing "provider": "${provider.name ?? provider.runtimeType}",
}''');
  }
}
