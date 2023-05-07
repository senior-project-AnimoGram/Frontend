import 'package:flutter/material.dart';

class AbandonedAnimalComponent extends StatelessWidget {
  final String imageAddress;
  final String dogName;
  final String breed;
  final String residence;

  const AbandonedAnimalComponent({
    required this.imageAddress,
    required this.dogName,
    required this.breed,
    required this.residence,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          imageAddress,
          height: 80.0,
          width: 80.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 130,
          height: 80.0,
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
              vertical: 15.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      dogName,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ), //hospital name
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      width: 8.0,
                      height: 2.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(breed), //hospital address
                  ],
                ),
                Text(residence),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
