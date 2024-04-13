class Provider<T> {
  final Map<Type, T> _storage = {};

  void add<B extends T>(B object) {
    _storage[B] = object;
  }

  B get<B extends T>() {
    final object = _storage[B];

    if (object == null) {
      throw Exception("No instance of type $T found");
    }

    return object as B;
  }

  List<T> getAll() {
    return _storage.values.toList();
  }
}
