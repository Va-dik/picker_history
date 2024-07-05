import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_bloc.dart';
import 'package:picker_history/scr/features/history/presentation/widgets/container_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoryBloc historyBloc = context.read<HistoryBloc>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          historyBloc.state.bottomSheetContainersData.length,
          (index) => ContainerWidget(
            containerModel:
                historyBloc.state.bottomSheetContainersData[index],
          ),
        ),
      ),
    );
  }
}
