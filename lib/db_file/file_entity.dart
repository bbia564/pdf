import 'package:intl/intl.dart';

class FileEntity {
  int id;
  DateTime createdTime;
  String name;
  String filePath;

  FileEntity({
    required this.id,
    required this.createdTime,
    required this.name,
    required this.filePath,
  });

  factory FileEntity.fromJson(Map<String, dynamic> json) {
    return FileEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      filePath: json['filePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'filePath': filePath,
    };
  }

  String get createdTimeString => DateFormat('yyyy-MM-dd').format(createdTime);
}