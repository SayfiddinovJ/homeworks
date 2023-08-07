
import 'package:flutter/material.dart';
class NinthScreen extends StatefulWidget {
  const NinthScreen({super.key});

  @override
  State<NinthScreen> createState() => _NinthScreenState();
}

class _NinthScreenState extends State<NinthScreen> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

  _init(){
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.easeOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
      });
    animationController.forward();
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:  Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: LinearProgressIndicator(
             value: animationController.value,
             backgroundColor: Colors.lightBlueAccent,
             color: Colors.blue,
             minHeight: 20,
           ),
         ),
          const SizedBox(height: 10,),
          Text('${animationController.value*100}%'),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                _init();
              });
            },
            child: const Text('Animate'),
          ),
        ],
      ),
    );
  }
}
