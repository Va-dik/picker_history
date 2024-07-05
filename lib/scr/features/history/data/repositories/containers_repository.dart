import 'dart:math';

import 'package:picker_history/scr/features/history/data/models/container_model.dart';

final class ContainersRepository {
  ContainersRepository({required this.historyContainersData});

  final List<ContainerModel> historyContainersData;

  List<ContainerModel> createContainers(
      {required int startRange, required int endRange}) {
    // Определение случайного количества контейнеров //
    final int containerAmount = Random().nextInt(endRange) + startRange;

    // Определение случайного количества контейнеров //
    return List<ContainerModel>.generate(
        containerAmount, (index) => ContainerModel(number: index + 1));
  }

  List<ContainerModel> addToHistoryContainer({
    required ContainerModel containerData,
  }) =>
      historyContainersData..add(containerData);
}
