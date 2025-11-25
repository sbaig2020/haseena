import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/request.dart';
import 'storage_service.dart';

class ApiService {
  // Default base for local testing. The app reads a saved API base URL from SharedPreferences when available.
  static const _defaultBase = 'http://localhost:3000';

  static Future<String> _base() async {
    final stored = await StorageService.getApiBase();
    return (stored == null || stored.isEmpty) ? _defaultBase : stored;
  }

  static Future<List<HelpRequest>> fetchRequests({String? name}) async {
    final base = await _base();
    final uri = Uri.parse('$base/requests${name != null ? '?name=${Uri.encodeComponent(name)}' : ''}');
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final List<dynamic> arr = jsonDecode(res.body);
      return arr.map((e) => HelpRequest.fromJson(e)).toList();
    }
    throw Exception('Failed to load requests');
  }

  static Future<HelpRequest> createRequest(Map<String, dynamic> body) async {
    final base = await _base();
    final uri = Uri.parse('$base/requests');
    final res = await http.post(uri, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 201) {
      return HelpRequest.fromJson(jsonDecode(res.body));
    }
    throw Exception('Failed to create request');
  }

  static Future<HelpRequest> updateRequest(String id, Map<String, dynamic> body) async {
    final base = await _base();
    final uri = Uri.parse('$base/requests/$id');
    final res = await http.put(uri, body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      return HelpRequest.fromJson(jsonDecode(res.body));
    }
    throw Exception('Failed to update request');
  }

  static Future<void> deleteRequest(String id) async {
    final base = await _base();
    final uri = Uri.parse('$base/requests/$id');
    final res = await http.delete(uri);
    if (res.statusCode != 200) throw Exception('Failed to delete');
  }
}
