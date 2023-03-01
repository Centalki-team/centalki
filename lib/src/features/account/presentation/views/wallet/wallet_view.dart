import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
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
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(TextDoc.txtOk),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          final currencyFormat = NumberFormat.currency(locale: 'vi_VN', symbol: 'VND');

          if (state is WalletLoadDoneState) {
            return Scaffold(
              backgroundColor: AppColor.white,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: const Text(
                      TextDoc.txtWallet,
                      style: TextStyle(
                        fontSize: headlineSmallSize,
                        fontWeight: headlineSmallWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
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
                            color: AppColor.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: padding16,
                          vertical: padding24,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.symmetric(
                                  vertical: padding8,
                                  horizontal: padding16,
                                ),
                                decoration: const BoxDecoration(
                                  color: AppColor.mainColor2Surface,
                                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: Column(
                                  children: [
                                    const Text(
                                      TextDoc.txtBalance,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                    Text(
                                      currencyFormat.format(state.balanceMoney),
                                      style: const TextStyle(
                                        height: 0.75,
                                        fontSize: headlineLargeSize,
                                        fontWeight: headlineLargeWeight,
                                        color: AppColor.support,
                                      ),
                                    ),
                                    const Text(
                                      TextDoc.txtOr,
                                      style: TextStyle(
                                        fontSize: labelLargeSize,
                                        fontWeight: labelLargeWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                    Text(
                                      '${state.balanceSessions} sessions',
                                      style: const TextStyle(
                                        height: 0.75,
                                        fontSize: headlineLargeSize,
                                        fontWeight: headlineLargeWeight,
                                        color: AppColor.support,
                                      ),
                                    ),
                                    const SizedBox(height: spaceBetweenLine12),
                                    const Text(
                                      TextDoc.txtEachSessionDuration,
                                      style: TextStyle(
                                        height: 0.5,
                                        fontStyle: FontStyle.italic,
                                        fontSize: bodySmallSize,
                                        fontWeight: bodySmallWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                    Text(
                                      '${TextDoc.txtEachSessionPrice}${currencyFormat.format(state.costPerSession)}',
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: bodySmallSize,
                                        fontWeight: bodySmallWeight,
                                        color: AppColor.defaultFont,
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
