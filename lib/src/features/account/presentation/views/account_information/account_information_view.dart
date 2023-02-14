import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/account_information_bloc/account_information_bloc.dart';
import '../../widgets/gender_radio_button_group.dart';

class AccountInformationView extends StatefulWidget {
  const AccountInformationView({Key? key}) : super(key: key);

  @override
  State<AccountInformationView> createState() => _AccountInformationViewState();
}

class _AccountInformationViewState extends State<AccountInformationView> {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final nameConnections = ['Facebook', 'Google', 'Apple'];
  String gender = '';
  var connections = [false, true, false];

  @override
  Widget build(BuildContext context) =>
      BlocListener<AccountInformationBloc, AccountInformationState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AccountInformationLoadingState ||
              state is AccountInformationSavingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is AccountInformationLoadDoneState) {
              emailController.text = state.email;
              phoneController.text = state.phoneNumber;
              dateOfBirthController.text =
                  DateFormat('yyyy-MM-dd').format(state.dateOfBirth);
              gender = state.gender;
            } else if (state is AccountInformationLoadFailureState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Load Failure'),
                        content: Text(state.message),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          )
                        ],
                      ));
            } else if (state is AccountInformationSaveFailureState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Save Failure'),
                        content: Text(state.message),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          )
                        ],
                      ));
            } else if (state is AccountInformationSaveDoneState) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Successfully Saved'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          )
                        ],
                      ));
            }
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text('Account Information'),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: screenAutoPadding16, vertical: 24.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextDoc.txtEmail,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: emailController,
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: spaceBetweenLine12,
                          ),
                          const Text(
                            'Phone Number',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: phoneController,
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: spaceBetweenLine12,
                          ),
                          const Text(
                            'Date of Birth',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            controller: dateOfBirthController,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () async {
                                  final datePicked = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.parse(
                                          dateOfBirthController.text),
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now());
                                  if (datePicked != null) {
                                    if (mounted) {
                                      context.read<AccountInformationBloc>().add(
                                          const AccountInformationChangeEvent());
                                      dateOfBirthController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(datePicked);
                                    }
                                  }
                                },
                                icon: const Icon(Icons.calendar_today),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: spaceBetweenLine12,
                          ),
                          const Text(
                            'Gender',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<AccountInformationBloc,
                              AccountInformationState>(
                            builder: (context, state) {
                              if (state is AccountInformationLoadingState) {
                                return Container();
                              }
                              return GenderRadioButtonGroup(
                                gender: gender.isNotEmpty ? gender : 'male',
                                genderCallback: (selectedValue) {
                                  gender = selectedValue;
                                  context.read<AccountInformationBloc>().add(
                                      const AccountInformationChangeEvent());
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            height: spaceBetweenLine12,
                          ),
                          const Text(
                            'Connections',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: nameConnections.length,
                            itemBuilder: (_, index) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(nameConnections[index]),
                                TextButton(
                                  onPressed: () {
                                    context.read<AccountInformationBloc>().add(
                                        const AccountInformationConnectEvent());
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: connections[index]
                                        ? mainColor1
                                        : support,
                                  ),
                                  child: Text(connections[index]
                                      ? 'Connected'
                                      : 'Connect'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: spaceBetweenLine12,
                          ),
                          const Text(
                            'Payment Method',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: spaceBetweenLine20,
                          ),
                          BlocBuilder<AccountInformationBloc,
                                  AccountInformationState>(
                              builder: (context, state) => (state
                                      is AccountInformationChangingState)
                                  ? ElevatedButton(
                                      onPressed: () {
                                        context.read<AccountInformationBloc>().add(
                                            AccountInformationSaveEvent(
                                                dateOfBirthController.text,
                                                gender));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: secondary,
                                        foregroundColor: defaultFont,
                                        minimumSize: const Size.fromHeight(48),
                                      ),
                                      child: const Text('Save Changes'))
                                  : Container()),
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
