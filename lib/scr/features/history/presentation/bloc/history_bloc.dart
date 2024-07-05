import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picker_history/scr/core/components/enums/screen_state_enum.dart';
import 'package:picker_history/scr/features/history/data/repositories/containers_repository.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_events.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  late final ContainersRepository _containersRepository;

  HistoryBloc({required ContainersRepository containersRepository})
      : super(const HistoryState(
          historyContainersData: [],
          bottomSheetContainersData: [],
        )) {
    _containersRepository = containersRepository;

    on<CreateContainersEvent>(_onCreateContainers);
    on<SelectContainerEvent>(_onSelectContainer);
    on<ClosedBottomSheetEvent>(_onClosedBottomSheet);
  }

  void _onCreateContainers(
      CreateContainersEvent event, Emitter<HistoryState> emit) {
    emit(state.copyWith(screenState: ScreenStateEnum.isLoading));

    emit(state.copyWith(
      bottomSheetContainersData: _containersRepository.createContainers(
        startRange: 1,
        endRange: 20,
      ),
      showBottomSheet: true,
      screenState: ScreenStateEnum.ready,
    ));

    add(const ClosedBottomSheetEvent());
  }

  void _onClosedBottomSheet(
      ClosedBottomSheetEvent event, Emitter<HistoryState> emit) {
    emit(state.copyWith(showBottomSheet: false));
  }

  void _onSelectContainer(
      SelectContainerEvent event, Emitter<HistoryState> emit) {
    emit(state.copyWith(screenState: ScreenStateEnum.isLoading));

    emit(state.copyWith(
      historyContainersData: _containersRepository.addToHistoryContainer(
        containerData: event.containerData,
      ),
      showBottomSheet: false,
      screenState: ScreenStateEnum.ready,
    ));
  }
}
