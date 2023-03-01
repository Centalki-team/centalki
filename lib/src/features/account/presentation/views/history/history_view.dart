import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/history_bloc/history_bloc.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HistoryBloc>().add(const HistoryLoadMoreEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryLoadFailureState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error_outline,
                        color: AppColor.error,
                      ),
                      title: const Text(TextDoc.txtLoadFailed),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: const Text(TextDoc.txtOk)),
                      ],
                    ));
          }
        },
        builder: (context, state) {
          if (state is HistoryLoadDoneState) {
            return Scaffold(
              backgroundColor: AppColor.white,
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverAppBar.medium(
                    title: const Text(
                      TextDoc.txtHistory,
                      style: TextStyle(
                        height: 1.0,
                        fontSize: headlineSmallSize,
                        fontWeight: headlineSmallWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                vertical: screenAutoPadding8,
                                horizontal: screenAutoPadding16,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColor.mainColor2Surface,
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    TextDoc.txtTotalCompletedSessions,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: AppColor.defaultFont,
                                    ),
                                  ),
                                  Text(
                                    '${state.sessionCount}',
                                    style: const TextStyle(
                                      fontSize: headlineLargeSize,
                                      fontWeight: headlineLargeWeight,
                                      color: AppColor.support,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: spaceBetweenLine24),
                            const Text(
                              TextDoc.txtSessions,
                              style: TextStyle(
                                fontSize: titleMediumSize,
                                fontWeight: titleMediumWeight,
                                color: AppColor.tertiary,
                              ),
                            ),
                            state.sessionList.isEmpty
                                ? const Center(
                                    child: Text(
                                      'No data',
                                      style: TextStyle(
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: state.sessionList.length,
                                    itemBuilder: (_, index) => Card(
                                      elevation: 0,
                                      clipBehavior: Clip.hardEdge,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: CachedNetworkImage(
                                              imageUrl: state.sessionList[index].sessionTopic?.imageURL ?? '',
                                              fit: BoxFit.fill,
                                              width: 100,
                                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                                  CircularProgressIndicator(
                                                value: downloadProgress.progress,
                                              ),
                                              errorWidget: (context, url, error) => const Text(''),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    state.sessionList[index].sessionTopic?.name ?? '',
                                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text(
                                                    state.sessionList[index].sessionTeacher?.fullName ?? '',
                                                  ),
                                                  Text(
                                                    DateFormat('yyyy-MM-dd hh:mm a').format(
                                                      state.sessionList[index].sessionStartAt ?? DateTime.now(),
                                                    ),
                                                    style: const TextStyle(
                                                      color: AppColor.secondary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
}
