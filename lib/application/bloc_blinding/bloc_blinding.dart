import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysivi/application/homepage/home_bloc.dart';

class BlocBindings {
  static List<BlocProvider> initializer = [
    BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
  ];
}
