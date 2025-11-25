class HelpRequest {
  final String id;
  final String name;
  final String phone;
  final String location;
  final String urgency;
  final String description;
  final int timestamp;
  final String status;

  HelpRequest({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.urgency,
    required this.description,
    required this.timestamp,
    required this.status,
  });

  factory HelpRequest.fromJson(Map<String, dynamic> j) => HelpRequest(
        id: j['id'] ?? '',
        name: j['name'] ?? '',
      phone: j['phone'] ?? '',
        location: j['location'] ?? '',
        urgency: j['urgency'] ?? 'Low',
        description: j['description'] ?? '',
        timestamp: j['timestamp'] ?? 0,
        status: j['status'] ?? 'pending',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      'phone': phone,
        'location': location,
        'urgency': urgency,
        'description': description,
        'timestamp': timestamp,
        'status': status,
      };
}
