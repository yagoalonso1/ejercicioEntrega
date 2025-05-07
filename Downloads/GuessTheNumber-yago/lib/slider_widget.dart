import 'package:flutter/material.dart';
import 'package:slider_app/app_colors.dart';

class SliderWidget extends StatelessWidget {
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  const SliderWidget(
      {super.key,
      required this.value,
      required this.min,
      required this.max,
      required this.onChanged});

//vista del slider.
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${min.toInt()}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Expanded(
          child: Slider(
            activeColor: AppColors.primaryColor,
            value: value,
            onChanged: onChanged,
            min: min,
            max: max,
          ),
        ),
        Text(
          "${max.toInt()}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
