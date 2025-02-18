import 'model.dart';

class Device extends Model {

  Device(
      {super.id,
      super.createdAt,
      super.updatedAt});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  @override
  Device fromJson(Map<String, dynamic> json) {
    return Device(
        id: json['id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  @override
  String get collectionName => "devices";
}
