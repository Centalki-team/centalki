import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../blocs/connect_teacher_bloc.dart';
import '../widgets/wave.dart';

class ConnectTeacherView extends StatefulWidget {
  const ConnectTeacherView({Key? key}) : super(key: key);

  @override
  State<ConnectTeacherView> createState() => _FindTeacherViewState();
}

class _FindTeacherViewState extends State<ConnectTeacherView> {
  @override
  Widget build(BuildContext context) {
    var width = -MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final pContext = context;

    return BlocConsumer<ConnectTeacherBloc, ConnectTeacherState>(
      listener: (context, state) {
        if (state is ConnectTeacherLoadDoneState) {
          context
              .read<ConnectTeacherBloc>()
              .add(const ConnectTeacherConnectRoom());
        } else if (state is ConnectTeacherConnectErrorState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.warning_amber_outlined,
                color: Colors.redAccent,
              ),
              title: Text(state.failureTitle),
              content: Text(state.message),
              actions: (state.failureType == ConnectFailure.internetConnection)
                  ? [
                      AppFilledButton(
                        text: TextDoc.txtTryAgain,
                        onPressed: () {
                          pContext
                              .read<ConnectTeacherBloc>()
                              .add(ConnectTeacherTryInternetConnect());
                        },
                      )
                    ]
                  : (state.failureType == ConnectFailure.teacherCancellation
                      ? [
                          AppFilledButton(
                            text: TextDoc.txtConnect,
                            onPressed: () => pContext
                                .read<ConnectTeacherBloc>()
                                .add(ConnectTeacherFindOtherTeacher()),
                          ),
                          AppOutlinedButton(
                            text: TextDoc.txtBack,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ]
                      : [
                          // state.failureType == ConnectFailure.NOT_FOUND_TEACHER
                          AppFilledButton(
                            text: TextDoc.txtGoBack,
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          )
                        ]),
            ),
          );
        } else if (state is ConnectTeacherMeetingState) {
          // TODO: connect to meeting room
          Navigator.pop(context);
        } else if (state is ConnectTeacherCancelState) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    title: Text(
                      TextDoc.txtSuccessfullyCancel,
                    ),
                    actions: [
                      AppFilledButton(
                        text: TextDoc.txtOk,
                        minimumSize: const Size.fromHeight(40),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ));
        }
      },
      builder: (context, state) => Material(
        color: const Color(0xffFFD033),
        child: SizedBox(
          height: height,
          width: -width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Wave(
                  widthScreen: width,
                  heightScreen: state is ConnectTeacherLoadingState ||
                          state is ConnectTeacherInitState
                      ? height * 1 / 3
                      : state is ConnectTeacherConnectDoneState
                          ? height
                          : height * 2 / 3,
                  colors: state is ConnectTeacherLoadingState
                      ? [const Color(0xffFF8811)]
                      : state is ConnectTeacherConnectDoneState
                          ? [const Color(0xff55C885)]
                          : [const Color(0xff3AAFFF)],
                  pick: state is ConnectTeacherConnectDoneState ? 0 : 24,
                  amount: 12,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    state is ConnectTeacherConnectingRoomState
                        ? const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 48,
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: height * 0.1,
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          TextDoc.txtCancelTitle,
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          TextDoc.txtCancelContent,
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      side:
                                          const BorderSide(color: Colors.grey)),
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: Text(TextDoc.txtNo),
                                ),
                              ),
                              const SizedBox(width: smallSpacing10),
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    TextDoc.txtYes,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).then((value) => value ?? false);
                    if (result) {
                      if (mounted) {
                        context
                            .read<ConnectTeacherBloc>()
                            .add(const ConnectTeacherCancelButtonPressed());
                      }
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.close_rounded, color: Colors.redAccent),
                      const SizedBox(width: smallSpacing4),
                      Text(
                        TextDoc.txtCancel,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
