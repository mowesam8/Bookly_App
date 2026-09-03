part of 'featureed_books_cubit.dart';

sealed class FeatureedBooksState extends Equatable {
  const FeatureedBooksState();

  @override
  List<Object> get props => [];
}

final class FeatureedBooksInitial extends FeatureedBooksState {}

final class FeatureedBooksLaoding extends FeatureedBooksState {}

final class FeatureedBooksSuccess extends FeatureedBooksState {
  final String errorMessage;

  const FeatureedBooksSuccess({required this.errorMessage});
}

final class FeatureedBooksFailure extends FeatureedBooksState {
  final List<BooksModel> books;

  const FeatureedBooksFailure({required this.books});
}
