import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: const CustomBookImage(
                    imageUrl:
                        'https://th.bing.com/th/id/R.b6b8b9a5c6e4065f0cf91bfa537b8e6c?rik=32u7PJKF8b9PVQ&pid=ImgRaw&r=0',
                  ),
                );
              },
            ),
          );
        }else if(state is SimilarBooksFailure){
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
