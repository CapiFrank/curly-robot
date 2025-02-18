import 'model.dart';

class Customer extends Model {

  Customer(
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
  Customer fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  @override
  String get collectionName => "customers";
}
