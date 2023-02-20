import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
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

            return BlocConsumer<YourAccountBloc, YourAccountState>(
                listener: (context, state) {
              if (state is YourAccountLoadErrorState) {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          icon: const Icon(
                            Icons.error_outline,
                            color: error,
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
                  body: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            height: heightView / 2,
                            color: mainColor2,
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
                                        color: support,
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
                                    decoration: BoxDecoration(
                                      color: mainColor2Surface,
                                      borderRadius: BorderRadius.circular(48),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: -40,
                                  bottom: 120,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: error,
                                      borderRadius: BorderRadius.circular(48),
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
                                              maxRadius: heightView / 8,
                                            ),
                                            const SizedBox(
                                              height: spaceBetweenLine18,
                                            ),
                                            Text(
                                              state.account.fullName ?? '',
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: heightView / 2 - 30,
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
                                                width: spaceBetweenLine18,
                                              ),
                                              Text(
                                                state.account.fullName ?? '',
                                                style: const TextStyle(
                                                    fontSize: 20),
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
                                  widthView > 400 ? 50 : 80,
                                  screenAutoPadding16,
                                  0),
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const StudentProfilePage()));
                                    if (mounted) {
                                      context.read<YourAccountBloc>().add(const YourAccountLoadEvent());
                                    }
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.person,
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtStudentProfile,
                                            style:
                                                TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const WalletPage()));
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.wallet,
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtWallet,
                                            style:
                                                TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const HistoryPage()));
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.history,
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtHistory,
                                            style:
                                                TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AccountInformationPage()));
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.info,
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtAccountInformation,
                                            style:
                                                TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChangePasswordPage())),
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.password,
                                            size: 32,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtChangePassword,
                                            style:
                                                TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final confirmedDelete = await showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text(
                                                TextDoc
                                                    .txtConfirmDeleteAccountTitle,
                                                style: TextStyle(
                                                    color: error),
                                              ),
                                              content: const Text(TextDoc
                                                  .txtConfirmDeleteAccountContent),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, false),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: mainColor1,
                                                  ),
                                                  child:
                                                      const Text(TextDoc.txtCancel),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, true),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: error,
                                                    foregroundColor:
                                                        Colors.white,
                                                  ),
                                                  child: const Text(
                                                      TextDoc.txtDeleteAccount),
                                                ),
                                              ],
                                            )).then((value) => value ?? false);
                                    if (confirmedDelete) {
                                      if (mounted) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const DeleteAccountPage()));
                                      }
                                    }
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.person_remove,
                                            size: 32,
                                            color: error,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            TextDoc.txtDeleteAccount,
                                            style: TextStyle(
                                                fontSize: 16, color: error),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: spaceBetweenLine12,
                                ),
                                AppOutlinedButton(
                                  onPressed: () {
                                    context
                                        .read<YourAccountBloc>()
                                        .add(const YourAccountLogOutEvent());
                                  },
                                  text: TextDoc.txtLogOut,
                                  icon: Icons.logout,
                                  minimumSize: const Size.fromHeight(48),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(screenAutoPadding16,
                            heightView * 1 / 2 - 30, screenAutoPadding16, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(screenAutoPadding16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      TextDoc.txtBalanceSessions,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${(state.account.userProfile?.accountBalance ?? 0) ~/ (state.account.userProfile?.currentCostPerSession ?? 1)}',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 2,
                                height: 40,
                                color: background,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      TextDoc.txtCompletedSessions,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${state.account.accountCompletedSessions ?? 0}'),
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
