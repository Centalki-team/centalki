import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../../../shared/widgets/textfields/search_txt_field.dart';
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
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.maybePop(context),
              ),
              backgroundColor: Colors.white,
              scrolledUnderElevation: 0.0,
              centerTitle: false,
              titleSpacing: 0.0,
              toolbarHeight: 60.0,
              title: SearchTextField(
                focusNode: _focusNode,
                controller: _searchController,
                hintText: 'search topics by name',
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
                              'Found ${state.topicsListEntity.topics!.length} topics',
                              style: const TextStyle(
                                fontSize: bodyLargeSize,
                                fontWeight: bodyLargeWeight,
                                color: AppColor.defaultFont,
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
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(
                                height: 72.0,
                                width: double.infinity,
                              ),
                              Text(
                                TextDoc.txtNoResultFound,
                                style: TextStyle(
                                  fontSize: titleLargeSize,
                                  fontWeight: titleLargeWeight,
                                  color: AppColor.defaultFont,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 38.0,
                              ),
                              SizedBox(
                                width: 271.0,
                                child: Text(
                                  '${TextDoc.txtSearchSr}\n\n${TextDoc.txtSearchPlsTryAgain}',
                                  style: TextStyle(
                                    fontSize: bodyMediumSize,
                                    fontWeight: bodyMediumWeight,
                                    color: AppColor.shadow,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
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
