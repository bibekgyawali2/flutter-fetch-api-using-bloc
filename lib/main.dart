import 'package:covid_api/bloc/connectivity_bloc/connectivity_bloc.dart';
import 'package:covid_api/cubit/theme_cubit.dart';
import 'package:covid_api/page/home.dart';
import 'package:covid_api/page/bottomnavbar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/covid_bloc/covid_bloc.dart';
import 'cubit/theme_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CovidBloc()..add(GetCovidList()),
      child: BlocProvider<SwitchCubit>(
        create: (context) => SwitchCubit(),
        child: BlocBuilder<SwitchCubit, SwitchState>(
          builder: (context, state) {
            return MaterialApp(
              home: const SecondPage(),
              theme: state.theme,
            );
          },
        ),
      ),
    );
  }
}
