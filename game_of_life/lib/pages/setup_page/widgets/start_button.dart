import 'package:flutter/material.dart';
import 'package:game_of_life/providers/setup/setup_provider.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
    required this.setupState,
    required this.submit,
  });

  final SetupState setupState;
  final void Function()? submit;

  @override
  Widget build(
    BuildContext context,
  ) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 57, 198, 62),
        ),
      ),
      onPressed:
          setupState.setupStatus == SetupStatus.submitting ? null : submit,
      child: Text(
        setupState.setupStatus == SetupStatus.submitting ? 'Loading' : 'Go!',
      ),
    );
  }
}
