import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../history_detail/presentation/views/history_detail_page.dart';
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
                title: S.current.txtLoadFailed,
                content: state.message,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HistoryLoadDoneState) {
            return Scaffold(
              //backgroundColor: AppColor.white,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    expandedHeight: sliverAppBarHeight,
                    leading: IconButton(
                      onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: colorsByTheme(context).defaultFont,
                      ),
                    ),
                    title: Text(
                      S.current.txtHistory,
                      style: TextStyle(
                        height: 1.0,
                        fontSize: headlineSmallSize,
                        fontWeight: headlineSmallWeight,
                        color: colorsByTheme(context).defaultFont,
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
                              decoration: BoxDecoration(
                                color: colorsByTheme(context)
                                    .backgroundCardHistoryWallet,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    S.current.txtTotalCompletedSessions,
                                    style: TextStyle(
                                      fontSize: titleMediumSize,
                                      fontWeight: titleMediumWeight,
                                      color: colorsByTheme(context).defaultFont,
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
                            Text(
                              S.current.txtSessions,
                              style: const TextStyle(
                                fontSize: titleMediumSize,
                                fontWeight: titleMediumWeight,
                                color: AppColor.tertiary,
                              ),
                            ),
                            state.sessionList.isEmpty
                                ? Center(
                                    child: Text(
                                      S.current.txtNoData,
                                      style: TextStyle(
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    padding: EdgeInsets.zero,
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
                                              Text(
                                                S.current
                                                    .txtTapToLoadMoreSessions,
                                                style: TextStyle(
                                                  fontSize: bodyLargeSize,
                                                  fontWeight: bodyLargeWeight,
                                                  color: colorsByTheme(context)
                                                      .defaultFont,
                                                ),
                                              ),
                                            ],
                                          )
                                        : GestureDetector(
                                            onTap: () => {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HistoryDetailPage(
                                                    session: state
                                                        .sessionList[index],
                                                  ),
                                                ),
                                              ),
                                            },
                                            child: Card(
                                              color: colorsByTheme(context)
                                                  .backgroundCardsChip,
                                              clipBehavior: Clip.hardEdge,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: CachedNetworkImage(
                                                      imageUrl: state
                                                              .sessionList[
                                                                  index]
                                                              .sessionTopic
                                                              ?.imageURL ??
                                                          '',
                                                      fit: BoxFit.fill,
                                                      width: 100,
                                                      height: 160,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  downloadProgress) =>
                                                              CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                      ),
                                                      errorWidget: (context,
                                                              url, error) =>
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
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  titleMediumWeight,
                                                              fontSize:
                                                                  titleMediumSize,
                                                              color: colorsByTheme(
                                                                      context)
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
                                                            style: TextStyle(
                                                              fontSize:
                                                                  bodyLargeSize,
                                                              fontWeight:
                                                                  bodyLargeWeight,
                                                              color: colorsByTheme(
                                                                      context)
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
                                                                  DateTime
                                                                      .now(),
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
