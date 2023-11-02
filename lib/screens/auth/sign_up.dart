import 'dart:io';

import 'package:PhoneFusion/screens/auth/login.dart';
import 'package:PhoneFusion/screens/bottom_bar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
// import 'usermodel.dart';
// import 'databasehelper.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/SignUpScreen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  bool _obscureText = true;
  // String _emailAddress = '';
  // String _password = '';
  // String _fullName = '';
  // late int _phoneNumber;
   File? _pickedImage;
  final _formKey = GlobalKey<FormState>();
  // final _googleSignIn = GoogleSignIn(scopes: ['https://www.googleapis.com/auth/spreadsheets']);
  // final _credentialsFile = 'phonefusion-a37b642f53b1.json';
  // final _spreadsheetId = '1GYd9GXEXLL2ROa-Utwzy1FjDd2zKTlAHNVShpaWs5aU';
  // final _range = 'User_details';

  // Define and initialize text controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;
    final mobile = mobileController.text;

    // Initialize Google Sheets API credentials and service
    final _credentials = ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "project_id": "phonefusion",
      "private_key_id": "a37b642f53b1105728144fffaf9915adc2ded874",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDOtKptr+L+8qGX\ng8bMBfIA9d58IXlxYakdadFL/2nnkp/VaZ2C1TkpbHeq5dgqCraxukXEvpbtiJEg\n7jrlYlZQX5K+hODV+3pV5m9lTH2oStJ2I11NvMA0PxvnK0QF/WI4P8FZBUA1WRj9\n9zJ9CG8zonNk5PAfxwVdvWZeDuPqZWtUaPEaUyBwtVN/3xjhaMcISBdB/WQ2xJMU\nKOJiJTp0lFuhk2VW5eH10Q4BgC7W93rZ4GCdyNi0zG6JwDvphWkO+mglz76sYflu\nWqHDJjonst6t1B9fHIuMJM4PPrHtpjZ40kScAUKSPLxSm5c1yvwnQJ8S266WQTrc\nvRQBABkHAgMBAAECggEABc8FPGCFSX16AFmp/CZtSYz0kUUY4OXKAdNCbWyiW5Pp\nkpli3Wqug4p9G7v/xMFY/EpBbFOgHCa1UAPsexu1/zuK/SLwyofu79EHmlokQdbF\nw/TJyhsexO5tE0708hIlG3Lh37rftgq97WJv9HGIkR6POEDyuoHg6w8dJvwreB+6\niweVBs9VuTdMUXVw7ZUqTwPoN6HIzCoAFaDbevl2sVMlYbBbR8sXPw9NEgyYPNIT\nsLfduCWbsb7hguaHI5OlsDlqIDu3ZF+Wq0dLC3QWicTzL9gMlZkavovglqTrhVL9\ndfYnS+kCOCZ7nvsdHh3vfLrxnYOrOz/seSDnoA584QKBgQDxibqQPOSGYDudYV5f\n3jK5A2kNunQTL5zxbWHAiRWTjRxUQXKWYx3IOAEDWGGVTP22rkyBniSw/V84eUQA\nkqNKsrnm6byISbJAr4qNUsqwl8uAagoJvKgDpAzwcejAx+gEYztdIFzj8K5fhBx0\ncbHEkAsZAC38/lTGRC8Ah/9jMQKBgQDbFQf7bgoHA3+pIgLqiorQ+JABBYVFowHJ\npMsl8uCfPfO8wMXPoF+oA8t7k4cXX309aSAok5bVMPnBYJe/y9DYXcRHXXVDQQzN\nbd8ARaorMqgUtracVSpk1VV45x9t5KoGBtDhLC6Fq1PrdBZ/fw1dNvVBbwfZrzVg\n8VOLBZ0BtwKBgQDFC+BIdXTVb0KTJPER8rqclvyoN3kkgc5eYybBJNSWWCNJVU8/\nAsM0KQQij4Kkg3fkBZPilnpGbZ21+7APa5GNifsBN6QX509lWBAHNQioQl3BeECS\nKvdCaR4pNjR0uWE92xp94b4GMr5+q89u66XjvsNe9PePkojkapGRtGETsQKBgQDE\nNc7DUWcrpueDy9E+y7vNsoAOWiplFru4I55Jq3+fPvX3e9LtxB1HtbZdQ+B+f2gE\nQw2pKZ2x7D4TAfaGsPynezsaC0rFZBIaPie1766bJ7A/dPCRjPj9+86kDKMqYdwg\nr6QNtusnji0HuB2aLGkErf7zjoRCYtf0rc37uZhHewKBgBctbPJcHqMzre6aBXMK\nrosdglhAKozEMhkgSw0KWUBQAtR+YDxb5DM3pVWxLOMUIGQJ9sF2P0eAJfuiNRJo\nzycEncUtocZFwRnke8YVc/XZ0aiuSfcubcfk/qFH42FeJvc3NlV+GxdXNWOWqKBh\nQm5iaeH2gJ9bpRF3IHmrv6fl\n-----END PRIVATE KEY-----\n",
      "client_email": "phonefusion@phonefusion.iam.gserviceaccount.com",
      "client_id": "108255245001188519045",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/phonefusion%40phonefusion.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    });

    // Create a client and access Google Sheets
    final client = await clientViaServiceAccount(_credentials, ['https://www.googleapis.com/auth/spreadsheets']);
    final sheets = SheetsApi(client);
    final spreadsheetId = '1GYd9GXEXLL2ROa-Utwzy1FjDd2zKTlAHNVShpaWs5aU'; // Replace with your spreadsheet ID
    final range = 'User_details'; // Replace with your sheet name

    // Fetch the existing data from Google Sheets
    final response = await sheets.spreadsheets.values.get(spreadsheetId, range);
    final values = response.values;

    // Check if the email already exists
    bool emailExists = false;
    if (values != null) {
      for (final row in values) {
        if (row.length >= 2 && row[1] == email) {
          emailExists = true;
          break;
        }
      }
    }

    if (emailExists) {
      // User with the same email is already registered; show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User with this email is already registered!'),
          duration: Duration(seconds: 2),
        ),

      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, LoginScreen.routeName);
      });
    } else {
      // User is not registered; proceed to add data
      final data = [
        [name, email, password, mobile],
      ];
      final valueRange = ValueRange(values: data);

      // Push the data to Google Sheets
      await sheets.spreadsheets.values.append(valueRange, spreadsheetId, range, valueInputOption: 'RAW');

      // Clear text fields after sign-up
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      mobileController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful, and data pushed to Google Sheets!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to the desired screen
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushNamed(context, BottomBarScreen.routeName);
      });
    }

    // Close the client
    client.close();
  }

  void _pickImageCamera() async{
    final picker=ImagePicker();
    final pickedImage=await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile=File(pickedImage!.path);
    setState(() {
      _pickedImage=pickedImageFile;
    });
    Navigator.pop(context);
  }
  void _pickImageGallery()async{
    final picker=ImagePicker();
    final pickedImage=await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile=File(pickedImage!.path);
    setState(() {
      _pickedImage=pickedImageFile;
    });
    Navigator.pop(context);
  }
  void _remove(){
    setState(() {
      _pickedImage=null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: [
                          [ColorsConsts.gradientFStart, ColorsConsts.gradientLStart],
                          [ColorsConsts.gradientFEnd, ColorsConsts.gradientLEnd],
                        ],
                        durations: [19440, 10800],
                        heightPercentages: [0.10, 0.15],
                        blur: const MaskFilter.blur(BlurStyle.solid, 10),
                        gradientBegin: Alignment.bottomLeft,
                        gradientEnd: Alignment.topRight,
                      ),
                      waveAmplitude: 0,
                      size: const Size(
                        double.infinity,
                        double.infinity,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(children: [
                      Container(margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      child: CircleAvatar(
                        radius:71,
                        backgroundColor: ColorsConsts.gradientLStart,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: _pickedImage == null?null:FileImage(_pickedImage!),
                        ),
                      ),
                      ),
                      Positioned(
                          top:120,
                          left:110,
                          child: RawMaterialButton(
                            elevation: 10,
                            fillColor: ColorsConsts.gradientLEnd,
                            padding: const EdgeInsets.all(15.0),
                            shape: const CircleBorder(),
                            onPressed: (){
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                    title:Text(
                                        'Choose option',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: ColorsConsts.gradientLStart),
                                    ),
                                  content:SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                         InkWell(
                                            onTap: _pickImageCamera,
                                            splashColor: Colors.purpleAccent,
                                              child:  Row(
                                                children: [
                                                   Container(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Icon(Icons.camera,color: Colors.purpleAccent,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Camera',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w500,
                                                      color: ColorsConsts.title,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        InkWell(
                                          onTap: _pickImageGallery,
                                          splashColor: Colors.purpleAccent,
                                          child:  Row(
                                            children: [
                                               Container(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.image,color: Colors.purpleAccent,
                                                ),
                                              ),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: ColorsConsts.title,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: _remove,
                                          splashColor: Colors.purpleAccent,
                                          child:   Row(
                                            children: [
                                               Container(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.remove_circle,color: Colors.red,
                                                ),
                                              ),
                                              Text(
                                                'Remove',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                          ],
                                          ),
                                        ),

                                );
                              });
                            },
                            child: const Icon(Icons.add_a_photo),
                            ))
                      ],
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                key: const ValueKey('name'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'name cannot be null';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(_emailFocusNode),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.person),
                                    labelText: 'Full name',
                                    fillColor: Theme.of(context).colorScheme.background),
                                onSaved: (value) {
                                  nameController = TextEditingController(text: value);
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: emailController,
                                key: const ValueKey('email'),
                                focusNode: _emailFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty || !value.contains('@')) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.email),
                                    labelText: 'Email Address',
                                    fillColor: Theme.of(context).colorScheme.background),
                                onSaved: (value) {
                                  emailController = TextEditingController(text: value);
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: passwordController,
                                key: const ValueKey('Password'),
                                validator: (value) {
                                  if (value!.isEmpty || value.length < 7) {
                                    return 'Please enter a valid Password';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                focusNode: _passwordFocusNode,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.lock),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    labelText: 'Password',
                                    fillColor: Theme.of(context).colorScheme.background),
                                onSaved: (value) {
                                  passwordController = TextEditingController(text: value);
                                },
                                obscureText: _obscureText,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(_phoneNumberFocusNode),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: mobileController,
                                key: const ValueKey('phone number'),

                                focusNode: _phoneNumberFocusNode,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                onEditingComplete: signUp,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: const UnderlineInputBorder(),
                                    filled: true,
                                    prefixIcon: const Icon(Icons.phone_android),
                                    labelText: 'Phone number',
                                    fillColor: Theme.of(context).colorScheme.background),
                                onSaved: (value) {
                                  mobileController = TextEditingController(text: value);;
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(width: 10),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            color: ColorsConsts.backgroundColor),
                                      ),
                                    )),
                                    onPressed: signUp,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign up',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          FeatherIcons.user,
                                          size: 18,
                                        )
                                      ],
                                    )),
                                const SizedBox(width: 20),
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
