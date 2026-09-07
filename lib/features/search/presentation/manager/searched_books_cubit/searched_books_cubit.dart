import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  SearchedBooksCubit({required this.searchRepo}) : super(SearchedBooksInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks() async {
    emit(SearchedBooksLoading());
    var result = await searchRepo.featchSearchedBooks(terms: '');
    result.fold(
      (failure) {
        emit(SearchedBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(SearchedBooksSuccess(books: books));
      },
    );
  }
}
