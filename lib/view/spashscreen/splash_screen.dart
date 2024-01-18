import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:prac_demo/utils/constants.dart';
import 'package:prac_demo/view/login/login_page.dart';

import '../signup/signup_page.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  bool disp_Content = false;
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if(timer.tick.toInt()==2){

        timer.cancel();
        disp_Content =true;
        setState(() {

        });
      }
      else{

      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(height: height,width:width,fit: BoxFit.cover,"assets/images/0_Splash Screen.png"),
          FadeIn(
            duration: Duration(seconds: 3),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Constants.sPaceHeight(100.0),
                  Center(child: Image.asset(fit: BoxFit.contain,height: 200,width: 200,'assets/images/Logo@3x.png')),
                  Spacer(),
                  if(disp_Content)    FadeInUp(
                    duration: Duration(seconds: 2),

                    child: Column(
                      children: [
                        SizedBox(
                          height: 52,
                          child: ElevatedButton(style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )),backgroundColor: MaterialStateProperty.all(Colors.blue)),onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login_page(),));

                          }, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.call,color: Colors.white,),
                            Constants.sPacewidth(10.0),
                              Constants. textWithPro("Login with Phone",14.0,FontWeight.w500,Colors.white)
                            ],
                          )),
                        ),
                        Constants.sPaceHeight(20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(height: 1,width: 100,color: Colors.black,),
                            Constants.textWithPro('OR', 16.0, FontWeight.w500, Colors.black),
                            Container(height: 1,width: 100,color: Colors.black,),
                          ],
                        ),

                        Constants.sPaceHeight(20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(fit: BoxFit.cover,'assets/images/Google.png'),
                            Image.asset(fit: BoxFit.cover,'assets/images/Facebook.png'),

                            Image.asset(fit: BoxFit.cover,'assets/images/Instagram.png'),
                          ],
                        ),
                        Constants.sPaceHeight(20.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Constants.textWithPro( "Don't have an account? ", 16,FontWeight.w400, Colors.black),

                              //Don't have an account?
                              InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup_Page(),));

                                  },
                                  child:Constants.textWithPro( "Sign Up", 16,FontWeight.w600, Colors.black)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),





                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}
