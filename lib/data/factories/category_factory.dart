import 'package:miio_flutter_test/domain/entities/category_entity.dart';

class CategoryFactory {
  static CategoryEntity fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      name: map['name'],
      iconUrl: map['icon_url'],
    );
  }
}
