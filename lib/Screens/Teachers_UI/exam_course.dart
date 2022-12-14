import 'package:diit_portal/Utility/App_Colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exam_Course extends StatefulWidget {
  const Exam_Course({Key? key}) : super(key: key);

  @override
  State<Exam_Course> createState() => _Exam_CourseState();
}

class _Exam_CourseState extends State<Exam_Course> {

  List<String> subname = ['Computer Network',"DLD", "Image Processing",'Web'];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorChanger.scaffoldcolor,
        appBar: AppBar(
          backgroundColor: ColorChanger.appbarColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Exam Mark',
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "azonix",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),

          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 25,left: 10,right: 10),
                child: GridView.builder(
                    itemCount: subname.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2),

                    itemBuilder: (BuildContext context, index){
                     return InkWell(
                       onTap: ()=>Get.toNamed('/ExamType'),
                       child: Card(

                         shape: RoundedRectangleBorder(
                           side: BorderSide(
                             color: Colors.white10,
                           ),
                           borderRadius: BorderRadius.circular(20.0),
                         ),
                         color : Colors.white12,
                         elevation: 3,
                         shadowColor: Colors.white10,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                                   Image.asset("assets/attendance_ic.png",
                                     height: Get.height/10,
                                     width: Get.width/2,

                                   ),
                             SizedBox(height: 10,),
                               Text(subname[index],style: TextStyle(fontSize: 18,color: Colors.white70,fontWeight: FontWeight.bold),)
                           ],
                         ),
                       ),
                     );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
