import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../blocs/vocabs_bloc/vocabs_bloc.dart';
import '../widgets/vocabs_card.dart';

class VocabsView extends StatefulWidget {
  const VocabsView({super.key});

  @override
  State<VocabsView> createState() => _VocabsViewState();
}

class _VocabsViewState extends State<VocabsView> {
  @override
  void initState() {
    super.initState();
    context.read<VocabsBloc>().add(const VocabsBookmarkedLoadEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<VocabsBloc, VocabsState>(
        listener: (context, state) {
          if (state is VocabsLoadingState && state.showOverlay) {
            LoadingManager.setLoading(context, loading: state.showLoading);
          } else if (state is VocabsRemoveBookmarkSuccessState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: const Text(
                'Remove bookmark successfully!',
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context.read<VocabsBloc>().add(const VocabsBookmarkedLoadEvent());
          } else if (state is VocabsErrorState) {
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
          }
        },
        child: BlocBuilder<VocabsBloc, VocabsState>(
          buildWhen: (previous, current) =>
              current is VocabsBookmarkedLoadDoneState ||
              current is VocabsLoadingState,
          builder: (context, state) {
            if (state is VocabsBookmarkedLoadDoneState) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: spacing24,
                ),
                itemBuilder: (context, index) =>
                    VocabCard(item: state.vocabsList[index]),
                separatorBuilder: (_, __) => const SizedBox(
                  height: spacing16,
                ),
                itemCount: state.vocabsList.length,
              );
            } else if (state is VocabsLoadingState) {
              if (!state.showOverlay) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
