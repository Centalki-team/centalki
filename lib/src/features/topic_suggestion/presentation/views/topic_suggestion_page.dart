import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topic_suggestion_bloc.dart';
import 'topic_suggestion_view.dart';

class TopicSuggestionPage extends StatelessWidget {
  const TopicSuggestionPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => TopicSuggestionBloc(),
        child: const TopicSuggestionView(),
      );
}
