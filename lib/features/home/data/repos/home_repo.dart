import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BooksModel>>> featchBestSellerBooks();
  Future<Either<Failure,List<BooksModel>>>  featchFeaturedBooks();
}