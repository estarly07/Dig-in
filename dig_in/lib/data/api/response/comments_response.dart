class CommentsResponse {
   final String comment;
  final String idComment;
  final double rating;
  final String date;
  final int fkIdUser;

  CommentsResponse(this.comment, this.idComment, this.rating, this.date, this.fkIdUser);
  
  factory CommentsResponse.fromJson(Map<String, dynamic> json){
    return CommentsResponse(
      json["comment"], 
      json["idComment"], 
      json["rating"], 
      json["date"], 
      json["fkIdUser"]
    );
  }
}