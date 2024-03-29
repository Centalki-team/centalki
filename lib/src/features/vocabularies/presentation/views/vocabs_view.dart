import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';
import '../../../vocabularies_learning/presentation/views/vocab_learning_page.dart';
import '../blocs/vocabs_bloc/vocabs_bloc.dart';
import '../widgets/vocabs_card.dart';
import 'vocabs_empty_view.dart';

class VocabsView extends StatefulWidget {
  const VocabsView({super.key});

  @override
  State<VocabsView> createState() => _VocabsViewState();
}

class _VocabsViewState extends State<VocabsView> {
  _showConfirmRemoveSavedVocab(BookmarkVocabsItemEntity item) async {
    final result = await showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          S.current.txtConfirmRemoveSavedTitle,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        content: Text(
          S.current.txtConfirmRemoveSavedContent,
          style: TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppColor.mainColor1,
            ),
            child: Text(
              S.current.txtCancel,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
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
    );
    if (result == true) {
      if (mounted) {
        context
            .read<VocabsBloc>()
            .add(VocabsRemoveBookmarkEvent(bookmarkId: item.id!));
      }
    }
  }

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
              message: Text(
                S.current.txtRemoteVocabBookmarkSuccess,
                style: const TextStyle(
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
        child: Scaffold(
          //backgroundColor: AppColor.white,
          body: BlocBuilder<VocabsBloc, VocabsState>(
            buildWhen: (previous, current) =>
                current is VocabsBookmarkedLoadDoneState ||
                current is VocabsLoadingState,
            builder: (context, state) {
              if (state is VocabsBookmarkedLoadDoneState) {
                if (state.vocabsList.isEmpty) {
                  return const VocabsEmptyView();
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    vertical: padding24,
                    horizontal: padding16,
                  ),
                  itemBuilder: (context, index) => VocabCard(
                    item: state.vocabsList[index],
                    onRemoveSaved: _showConfirmRemoveSavedVocab,
                  ),
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
          floatingActionButton: BlocBuilder<VocabsBloc, VocabsState>(
            buildWhen: (previous, current) =>
                current is VocabsBookmarkedLoadDoneState,
            builder: (context, state) {
              if (state is VocabsBookmarkedLoadDoneState &&
                  state.vocabsList.isNotEmpty) {
                return FloatingActionButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VocabLearningPage(
                        vocabsList: state.vocabsList,
                      ),
                    ),
                  ),
                  shape: const CircleBorder(),
                  backgroundColor: colorsByTheme(context).iconBackground,
                  child: Icon(
                    Icons.local_library_outlined,
                    color: colorsByTheme(context).icon,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );
}
