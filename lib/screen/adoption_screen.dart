import 'package:flutter/material.dart';

import '../component/adoption_list.dart';
import '../component/search_bar.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          // TopMenuBar(),
          SizedBox(
            height: 10.0,
          ),
          SearchBar(),
          SizedBox(
            height: 10.0,
          ),
          AdoptionList(),
        ],

      );
  }
}
