import 'package:flutter/material.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  final String message;

  const NotFoundScreen({this.message = 'Page not found', super.key});

  const NotFoundScreen.unimplemented({String? name, Key? key}) : this(message: 'Not Implemented $name', key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Text(message),
        ),
      ),
    );
  }
}
