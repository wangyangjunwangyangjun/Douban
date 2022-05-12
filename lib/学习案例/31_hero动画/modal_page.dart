import 'package:flutter/material.dart';

class HYModalPage extends StatelessWidget {
  final String _imageURL;

  HYModalPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          child: Hero(
            tag: _imageURL,
            child: Image.network(
              _imageURL,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
