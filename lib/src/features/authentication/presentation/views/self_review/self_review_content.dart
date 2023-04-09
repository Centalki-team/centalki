import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/app_text.dart';
import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/toast/app_toast.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';
import '../../blocs/self_review_bloc/self_review_bloc.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../widgets/self_review_widgets/self_review_selectable_level.dart';

class SelfReviewContent extends StatefulWidget {
  const SelfReviewContent({
    super.key,
    required this.onSignUp,
  });

  final Function() onSignUp;

  @override
  State<SelfReviewContent> createState() => _SelfReviewContentState();
}

class _SelfReviewContentState extends State<SelfReviewContent> {
  ValueNotifier<SelfLevelEntity?> selectedLevel = ValueNotifier(null);

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<SelfReviewBloc, SelfReviewState>(
            listener: (context, state) {
              if (state is SelfReviewErrorState) {
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
          ),
          BlocListener<SignUpBloc, SignUpState>(
            listener: (context, state) {
              if (state is SignUpErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              } else if (state is SignUpSuccessState) {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text(
                  TextDoc.txtSelfReviewTitle,
                  style: TextStyle(
                    fontSize: titleLargeSize,
                    fontWeight: titleLargeWeight,
                    color: AppColor.defaultFont,
                    height: 1,
                  ),
                ),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: spacing12,
                          ),
                          const Text(
                            TextDoc.txtSelfReviewContent,
                            style: TextStyle(
                              fontSize: bodyMediumSize,
                              fontWeight: bodyMediumWeight,
                              color: AppColor.defaultFont,
                            ),
                          ),
                          const SizedBox(
                            height: spacing16,
                          ),
                          BlocBuilder<SelfReviewBloc, SelfReviewState>(
                              buildWhen: (previous, current) =>
                                  current is SelfReviewGetLevelsDoneState ||
                                  current is SelfReviewGetLevelsLoadingState,
                              builder: (context, state) {
                                if (state is SelfReviewGetLevelsDoneState) {
                                  var levels = state.levels;
                                  return SelfReviewSelectableLevel(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    levelsList: levels,
                                    onSelect: (value) {
                                      selectedLevel.value = value;
                                    },
                                  );
                                } else if (state
                                        is SelfReviewGetLevelsLoadingState &&
                                    state.showLoading) {
                                  return const Center(
                                    child: CupertinoActivityIndicator(),
                                  );
                                }
                                return const SizedBox.shrink();
                              }),
                          const SizedBox(
                            height: spacing40,
                          ),
                          ValueListenableBuilder<SelfLevelEntity?>(
                              valueListenable: selectedLevel,
                              builder: (_, value, __) => AppFilledButton(
                                    text: AppText.txtSignUp,
                                    minimumSize: const Size.fromHeight(40),
                                    onPressed: selectedLevel.value != null
                                        ? () => widget.onSignUp.call()
                                        : null,
                                  )),
                          const SizedBox(
                            height: spacing8,
                          ),
                          SafeArea(
                            top: false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  TextDoc.txtHaveAnAccount,
                                  style: TextStyle(
                                    fontSize: bodyMediumSize,
                                    fontWeight: bodyMediumWeight,
                                    color: AppColor.defaultFont,
                                  ),
                                ),
                                const SizedBox(width: spacing4),
                                AppTextButton(
                                  text: TextDoc.txtSignIn,
                                  onPressed: () => Navigator.popUntil(
                                      context, (route) => route.isFirst),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
