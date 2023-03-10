class CommentModel {
  final String comment;
  final String idComment;
  final double rating;
  final String date;
  final int fkIdUser;

  CommentModel(this.comment, this.idComment, this.rating, this.date, this.fkIdUser);
}