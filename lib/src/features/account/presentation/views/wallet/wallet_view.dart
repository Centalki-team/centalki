import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/wallet_bloc/wallet_bloc.dart';

class WalletView extends StatelessWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state is WalletLoadFailureState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error_outline,
                        color: AppColor.error,
                      ),
                      title: const Text(TextDoc.txtLoadFailed),
                      content: Text(state.message),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context), child: const Text(TextDoc.txtOk)),
                      ],
                    ));
          }
        },
        builder: (context, state) {
          final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');

          if (state is WalletLoadDoneState) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: const Text(TextDoc.txtWallet),
                    centerTitle: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          onPressed: () {
                            context.read<WalletBloc>().add(const WalletGetMoreEvent());
                          },
                          icon: const Icon(
                            Icons.add,
                            color: AppColor.mainColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16, vertical: 24),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: AppColor.mainColor2Surface,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: screenAutoPadding16,
                                      ),
                                      child: Column(
                                        children: [
                                          const Text(
                                            TextDoc.txtBalance,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.defaultFont,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            currencyFormat.format(state.balanceMoney),
                                            style: const TextStyle(
                                              color: AppColor.support,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(TextDoc.txtOr),
                                          Text(
                                            '${state.balanceSessions} sessions',
                                            style: const TextStyle(
                                              color: AppColor.support,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${TextDoc.txtEachSession} ${currencyFormat.format(state.costPerSession)}${TextDoc.txt30Minutes}',
                                            style: const TextStyle(fontStyle: FontStyle.italic),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: spaceBetweenLine20,
                              ),
                              /*const Text(
                                    TextDoc.txtTransactions,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: tertiary,
                                        fontSize: 18),
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (_, index) =>
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: shadowColor,
                                                ),
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.arrow_upward,
                                                  color: support,
                                                ),
                                                const SizedBox(
                                                  width: smallSpacing10,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      DateFormat(
                                                          'yyyy-MM-dd hh:mm a')
                                                          .format(
                                                          DateTime.now()),
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        color: defaultFont,
                                                      ),
                                                    ),
                                                    const Text(
                                                      TextDoc.txtCharged,
                                                      style: TextStyle(
                                                        color: defaultFont,
                                                      ),
                                                    ),
                                                    Text(
                                                      currencyFormat.format(
                                                          100000),
                                                      style:
                                                      const TextStyle(
                                                          color: support),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  )*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      );
}
