




import 'dart:io';
import 'dart:async';
import 'package:anipet/screen/add_post/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/photofilters.dart';
import 'package:path/path.dart';
import 'package:image/image.dart' as imageLib;


class FilterScreen extends StatefulWidget{

  const FilterScreen({Key? key}) : super(key: key);

  @override
  _MyAppState createState() =>  _MyAppState();
}

class _MyAppState extends State<FilterScreen> {

  static AddPostController addPostController = Get.put(AddPostController());
  List<Filter> filters = presetFiltersList;
  static File imageFile = File(addPostController.image.value!.path);
  String fileName=basename(imageFile.path);

  Future getImage(BuildContext context) async
  {
    imageFile = File(addPostController.image.value!.path);
    var img = imageLib.decodeImage(imageFile.readAsBytesSync());
    var image = imageLib.copyResize(img!, width: 600);

    print('imageFile : ' + imageFile.toString());

    Map imagefile = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  PhotoFilterSelector(
              title: Text("Photo filter Example"),
              image: image,
              filters: presetFiltersList,
              filename: fileName,
              loader: Center(child:CircularProgressIndicator()),
              fit: BoxFit.contain,
            )
        )
    );
    if (imagefile != null && imagefile.containsKey('image_filtered'))
    {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
      print(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AddPostController addPostController = Get.put(AddPostController());

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'ANIMOGRAM',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          // Add your notification icon button here
          IconButton(
            icon: Icon(Icons
                .notifications_none), // You can choose any notification icon
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: screenWidth, // Set the width to the screen width
                    height: 600,
                    child:  Image.file(imageFile),
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () => getImage(context),
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons
                        .photo_camera), // You can choose any notification icon
                    color: Colors.black,
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons
                        .upload), // You can choose any notification icon
                    color: Colors.black,
                    onPressed: () {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons
                        .home), // You can choose any notification icon
                    color: Colors.black,
                    onPressed: () {

                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



/*
void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String fileName;
  List<Filter> filters = presetFiltersList;
  late File imageFile;

  Future getImage(context) async {
    imageFile = (await ImagePicker.pickImage(source: ImageSource.gallery)) as File;
    fileName = basename(imageFile.path);
    var image = imageLib.decodeImage(imageFile.readAsBytesSync());
    image = imageLib.copyResize(image!, width: 600);
     Map imagefile = await Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => new PhotoFilterSelector(
              title: Text("Photo Filter Example"),
              image: image,
              filters: presetFiltersList,
              filename: fileName,
              loader: Center(child: CircularProgressIndicator()),
              fit: BoxFit.contain,
            ),
      ),
    );
    if (imagefile != null && imagefile.containsKey('image_filtered')) {
      setState(() {
        imageFile = imagefile['image_filtered'];
      });
      print(imageFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Photo Filter Example'),
      ),
      body: Center(
        child: new Container(
          child: imageFile == null
              ? Center(
                  child: new Text('No image selected.'),
                )
              : Image.file(imageFile),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }

}
*/