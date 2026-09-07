import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure,List<BookModel>>> featchNewsetBooks();
  Future<Either<Failure,List<BookModel>>>  featchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>  featchSimilarBooks({required String category});
}