import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:game_of_life/timer/timer_types.dart';

import '../utils/color_map.dart';

class GridFormField extends StatelessWidget {
  const GridFormField({
    Key? key,
    required this.label,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);

  final String label;
  final void Function(String?) onSaved;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        filled: true,
        labelText: label,
        prefixIcon: const Icon(Icons.grid_3x3),
      ),
      onSaved: onSaved,
      validator: validator,
    );
  }
}

class TimerField extends StatefulWidget {
  const TimerField({
    super.key,
    required this.onChanged,
  });

  final void Function(TimerTypes?)? onChanged;

  @override
  State<TimerField> createState() => _TimerFieldState();
}

class _TimerFieldState extends State<TimerField> {
  TimerTypes? timerType = TimerTypes.perHalfSecond;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<TimerTypes>(
      items: TimerTypes.values.map((TimerTypes timerType) {
        return DropdownMenuItem(
          value: timerType,
          child: Text(
            timerType.name,
          ),
        );
      }).toList(),
      onChanged: (TimerTypes? newValue) {
        setState(() {
          timerType = newValue;
        });
        widget.onChanged!(newValue);
      },
    );
  }
}

class ColorPickerField extends StatefulWidget {
  const ColorPickerField({
    super.key,
    required this.title,
    required this.onColorChanged,
  });

  final String title;
  final void Function(Color) onColorChanged;

  @override
  State<ColorPickerField> createState() => _ColorPickerFieldState();
}

class _ColorPickerFieldState extends State<ColorPickerField> {
  Color screenPickerColor = Colors.red;
  Color dialogPickerColor = Colors.amber;
  Color dialogSelectColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
      ),
      subtitle: Text(
        '${ColorTools.materialNameAndCode(
          dialogPickerColor,
          colorSwatchNameMap: ColorMap.colorsNameMap,
        )} '
        'aka ${ColorTools.nameThatColor(
          dialogPickerColor,
        )}',
      ),
      trailing: ColorIndicator(
        width: 44,
        height: 44,
        borderRadius: 4,
        color: dialogPickerColor,
        onSelectFocus: false,
        onSelect: () async {
          final Color colorBeforeDialog = dialogPickerColor;

          if (!(await colorPickerDialog())) {
            setState(() {
              dialogPickerColor = colorBeforeDialog;
            });
          }
        },
      ),
    );
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) {
        setState(() => dialogPickerColor = color);
        widget.onColorChanged(color);
      },
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: ColorMap.colorsNameMap,
    ).showPickerDialog(
      context,
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(
            0.0,
            curvedValue * 200,
            0.0,
          ),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(
        minHeight: 460,
        minWidth: 300,
        maxWidth: 320,
      ),
    );
  }
}
