import 'category_entity.dart';
import 'comment.dart';

class PostEntity {
  final int id;
  final String title;
  final String avatarUrl;
  final String backgroundUrl;
  final String text;
  final String language;
  final bool isFeatured;
  final CategoryEntity category;
  final List<CommentEntity> comments;
  const PostEntity({
    required this.id,
    required this.title,
    required this.avatarUrl,
    required this.backgroundUrl,
    required this.text,
    required this.language,
    required this.isFeatured,
    required this.category,
    required this.comments,
  });
}
