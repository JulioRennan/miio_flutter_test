class CommentEntity {
  CommentEntity({
    required this.rate,
    required this.title,
    required this.reviewerNickname,
  });
  final int rate;
  final String title;
  final String reviewerNickname;
}
