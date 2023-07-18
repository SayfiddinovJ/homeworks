import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homeworks/ui/widgets/pinned.dart';
import 'package:homeworks/utils/app_utils.dart';

// ignore: must_be_immutable
/// Flutter code sample for [CustomScrollView].
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<String> listHorizontal = [AppImages.chickenBurger,AppImages.blackBurger];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111015),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF111015),
        title: Text('Привет, Максим',style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),),
        actions: [
          SvgPicture.asset(AppIcons.search),
          SizedBox(width: 11.w,),
          SizedBox(
            height: 40.w,
            width: 40.w,
            child: Image.asset(AppImages.profile),
          ),
          SizedBox(width: 16.w,),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(horizontal: 16),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                color: const Color(0xFF111015),
                child: Column(
                  children: [
                    Container(
                      height: 7.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE1D24A),
                            Color(0xFFC69233),
                          ]
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Row(
                      children: [
                        Text("Ваши любимые товары",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),),
                        const Spacer(),
                        Text("Посмотреть все",style: TextStyle(
                          color: const Color(0xFFEDB216),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              height: 114.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 9),
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22222A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(listHorizontal[index]),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(index==0 ? 'Чикен Бургер':'Черный Бургер',style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),),
                            SizedBox(height: 5.h,),
                            SizedBox(
                              width: 151.w,
                              child: Text('Котлета куриная, свежие овощи, сыр чеддер, соус для бургера',style: TextStyle(
                                color: const Color(0xFF6A6A6E),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),),
                            ),
                            Row(
                              children: [
                                Text('₽160',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),),
                                SizedBox(width: 52.w,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFF16151B),
                                  ),
                                  child: Center(
                                    child: Text('290g',style: TextStyle(
                                      color: const Color(0xFF6A6A6E),
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ),
                                ),
                                SizedBox(width: 8.w,),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 5.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 1.5,
                                        color: const Color(0xFFC69223),
                                      ),
                                    ),
                                    child: Center(child: SvgPicture.asset(AppIcons.bag))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // SliverAppBar(
          //   expandedHeight: 75,
          //   flexibleSpace: FlexibleSpaceBar(
          //     titlePadding: const EdgeInsets.symmetric(horizontal: 16),
          //     background: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 16.w),
          //       color: const Color(0xFF111015),
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               Text("Все товары",style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 16.sp,
          //               ),),
          //               const Spacer(),
          //               Text("Посмотреть все",style: TextStyle(
          //                 color: const Color(0xFFEDB216),
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 14.sp,
          //               ),),
          //             ],
          //           ),
          //           SizedBox(height: 10.h,),
          //           Container(
          //             child: Row(
          //               children: [
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Burger', isSelect: true),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Snack', isSelect: false),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Pizza', isSelect: false),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'French dog', isSelect: false),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     title: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 16.w),
          //       color: const Color(0xFF111015),
          //       child: Column(
          //         children: [
          //           Row(
          //             children: [
          //               Text("Все товары",style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 16.sp,
          //               ),),
          //               const Spacer(),
          //               Text("Посмотреть все",style: TextStyle(
          //                 color: const Color(0xFFEDB216),
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 14.sp,
          //               ),),
          //             ],
          //           ),
          //           SizedBox(height: 10.h,),
          //           Container(
          //             child: Row(
          //               children: [
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Burger', isSelect: true),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Snack', isSelect: false),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'Pizza', isSelect: false),
          //                 Pinned(icon: AppImages.burgerIcon, text: 'French dog', isSelect: false),
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w),
              child: Row(
                children: [
                  Text("Ваши любимые товары",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                  ),),
                  const Spacer(),
                  Text("Посмотреть все",style: TextStyle(
                    color: const Color(0xFFEDB216),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h,left: 20.w),
              child: Row(
                children: [
                  Pinned(icon: AppImages.burgerIcon, text: 'Burger', isSelect: true),
                  Pinned(icon: AppImages.burgerIcon, text: 'Snack', isSelect: false),
                  Pinned(icon: AppImages.burgerIcon, text: 'Pizza', isSelect: false),
                  Pinned(icon: AppImages.burgerIcon, text: 'French dog', isSelect: false),
                ],
              ),
            ),
          ),


          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.83.h,
            ),

            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 11.w),
                  padding: EdgeInsets.symmetric(horizontal: 11.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF22222A),
                  ),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SizedBox(
                            height: 150,
                            child: Image.asset(AppImages.images[index])),
                      ),
                      Text(index==0 ? 'Чикен Бургер':'Черный Бургер',style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 5.h,),
                      SizedBox(
                        width: 151.w,
                        child: Text('Котлета куриная, свежие овощи, сыр чеддер, соус для бургера',style: TextStyle(
                          color: const Color(0xFF6A6A6E),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),),
                      ),
                      Row(
                        children: [
                          Text('₽160',style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 3.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF16151B),
                            ),
                            child: Center(
                              child: Text('290g',style: TextStyle(
                                color: const Color(0xFF6A6A6E),
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w500,
                              ),),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFE1D24A),
                                    Color(0xFFC69223),
                                  ]
                                )
                              ),
                              child: Center(child: Icon(Icons.add,color: Colors.black,),),),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
