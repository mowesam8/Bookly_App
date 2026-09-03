part of 'featureed_books_cubit.dart';

sealed class FeatureedBooksState extends Equatable {
  const FeatureedBooksState();

  @override
  List<Object> get props => [];
}

final class FeatureedBooksInitial extends FeatureedBooksState {}

final class FeatureedBooksLaoding extends FeatureedBooksState {}

final class FeatureedBooksFailure extends FeatureedBooksState {
  final String errorMessage;

  const FeatureedBooksFailure({required this.errorMessage});
}

final class FeatureedBooksSuccess extends FeatureedBooksState {
  final List<BooksModel> books;

  const FeatureedBooksSuccess({required this.books});
}
