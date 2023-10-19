import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home_assignment/models/todo_model.dart';
import 'package:take_home_assignment/modules/todo/bloc/todo_bloc.dart';
import 'package:take_home_assignment/style/app_colors.dart';
import 'package:take_home_assignment/style/app_text_styles.dart';
import 'package:take_home_assignment/style/spacing.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              if (state is DataFetchedState) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.modelList?.length,
                    itemBuilder: (context, index) {
                      final todoItem = state.modelList?[index];
                      return Dismissible(
                        key: ValueKey<TodoModel?>(todoItem),
                        onDismissed: (direction) {
                          BlocProvider.of<TodoBloc>(context)
                              .add(DeleteTodoDataEvent(deletedItem: todoItem));
                        },
                        background: ColoredBox(
                          color: AppColors.darkRed,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Spacing.margin24,
                                horizontal: Spacing.margin24),
                            child: Text(
                              "Remove",
                              style: AppTextStyles.medium(
                                FontSize.normal,
                                AppColors.white,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(todoItem?.title ?? ''),
                            subtitle: Text(todoItem?.subtitle ?? ''),
                            isThreeLine: true,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ] else ...[
                CircularProgressIndicator(),
              ],
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              BlocProvider.of<TodoBloc>(context).add(AddTodoDataEvent(
                  item: TodoModel(
                id: 6,
                title: "Task 6",
                subtitle: "Write a report on the latest sales data",
              )));
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
