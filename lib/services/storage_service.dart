import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _keyName = 'patient_name';
  static const _keyPhone = 'patient_phone';
  static const _keyTransfusion = 'transfusion_date';
  static const _keyApiBase = 'api_base_url';

  static Future<void> saveName(String name) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_keyName, name);
  }

  static Future<String?> getName() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_keyName);
  }

  static Future<void> savePhone(String phone) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_keyPhone, phone);
  }

  static Future<String?> getPhone() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_keyPhone);
  }

  static Future<void> saveTransfusion(String date) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_keyTransfusion, date);
  }

  static Future<String?> getTransfusion() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_keyTransfusion);
  }

  static Future<void> saveApiBase(String url) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_keyApiBase, url);
  }

  static Future<String?> getApiBase() async {
    final p = await SharedPreferences.getInstance();
    return p.getString(_keyApiBase);
  }
}
