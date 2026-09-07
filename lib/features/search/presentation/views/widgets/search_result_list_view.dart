import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/manager/searched_books_cubit/searched_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/initial_search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchReasultListView extends StatelessWidget {
  const SearchReasultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text('Search Result', style: Styles.textStyle18),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: NewestBooksListViewItem( bookModel: state.books[index] ,),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchedBooksLoading) {
          return CustomLoadingIndicator();
        } else if(state is SearchedBooksInitial){
          return InitialSearchViewBody();
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
