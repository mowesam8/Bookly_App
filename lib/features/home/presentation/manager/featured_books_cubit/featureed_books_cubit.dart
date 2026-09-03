import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/books_model.dart';
import 'package:equatable/equatable.dart';

part 'featureed_books_state.dart';

class FeatureedBooksCubit extends Cubit<FeatureedBooksState> {
  FeatureedBooksCubit() : super(FeatureedBooksInitial());
}
