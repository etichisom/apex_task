
import 'package:apex_task/res/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class Field extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon , suffixIcon;
  final double height,width,borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Function(String)? validate;
  final Color fillColor;
  final bool obSecure,enable;
  final Function()? onTap;
  const Field({
    this.controller,
    this.height=54,
    this.onTap,
    this.enable=true,
    this.validate,
    this.fillColor=AppColor.whiteGrey,
    this.width=double.maxFinite,
    this.obSecure=false,
    this.borderRadius=10,
    this.hint="",
    this.textInputType=TextInputType.text,
    this.prefixIcon,
    Key? key, this.suffixIcon, this.onChanged}) : super(key: key);

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool secure = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:widget.onTap ,
      child: TextFormField(
        obscureText: secure,
        onChanged: widget.onChanged,
        enabled: widget.enable,
        controller:widget.controller ,
        keyboardType: widget.textInputType,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600
        ),
        validator: (e){
          return  widget.validate==null?null:widget.validate!(e!);
        },
        decoration: InputDecoration(
          hintStyle:TextStyle(
              fontSize: 16.sp,
              color: AppColor.textGrey,
              fontWeight: FontWeight.w400
          ) ,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 13.w),
          hintText: widget.hint,
          prefixIcon:widget.prefixIcon==null?null: Transform.scale(
              scale: 0.5,
              child: widget.prefixIcon),
          suffixIcon: widget.obSecure?InkWell(
              onTap: (){
                setSecure();
              },
              child: icon()):widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent,width: 0),
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: Colors.transparent,width:0),
          ) ,
          disabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: Colors.transparent,width:0),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:const BorderSide(color: AppColor.green,width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:  const BorderSide(color: Colors.red,width: 0.2),
          ),
          fillColor:widget.fillColor ,
          filled: true,

        ),

      ),
    );
  }

  setSecure(){
    setState((){
      secure=!secure;
    });
  }

  Widget icon() {
    if(secure){
      return const Icon(Icons.visibility_outlined);
    }else{
      return const Icon(Icons.visibility_off_outlined);
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.obSecure){
      setState(() {
        secure=true;
      });
    }
  }
}
