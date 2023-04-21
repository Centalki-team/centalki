import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../blocs/history_bloc/history_bloc.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) => BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryLoadFailureState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => ErrorDialogContent(
                title: TextDoc.txtLoadFailed,
                content: state.message,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HistoryLoadDoneState) {
            return Scaffold(
              backgroundColor: AppColor.white,
              body: CustomScrollView(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: padding16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                vertical: padding8,
                                horizontal: padding16,
                              ),
                              decoration: const BoxDecoration(
                                color: AppColor.mainColor2Surface,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
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
                                    '${state.totalCompletedSessionCount}',
                                    style: const TextStyle(
                                      fontSize: headlineLargeSize,
                                      fontWeight: headlineLargeWeight,
                                      color: AppColor.support,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: spacing24),
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
                                      TextDoc.txtNoData,
                                      style: TextStyle(
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    separatorBuilder: (_, index) =>
                                        const SizedBox(height: spacing16),
                                    itemCount: state.hasReachMax
                                        ? state.sessionList.length
                                        : state.sessionList.length + 1,
                                    itemBuilder: (_, index) => index ==
                                            state.sessionList.length
                                        ? Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  context.read<HistoryBloc>().add(
                                                      const HistoryLoadMoreEvent());
                                                },
                                                child:
                                                    const CircularProgressIndicator(),
                                              ),
                                              const SizedBox(
                                                height: spacing8,
                                              ),
                                              const Text(
                                                TextDoc
                                                    .txtTapToLoadMoreSessions,
                                                style: TextStyle(
                                                  fontSize: bodyLargeSize,
                                                  fontWeight: bodyLargeWeight,
                                                  color: AppColor.shadow,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Card(
                                            clipBehavior: Clip.hardEdge,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: CachedNetworkImage(
                                                    imageUrl: state
                                                            .sessionList[index]
                                                            .sessionTopic
                                                            ?.imageURL ??
                                                        '',
                                                    fit: BoxFit.fill,
                                                    width: 100,
                                                    height: 160,
                                                    progressIndicatorBuilder: (context,
                                                            url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                      value: downloadProgress
                                                          .progress,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            const Text(''),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          state
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionTopic
                                                                  ?.name ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                titleMediumWeight,
                                                            fontSize:
                                                                titleMediumSize,
                                                            color: AppColor
                                                                .defaultFont,
                                                          ),
                                                        ),
                                                        Text(
                                                          state
                                                                  .sessionList[
                                                                      index]
                                                                  .sessionTeacher
                                                                  ?.fullName ??
                                                              '',
                                                          style:
                                                              const TextStyle(
                                                            fontSize:
                                                                bodyLargeSize,
                                                            fontWeight:
                                                                bodyLargeWeight,
                                                            color: AppColor
                                                                .defaultFont,
                                                          ),
                                                        ),
                                                        Text(
                                                          DateFormat(
                                                                  'yyyy-MM-dd hh:mm a')
                                                              .format(
                                                            state
                                                                    .sessionList[
                                                                        index]
                                                                    .sessionStartAt
                                                                    ?.toLocal() ??
                                                                DateTime.now(),
                                                          ),
                                                          style:
                                                              const TextStyle(
                                                            color: AppColor
                                                                .secondary,
                                                            fontWeight:
                                                                bodyLargeWeight,
                                                            fontSize:
                                                                bodyLargeSize,
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
