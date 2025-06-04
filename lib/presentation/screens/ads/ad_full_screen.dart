import 'package:flutter/material.dart';


class AdFullScreen extends StatelessWidget {
  const AdFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncio pantalla completa'),
      ),
      body: Center(
        child: Text('Ya puedes regresar o ver esta pantalla'),
      ),
    );
  }
}