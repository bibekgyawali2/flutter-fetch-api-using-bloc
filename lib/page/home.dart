import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/covid_bloc/covid_bloc.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';
import '../models/covid_models.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  CovidPageState createState() => CovidPageState();
}

class CovidPageState extends State<CovidPage> {
  // final CovidBloc _newsBloc = CovidBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COVID-19 List'),
        actions: [
          BlocBuilder<SwitchCubit, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.isDarkThemeOn,
                onChanged: (newValue) {
                  context.read<SwitchCubit>().toggleSwitch(newValue);
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CovidLoaded) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return ListView.builder(
      itemCount: model.countries?.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text("Country: ${model.countries![index].country}"),
                  Text(
                      "Total Confirmed: ${model.countries![index].totalConfirmed}"),
                  Text("Total Deaths: ${model.countries![index].totalDeaths}"),
                  Text(
                      "Total Recovered: ${model.countries![index].totalRecovered}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
