import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../generated/l10n.dart';
import '../../../settings/presentation/views/settings_notification_view.dart';
import '../../domain/entities/noti_list_item_entity.dart';
import '../blocs/noti_list_bloc/noti_list_bloc.dart';
import '../widgets/noti_bottom_modal.dart';
import '../widgets/noti_list.dart';

class NotiListView extends StatefulWidget {
  const NotiListView({super.key});

  @override
  State<NotiListView> createState() => _NotiListViewState();
}

class _NotiListViewState extends State<NotiListView> {
  var selectedNotiList = <NotiListItemEntity>[];

  _showNotiExternalOptions() async {
    final result = await showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      builder: (context) => const NotiModalBottomSheet(),
    );
    if (result != null) {
      switch (result) {
        case 0:
          if (mounted) {
            context.read<NotiListBloc>().add(const NotiListMarkAllReadEvent());
          }
          break;
        case 1:
          if (mounted) {
            context
                .read<NotiListBloc>()
                .add(const NotiListMarkAllUnreadEvent());
          }
          break;
        case 2:
          if (mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingsNotification(),
              ),
            );
          }
          break;
        default:
          return;
      }
    }
  }

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
                title: Text(
                  S.current.txtNotifications,
                  style: const TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: AppColor.defaultFont,
                    height: 32 / 34,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: _showNotiExternalOptions,
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
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              const Icon(
                                Icons.notifications_none_outlined,
                                color: AppColor.shadow,
                                size: 80.0,
                              ),
                              const SizedBox(
                                height: spacing16,
                                width: double.infinity,
                              ),
                              Text(
                                S.current.txtNoNotiToShow,
                                style: const TextStyle(
                                  fontSize: titleLargeSize,
                                  fontWeight: titleLargeWeight,
                                  color: AppColor.defaultFont,
                                  height: 28 / 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: spacing8,
                                width: double.infinity,
                              ),
                              Text(
                                S.current.txtNotiWillUpdateRemind,
                                style: const TextStyle(
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
                                title: S.current.txtToday,
                                notiList: state.todayList,
                                selectedList: selectedNotiList,
                                needTimeAgoConvert: true,
                                markAsRead: _markAsRead,
                              ),
                              NotiList(
                                title: S.current.txtThisWeek,
                                notiList: state.thisWeekList,
                                selectedList: selectedNotiList,
                                needTimeAgoConvert: true,
                                markAsRead: _markAsRead,
                              ),
                              NotiList(
                                title: S.current.txtPrevious,
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
