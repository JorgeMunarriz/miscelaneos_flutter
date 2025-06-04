import 'package:flutter/material.dart';


class AdRewardedScreen extends StatelessWidget {
  const AdRewardedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recompensas de anuncios'),
      ),
      body: Center(
        child: Text('Puntos actuales'),
      ),
    );
  }
}