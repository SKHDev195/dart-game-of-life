import 'package:flutter/material.dart';
import 'package:game_of_life/pages/setup_page/widgets/fields.dart';
import 'package:game_of_life/pages/setup_page/widgets/separator.dart';
import 'package:game_of_life/pages/setup_page/widgets/start_button.dart';
import 'package:game_of_life/providers/setup/setup_provider.dart';
import 'package:game_of_life/utils/error_dialog.dart';
import 'package:provider/provider.dart';

import '../../models/custom_error.dart';
import '../../timer/timer_types.dart';
import 'widgets/logo.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});
  static const routeName = '/setup';

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? _rowsAsString;
  String? _columnsAsString;
  Color? aliveCellsColor;
  Color? deadCellsColor;
  TimerTypes? timerType;
  late int rows;
  late int columns;

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    int? rows = int.tryParse(_rowsAsString!);
    int? columns = int.tryParse(_columnsAsString!);

    final form = _formKey.currentState;

    if (form == null || !form.validate()) {
      return;
    }

    form.save();

    try {
      context.read<SetupProvider>().setupGridRenderer(
            timerType: timerType!,
            rows: rows!,
            columns: columns!,
            aliveCellsColor: aliveCellsColor!,
            deadCellsColor: deadCellsColor!,
          );
    } on CustomError catch (e) {
      ErrorDialogRenderer.errorDialog(
        context,
        e,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final setupState = context.watch<SetupState>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Logo(),
                  const Separator(),
                  GridField(
                    label: 'Rows',
                    onSaved: (newValue) {
                      rows = int.tryParse(newValue!)!;
                    },
                  ),
                  const Separator(),
                  GridField(
                    label: 'Сolumns',
                    onSaved: (newValue) {
                      columns = int.tryParse(newValue!)!;
                    },
                  ),
                  const Separator(),
                  TimerField(
                    onChanged: (newValue) {
                      timerType = newValue;
                    },
                  ),
                  const Separator(),
                  ColorPickerField(
                    title: 'Color for alive cells',
                    onColorChanged: (newValue) {
                      aliveCellsColor = newValue;
                    },
                  ),
                  const Separator(),
                  ColorPickerField(
                    title: 'Color for dead cells',
                    onColorChanged: (newValue) {
                      deadCellsColor = newValue;
                    },
                  ),
                  const Separator(),
                  StartButton(
                    setupState: setupState,
                    submit: _submit,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
