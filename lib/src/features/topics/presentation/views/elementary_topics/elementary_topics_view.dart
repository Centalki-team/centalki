import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/elementary_topics_bloc/elementary_topics_bloc.dart';
import '../../widgets/topic_card.dart';

class ElementaryTopicView extends StatelessWidget {
  const ElementaryTopicView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<ElementaryTopicsBloc, ElementaryTopicsState>(
        listener: (context, state) {
          if (state is ElementaryTopicsLoadingState) {
            LoadingManager.setLoading(context, loading: state.showLoading && state.isOverlay);
          } else if (state is ElementaryTopicsErrorState) {
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
              message: Text(
                S.current.txtAddFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<ElementaryTopicsBloc>()
                .add(const ElementaryTopicsLoadEvent(isRefresh: true));
          } else if (state is ElementaryTopicsRemoveFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                S.current.txtRemoveFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<ElementaryTopicsBloc>()
                .add(const ElementaryTopicsLoadEvent(isRefresh: true));
          }
        },
        child: BlocBuilder<ElementaryTopicsBloc, ElementaryTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is ElementaryTopicsLoadDoneState ||
                  (current is ElementaryTopicsLoadingState && !current.isOverlay)),
          builder: (context, state) {
            if (state is ElementaryTopicsLoadDoneState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: padding16),
                  itemCount: state.topics.length,
                  separatorBuilder: (context, index) => const SizedBox(height: spacing8),
                  itemBuilder: (context, index) => TopicCard(
                    logKey: state.logKey,
                    logName: state.logName,
                    item: state.topics[index],
                    onTap: () async {
                      if (state.topics[index].topicBookmark != null) {
                        await showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: colorsByTheme(context).backgroundCardsChip,
                            title: Text(
                              S.current.txtConfirmRemoveFavoriteTitle,
                              style: TextStyle(
                                fontSize: titleLargeSize,
                                fontWeight: titleLargeWeight,
                                color: colorsByTheme(context).defaultFont,
                              ),
                            ),
                            content: Text(
                              S.current.txtConfirmRemoveFavoriteContent,
                              style: TextStyle(
                                fontSize: bodySmallSize,
                                fontWeight: bodySmallWeight,
                                color: colorsByTheme(context).defaultFont,
                              ),
                            ),
                            actions: [
                              AppTextButton(
                                text: S.current.txtCancel,
                                onPressed: () => Navigator.pop(context, false),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, true),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.error,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(
                                  S.current.txtRemove,
                                  style: const TextStyle(
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
                                        id: state.topics[index].topicBookmark?.bookmarkId ?? '',
                                      )),
                                }
                            });
                      } else {
                        context.read<ElementaryTopicsBloc>().add(ElementaryTopicsAddFavoriteEvent(
                              topicId: state.topics[index].topicId ?? '',
                            ));
                      }
                    },
                    onTopicsRefresh: () =>
                        context.read<ElementaryTopicsBloc>().add(const ElementaryTopicsInitEvent()),
                  ),
                ),
              );
            }
            if (state is ElementaryTopicsLoadingState && state.showLoading && !state.isOverlay) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
