import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/book_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failure, List<BooksModel>>> featchBestSellerBooks() {
    // TODO: implement featchBestSellerBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BooksModel>>> featchFeaturedBooks() {
    // TODO: implement featchFeaturedBooks
    throw UnimplementedError();
  }
}