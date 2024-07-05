import 'package:picker_history/scr/features/history/data/models/container_model.dart';

abstract final class HistoryEvent {
  const HistoryEvent();
}

final class CreateContainersEvent extends HistoryEvent {}

final class SelectContainerEvent extends HistoryEvent {
  const SelectContainerEvent({required this.containerData});

  final ContainerModel containerData;
}

final class ClosedBottomSheetEvent extends HistoryEvent {
  const ClosedBottomSheetEvent();
}
