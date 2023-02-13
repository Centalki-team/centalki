import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../blocs/student_profile_bloc/student_profile_bloc.dart';

class StudentProfileView extends StatefulWidget {
  const StudentProfileView({Key? key}) : super(key: key);

  @override
  State<StudentProfileView> createState() => _StudentProfileViewState();
}

class _StudentProfileViewState extends State<StudentProfileView> {
  final fullNameController = TextEditingController();
  final englishNameController = TextEditingController();
  final bioController = TextEditingController();
  var avatarUrl = '';
  var selectedTopics = <bool>[];

  @override
  Widget build(BuildContext context) =>
      BlocListener<StudentProfileBloc, StudentProfileState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is StudentProfileSavingState ||
              state is StudentProfileLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is StudentProfileLoadDoneState) {
              fullNameController.text = state.fullName;
              englishNameController.text = state.englishName;
              bioController.text = state.bio;
              avatarUrl = state.avatarUrl;
              selectedTopics = state.selectedInterestedTopics.toList();
            } else if (state is StudentProfileLoadFailureState) {
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
            } else if (state is StudentProfileSaveFailureState) {
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
            } else if (state is StudentProfileSaveDoneState) {
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
        child: BlocBuilder<StudentProfileBloc, StudentProfileState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraint) {
                final widthView = constraint.maxWidth;

                return Scaffold(
                  body: CustomScrollView(
                    slivers: [
                      SliverAppBar.medium(
                        title: const Text('Student Profile'),
                        centerTitle: true,
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                          (_, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: screenAutoPadding16,
                                vertical: 24.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Center(
                                    child: CircleAvatar(
                                      radius: 80,
                                      child: Text('AN'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: spaceBetweenLine20,
                                  ),
                                  const Text(
                                    'Full Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: fullNameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      context.read<StudentProfileBloc>().add(
                                          StudentProfileChangeEvent(
                                              avatarUrl,
                                              fullNameController.text,
                                              englishNameController.text,
                                              bioController.text,
                                              selectedTopics));
                                    },
                                  ),
                                  const SizedBox(
                                    height: spaceBetweenLine12,
                                  ),
                                  const Text(
                                    'English Name',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: englishNameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      context.read<StudentProfileBloc>().add(
                                          StudentProfileChangeEvent(
                                              avatarUrl,
                                              fullNameController.text,
                                              englishNameController.text,
                                              bioController.text,
                                              selectedTopics));
                                    },
                                  ),
                                  const SizedBox(
                                    height: spaceBetweenLine12,
                                  ),
                                  const Text(
                                    'Bio',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: bioController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      context.read<StudentProfileBloc>().add(
                                          StudentProfileChangeEvent(
                                              avatarUrl,
                                              fullNameController.text,
                                              englishNameController.text,
                                              bioController.text,
                                              selectedTopics));
                                    },
                                  ),
                                  const SizedBox(
                                    height: spaceBetweenLine12,
                                  ),
                                  const Text(
                                    'Interested Topics',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  BlocBuilder<StudentProfileBloc,
                                      StudentProfileState>(
                                    builder: (context, state) =>
                                        GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: widthView < 400
                                            ? 1.25
                                            : widthView < 500
                                                ? 2
                                                : widthView < 1000
                                                    ? 5
                                                    : 10,
                                      ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: selectedTopics.length,
                                      itemBuilder: (_, index) =>
                                          CheckboxListTile(
                                        value: selectedTopics[index],
                                        onChanged: (value) {
                                          selectedTopics[index] =
                                              value ?? false;
                                          context
                                              .read<StudentProfileBloc>()
                                              .add(StudentProfileChangeEvent(
                                                  avatarUrl,
                                                  fullNameController.text,
                                                  englishNameController.text,
                                                  bioController.text,
                                                  selectedTopics));
                                        },
                                        title:
                                            Text('$index. Clothes and Fashion'),
                                      ),
                                    ),
                                  ),
                                  BlocBuilder<StudentProfileBloc,
                                      StudentProfileState>(
                                    builder: (context, state) => (state
                                            is StudentProfileChangeState)
                                        ? ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<StudentProfileBloc>()
                                                  .add(
                                                      StudentProfileSaveChangesEvent(
                                                          avatarUrl,
                                                          fullNameController
                                                              .text,
                                                          englishNameController
                                                              .text,
                                                          bioController.text,
                                                          selectedTopics));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: secondary,
                                              foregroundColor: defaultFont,
                                              minimumSize:
                                                  const Size.fromHeight(48),
                                            ),
                                            child: const Text('Save Changes'),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
}
