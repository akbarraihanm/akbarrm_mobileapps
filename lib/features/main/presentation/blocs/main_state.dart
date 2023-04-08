import 'package:flutter/material.dart';

abstract class MainState {
  Widget when({
    Widget Function(Init state)? onInit,
    Widget Function(ShowLoading state)? onLoading,
    Widget Function(ShowError state)? onError,
    Widget Function(ShowUnauthorized state)? onUnauthorized,
  }) {
    final state = this;
    const defaultWidget = SizedBox();
    if (state is Init) {
      return onInit?.call(state) ?? defaultWidget;
    } else if (state is ShowLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ShowError) {
      return onError?.call(state) ?? defaultWidget;
    } else if (state is ShowUnauthorized) {
      return onUnauthorized?.call(state) ?? defaultWidget;
    }
    return defaultWidget;
  }
}

class Init extends MainState {}

class ShowLoading extends MainState {}

class ShowError extends MainState {
  String message;

  ShowError(this.message);
}

class ShowUnauthorized extends MainState {
  String message;

  ShowUnauthorized(this.message);
}