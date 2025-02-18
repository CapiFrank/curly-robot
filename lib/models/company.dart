import 'model.dart';

class Company extends Model {

  Company(
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
  Company fromJson(Map<String, dynamic> json) {
    return Company(
        id: json['id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  @override
  String get collectionName => "companies";
}
