import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  final String id;
  final String profileImg;
  final String imageAddress;
  final String title;
  final String content;
  final int numberOfComment;
  final int numberOflikes;

  const PostComponent({
    required this.id,
    required this.profileImg,
    required this.imageAddress,
    required this.title,
    required this.content,
    required this.numberOfComment,
    required this.numberOflikes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(
          color: Colors.grey,
        )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Container(
                  width: 38.0,
                  height: 38.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      profileImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text(
                id,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Image.network(
            imageAddress,
            //height: 380.0,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(content),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.mode_comment,
                color: Colors.black87,
              ),
              Text(numberOfComment.toString()),
              const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text(numberOflikes.toString())
            ],
          ),
        ],
      ),
    );
  }
}
