import 'package:hive_flutter/adapters.dart';

class HiveHelper<T> {
  String boxName;

  HiveHelper(this.boxName);

  Future<Box<T>> openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  Future<void> closeBox(Box<T> box) async {
    return await box.close();
  }

  Future<void> addValue({required String key, required T value}) async {
    Box<T> box = await openBox();
    try {
      await box.put(key, value);
    } finally {
      if (await box.isOpen) {
        await box.close();
      }
    }
  }

  Future<bool> updateValue({required String key, required T newValue}) async {
    Box<T> box = await openBox();
    bool update;
    try {
      update = box.containsKey(key);
      if (update == true) {
        await box.put(key, newValue);
      }
    } finally {
      if (await box.isOpen) {
        await box.close();
      }
    }
    return update;
  }

  Future<bool> deleteValue({required String key}) async {
    Box<T> box = await openBox();
    bool founded;
    try {
      founded = box.containsKey(key);
      if (founded == true) {
        await box.delete(key);
      }
    } finally {
      if (await box.isOpen) {
        await box.close();
      }
    }
    return founded;
  }

  Future<T?> getValue({required String key}) async {
    Box<T> box = await openBox();
    T? data;
    try {
      data = await box.get(key);
    } finally {
      await closeBox(box);
    }
    return data;
  }

  Future<Map<dynamic, T>> getAllData() async {
    Box<T> box = await openBox();

    Map<dynamic, T> data;

    try {
      data = await box.toMap();
    } finally {
      await closeBox(box);
    }
    return data;
  }
}
