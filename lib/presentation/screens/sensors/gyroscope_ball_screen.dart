import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../lib_barrel.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeBallProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Giróscopo')),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (value) => MovingBall(x: value.x, y: value.y),
          error: (error, stackTrace) => Text('$error'),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovingBall extends StatelessWidget {
  final double x;
  final double y;
  const MovingBall({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;
    double currentXPosition = (x * 100);
    double currentYPosition = (y * 100);

    return Stack(
      alignment: Alignment.center,
      children: [
        Text('''
          X:$x,
          Y:$y, ''', style: const TextStyle(fontSize: 30)),
        SizedBox(height: 80),
        AnimatedPositioned(
          left: (currentYPosition - 25) + (screenWidth / 2),
          top: (currentXPosition - 25) + (screenHeight / 2),
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 1000),
          child: const Ball(),
        ),
      ],
    );
  }
}

class Ball extends StatelessWidget {
  const Ball({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
