import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/bloc/graph_bloc.dart';
import 'package:homeworks/bloc/graph_state.dart';
import 'package:homeworks/ui/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ships')),
      body: Center(
        child: BlocBuilder<ShipsBloc, ShipsState>(
          builder: (context, state) {
            if (state is ShipsLoadingState) {
              return const CircularProgressIndicator();
            }
            if (state is ShipsLoadingSuccess) {
              return ListView.builder(
                itemCount: state.ships.length,
                itemBuilder: (context, index) {
                  final ship = state.ships[index];
                  return ListTile(
                    title: Text(ship.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(ship: ship),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Text('Oops something went wrong!');
          },
        ),
      ),
    );
  }
}
