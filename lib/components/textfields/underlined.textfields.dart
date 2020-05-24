



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UnderlinedTextFields extends StatelessWidget {
  final UnderlinedTextFieldsVM vm;
  UnderlinedTextFields(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Theme(
                  data: vm.theme,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.none,
                    controller: vm.controller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return vm.emptyTextfield;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: vm.placeholder,
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (str) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                ),
      );
  }
}
class UnderlinedTextFieldsVM{
  ThemeData theme;
  String placeholder;
  String emptyTextfield;
  TextEditingController controller;
  UnderlinedTextFieldsVM(this.theme, this.placeholder, this.controller, this.emptyTextfield);
}





