class NoteForListing {
  final String noteID;
  final String noteTitle;
  final DateTime createDateTime;
  final DateTime lastEditedDateTime;

  NoteForListing(
      {required this.noteID,
      required this.noteTitle,
      required this.createDateTime,
      required this.lastEditedDateTime});
}
