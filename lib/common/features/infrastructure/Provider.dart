class Provider<T> {
  final Map<Type, T> _storage = {};

  void add(T object) {
    _storage[T] = object;
  }

  T get() {
    final object = _storage[T];

    if (object == null) {
      throw Exception("No instance of type $T found");
    }

    return object as T;
  }

  List<T> getAll() {
    return _storage.values.toList();
  }
}
