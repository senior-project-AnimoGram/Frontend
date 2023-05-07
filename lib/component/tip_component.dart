import 'package:flutter/material.dart';

class TipComponent extends StatelessWidget {
  final String tipTitle;
  final String tipContent;
  final String imageUrl;
  const TipComponent({
    required this.tipTitle,
    required this.tipContent,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
        color: Color(0xffF9F9ff),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tipTitle,
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ), //hospital name
                SizedBox(
                  height: 5.0,
                ),
                Text(tipContent),
                SizedBox(
                  height: 5.0,
                ) //hospital address
              ],
            ),
            SizedBox(width: 13.0,),
            Image.network(
              imageUrl,
              height: 80.0,
              width: 80.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
