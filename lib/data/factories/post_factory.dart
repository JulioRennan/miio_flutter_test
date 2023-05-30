import 'package:miio_flutter_test/data/factories/category_factory.dart';
import 'package:miio_flutter_test/data/factories/comment_factory.dart';
import 'package:miio_flutter_test/domain/entities/post_entity.dart';

class PostFactory {
  static PostEntity fromMap(Map<String, dynamic> map) {
    return PostEntity(
      id: map['id'],
      userName: map['user_name'],
      userSubtitle: map['user_subtitle'],
      title: map['title'],
      avatarUrl: map['avatar_url'],
      backgroundUrl: map['background_url'],
      text: map['text'],
      language: map['language'],
      isFeatured: map['is_featured'],
      category: CategoryFactory.fromMap(map['category']),
      comments: List.from(map['comments'])
          .map((commentJson) => CommentFactory.fromMap(commentJson))
          .toList(),
    );
  }
}
