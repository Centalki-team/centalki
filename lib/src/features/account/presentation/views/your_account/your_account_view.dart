import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/avatar.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../blocs/your_account_bloc/your_account_bloc.dart';
import '../account_information/account_information_page.dart';
import '../change_password/change_password_page.dart';
import '../delete_account/delete_account_page.dart';
import '../history/history_page.dart';
import '../student_profile/student_profile_page.dart';
import '../wallet/wallet_page.dart';

class YourAccountView extends StatefulWidget {
  const YourAccountView({Key? key}) : super(key: key);

  @override
  State<YourAccountView> createState() => _YourAccountViewState();
}

class _YourAccountViewState extends State<YourAccountView> {
  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) => LayoutBuilder(
          builder: (context, constraint) {
            final heightView = constraint.maxHeight;
            final widthView = constraint.maxWidth;

            return BlocConsumer<YourAccountBloc, YourAccountState>(listener: (context, state) {
              if (state is YourAccountLoadErrorState) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          icon: const Icon(
                            Icons.error_outline,
                            color: AppColor.error,
                          ),
                          title: const Text(TextDoc.txtLoadFailed),
                          content: Text(state.message),
                        ));
              }
            }, builder: (context, state) {
              if (state is YourAccountLoadingState) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is YourAccountLoadDoneState) {
                return Scaffold(
                  backgroundColor: AppColor.white,
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: heightView / 2,
                            color: AppColor.mainColor2,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -50,
                                  bottom: 50,
                                  child: RotationTransition(
                                    turns: const AlwaysStoppedAnimation(45 / 360),
                                    child: ClipRect(
                                      child: Container(
                                        color: AppColor.support,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 100,
                                  top: -20,
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                      color: AppColor.mainColor2Surface,
                                      borderRadius: BorderRadius.all(Radius.circular(48.0)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -40,
                                  bottom: 120,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: const BoxDecoration(
                                      color: AppColor.error,
                                      borderRadius: BorderRadius.all(Radius.circular(48.0)),
                                    ),
                                  ),
                                ),
                                orientation == Orientation.portrait || heightView > 400
                                    ? Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Avatar(
                                              avatarUrl: state.account.avatarUrl ?? '',
                                              fullName: state.account.fullName ?? '',
                                              maxRadius: heightView / 8,
                                            ),
                                            const SizedBox(
                                              height: spaceBetweenLine18,
                                            ),
                                            Text(
                                              state.account.fullName ?? '',
                                              style: const TextStyle(
                                                fontSize: titleMediumSize,
                                                fontWeight: titleMediumWeight,
                                                color: AppColor.defaultFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: heightView / 2 - 30,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Avatar(
                                                avatarUrl: state.account.avatarUrl ?? '',
                                                fullName: state.account.fullName ?? '',
                                                maxRadius: heightView / 8,
                                              ),
                                              const SizedBox(
                                                width: spaceBetweenLine18,
                                              ),
                                              Text(
                                                state.account.fullName ?? '',
                                                style: const TextStyle(
                                                  fontSize: titleMediumSize,
                                                  fontWeight: titleMediumWeight,
                                                  color: AppColor.defaultFont,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.fromLTRB(
                                screenAutoPadding16,
                                widthView > 400 ? 48 : 64,
                                screenAutoPadding16,
                                0,
                              ),
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context, MaterialPageRoute(builder: (_) => const StudentProfilePage()));
                                    if (mounted) {
                                      context.read<YourAccountBloc>().add(const YourAccountLoadEvent());
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.shadow.shade300,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.person_outline,
                                          size: 24,
                                          color: AppColor.defaultFont,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtStudentProfile,
                                          style: TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine12),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const WalletPage()),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColor.shadow.shade300,
                                            blurRadius: 2.0,
                                            spreadRadius: 0.0,
                                            offset: const Offset(0, 1),
                                          )
                                        ]),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.wallet,
                                          size: 24,
                                          color: AppColor.defaultFont,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtWallet,
                                          style: TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine12),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoryPage()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.shadow.shade300,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.history_outlined,
                                          size: 24,
                                          color: AppColor.defaultFont,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtHistory,
                                          style: TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine12),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const AccountInformationPage()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.shadow.shade300,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.info_outline_rounded,
                                          size: 24,
                                          color: AppColor.defaultFont,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtAccountInformation,
                                          style: TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine12),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const ChangePasswordPage())),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.shadow.shade300,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.password_outlined,
                                          size: 24,
                                          color: AppColor.defaultFont,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtChangePassword,
                                          style: TextStyle(
                                            fontSize: bodyLargeSize,
                                            fontWeight: bodyLargeWeight,
                                            color: AppColor.defaultFont,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine12),
                                GestureDetector(
                                  onTap: () async {
                                    final confirmedDelete = await showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text(
                                                TextDoc.txtConfirmDeleteAccountTitle,
                                                style: TextStyle(
                                                  color: AppColor.error,
                                                ),
                                              ),
                                              content: const Text(TextDoc.txtConfirmDeleteAccountContent),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context, false),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: AppColor.mainColor1,
                                                  ),
                                                  child: const Text(TextDoc.txtCancel),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () => Navigator.pop(context, true),
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: AppColor.error,
                                                    foregroundColor: Colors.white,
                                                  ),
                                                  child: const Text(TextDoc.txtDeleteAccount),
                                                ),
                                              ],
                                            )).then((value) => value ?? false);
                                    if (confirmedDelete) {
                                      if (mounted) {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const DeleteAccountPage()));
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.shadow.shade300,
                                          blurRadius: 2.0,
                                          spreadRadius: 0.0,
                                          offset: const Offset(0, 1),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.person_remove_outlined,
                                          size: 24,
                                          color: AppColor.error,
                                        ),
                                        SizedBox(width: spaceBetweenLine16),
                                        Text(
                                          TextDoc.txtDeleteAccount,
                                          style: TextStyle(
                                            fontSize: titleMediumSize,
                                            fontWeight: titleMediumWeight,
                                            color: AppColor.error,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine32),
                                TextButton(
                                  onPressed: () => context.read<YourAccountBloc>().add(
                                        const YourAccountLogOutEvent(),
                                      ),
                                  style: TextButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: AppColor.error,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.logout_outlined,
                                        size: 24,
                                        color: AppColor.error,
                                      ),
                                      SizedBox(width: smallSpacing8),
                                      Text(
                                        TextDoc.txtLogOut,
                                        style: TextStyle(
                                          fontSize: labelLargeSize,
                                          fontWeight: labelLargeWeight,
                                          color: AppColor.error,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: spaceBetweenLine32),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          screenAutoPadding16,
                          heightView * 1 / 2 - 30,
                          screenAutoPadding16,
                          0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.shadow.shade300,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: const Offset(0, 2),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      TextDoc.txtRemainingSessions,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: titleSmallSize,
                                        fontWeight: titleSmallWeight,
                                        color: AppColor.shadow,
                                      ),
                                    ),
                                    Text(
                                      '${(state.account.userProfile?.accountBalance ?? 0) ~/ (state.account.userProfile?.currentCostPerSession ?? 1)}',
                                      style: const TextStyle(
                                        height: 0.75,
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: spaceBetweenLine16),
                              Container(
                                width: 1,
                                height: 48,
                                color: AppColor.container,
                              ),
                              const SizedBox(width: spaceBetweenLine16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      TextDoc.txtCompletedSessions,
                                      style: TextStyle(
                                        fontSize: titleSmallSize,
                                        fontWeight: titleSmallWeight,
                                        color: AppColor.shadow,
                                      ),
                                    ),
                                    Text(
                                      '${state.account.accountCompletedSessions ?? 0}',
                                      style: const TextStyle(
                                        height: 0.75,
                                        fontSize: bodyLargeSize,
                                        fontWeight: bodyLargeWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            });
          },
        ),
      );
}
