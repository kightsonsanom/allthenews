import 'package:allthenews/src/domain/common/persistence/persistence_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesPersistenceRepository extends PersistenceRepository {
  final _SharedPreferences _sharedPreferences = _SharedPreferences();

  @override
  Future<bool> saveString(String key, String value) => _sharedPreferences
      .getInstance()
      .then((preferences) => preferences.setString(key, value));

  @override
  Future<String> getString(String key) => _sharedPreferences
      .getInstance()
      .then((preferences) => preferences.getString(key));
}

class _SharedPreferences {
  SharedPreferences _sharedPreferences;

  Future<SharedPreferences> getInstance() async =>
      _sharedPreferences ??= await SharedPreferences.getInstance();
}