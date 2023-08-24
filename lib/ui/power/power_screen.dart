import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/degree/degree_cubit.dart';
import 'package:homeworks/cubit/degree/degree_state.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DegreeScreen extends StatefulWidget {
  const DegreeScreen({super.key});

  @override
  State<DegreeScreen> createState() => _DegreeScreenState();
}

class _DegreeScreenState extends State<DegreeScreen> {
  TextEditingController aController = TextEditingController();
  TextEditingController bController = TextEditingController();
  var maskFormatterA = MaskTextInputFormatter(
    mask: '###',
    filter: {"#": RegExp(r'[0-9]')},
  );
  var maskFormatterB = MaskTextInputFormatter(
    mask: '##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: aController,
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatterA],
              onChanged: (aValue) {
                context.read<DegreeCubit>().updateA(int.parse(aValue));
              },
              decoration: const InputDecoration(hintText: 'Enter A'),
            ),
            TextField(
              controller: bController,
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatterB],
              onChanged: (bValue) {
                context.read<DegreeCubit>().updateB(int.parse(bValue));
              },
              decoration: const InputDecoration(hintText: 'Enter B'),
            ),
            const SizedBox(height: 10),
            BlocBuilder<DegreeCubit, DegreeState>(
              builder: (context, state) {
                return Text(state.result.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),);
              },
              buildWhen:
                  (DegreeState previousState, DegreeState currentState) {
                debugPrint("PREVIOUS:$previousState");
                debugPrint("CURRENT:$currentState");
                return currentState != previousState;
              },
            ),
          ],
        ),
      ),
    );
  }
}
