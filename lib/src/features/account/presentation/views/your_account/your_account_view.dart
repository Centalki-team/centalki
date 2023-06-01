import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/common_txt_style.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/avatar.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../notifications/presentation/views/noti_list_page.dart';
import '../../blocs/your_account_bloc/your_account_bloc.dart';
import '../../widgets/account_tile.dart';
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

            return BlocConsumer<YourAccountBloc, YourAccountState>(
                listener: (context, state) {
              if (state is YourAccountLoadErrorState) {
                showDialog(
                  context: context,
                  builder: (context) => ErrorDialogContent(
                    title: S.current.txtLoadFailed,
                    content: state.message,
                  ),
                );
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
                  //backgroundColor: AppColor.white,
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Container(
                            height: 64.0,
                            padding: const EdgeInsets.only(
                              left: padding16,
                              right: padding4,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.current.appName,
                                    style: CommonTxtStyle.t30Regular.apply(
                                      color: colorsByTheme(context).defaultFont,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotiListPage(),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: padding12,
                                    ),
                                    child: Icon(
                                      Icons.notifications_none_rounded,
                                      color: AppColor.mainColor1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: heightView / 3 + 15,
                            color: AppColor.mainColor2,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: -50,
                                  bottom: 50,
                                  child: RotationTransition(
                                    turns:
                                        const AlwaysStoppedAnimation(45 / 360),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(48.0)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(48.0)),
                                    ),
                                  ),
                                ),
                                orientation == Orientation.portrait ||
                                        heightView > 400
                                    ? Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Avatar(
                                              avatarUrl:
                                                  state.account.avatarUrl ?? '',
                                              fullName:
                                                  state.account.fullName ?? '',
                                              maxRadius: heightView / 10,
                                            ),
                                            const SizedBox(
                                              height: spacing4,
                                            ),
                                            Text(
                                              state.account.fullName ?? '',
                                              style: const TextStyle(
                                                fontSize: titleMediumSize,
                                                fontWeight: titleMediumWeight,
                                                color:
                                                    AppColor.defaultFontLight,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: spacing24,
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: heightView / 3 - 30,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Avatar(
                                                avatarUrl:
                                                    state.account.avatarUrl ??
                                                        '',
                                                fullName:
                                                    state.account.fullName ??
                                                        '',
                                                maxRadius: heightView / 8,
                                              ),
                                              const SizedBox(
                                                width: spacing18,
                                              ),
                                              Text(
                                                state.account.fullName ?? '',
                                                style: const TextStyle(
                                                  fontSize: titleMediumSize,
                                                  fontWeight: titleMediumWeight,
                                                  color:
                                                      AppColor.defaultFontLight,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              padding16,
                              heightView * 1 / 3 -
                                  30 +
                                  MediaQuery.of(context).padding.top +
                                  64.0,
                              padding16,
                              0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(radius12)),
                                color: colorsByTheme(context).backgroundTheme,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.shadow.shade300,
                                    blurRadius: 12.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(0, 2),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(padding8),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(padding4),
                                    child: Text(
                                      S.current.txtSessions,
                                      style: const TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color: AppColor.tertiary,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              S.current.txtRemainingSessions,
                                              textAlign: TextAlign.end,
                                              style: const TextStyle(
                                                fontSize: titleSmallSize,
                                                fontWeight: titleSmallWeight,
                                                color: AppColor.shadow,
                                                height: 1,
                                              ),
                                            ),
                                            Text(
                                              '${(state.account.userProfile?.accountBalance ?? 0) ~/ (state.account.userProfile?.currentCostPerSession ?? 1)}',
                                              style: TextStyle(
                                                height: 0.75,
                                                fontSize: bodyLargeSize,
                                                fontWeight: bodyLargeWeight,
                                                color: colorsByTheme(context)
                                                    .defaultFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: spacing16),
                                      Container(
                                        width: 1,
                                        height: 40,
                                        color: AppColor.container,
                                      ),
                                      const SizedBox(width: spacing16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              S.current.txtCompletedSessions,
                                              style: const TextStyle(
                                                fontSize: titleSmallSize,
                                                fontWeight: titleSmallWeight,
                                                color: AppColor.shadow,
                                                height: 1,
                                              ),
                                            ),
                                            Text(
                                              '${state.account.accountCompletedSessions ?? 0}',
                                              style: TextStyle(
                                                height: 0.75,
                                                fontSize: bodyLargeSize,
                                                fontWeight: bodyLargeWeight,
                                                color: colorsByTheme(context)
                                                    .defaultFont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: spacing8),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: padding16),
                              children: [
                                const SizedBox(height: spacing8),
                                AccountTile(
                                  icon: Icons.person_outline,
                                  title: S.current.txtStudentProfile,
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              const StudentProfilePage(),
                                        ));
                                    if (mounted) {
                                      context.read<YourAccountBloc>().add(
                                            const YourAccountLoadEvent(),
                                          );
                                    }
                                  },
                                ),
                                const SizedBox(height: spacing12),
                                AccountTile(
                                  icon: Icons.wallet_outlined,
                                  title: S.current.txtWallet,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const WalletPage()),
                                  ),
                                ),
                                const SizedBox(height: spacing12),
                                AccountTile(
                                  icon: Icons.history_outlined,
                                  title: S.current.txtHistory,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HistoryPage()),
                                  ),
                                ),
                                const SizedBox(height: spacing12),
                                AccountTile(
                                  icon: Icons.manage_accounts_outlined,
                                  title: S.current.txtAccountInformation,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AccountInformationPage()),
                                  ),
                                ),
                                const SizedBox(height: spacing12),
                                AccountTile(
                                  icon: Icons.password_outlined,
                                  title: S.current.txtChangePassword,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangePasswordPage()),
                                  ),
                                ),
                                const SizedBox(height: spacing12),
                                AccountTile(
                                  icon: Icons.person_remove_outlined,
                                  title: S.current.txtDeleteAccount,
                                  foregroundColor: AppColor.error,
                                  onTap: () async {
                                    final confirmedDelete = await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: colorsByTheme(context)
                                            .backgroundCardsChip,
                                        title: Text(
                                          S.current
                                              .txtConfirmDeleteAccountTitle,
                                          style: const TextStyle(
                                            fontSize: titleLargeSize,
                                            fontWeight: titleLargeWeight,
                                            color: AppColor.error,
                                          ),
                                        ),
                                        content: Text(
                                          S.current
                                              .txtConfirmDeleteAccountContent,
                                          style: TextStyle(
                                            fontSize: bodySmallSize,
                                            fontWeight: bodySmallWeight,
                                            color: colorsByTheme(context)
                                                .defaultFont,
                                          ),
                                        ),
                                        actions: [
                                          AppTextButton(
                                            text: S.current.txtCancel,
                                            onPressed: () =>
                                                Navigator.pop(context, false),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.pop(context, true),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColor.error,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: Text(
                                              S.current.txtDeleteAccount,
                                              style: const TextStyle(
                                                fontSize: labelLargeSize,
                                                fontWeight: labelLargeWeight,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ).then((value) => value ?? false);
                                    if (confirmedDelete) {
                                      if (mounted) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DeleteAccountPage()),
                                        );
                                      }
                                    }
                                  },
                                ),
                                const SizedBox(height: spacing32),
                                TextButton(
                                  onPressed: () async {
                                    final confirmedLogout = await showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              backgroundColor:
                                                  colorsByTheme(context)
                                                      .backgroundCardsChip,
                                              title: Text(
                                                S.current.txtSignOut,
                                                style: const TextStyle(
                                                  fontSize: titleLargeSize,
                                                  fontWeight: titleLargeWeight,
                                                  color: AppColor.error,
                                                ),
                                              ),
                                              content: Text(
                                                S.current.txtSignOutContent,
                                                style: TextStyle(
                                                  fontSize: bodySmallSize,
                                                  fontWeight: bodySmallWeight,
                                                  color: colorsByTheme(context)
                                                      .defaultFont,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, false),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        AppColor.mainColor1,
                                                  ),
                                                  child: Text(
                                                    S.current.txtCancel,
                                                    style: const TextStyle(
                                                      fontSize: labelLargeSize,
                                                      fontWeight:
                                                          labelLargeWeight,
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, true),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        AppColor.error,
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  child: Text(
                                                    S.current.txtSignOut,
                                                    style: const TextStyle(
                                                      fontSize: labelLargeSize,
                                                      fontWeight:
                                                          labelLargeWeight,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )).then((value) => value ?? false);
                                    if (confirmedLogout) {
                                      if (mounted) {
                                        context.read<YourAccountBloc>().add(
                                              const YourAccountLogOutEvent(),
                                            );
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColor.error,
                                    minimumSize: const Size.fromHeight(48.0),
                                    side: const BorderSide(
                                      width: 1.0,
                                      color: AppColor.error,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.logout_outlined,
                                      ),
                                      const SizedBox(width: spacing8),
                                      Text(
                                        S.current.txtSignOut,
                                        style: const TextStyle(
                                          fontSize: labelLargeSize,
                                          fontWeight: labelLargeWeight,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: spacing32),
                              ],
                            ),
                          ),
                        ],
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
