import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _ctrl = TextEditingController();
  String _status = '';

  @override
  void initState() {
    super.initState();
    StorageService.getApiBase().then((v) {
      _ctrl.text = v ?? '';
    });
  }

  void _save() async {
    final v = _ctrl.text.trim();
    await StorageService.saveApiBase(v);
    setState(() => _status = 'Saved');
    await Future.delayed(Duration(seconds: 1));
    setState(() => _status = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text('API base URL (example: https://abcd-1234.ngrok.io)'),
          SizedBox(height: 8),
          TextField(controller: _ctrl, decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'http://10.0.2.2:3000 or https://xyz.ngrok.io')),
          SizedBox(height: 12),
          ElevatedButton(onPressed: _save, child: Text('Save')),
          if (_status.isNotEmpty) ...[SizedBox(height: 12), Text(_status)],
          SizedBox(height: 20),
          Text('To expose your PC backend to the internet (so others can access it), you can use a tunnel tool like ngrok. Run `ngrok http 3000` on the PC and copy the generated HTTPS URL here.'),
        ]),
      ),
    );
  }
}
