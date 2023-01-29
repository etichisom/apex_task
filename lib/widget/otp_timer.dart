
import 'package:apex_task/core/res/color.dart';
import 'package:apex_task/core/res/text_stlye.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';

class OtpTimer extends StatefulWidget {
  final Function() onTap;
  const OtpTimer({
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  final CustomTimerController _controller = CustomTimerController();
  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: _controller,
        begin: const Duration(seconds: 30),
        end: const Duration(seconds: 0),
        builder: (time){
          if(time.seconds=="00"){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t recieve code? ",style: AppTextTheme.h3.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400
                ),),
                GestureDetector(
                  onTap:(){
                    widget.onTap();
                    _controller.reset();
                    _controller.start();
                  },
                  child: Text("Request again",style: AppTextTheme.h3.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),),
                )
              ],
            );
          }else{
            return Text("Resend Code in ${time.seconds}",style: AppTextTheme.h3.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                 color: AppColor.grey2
            ),);
          }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.start();
  }
}





class OtpTimerPassword extends StatefulWidget {
  final Function() onTap;
  const OtpTimerPassword({
    required this.onTap,
    Key? key}) : super(key: key);

  @override
  State<OtpTimerPassword> createState() => _OtpTimerPasswordState();
}

class _OtpTimerPasswordState extends State<OtpTimerPassword> {
  final CustomTimerController _controller = CustomTimerController();
  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: _controller,
        begin: const Duration(seconds: 0),
        end: const Duration(seconds: 60),
        builder: (time){
          if(time.seconds=="00"){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap:(){
                    widget.onTap();
                    _controller.reset();
                    _controller.start();
                  },
                  child: Text("Generate Otp",style: AppTextTheme.h3.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  ),),
                )
              ],
            );
          }else{
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Resend otp in ${60-int.parse(time.seconds)}",style: AppTextTheme.h3.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),),
              ],
            );
          }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
}
