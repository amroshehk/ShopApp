import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
  required String title,
  Color color = Colors.indigoAccent,
  double radius = 10.0,
  required VoidCallback function,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      height: 46,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          "$title".toUpperCase(),
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,

          ),


        ),
      ),
    );

Widget defaultTextButton({
  required String title,
  required VoidCallback function,
}) =>
    TextButton(onPressed: function, child: Text('$title'.toUpperCase()
    ,style: TextStyle(fontSize: 14.0, ),));


Widget defaultTextFormField(
    {required TextEditingController controller,
      required String labelText,
      required Icon prefixIcon,
      IconButton? suffixIcon = null,
      bool obscureText = false,
      bool isReadOnly = false,
      required TextInputType type,
      required FormFieldValidator validator,
      GestureTapCallback? onTab,
      ValueChanged<String>? onChanged,
      required BuildContext context
}
) =>
    TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      keyboardType: type,
      onTap: onTab,
      readOnly: isReadOnly,
      onChanged: onChanged ,
      style:  Theme.of(context).textTheme.bodyMedium,
    );

void navigateTo(context, Widget screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

void navigateToAndFinish(context, Widget screen) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => screen),
    (route) {
      return false;
    },);