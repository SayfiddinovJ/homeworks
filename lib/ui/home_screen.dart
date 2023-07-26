import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homeworks/providers/calculator_provider.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint('BuildContext !!!');
    TextEditingController textEditingControllerFirst = TextEditingController();
    TextEditingController textEditingControllerSecond = TextEditingController();
    var provider = Provider.of<CalculatorProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          TextButton(
            onPressed: (){
              textEditingControllerFirst.clear();
              textEditingControllerSecond.clear();
              provider.clear();
            },
            child: const Text('Clear',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),
          Center(
            child: Consumer<CalculatorProvider>(
              builder: (context,calculatorProvider,child){
                return Text(
                  calculatorProvider.getNumber.toString(),
                  style: const TextStyle(fontSize: 45),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: textEditingControllerFirst,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: textEditingControllerSecond,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(6),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    provider.addition(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('+',style: TextStyle(fontSize: 30),),
              ),
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    provider.subtract(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('-',style: TextStyle(fontSize: 30),),
              ),
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    provider.multiply(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('*',style: TextStyle(fontSize: 30),),
              ),
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    provider.divide(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('/',style: TextStyle(fontSize: 30),),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    provider.arithmetic(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('Arithmetic'),
              ),
              ElevatedButton(
                onPressed: (){
                  if(textEditingControllerFirst.text.isEmpty || textEditingControllerSecond.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                  }else if(textEditingControllerFirst.text.isNotEmpty || textEditingControllerSecond.text.isNotEmpty){
                    // provider.divide(int.parse(textEditingControllerFirst.text), int.parse(textEditingControllerSecond.text));
                  }
                },
                child: const Text('Geometric'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}