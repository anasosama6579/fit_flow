import 'package:fit_flow/features/onboarding/ui/widgets/selected_radio_button.dart';
import 'package:fit_flow/features/onboarding/ui/widgets/unselected_radio_button.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected ? const SelectedRadioButton() : const UnselectedRadioButton();
  }
}

