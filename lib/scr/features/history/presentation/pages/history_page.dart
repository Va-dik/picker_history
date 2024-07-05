import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picker_history/scr/core/components/enums/screen_state_enum.dart';
import 'package:picker_history/scr/core/presentation/widgets/error_widget.dart';
import 'package:picker_history/scr/core/presentation/widgets/loading_widget.dart';
import 'package:picker_history/scr/features/history/data/models/container_model.dart';
import 'package:picker_history/scr/features/history/data/repositories/containers_repository.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_bloc.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_events.dart';
import 'package:picker_history/scr/features/history/presentation/bloc/history_state.dart';
import 'package:picker_history/scr/features/history/presentation/widgets/bottom_sheet_widget.dart';
import 'package:picker_history/scr/features/history/presentation/widgets/container_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryBloc>(
      create: (context) => HistoryBloc(
        containersRepository: ContainersRepository(
          historyContainersData: [],
        ),
      ),
      child: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state.showBottomSheet) {
            showModalBottomSheet<ContainerModel>(
              context: context,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (_) => BlocProvider.value(
                value: context.read<HistoryBloc>(),
                child: const BottomSheetWidget(),
              ),
            ).then((value) {
              if (value != null) {
                context.read<HistoryBloc>().add(SelectContainerEvent(
                    containerData: ContainerModel(number: value.number)));
              } else {
                context.read<HistoryBloc>().add(const ClosedBottomSheetEvent());
              }
            });
          }
        },
        builder: (context, state) {
          switch (state.screenState) {
            case ScreenStateEnum.error:
              return CustomErrorWidget(errorMessage: state.errorMessage);
            case ScreenStateEnum.isLoading:
              return const CustomLoadingWidget();
            case ScreenStateEnum.ready:
              return Scaffold(
                appBar: AppBar(
                  title: const Text('История выбранных номеров'),
                ),
                body: state.historyContainersData.isNotEmpty
                    ? SafeArea(
                        child: GridView.builder(
                          itemCount: state.historyContainersData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 100,
                          ),
                          itemBuilder: (context, index) {
                            final ContainerModel containerModel =
                                state.historyContainersData[index];

                            return ContainerWidget(
                                containerModel: containerModel);
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          'История пуста',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                floatingActionButton: FloatingActionButton(
                  tooltip: 'Выбрать квадратик',
                  child: const Icon(CupertinoIcons.square_stack_3d_up),
                  onPressed: () {
                    context.read<HistoryBloc>().add(CreateContainersEvent());
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
