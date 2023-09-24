import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {
  const StopButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(
        255,
        152,
        79,
        74,
      ),
      splashColor: Colors.redAccent,
      heroTag: null,
      onPressed: onPressed,
      tooltip: 'Stop Game',
      elevation: 10,
      child: const Icon(
        Icons.stop_outlined,
      ),
    );
  }
}

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 143, 138, 84),
      splashColor: Colors.yellowAccent,
      heroTag: null,
      onPressed: onPressed,
      tooltip: 'Pause Game',
      elevation: 10,
      child: const Icon(
        Icons.pause_outlined,
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(
        255,
        88,
        169,
        78,
      ),
      splashColor: Colors.greenAccent,
      heroTag: null,
      onPressed: onPressed,
      tooltip: 'Start Game',
      elevation: 10,
      child: const Icon(
        Icons.start_outlined,
      ),
    );
  }
}
