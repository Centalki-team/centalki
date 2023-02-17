import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/history_bloc/history_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryLoadFailureState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error_outline,
                        color: error,
                      ),
                      title: Text(TextDoc.txtLoadFailed),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(TextDoc.txtOk)),
                      ],
                    ));
          }
        },
        builder: (context, state) => (state is HistoryLoadingState)
            ? Scaffold(
                appBar: AppBar(),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar.medium(
                      title: Text(TextDoc.txtHistory),
                      centerTitle: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: 1,
                        (_, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: screenAutoPadding16, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: mainColor2Surface,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: screenAutoPadding16,
                                          vertical: screenAutoPadding16),
                                      child: Column(
                                        children: [
                                          Text(
                                            TextDoc.txtTotalCompletedSessions,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: defaultFont),
                                          ),
                                          const SizedBox(
                                            height: smallSpacing10,
                                          ),
                                          const Text(
                                            '10',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: support,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: smallSpacing10,
                                          ),
                                          Text(
                                            '${TextDoc.txtTotalTime} 4 ${TextDoc.txtHours} 55 ${TextDoc.txtMinutes}',
                                            style:
                                                const TextStyle(color: defaultFont),
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
                              Text(
                                TextDoc.txtSessions,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: tertiary,
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (_, index) => Card(
                                  elevation: 0,
                                  clipBehavior: Clip.antiAlias,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Image.network(
                                          'https://images.unsplash.com/photo-1616706161242-f1d591350d1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=967&q=80',
                                          width: 100,
                                          fit: BoxFit.fill,
                                          loadingBuilder:
                                              (_, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return CircularProgressIndicator(
                                              value: loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                          .cumulativeBytesLoaded /
                                                      loadingProgress
                                                          .expectedTotalBytes!
                                                  : null,
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0, vertical: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Your Hobbies',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text('Jessica'),
                                              Text(
                                                DateFormat('yyyy-MM-dd hh:mm a')
                                                    .format(DateTime.now()),
                                                style: const TextStyle(
                                                    color: secondary),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      );
}
