import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> featchNewsetBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=subject:computer science&key=${dotenv.env['kApiKey']}&Filtering=free-ebooks&Sorting=newst',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=subject:programming&key=${dotenv.env['kApiKey']}&Filtering=free-ebooks',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=subject:$category&key=${dotenv.env['kApiKey']}&Filtering=free-ebooks&Sorting=relevance',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
