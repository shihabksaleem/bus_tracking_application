import 'package:bus_tracking_application/presentation/global_widgets/custom_drop_down_widget/model/custom_drop_down_model.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    this.value,
    required this.items,
    this.onChanged,
  });
  final CustomDropDownModel? value;
  final List<CustomDropDownModel> items;
  final void Function(CustomDropDownModel?)? onChanged;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<CustomDropDownModel>(
        isExpanded: true,
        // underline: const Divider(
        //   color: Colors.black,
        //   thickness: 1,
        // ),
        value: widget.value,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Color(0xff628e91),
        ),
        hint: const Text(
          'Please choose one',
          style: const TextStyle(
            color: Color(0xff628e91),
          ),
        ),
        items: widget.items.map((element) {
          return DropdownMenuItem(
            value: element,
            child: Text(
              element.text,
              style: const TextStyle(
                color: Color(0xff628e91),
              ),
            ),
          );
        }).toList(),
        onChanged: widget.onChanged);
  }
}
