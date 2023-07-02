import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../di/di_module.dart';
import '../../../../../generated/l10n.dart';
import '../../../meeting/presentation/views/meeting_page.dart';
import '../blocs/ongoing_session_bloc/ongoing_session_bloc.dart';

class OngoingSessionNotiPanel extends StatelessWidget {
  const OngoingSessionNotiPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final _bloc = getIt.get<OngoingSessionBloc>();

    return BlocListener<OngoingSessionBloc, OngoingSessionState>(
      bloc: _bloc,
      listener: (context, state) async {
        if (state is OngoingSessionCheckingDoneState &&
            state.isInOngoingSession &&
            state.isRecheckForRejoin) {
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MeetingPage(),
                  settings: RouteSettings(
                    arguments: state.sessionScheduleEntity,
                  )));
          _bloc.add(const OngoingSessionCheckingEvent());
        }
      },
      child: BlocBuilder<OngoingSessionBloc, OngoingSessionState>(
        bloc: _bloc,
        buildWhen: (prev, cur) => cur is OngoingSessionCheckingDoneState,
        builder: (context, state) {
          if (state is OngoingSessionCheckingDoneState &&
              state.isInOngoingSession) {
            return Container(
              padding: const EdgeInsets.all(padding12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.support.withOpacity(0.9),
                    AppColor.support.withOpacity(0.3),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${S.current.txtOngoingSessionWith} ${state.sessionScheduleEntity?.sessionTeacher?.fullName ?? '--'}",
                          style: const TextStyle(
                            fontSize: labelLargeSize,
                            fontWeight: labelLargeWeight,
                            color: AppColor.defaultFontLight,
                            height: 20 / 22,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: spacing4,
                        ),
                        Text(
                          state.sessionScheduleEntity?.sessionTopic?.name ??
                              '--',
                          style: const TextStyle(
                            fontSize: bodySmallSize,
                            fontWeight: bodySmallWeight,
                            color: AppColor.defaultFontLight,
                            height: 16 / 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: spacing8,
                  ),
                  AppOutlinedButton(
                    text: S.current.txtRejoin,
                    onPressed: () =>
                        _bloc.add(const OngoingSessionCheckingEvent(
                      isRecheckForRejoin: true,
                    )),
                    minimumSize: const Size(88, 40),
                    textColor: AppColor.support,
                    outlineColor: AppColor.support,
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
