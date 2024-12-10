import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        return  Padding( 
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black.withOpacity(0.3), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [BoxShadow(
                  color:Colors.black.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 5,
              )],
            ),
            clipBehavior: Clip.hardEdge,
            child: 
              const Row(
                children: [
                  Image(image: AssetImage('images/IMG_8357.png'),
                  ),
           ]),
          ),
        );
      }
    );   
  }
}