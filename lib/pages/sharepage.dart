import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:memapp/pages/discoverpage.dart';

bool update = false;
late DocumentSnapshot documentSnapshot;

class SharePage extends StatefulWidget {
  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  String? _text;
  File? _image;

  void navigateToNewPostPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPostPage()),
    );
    if (result != null) {
      setState(() {
        _text = result['text'];
        _image = result['image'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('         '),
      ),
      body: Center(
        child: Stack(
          children: [
            if (_text != null || _image != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_image != null)
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (_text != null)
                    Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          _text!,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              )
            else
              const Text(
                'Lütfen içerik ekleyiniz',
                style: TextStyle(fontSize: 24),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToNewPostPage(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewPostPage extends StatefulWidget {
  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final TextEditingController _textEditingController = TextEditingController();
  File? _selectedImage;
  String imageurl="";
  String docID = "";
  Future getdocid() async{
    await FirebaseFirestore.instance.collection("Imagedata").get().then((snapshot)=>(snapshot.docs.forEach((element) {docID = element.reference.id;})));
  }
  Future<void> selectImage(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Fotoğraf Seç"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text("Galeriden Seç"),
                  onTap: () async {
                    Navigator.pop(context);
                    final picker = ImagePicker();
                    final pickedImage = await picker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedImage != null) {
                      setState(() async {
                        //Unique file name
                        _selectedImage = File(pickedImage.path);
                        String uniquefilename=DateTime.now().millisecondsSinceEpoch.toString();
                        //Reference of storage root
                        Reference referenceroot = FirebaseStorage.instance.ref();
                        Reference referencedirimages = referenceroot.child("images");
                        //Reference for image to be stored
                        Reference referenceofuploadedimage = referencedirimages.child(uniquefilename);

                        try{
                          //Store
                          await referenceofuploadedimage.putFile(File(pickedImage.path));
                          //Get download URL
                          imageurl = await referenceofuploadedimage.getDownloadURL();
                        }catch(error){}
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text("Kameradan Çek"),
                  onTap: () async {
                    Navigator.pop(context);
                    final picker = ImagePicker();
                    final pickedImage = await picker.pickImage(
                      source: ImageSource.camera,
                    );
                    if (pickedImage != null) {
                      setState(() async{
                        _selectedImage = File(pickedImage.path);
                        String uniquefilename=DateTime.now().millisecondsSinceEpoch.toString();
                        //Reference of storage root
                        Reference referenceroot = FirebaseStorage.instance.ref();
                        Reference referencedirimages = referenceroot.child("images");
                        //Reference for image to be stored
                        Reference referenceofuploadedimage = referencedirimages.child(uniquefilename);

                        try{
                          //Store
                          await referenceofuploadedimage.putFile(File(pickedImage.path));
                          //Get download URL
                          imageurl = await referenceofuploadedimage.getDownloadURL();
                        }catch(error){}
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('           '),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () => selectImage(context),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  const Icon(Icons.photo, size: 100, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Şehir',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Satır sayısını sınırlama
                textInputAction: TextInputAction.done,
                keyboardType:
                TextInputType.name, // Sesli harfler için klavyeye ekledim
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  String city = _textEditingController.text.trim();
                  if (_selectedImage != null && city.isNotEmpty) {
                    if(imageurl.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please upload an image")));
                    }
                    else
                    {
                      Map<String,String> data ={
                        "city": city,
                        "image": imageurl
                      };
                      FirebaseFirestore.instance.collection("Imagedata").add(data);
                      update = true;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const DiscoverPage()));
                    }
                  }
                },
                child: const Text('Paylaş'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
