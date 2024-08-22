import 'package:hive/hive.dart';

part 'complaint.g.dart';

@HiveType(typeId: 1)
class Complaint extends HiveObject {
  Complaint({
    required this.topic,
    required this.text,
    required this.timestamp,
    required this.userEmail,
  });

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      topic: json['topic'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      userEmail: json['userEmail'] as String,
    );
  }

  @HiveField(0)
  String topic;

  @HiveField(1)
  String text;

  @HiveField(2)
  DateTime timestamp;

  @HiveField(3)
  String userEmail;

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
      'userEmail': userEmail,
    };
  }
}
