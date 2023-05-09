import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../blocs/favorite_topics_bloc.dart';
import 'favorite_topics_empty_view.dart';
import 'widgets/favorite_topic_card.dart';

class FavoriteTopicsView extends StatefulWidget {
  const FavoriteTopicsView({Key? key}) : super(key: key);

  @override
  State<FavoriteTopicsView> createState() => _FavoriteTopicsViewState();
}

class _FavoriteTopicsViewState extends State<FavoriteTopicsView> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<FavoriteTopicsBloc, FavoriteTopicsState>(
        listener: (context, state) {
          if (state is FavoriteTopicsErrorState) {
            AppToast(
              mode: AppToastMode.error,
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                state.exception.displayMessage,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
          } else if (state is RemoveFavoriteTopicDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: const Text(
                TextDoc.txtRemoveFavoriteSuccess,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<FavoriteTopicsBloc>()
                .add(const FavoriteTopicsLoadEvent());
          }
        },
        child: BlocBuilder<FavoriteTopicsBloc, FavoriteTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is FavoriteTopicsLoadDoneState ||
                  current is FavoriteTopicsLoadingState),
          builder: (context, state) {
            if (state is FavoriteTopicsLoadDoneState) {
              if (state.bookmarks.isEmpty) {
                return const FavoriteTopicsEmptyView();
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.bookmarks.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacing8),
                  itemBuilder: (context, index) => FavoriteTopicCard(
                    bookmark: state.bookmarks[index],
                  ),
                ),
              );
            }
            if (state is FavoriteTopicsLoadingState && state.showLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
