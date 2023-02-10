import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../blocs/your_account_bloc/your_account_bloc.dart';
import '../delete_account/delete_account_page.dart';

class YourAccountView extends StatefulWidget {
  const YourAccountView({Key? key}) : super(key: key);

  @override
  State<YourAccountView> createState() => _YourAccountViewState();
}

class _YourAccountViewState extends State<YourAccountView> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraint) {
            final heightView = constraint.maxHeight;
            final widthView = constraint.maxWidth;

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
                                turns: const AlwaysStoppedAnimation(45 / 360),
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
                                        CircleAvatar(
                                          backgroundColor: secondary,
                                          maxRadius: (heightView / 8),
                                          child: const Text('AN'),
                                        ),
                                        const SizedBox(
                                          height: spaceBetweenLine18,
                                        ),
                                        const Text(
                                          'Nguyễn Ngọc Mai Anh',
                                          style: TextStyle(fontSize: 20),
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
                                          CircleAvatar(
                                            backgroundColor: secondary,
                                            maxRadius: (heightView / 8),
                                            child: const Text('AN'),
                                          ),
                                          const SizedBox(
                                            width: spaceBetweenLine18,
                                          ),
                                          const Text(
                                            'Nguyễn Ngọc Mai Anh',
                                            style: TextStyle(fontSize: 20),
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
                              screenAutoPadding16, widthView > 400 ? 50 : 80, screenAutoPadding16, 0),
                          children: [
                            GestureDetector(
                              onTap: () {},
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
                                        'Student Profile',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                        'Wallet',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                        'History',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                        'Account Information',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
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
                                        'Change Password',
                                        style: TextStyle(fontSize: 16),
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
                                            'Delete your account?',
                                            style: TextStyle(color: error),
                                          ),
                                          content: const Text(
                                              'You are requesting that your account be deleted.\nDeleting the account will:\n   \u{2022} Remove account information and images\n   \u{2022} Remove all messages\n   \u{2022} Unable to restore'),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, false),
                                              style: TextButton.styleFrom(
                                                foregroundColor: mainColor1,
                                              ),
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, true),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: error,
                                                foregroundColor: Colors.white,
                                              ),
                                              child:
                                                  const Text('Delete Account'),
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
                                        'Delete Account',
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
                              text: 'Log Out',
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
                              children: const [
                                Text(
                                  '  Balance sessions',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('100'),
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
                              children: const [
                                Text(
                                  'Completed sessions',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('10'),
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
          },
        );
      },
    );
  }
}
