import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/search_topics_bloc/search_topics_bloc.dart';
import 'search_topics_view.dart';

class SearchTopicsPage extends StatelessWidget {
  const SearchTopicsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SearchTopicsBloc>(
        create: (context) => SearchTopicsBloc(),
        child: const SearchTopicsView(),
      );
}
