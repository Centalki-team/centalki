import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/self_review_bloc/self_review_bloc.dart';
import 'self_review_content.dart';

class SelfReviewPage extends StatelessWidget {
  const SelfReviewPage({
    super.key,
    required this.onSignUp,
  });

  final Function() onSignUp;

  @override
  Widget build(BuildContext context) => BlocProvider<SelfReviewBloc>(
        create: (context) => SelfReviewBloc(),
        child: SelfReviewContent(
          onSignUp: onSignUp,
        ),
      );
}
