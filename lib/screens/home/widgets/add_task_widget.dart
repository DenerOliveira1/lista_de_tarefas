import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../stores/stores.dart';

class AddTaskWidget extends StatelessWidget {
  final TaskStore taskStore = TaskStore();

  AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: taskStore.observerKey,
      color: AppColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Observer(builder: (context) {
              return Visibility(
                visible: taskStore.selectDateTime,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: taskStore.periods.length,
                      itemBuilder: (context, index) {
                        return IntrinsicWidth(
                          stepWidth: 100.0,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                              border: Border.all(
                                color: AppColors.inputBorderColor,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              taskStore.periods[index],
                              style: const TextStyle(color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            }),
            TextField(
              autofocus: true,
              onChanged: taskStore.setTitle,
              style: TextStyle(color: Colors.white),
              //style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(
                //hintText: AppStrings.taskFormFieldTitleHintText.tr(),
                //labelText: AppStrings.taskFormFieldTitle.tr(),
                //errorText: taskStore.titleError?.tr(),
                /*suffixStyle: TextStyle(color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                hoverColor: Colors.white,
                fillColor: Colors.white,
                focusColor: Colors.white,
                prefixStyle: TextStyle(color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),*/
                suffixIcon: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Observer(
                      builder: (context) {
                        return IconButton(
                          icon: Icon(
                            Icons.calendar_month,
                            color: taskStore.selectDateTime ? AppColors.iconColor : AppColors.disabledColor,
                          ),
                          onPressed: taskStore.selectDateTimePressed,
                        );
                      },
                    ),
                    Observer(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: taskStore.savePressed,
                          //disabledColor: Colors.grey,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
