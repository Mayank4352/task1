import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stroll/views/widgets/questions_options.dart';
import '../controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 70.h,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bonfire.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            top: 30.h,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0),
                    Colors.black.withValues(alpha: 0.9),
                    Colors.black,
                  ],
                  stops: const [0.0, 0.3, 0.6, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stroll Bonfire",
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
                        Icon(Icons.timer, color: Colors.white, size: 16.sp),
                        SizedBox(width: 1.w),
                        Text("22h 00m",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.sp)),
                        SizedBox(width: 2.w),
                        Icon(Icons.person, color: Colors.white, size: 16.sp),
                        SizedBox(width: 1.w),
                        Text("103",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.sp)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 6.w,
                          backgroundImage:
                              AssetImage("assets/images/avatar.jpg"),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Angelina, 28",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Obx(() {
                      final question = controller.questions.first;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              question.question,
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Center(
                            child: Text(
                              '"Mine is definitely the peace in the morning."',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2.w,
                              mainAxisSpacing: 2.h,
                              childAspectRatio: 2.5,
                            ),
                            itemCount: question.options.length,
                            itemBuilder: (context, index) {
                              return Obx(() => QuestionOption(
                                    optionText: question.options[index],
                                    isSelected:
                                        controller.selectedOption.value ==
                                            index,
                                    onTap: () => controller.selectOption(index),
                                    optionLetter:
                                        String.fromCharCode(65 + index),
                                  ));
                            },
                          ),
                        ],
                      );
                    }),
                    SizedBox(height: 2.h),
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
            ],
          ),
        ],
      ),
    );
  }
}
