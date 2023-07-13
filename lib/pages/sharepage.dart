import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
                'Ekranın İçeriği',
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
                      setState(() {
                        _selectedImage = File(pickedImage.path);
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
                      setState(() {
                        _selectedImage = File(pickedImage.path);
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

  void post() {
    String text = _textEditingController.text;
    if (_selectedImage != null && text.isNotEmpty) {
      Navigator.pop(context, {'text': text, 'image': _selectedImage!.path});
    } else {
      // Gerekli kontrolleri yaparak kullanıcıya bir uyarı verebilirsiniz.
    }
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
                  child: _selectedImage != null
                      ? Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  )
                      : const Icon(Icons.photo, size: 100, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Yazı',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, // Satır sayısını sınırlama
                textInputAction: TextInputAction.done,
                keyboardType:
                TextInputType.name, // Sesli harfler için klavyeye ekledim
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: post,
                child: const Text('Paylaş'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
