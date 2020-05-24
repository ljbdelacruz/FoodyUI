




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordTextFields extends StatefulWidget {
  final PasswordTextFieldsVM vm;
  PasswordTextFields(this.vm);
  @override
  PasswordTextFieldsState createState() => PasswordTextFieldsState();
}

class PasswordTextFieldsState extends State<PasswordTextFields> {
  @override
  Widget build(BuildContext context) {
    return Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Theme(
                  data: widget.vm.theme,
                  child: TextFormField(
                    textCapitalization: TextCapitalization.none,
                    controller: widget.vm.passwordC,
                    obscureText: widget.vm.isObscured,
                    validator: (value) {
                      if (value.isEmpty) {
                        return widget.vm.validatorMessage;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: widget.vm.placeholder,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.vm.isObscured = !widget.vm.isObscured;
                          });
                        },
                        child: Container(
                          child: Center(
                            widthFactor: 0,
                            child: Text(
                              widget.vm.isObscured ? widget.vm.showL : widget.vm.hideL,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
  } 
}


class PasswordTextFieldsVM{
  ThemeData theme;
  String placeholder;
  TextEditingController passwordC;
  bool isObscured=true;
  String validatorMessage;
  String showL;
  String hideL;
  PasswordTextFieldsVM(this.placeholder,this.theme, this.passwordC, this.validatorMessage, this.showL, this.hideL);
}

