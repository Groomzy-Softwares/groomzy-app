import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

import './time.dart';
import '../../../../widgets/button/button.dart';
import '../../../../widgets/alert_dialog/alert_dialog.dart';
import '../../../../widgets/loading/loading.dart';

import '../../../../../api/graphql/operating_time/add_operating_time.dart';

class AddOperatingTime extends HookWidget {
  AddOperatingTime({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _day = useState<String>('');
    final _startTime = useState<String>(null);
    final _endTime = useState<String>(null);

    Future<void> _submit({Function addOperatingTime}) async {
      if (!_formKey.currentState.validate()) {
        return;
      }
      _formKey.currentState.save();

      await addOperatingTime({
        'day': _day.value,
        'startTime': _startTime.value,
        'endTime': _endTime.value,
      });
    }

    return Mutation(
      options: MutationOptions(
        document: gql(
          AddOperatingTimeMutation().addOperatingTime,
        ),
        update: (
          GraphQLDataProxy cache,
          QueryResult result,
        ) {
          if (result.hasException) {
            String errMessage = result.exception.graphqlErrors[0].message;
            print(errMessage);
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AndroidAlertDialog(
                  title: 'Error',
                  message: Text(
                    errMessage,
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                  popTimes: 2,
                );
              },
            );
          }
          return cache;
        },
        onCompleted: (dynamic addOperatingTimeResult) async {
          if (addOperatingTimeResult != null) {
            String message =
                addOperatingTimeResult['addOperatingTime']['message'];
            if (message.isNotEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AndroidAlertDialog(
                    title: 'Completed',
                    message: Text(
                      message,
                      style: TextStyle(
                        color: Colors.lightGreen,
                      ),
                    ),
                    popTimes: 2,
                  );
                },
              );
            }
          }
        },
      ),
      builder: (
        RunMutation runAddOperatingTimeMutation,
        QueryResult addOperatingTimeResult,
      ) {
        if (addOperatingTimeResult.isLoading) {
          return AndroidLoading();
        }

        return Form(
          key: _formKey,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 500.0,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        FontAwesomeIcons.times,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  DropDownFormField(
                    value: _day.value,
                    titleText: 'Day',
                    textField: 'display',
                    valueField: 'value',
                    dataSource: [
                      {
                        "display": "Mon",
                        "value": "Mon",
                      },
                      {
                        "display": "Tue",
                        "value": "Tue",
                      },
                      {
                        "display": "Wed",
                        "value": "Wed",
                      },
                      {
                        "display": "Thu",
                        "value": "Thu",
                      },
                      {
                        "display": "Fri",
                        "value": "Fri",
                      },
                      {
                        "display": "Sat",
                        "value": "Sat",
                      },
                      {
                        "display": "Sun",
                        "value": "Sun",
                      },
                    ],
                    onChanged: (String input) {
                      _day.value = input;
                    },
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Day is required';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  Time(
                    label: 'Select start time',
                    selectedTime: _startTime.value,
                    setTime: (time) {
                      _startTime.value = DateFormat.Hm().format(time);
                    },
                  ),
                  SizedBox(height: 10.0),
                  Time(
                    label: 'Select end time',
                    selectedTime: _endTime.value,
                    setTime: (time) {
                      _endTime.value = DateFormat.Hm().format(time);
                    },
                  ),
                  SizedBox(height: 10.0),
                  AndroidButton(
                    label: 'Add',
                    backgroundColor: Theme.of(context).primaryColor,
                    pressed: () {
                      _submit(addOperatingTime: runAddOperatingTimeMutation);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}