import 'package:anipet/screen/register_adoption_animal/register_adoption_animal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/adoption_list.dart';
import '../component/search_bar.dart';

class AdoptionScreen extends StatelessWidget {
  const AdoptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TopMenuBar(),
        SizedBox(
          height: 10.0,
        ),
        SearchBar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 7.0),
            IconButton(
              onPressed: () {
                Get.offAll(() => RegisterAdoptionAnimal());
              },
              icon: Icon(Icons.add_circle_outline_sharp),
              iconSize: 20.0,
            ),
            Text(
              'Register adoption animal',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        AdoptionList(),
      ],
    );
  }
}
