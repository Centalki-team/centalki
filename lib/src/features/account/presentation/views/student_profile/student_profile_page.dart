import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/student_profile_bloc/student_profile_bloc.dart';
import 'student_profile_view.dart';

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => StudentProfileBloc()..add(const StudentProfileInitEvent()),
        child: const StudentProfileView(),
      );
}
