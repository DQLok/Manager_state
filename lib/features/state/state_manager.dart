import 'package:manager_state/features/state/state_store.dart';

class StateManager {
  static final StateManager _instance = StateManager._internal();

  factory StateManager() => _instance;

  StateManager._internal();

  final _stores = <String, StateStore>{};

  void register<T>(String key, StateStore<T> store) {
    _stores[key] = store;
  }

  StateStore<T> get<T>(String key) {
    final store = _stores[key];
    if (store is StateStore<T>) {
      return store;
    }
    throw Exception('StateStore of type $T not found for key: $key');
  }

  void unregister(String key) {
    _stores[key]?.dispose();
    _stores.remove(key);
  }

  void resetAll() {
    _stores.forEach((key, store) {
      store.dispose();
    });
    _stores.clear();
  }
}
