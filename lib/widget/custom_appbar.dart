
import 'package:apex_task/res/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {


  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 30,left:15.w),
      child: AppBar(
        leading: context.canPop()?Column(
          children: [
            GestureDetector(
              onTap: (){
                context.pop();
              },
              child: SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: SvgPicture.asset(AppImage.back)),
            ),
          ],
        ):null,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }



  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height+40) ;


}
