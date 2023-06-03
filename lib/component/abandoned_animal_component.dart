import 'package:anipet/screen/adoption_webview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbandonedAnimalComponent extends StatelessWidget {
  final String imageUrl;
  final String animalName;
  final String breed;
  final String residence;
  final String webviewUrl;

  const AbandonedAnimalComponent({
    required this.imageUrl,
    required this.animalName,
    required this.breed,
    required this.residence,
    required this.webviewUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AdoptionWebview(), arguments: webviewUrl);
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: 100.0,
        decoration: BoxDecoration(
          color: const Color(0xffF9F9ff),
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          child: Row(
            children: [
              Image.network(
                imageUrl,
                height: 80.0,
                width: 80.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        animalName,
                        style: const TextStyle(
                          fontSize: 17.0,
                        ),
                      ), //hospital name
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 8.0,
                        height: 2.0,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(breed), //hospital address
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(residence),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
