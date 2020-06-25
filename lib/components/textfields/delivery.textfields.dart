



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeliveryTextFields extends StatefulWidget{
  final DeliveryTextFieldsVM vm;
  DeliveryTextFields(this.vm);
  @override
  DeliveryTextFieldsState createState() => DeliveryTextFieldsState();
}
class DeliveryTextFieldsState extends State<DeliveryTextFields> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
                      controller: widget.vm.controller,
                      keyboardType: TextInputType.emailAddress,
                      // onSaved: (input) => _con.user.email = input,
                      // validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                      decoration: InputDecoration(
                        labelText: widget.vm.label,
                        labelStyle: TextStyle(color: widget.vm.labelStyleColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText: widget.vm.placeholder,
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(widget.vm.icon, color: widget.vm.iconColor),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      ),
                    );
  }
}

class DeliveryTextFieldsVM{
  TextEditingController controller;
  Color labelStyleColor;
  String placeholder;
  String label;
  IconData icon;
  Color iconColor;
  DeliveryTextFieldsVM(this.controller, this.label, {this.placeholder = "", this.labelStyleColor = Colors.blue, this.icon = Icons.email, this.iconColor = Colors.blue});
}
