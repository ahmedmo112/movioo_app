
import 'package:flutter/material.dart';
import 'package:movioo/shared/colors.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false); 


class ShakeTransition extends StatelessWidget {
  const ShakeTransition(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 700),
      this.offset = 140.0,
      this.axis = Axis.horizontal,
      this.left = true})
      : super(key: key);
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool left;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      child: child,
      curve: Curves.easeInOut,
      tween: Tween(begin: 1.0,end: 0.0),
      builder: (BuildContext context, double value, Widget? child){
        return Transform.translate(
          offset: left?Offset(-value*offset, value*offset): Offset(value*offset,-value*offset),
          child:child
          );
      },
    );
  }
}

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(dynamic? val)? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required String? Function(String? val)? validate,
 
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      
      style: TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange ?? () {};
      },
      onTap: () {
        onTap ?? () {};
      },
      validator: (value) {
        return validate!(value);
      },
      cursorColor: Colors.amber,
      
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: maincolor,
        filled: true,
        
          
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                   color: Colors.amber
                  ),
                )
              : null,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
            
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.amber,width: 2.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.amber)
          ),

            
          ),
    );
