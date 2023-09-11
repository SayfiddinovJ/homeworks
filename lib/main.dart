import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:homeworks/bloc/graph_bloc.dart';
import 'package:homeworks/bloc/graph_event.dart';
import 'package:homeworks/data/graphql/api_client.dart';
import 'package:homeworks/ui/home_screen.dart';

void main() => runApp(MyApp(jobsApiClient: ShipsApiClient.create()));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.jobsApiClient});

  final ShipsApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ShipsBloc(
            jobsApiClient: jobsApiClient,
          )..add(ShipsFetchStarted()),
        ),
      ],
      child: GraphQLProvider(
        client: ValueNotifier(ShipsApiClient.create().graphQLClient),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}