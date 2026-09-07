part of 'searched_books_cubit.dart';

sealed class SearchedBooksState extends Equatable {
  const SearchedBooksState();

  @override
  List<Object> get props => [];
}

final class SearchedBooksInitial extends SearchedBooksState {}

final class SearchedBooksLoading extends SearchedBooksState {}

final class SearchedBooksSuccess extends SearchedBooksState {
  final List<BookModel> books;

  const SearchedBooksSuccess({required this.books});
}

final class SearchedBooksFailure extends SearchedBooksState {
  final String errorMessage;

  const SearchedBooksFailure({required this.errorMessage});
}
