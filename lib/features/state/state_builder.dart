import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:manager_state/features/state/state_manager.dart';
import 'package:manager_state/features/state/state_store.dart';

class StateBuilder<T> extends StatefulWidget {
  final String stateKey;
  final Widget Function(BuildContext context, T value) builder;

  const StateBuilder({
    super.key,
    required this.stateKey,
    required this.builder,
  });

  @override
  _StateBuilderState<T> createState() => _StateBuilderState<T>();
}

class _StateBuilderState<T> extends State<StateBuilder<T>> {
  late StateStore<T> store;
  late StreamSubscription<T> subscription;
  late T value;

  @override
  void initState() {
    super.initState();
    store = StateManager().get<T>(widget.stateKey);
    value = store.value;
    subscription = store.listen((v) {
      setState(() => value = v);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}
