import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../blocs/pre_intermediate_topic_bloc/pre_intermediate_topics_bloc.dart';
import '../../widgets/topic_card.dart';

class PreIntermediateTopicView extends StatefulWidget {
  const PreIntermediateTopicView({Key? key}) : super(key: key);

  @override
  State<PreIntermediateTopicView> createState() =>
      _PreIntermediateTopicViewState();
}

class _PreIntermediateTopicViewState extends State<PreIntermediateTopicView> {
  @override
  Widget build(BuildContext context) =>
      BlocListener<PreIntermediateTopicsBloc, PreIntermediateTopicsState>(
        listener: (context, state) {
          if (state is PreIntermediateTopicsErrorState) {
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
          } else if (state is PreIntermediateTopicsAddFavoriteDoneState) {
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
                .read<PreIntermediateTopicsBloc>()
                .add(const PreIntermediateTopicsLoadEvent());
          } else if (state is PreIntermediateTopicsRemoveFavoriteDoneState) {
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
                .read<PreIntermediateTopicsBloc>()
                .add(const PreIntermediateTopicsLoadEvent());
          }
        },
        child:
            BlocBuilder<PreIntermediateTopicsBloc, PreIntermediateTopicsState>(
          buildWhen: (previous, current) =>
              current != previous &&
              (current is PreIntermediateTopicsLoadDoneState ||
                  current is PreIntermediateTopicsLoadingState),
          builder: (context, state) {
            if (state is PreIntermediateTopicsLoadDoneState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding16),
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.topics.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacing8),
                  itemBuilder: (context, index) => TopicCard(
                    item: state.topics[index],
                  ),
                ),
              );
            }
            if (state is PreIntermediateTopicsLoadingState &&
                state.showLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
