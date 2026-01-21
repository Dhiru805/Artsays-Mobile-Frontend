import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';


const _storage = FlutterSecureStorage();


const _keyEmailOrPhone = 'emailOrPhone';
const _keyPassword = 'password';
const _keyAuthToken = 'authToken';
const _keyUserType = 'userType';
const _keyUserID = 'userId';

Future<void> setFirstLaunch(bool val) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('isFirstLaunch', val);
}

Future<bool> getFirstLaunch() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('isFirstLaunch') ?? true;
}

Future<void> setEarlierLogin(bool val) async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool('isEarlierLogin', val);
}

Future<bool> getEarlierLogin() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getBool('isEarlierLogin') ?? false;
}

Future<void> saveEmailOrPhone(String? value) async {
  await _storage.write(key: _keyEmailOrPhone, value: value);
}

Future<String?> getEmailOrPhone() async {
  return await _storage.read(key: _keyEmailOrPhone);
}

Future<void> savePassword(String? value) async {
  await _storage.write(key: _keyPassword, value: value);
}

Future<String?> getPassword() async {
  return await _storage.read(key: _keyEmailOrPhone);
}

Future<void> saveUserType(String? value) async {
  await _storage.write(key: _keyUserType, value: value);
}

Future<String?> getUserType() async {
  return await _storage.read(key: _keyUserType);
}

Future<void> saveAuthToken(String? value) async {
  await _storage.write(key: _keyAuthToken, value: value);
}

Future<String?> getAuthToken() async {
  return await _storage.read(key: _keyAuthToken);
}

Future<void> saveUserID(String? value) async {
  await _storage.write(key: _keyUserID, value: value);
}

Future<String?> getUserID() async {
  return await _storage.read(key: _keyUserID);
}