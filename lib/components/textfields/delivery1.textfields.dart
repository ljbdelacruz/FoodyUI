



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeliveryTextFields1 extends StatefulWidget{
  final DeliveryTextFields1VM vm;
  DeliveryTextFields1(this.vm);
  @override
  DeliveryTextFields1State createState() => DeliveryTextFields1State();
}
class DeliveryTextFields1State extends State<DeliveryTextFields1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
                      controller:widget.vm.controller,
                      keyboardType: TextInputType.text,
                      // onSaved: (input) => _con.user.password = input,
                      // validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                      obscureText: widget.vm.isHidePassword,
                      decoration: InputDecoration(
                        labelText: widget.vm.label,
                        labelStyle: TextStyle(color: Theme.of(context).accentColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText:widget.vm.placeholder,
                        // hintText: '••••••••••••',
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(widget.vm.icon, color: widget.vm.iconColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.vm.isHidePassword = !widget.vm.isHidePassword;
                            });
                          },
                          color: widget.vm.iconColor,
                          icon: Icon(widget.vm.isHidePassword ? Icons.visibility : Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                      ),
        );
  }
}

class DeliveryTextFields1VM{
  TextEditingController controller;
  Color labelStyleColor;
  String placeholder;
  String label;
  IconData icon;
  Color iconColor;
  bool isHidePassword=true;
  DeliveryTextFields1VM(this.controller, this.label, {this.placeholder = "", this.labelStyleColor = Colors.blue, this.icon = Icons.lock, this.iconColor = Colors.blue});
}
