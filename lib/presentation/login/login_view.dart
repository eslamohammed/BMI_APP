
import 'package:flutter/material.dart';
import 'package:ibm_task/presentation/register/register_view.dart';
import 'package:ibm_task/presentation/utils/color_manager.dart';
import 'package:ibm_task/presentation/utils/routes_manager.dart';
import 'package:ibm_task/widget/form_container_widget.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // bool _isSigning = false;

  // final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(color: ColorManager.darkPrimary,fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(height: 10,),
              FormContainerWidget(
                controller: _passwordController,
                hintText: "Password",
                isPasswordField: true,
              ),
              SizedBox(height: 30,),
              GestureDetector(
                // onTap: _signIn,
                onTap: (){
                  print("fill the fire base login in part");
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: ColorManager.darkPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child:Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(Routes.registerRoute);
                      },
                      child: Text("Sign Up",style: TextStyle(color: ColorManager.darkPrimary,fontWeight: FontWeight.bold),))
                ],
              ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Go directly to app Main screen"),
                  SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(Routes.mainScreen);
                      },
                      child: Text("Main Screen",style: TextStyle(color: ColorManager.darkPrimary,fontWeight: FontWeight.bold),))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }

  // void _signIn() async {

  //   String email = _emailController.text;
  //   String password = _passwordController.text;

  //   User? user = await _auth.signInWithEmailAndPassword(email, password);

  //   if (user!= null){
  //     print("User is successfully signedIn");
  //     // Navigator.pushNamed(context, "/home");
  //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>HomeScreen()));
  //   } else{
  //     print("Some error happend");
  //   }

  // }
}
