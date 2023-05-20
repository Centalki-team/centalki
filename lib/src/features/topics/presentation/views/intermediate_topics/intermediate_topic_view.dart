import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/intermediate_topics_bloc/intermediate_topics_bloc.dart';
import '../../widgets/topic_card.dart';

class IntermediateTopicsView extends StatelessWidget {
  const IntermediateTopicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocListener<IntermediateTopicsBloc, IntermediateTopicsState>(
        listener: (context, state) {
          if (state is IntermediateTopicsLoadingState) {
            LoadingManager.setLoading(context,
                loading: state.showLoading && state.isOverlay);
          } else if (state is IntermediateTopicsErrorState) {
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
          } else if (state is IntermediateTopicsAddFavoriteDoneState) {
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
                .read<IntermediateTopicsBloc>()
                .add(const IntermediateTopicsLoadEvent(isRefresh: true));
          } else if (state is IntermediateTopicsRemoveFavoriteDoneState) {
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
                .read<IntermediateTopicsBloc>()
                .add(const IntermediateTopicsLoadEvent(isRefresh: true));
          }
        },
        child: BlocBuilder<IntermediateTopicsBloc, IntermediateTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is IntermediateTopicsLoadDoneState ||
                  (current is IntermediateTopicsLoadingState &&
                      !current.isOverlay)),
          builder: (context, state) {
            if (state is IntermediateTopicsLoadDoneState) {
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
                            title: Text(
                              S.current.txtConfirmRemoveFavoriteTitle,
                              style: const TextStyle(
                                fontSize: titleLargeSize,
                                fontWeight: titleLargeWeight,
                                color: AppColor.defaultFont,
                              ),
                            ),
                            content: Text(
                              S.current.txtConfirmRemoveFavoriteContent,
                              style: const TextStyle(
                                fontSize: bodySmallSize,
                                fontWeight: bodySmallWeight,
                                color: AppColor.defaultFont,
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
                                  context.read<IntermediateTopicsBloc>().add(
                                          IntermediateTopicsRemoveFavoriteEvent(
                                        id: state.topics[index].topicBookmark
                                                ?.bookmarkId ??
                                            '',
                                      )),
                                }
                            });
                      } else {
                        context
                            .read<IntermediateTopicsBloc>()
                            .add(IntermediateTopicsAddFavoriteEvent(
                              topicId: state.topics[index].topicId ?? '',
                            ));
                      }
                    },
                    onTopicsRefresh: () => context
                        .read<IntermediateTopicsBloc>()
                        .add(const IntermediateTopicsInitEvent()),
                  ),
                ),
              );
            }
            if (state is IntermediateTopicsLoadingState &&
                state.showLoading &&
                !state.isOverlay) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
