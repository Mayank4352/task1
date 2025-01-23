import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stroll/views/widgets/background.dart';
import 'package:stroll/controllers/quote_controller.dart';
import '../controllers/home_controller.dart';
import 'package:stroll/views/widgets/question_section.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());
  final QuoteController quoteController = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              const TimeBasedBackground(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical:
                            orientation == Orientation.portrait ? 8.h : 4.h,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Text(
                                  "Stroll Bonfire",
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 1.w),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,
                                  color: Colors.white, size: 16.sp),
                              SizedBox(width: 1.w),
                              Obx(() => Text(controller.remainingTime.value,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp))),
                              SizedBox(width: 2.w),
                              Icon(Icons.person,
                                  color: Colors.white, size: 16.sp),
                              SizedBox(width: 1.w),
                              Text("103",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        height:
                            orientation == Orientation.portrait ? 15.h : 2.h),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 6.w,
                                  backgroundImage:
                                      AssetImage("assets/images/avatar.jpg"),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Angelina, 28",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Obx(() {
                                        final question =
                                            controller.questions.first;
                                        return Text(
                                          question.question,
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                            const QuestionSection(),
                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Pick your option.\nSee who has a similar mind.",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[900],
                                    border: Border.all(
                                      color: Color(0xFF8B5CF6),
                                      width: 2,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.mic,
                                    color: Color(0xFF8B5CF6),
                                    size: 20.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Container(
                                  height: 12.w,
                                  width: 12.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF8B5CF6),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                    size: 20.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
