import 'package:picker_history/scr/core/components/enums/screen_state_enum.dart';
import 'package:picker_history/scr/features/history/data/models/container_model.dart';

final class HistoryState {
  const HistoryState({
    this.historyContainersData = const [],
    this.bottomSheetContainersData = const [],
    this.screenState = ScreenStateEnum.ready,
    this.errorMessage = '',
    this.showBottomSheet = false,
  });

  final List<ContainerModel> historyContainersData;
  final List<ContainerModel> bottomSheetContainersData;
  final ScreenStateEnum screenState;
  final String errorMessage;
  final bool showBottomSheet;

  HistoryState copyWith({
    List<ContainerModel>? historyContainersData,
    List<ContainerModel>? bottomSheetContainersData,
    ScreenStateEnum? screenState,
    String? errorMessage,
    bool? showBottomSheet,
  }) {
    return HistoryState(
      historyContainersData:
          historyContainersData ?? this.historyContainersData,
      bottomSheetContainersData:
          bottomSheetContainersData ?? this.bottomSheetContainersData,
      screenState: screenState ?? this.screenState,
      errorMessage: errorMessage ?? this.errorMessage,
      showBottomSheet: showBottomSheet ?? this.showBottomSheet,
    );
  }
}
