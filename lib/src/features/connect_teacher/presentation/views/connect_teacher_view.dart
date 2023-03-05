import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../blocs/connect_teacher_bloc.dart';
import '../widgets/warning_dialog_content.dart';
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
              .add(const ConnectTeacherFindTeacher());
        } else if (state is ConnectTeacherLoadFailureState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => WarningDialogContent(
              title: 'Create session failed!',
              content: state.message,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text(TextDoc.txtOk),
                ),
              ],
            ),
          );
        } else if (state is ConnectTeacherFindFailureState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => WarningDialogContent(
                title: 'Find teacher failed!',
                content: state.message,
                actions: (state.message == TextDoc.txtInternetConnection)
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
          );
        } else if (state is ConnectTeacherConnectDoneState) {
          Navigator.pop(context);
        } else if (state is ConnectTeacherConnectErrorState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => WarningDialogContent(
              title: 'Connect room failed!',
              content: state.message,
              actions: [
                AppFilledButton(
                  text: TextDoc.txtTryAgain,
                  onPressed: () {
                    pContext
                        .read<ConnectTeacherBloc>()
                        .add(ConnectTeacherTryInternetConnect());
                  },
                )
              ],
            ),
          );
        } else if (state is ConnectTeacherCancelState) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    icon: const Icon(
                      Icons.check,
                      color: AppColor.support,
                    ),
                    title: const Text(
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
        color: AppColor.mainColor2,
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
                  heightScreen: (state is ConnectTeacherLoadingState ||
                          state is ConnectTeacherInitState ||
                          state is ConnectTeacherLoadFailureState ||
                          state is ConnectTeacherFindingTeacherState ||
                          state is ConnectTeacherFindFailureState)
                      ? height * 1 / 3
                      : (state is ConnectTeacherConnectingRoomState)
                          ? height
                          : height * 2 / 3,
                  colors: state is ConnectTeacherLoadingState ||
                          state is ConnectTeacherFindingTeacherState ||
                          state is ConnectTeacherInitState
                      ? [AppColor.secondary]
                      : (state is ConnectTeacherLoadFailureState ||
                              state is ConnectTeacherConnectErrorState ||
                              state is ConnectTeacherFindFailureState ||
                              state is ConnectTeacherCancelState)
                          ? [AppColor.error]
                          : state is ConnectTeacherConnectingRoomState
                              ? [AppColor.support]
                              : [AppColor.mainColor1],
                  pick: state is ConnectTeacherConnectingRoomState ? 0 : 24,
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
                child: state is ConnectTeacherConnectDoneState
                    ? Container()
                    : ElevatedButton.icon(
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                TextDoc.txtCancelTitle,
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                TextDoc.txtCancelContent,
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppElevatedButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        text: TextDoc.txtNo,
                                      ),
                                    ),
                                    const SizedBox(width: spacing10),
                                    Expanded(
                                      child: AppTextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        text: TextDoc.txtYes,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ).then((value) => value ?? false);
                          if (result) {
                            if (mounted) {
                              context.read<ConnectTeacherBloc>().add(
                                  const ConnectTeacherCancelButtonPressed());
                            }
                          }
                        },
                        icon: const Icon(Icons.close_rounded,
                            color: AppColor.error),
                        label: const Text(
                          TextDoc.txtCancel,
                          style: TextStyle(fontSize: 18, color: AppColor.error),
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
