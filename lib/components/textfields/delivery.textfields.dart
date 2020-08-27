



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody_ui/typdef/mytypedef.dart';

class DeliveryTextFields extends StatefulWidget{
  final NormalCallback onEndEdit;
  final DeliveryTextFieldsVM vm;
  DeliveryTextFields(this.vm, {this.onEndEdit});
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
                      obscureText: widget.vm.isObscure,
                      decoration: InputDecoration(
                        labelText: widget.vm.label,
                        labelStyle: TextStyle(color: widget.vm.labelStyleColor),
                        contentPadding: EdgeInsets.all(12),
                        hintText: widget.vm.placeholder,
                        hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
                        prefixIcon: Icon(widget.vm.icon, color: widget.vm.iconColor),
                        border: OutlineInputBorder(borderSide: BorderSide(color: widget.vm.bColor)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.vm.bColor)),
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: widget.vm.bColor)),
                      ),
                      onEditingComplete: (){
                        print("End editing");
                        if(widget.onEndEdit != null){
                          widget.onEndEdit();
                        }
                      },
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
  bool isObscure;
  Color bColor;
  DeliveryTextFieldsVM(this.controller, this.label, {this.placeholder = "", this.labelStyleColor = Colors.blue, this.icon = Icons.email, this.iconColor = Colors.blue, this.isObscure = false, this.bColor = Colors.blue});
}
