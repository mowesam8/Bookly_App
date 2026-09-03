import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit({required this.homeRepo}) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.featchNewsetBooks();
    result.fold((failure) {
      emit(NewsetBooksFailure(errorMessage:failure.errorMessage ));
    }, (books) {
      emit(NewsetBooksSuccess(books: books));
    },);
  }
}
