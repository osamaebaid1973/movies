import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper<T> {
  final String boxName;

  HiveHelper(this.boxName);

  Future<Box<T>> openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  Future<void> put(dynamic key, T value) async {
    final box = await openBox();
    await box.put(key, value);
  }

  Future<T?> get(dynamic key) async {
    final box = await openBox();
    return box.get(key);
  }

  Future<void> delete(dynamic key) async {
    final box = await openBox();
    await box.delete(key);
  }

  Future<void> clear() async {
    final box = await openBox();
    await box.clear();
  }

  Future<void> closeBox() async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  Future<void> deleteBox() async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<List<T>> getAllValues() async {
    final box = await openBox();
    return box.values.toList();
  }

  Future<List<dynamic>> getAllKeys() async {
    final box = await openBox();
    return box.keys.toList();
  }

  Box<T> getBoxSync() {
    return Hive.box<T>(boxName);
  }

  Future<int> length() async {
    final box = await openBox();
    return box.length;
  }

  Future<bool> containsKey(dynamic key) async {
    final box = await openBox();
    return box.containsKey(key);
  }

  Stream<BoxEvent> watch({dynamic key}) async* {
    final box = await openBox();
    yield* box.watch(key: key);
  }

}