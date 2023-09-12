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
      onPressed: onPressed,
      tooltip: 'Stop Game',
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
      onPressed: onPressed,
      tooltip: 'Pause Game',
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
      onPressed: onPressed,
      tooltip: 'Start Game',
      child: const Icon(
        Icons.start_outlined,
      ),
    );
  }
}
