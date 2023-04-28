import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../domain/entities/noti_list_item_entity.dart';
import '../blocs/noti_list_bloc/noti_list_bloc.dart';
import '../widgets/noti_list.dart';

class NotiListView extends StatefulWidget {
  const NotiListView({super.key});

  @override
  State<NotiListView> createState() => _NotiListViewState();
}

class _NotiListViewState extends State<NotiListView> {
  var selectedNotiList = <NotiListItemEntity>[];

  _markAsRead(NotiListItemEntity item) {
    if (!selectedNotiList.contains(item)) {
      selectedNotiList.add(item);
    }
    if (item.seenAtTime == null) {
      context
          .read<NotiListBloc>()
          .add(NotiListMarkReadSingleEvent(notiId: item.id ?? ''));
    } else {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<NotiListBloc, NotiListState>(
        listener: (context, state) {
          LoadingManager.setLoading(
            context,
            loading: state is NotiListLoadingState &&
                state.isOverlay &&
                state.showLoading,
          );
          if (state is NotiListMarkSingleAsReadSuccess) {
            context.read<NotiListBloc>().add(const NotiListLoadDataEvent());
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text(
                  TextDoc.txtNotifications,
                  style: TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: AppColor.defaultFont,
                    height: 32 / 34,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: AppColor.mainColor1,
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (context, index) => BlocBuilder<NotiListBloc, NotiListState>(
                    buildWhen: (previous, current) =>
                        previous != current && current is NotiListLoadDoneState,
                    builder: (context, state) {
                      if (state is NotiListLoadDoneState) {
                        if (state.notiListResponseEntity.data.isEmpty) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: AppColor.shadow,
                                size: 80.0,
                              ),
                              SizedBox(
                                height: spacing16,
                                width: double.infinity,
                              ),
                              Text(
                                TextDoc.txtNoNotiToShow,
                                style: TextStyle(
                                  fontSize: titleLargeSize,
                                  fontWeight: titleLargeWeight,
                                  color: AppColor.defaultFont,
                                  height: 28 / 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: spacing8,
                                width: double.infinity,
                              ),
                              Text(
                                TextDoc.txtNotiWillUpdateRemind,
                                style: TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: bodyMediumWeight,
                                  color: AppColor.shadow,
                                  height: 20 / 22,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        }
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              NotiList(
                                title: TextDoc.txtToday,
                                notiList: state.todayList,
                                selectedList: selectedNotiList,
                                needTimeAgoConvert: true,
                                markAsRead: _markAsRead,
                              ),
                              NotiList(
                                title: TextDoc.txtThisWeek,
                                notiList: state.thisWeekList,
                                selectedList: selectedNotiList,
                                needTimeAgoConvert: true,
                                markAsRead: _markAsRead,
                              ),
                              NotiList(
                                title: TextDoc.txtPrevious,
                                notiList: state.previousList,
                                selectedList: selectedNotiList,
                                markAsRead: _markAsRead,
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
