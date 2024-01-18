import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prac_demo/utils/constants.dart';
import 'package:prac_demo/view/home/home_screen.dart';
import 'package:prac_demo/view/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final key = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      // i can make it with opacity but due to lack of time im just putting image overhere
                      height:height*0.3,width: width ,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/Sign in bg.png'
                              ))
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.arrow_back,color: Colors.white,),
                          Constants.sPaceHeight(40),
                          Constants.textWithPro("Hi ,\nWelcome", 30, FontWeight.bold, Colors.white)
                        ],
                      ),
                    )
                  ],
                ),
                Constants.sPaceHeight(20),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constants.textWithPro("Mobile Number", 14.0, FontWeight.w400, Colors.grey),
                      TextFormField(
                        keyboardType: TextInputType.number,

                        controller:mobile ,
                        decoration: InputDecoration(
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/flag.png',),
                                Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size: 20,),
                                Constants.textWithPro("+91  ", 14.0, FontWeight.w400, Colors.black),

                              ],
                            ),

                            hintText: 'Enter your mobile number',
                            hintStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14)
                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter mobile no';
                          }

                        },
                      ),
                      Constants.sPaceHeight(30),

                      TextFormField(
                        controller:otp ,
                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(

                            hintText: 'Enter Otp',
                            hintStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey,fontSize: 14,

                            )

                        ),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter otp';

                          }
                        },
                      ),
                      Constants.sPaceHeight(30),

                      Align(alignment: Alignment.centerRight,child: Constants.textWithPro("Resend Otp", 14.0, FontWeight.w600,Colors.blue)),
                      Constants.sPaceHeight(30),

                      SizedBox(
                        height: 52,
                        child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )),backgroundColor: MaterialStateProperty.all(Colors.blue)),onPressed: ()async {
                          final shar = await SharedPreferences.getInstance();
                          if(key.currentState!.validate()){
                            shar.setString('mo_no', mobile.text);
                            shar.setString('otp', otp.text);
                            Constants.toaster('register successfully');

                            Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>Login_page() ,));


                          }
                        }, child: Center(child: Constants. textWithPro("Signup",16.0,FontWeight.w400,Colors.white))),
                      ),
                      Constants.sPaceHeight(100),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Constants.textWithPro( "Back to? ", 16,FontWeight.w400, Colors.black),

                            //Don't have an account?
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();

                                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Login_page() ,));
                                },
                                child:Constants.textWithPro( "Login", 16,FontWeight.w600, Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
