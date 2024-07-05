import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:picker_history/scr/core/components/constants/colors/core_constant_colors.dart';
import 'package:picker_history/scr/features/history/data/models/container_model.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.containerModel,
  });

  final ContainerModel containerModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context, containerModel),
      child: Container(
        alignment: const Alignment(0, 0),
        margin: const EdgeInsets.all(10),
        height: 100,
        decoration: const BoxDecoration(
          color: CoreConstantColors.containerColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Text(
          containerModel.number.toString(),
          style: const TextStyle(color: CoreConstantColors.containerTextColor, fontSize: 32),
        ),
      ),
    );
  }
}
