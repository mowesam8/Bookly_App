import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featureed_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeatureedBooksState> {
  FeaturedBooksCubit({required this.homeRepo})
    : super(FeatureedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeatureedBooksLaoding());
    var result = await homeRepo.featchFeaturedBooks();
    result.fold((failure) {
      emit(FeatureedBooksFailure(errorMessage:failure.errorMessage ));
    }, (books) {
      emit(FeatureedBooksSuccess(books: books));
    },);
  }
}
