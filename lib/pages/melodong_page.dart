import 'package:flutter/material.dart';

class MeloDonGPage extends StatelessWidget {
  const MeloDonGPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(left: 100, right: 100),
        children: [
          Text("MeloDonG", style: Theme.of(context).textTheme.headline1,),
        ],
      ),
    );
  }
}