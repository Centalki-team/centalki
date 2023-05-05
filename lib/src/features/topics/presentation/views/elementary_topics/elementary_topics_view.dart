import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../blocs/elementary_topics_bloc/elementary_topics_bloc.dart';
import '../../widgets/topic_card.dart';

class ElementaryTopicView extends StatelessWidget {
  const ElementaryTopicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<ElementaryTopicsBloc, ElementaryTopicsState>(
        listener: (context, state) {
          if (state is ElementaryTopicsErrorState) {
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
          } else if (state is ElementaryTopicsAddFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: const Text(
                TextDoc.txtAddFavoriteSuccess,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<ElementaryTopicsBloc>()
                .add(const ElementaryTopicsLoadEvent());
          } else if (state is ElementaryTopicsRemoveFavoriteDoneState) {
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
                .read<ElementaryTopicsBloc>()
                .add(const ElementaryTopicsLoadEvent());
          }
        },
        child: BlocBuilder<ElementaryTopicsBloc, ElementaryTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is ElementaryTopicsLoadDoneState ||
                  current is ElementaryTopicsLoadingState),
          builder: (context, state) {
            if (state is ElementaryTopicsLoadDoneState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.topics.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacing8),
                  itemBuilder: (context, index) => TopicCard(
                    item: state.topics[index],
                    onTap: () async {
                      if (state.topics[index].topicBookmark != null) {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: AppColor.white,
                            title: const Text(
                              TextDoc.txtConfirmRemoveFavoriteTitle,
                              style: TextStyle(
                                fontSize: titleLargeSize,
                                fontWeight: titleLargeWeight,
                                color: AppColor.defaultFont,
                              ),
                            ),
                            content: const Text(
                              TextDoc.txtConfirmRemoveFavoriteContent,
                              style: TextStyle(
                                fontSize: bodySmallSize,
                                fontWeight: bodySmallWeight,
                                color: AppColor.defaultFont,
                              ),
                            ),
                            actions: [
                              AppTextButton(
                                text: TextDoc.txtCancel,
                                onPressed: () => Navigator.pop(context, false),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.error,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text(
                                  TextDoc.txtRemove,
                                  style: TextStyle(
                                    fontSize: labelLargeSize,
                                    fontWeight: labelLargeWeight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ).then((confirmRemoved) => {
                              if (confirmRemoved)
                                {
                                  context
                                      .read<ElementaryTopicsBloc>()
                                      .add(ElementaryTopicsRemoveFavoriteEvent(
                                        id: state.topics[index].topicBookmark
                                                ?.bookmarkId ??
                                            '',
                                      )),
                                }
                            });
                      } else {
                        context
                            .read<ElementaryTopicsBloc>()
                            .add(ElementaryTopicsAddFavoriteEvent(
                              topicId: state.topics[index].topicId ?? '',
                            ));
                      }
                    },
                    onTopicsRefresh: () => context
                        .read<ElementaryTopicsBloc>()
                        .add(const ElementaryTopicsInitEvent()),
                  ),
                ),
              );
            }
            if (state is ElementaryTopicsLoadingState && state.showLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
