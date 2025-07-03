class SteveCollectionUtil {
  SteveCollectionUtil._();

  static Iterable<T> intersperse<T>(T element, Iterable<T> iterable) sync* {
    var iterator = iterable.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield element;
        yield iterator.current;
      }
    }
  }
}
