class BookEntitie {
  final String bookId;
  final String bookName;
  final String? bookImage;
  final String? previewLink;

  BookEntitie({required this.bookId, required this.bookName, this.bookImage, this.previewLink});
}
