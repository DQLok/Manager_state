import 'dart:async';

typedef StateListener<T> = void Function(T value);

class StateStore<T> {
  T _value;
  final _controller = StreamController<T>.broadcast();

  StateStore(this._value);

  T get value => _value;

  void set(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _controller.add(_value);
    }
  }

  Future<void> setAsync(Future<T> futureValue) async {
    final newValue = await futureValue;
    if (_value != newValue) {
      _value = newValue;
      _controller.add(_value);
    }
  }

  StreamSubscription<T> listen(StateListener<T> listener) {
    listener(_value);
    return _controller.stream.listen(listener);
  }

  void reset(T defaultValue) {
    set(defaultValue);
  }

  void dispose() {
    _controller.close();
  }
}

extension ListStoreExtension<T> on StateStore<List<T>> {
  void addItem(T item) {
    final newList = List<T>.from(value)..add(item);
    set(newList);
  }

  void removeItem(T item) {
    final newList = List<T>.from(value)..remove(item);
    set(newList);
  }
}
