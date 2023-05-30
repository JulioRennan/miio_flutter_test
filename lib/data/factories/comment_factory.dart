import '../../domain/entities/comment.dart';

class CommentFactory {
  static CommentEntity fromMap(Map<String, dynamic> map) {
    return CommentEntity(
      rate: map['rate'],
      title: map['title'],
      reviewerNickname: map['reviewer_nickname'],
    );
  }
}
