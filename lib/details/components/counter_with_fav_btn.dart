import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cart_counter.dart';

class CounterWithFavBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CartCounter(),
        // Container(
        //   padding: EdgeInsets.all(8),
        //   height: 32,
        //   width: 32,
        //   decoration: BoxDecoration(
        //     color: Colors.transparent,
        //     shape: BoxShape.circle,
        //   ),
        //   child: Icon(
        //     Icons.favorite,
        //     color: Colors.grey,
        //   ),
        // )
      ],
    );
  }
}
