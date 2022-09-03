class CommentModel {
  int? id;
  String? userName;
  String? Comment;
  List<CommentModel> reply = [];

  CommentModel(
      {required this.id, this.userName, this.Comment, required this.reply});
}
