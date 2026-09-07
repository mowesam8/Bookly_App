import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchRepoImpl implements SearchRepo{
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> featchSearchedBooks({
    required String terms,
  }) async {
    if (terms.trim().isEmpty) {
      return right([]);
    }
    
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?q=search:$terms&key=${dotenv.env['kApiKey']}&Filtering=free-ebooks&Sorting=relevance',
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