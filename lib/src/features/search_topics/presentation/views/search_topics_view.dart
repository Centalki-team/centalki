import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/buttons/outlined_button.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/widgets/textfields/search_txt_field.dart';
import '../../../topic_suggestion/presentation/views/topic_suggestion_page.dart';
import '../../../topics/presentation/widgets/topic_card.dart';
import '../blocs/search_topics_bloc/search_topics_bloc.dart';

class SearchTopicsView extends StatefulWidget {
  const SearchTopicsView({super.key});

  @override
  State<SearchTopicsView> createState() => _SearchTopicsViewState();
}

class _SearchTopicsViewState extends State<SearchTopicsView> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<SearchTopicsBloc, SearchTopicsState>(
        listener: (context, state) {
          if (state is SearchTopicsLoadingState) {
          } else if (state is SearchTopicsErrorState) {
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
        child: GestureDetector(
          onTap: _focusNode.unfocus,
          child: Scaffold(
            //backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: colorsByTheme(context).defaultFont,
                ),
                onPressed: () => Navigator.maybePop(context),
              ),
              //backgroundColor: Colors.white,
              scrolledUnderElevation: 0.0,
              centerTitle: false,
              titleSpacing: 0.0,
              toolbarHeight: 80.0,
              title: SearchTextField(
                focusNode: _focusNode,
                controller: _searchController,
                hintText: S.current.txtSearchTopicHint,
                onSubmitted: (value) => context
                    .read<SearchTopicsBloc>()
                    .add(SearchTopicsQuerySubmitEvent(
                      searchContent: value,
                    )),
              ),
              actions: const [
                SizedBox(
                  width: spacing16,
                ),
              ],
            ),
            body: Column(
              children: [
                BlocBuilder<SearchTopicsBloc, SearchTopicsState>(
                  builder: (context, state) {
                    if (state is SearchTopicsLoadDoneState &&
                        state.topicsListEntity.topics != null &&
                        state.topicsListEntity.topics!.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: spacing16,
                          vertical: spacing24,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${S.current.txtFound} ${state.topicsListEntity.topics!.length} ${state.topicsListEntity.topics!.length > 1 ? S.current.txtTopicsPlural : S.current.txtTopicSingular}',
                              style: TextStyle(
                                fontSize: bodyLargeSize,
                                fontWeight: bodyLargeWeight,
                                color: colorsByTheme(context).defaultFont,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                Expanded(
                  child: BlocBuilder<SearchTopicsBloc, SearchTopicsState>(
                    buildWhen: (prev, curr) =>
                        curr is SearchTopicsLoadDoneState ||
                        curr is SearchTopicsLoadingState,
                    builder: (context, state) {
                      if (state is SearchTopicsLoadDoneState) {
                        if (state.topicsListEntity.topics != null &&
                            state.topicsListEntity.topics!.isNotEmpty) {
                          return ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(
                              horizontal: spacing16,
                            ),
                            itemBuilder: (context, index) => TopicCard(
                              item: state.topicsListEntity.topics![index],
                              onTap: () {},
                            ),
                            separatorBuilder: (_, __) => const SizedBox(
                              height: spacing16,
                            ),
                            itemCount: state.topicsListEntity.topics!.length,
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: spacing80,
                                  width: double.infinity,
                                ),
                                const Icon(
                                  Icons.search_off_rounded,
                                  size: 64.0,
                                  color: AppColor.shadow,
                                ),
                                const SizedBox(
                                  height: spacing80,
                                  width: double.infinity,
                                ),
                                Text(
                                  S.current.txtNoResultFound,
                                  style: TextStyle(
                                    fontSize: titleLargeSize,
                                    fontWeight: titleLargeWeight,
                                    color: colorsByTheme(context).defaultFont,
                                    height: 28 / 30,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 38.0,
                                ),
                                SizedBox(
                                  width: 271.0,
                                  child: Text(
                                    '${S.current.txtSearchSr}\n\n${S.current.txtSearchPlsTryAgain}',
                                    style: const TextStyle(
                                      fontSize: bodyMediumSize,
                                      fontWeight: bodyMediumWeight,
                                      color: AppColor.shadow,
                                      height: 20 / 22,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 160,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 56),
                                  child: Text(
                                    S.current.txtSearchSuggestTopic,
                                    style: const TextStyle(
                                      fontSize: bodySmallSize,
                                      fontWeight: bodySmallWeight,
                                      color: AppColor.shadow,
                                      height: 16 / 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: spacing24,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 110),
                                  child: AppFilledButton(
                                    onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const TopicSuggestionPage())),
                                    text: S.current.txtSuggestTopicBtn,
                                    minimumSize: const Size.fromHeight(48),
                                  ),
                                ),
                                const SizedBox(
                                  height: spacing24,
                                ),
                              ],
                            ),
                          );
                        }
                      } else if (state is SearchTopicsLoadingState &&
                          state.showLoading) {
                        return Column(
                          children: const [
                            SizedBox(
                              height: 72.0,
                              width: double.infinity,
                            ),
                            CupertinoActivityIndicator(),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
