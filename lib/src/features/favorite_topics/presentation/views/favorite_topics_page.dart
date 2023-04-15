import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/favorite_topics_bloc.dart';
import 'favorite_topics_view.dart';

class FavoriteTopicsPage extends StatelessWidget {
  const FavoriteTopicsPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<FavoriteTopicsBloc>(
        create: (context) => FavoriteTopicsBloc(),
        child: const FavoriteTopicsView(),
      );
}
