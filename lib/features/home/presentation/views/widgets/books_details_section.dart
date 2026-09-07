import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2, vertical: 27),
            child: CustomBookImage(
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
          ),
          const SizedBox(height: 16),
          Text(
            book.volumeInfo.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle30,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: .7,
            child: Text(
              book.volumeInfo.authors?[0] ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Styles.textStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 16),
          BookRating(
            rating: book.volumeInfo.pageCount!,
            count: book.volumeInfo.hashCode,
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: BooksAction(bookModel: book),
          ),
        ],
      ),
    );
  }
}
