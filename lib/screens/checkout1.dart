import 'dart:io';
import 'dart:math';

// import 'package:PhoneFusion/screens/bottom_bar.dart';
import 'package:PhoneFusion/screens/confirmorder.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
// import 'usermodel.dart';
// import 'databasehelper.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = '/CheckoutScreen';
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  bool _obscureText = true;
  String _address = '';

  String _fullName = '';
  late int _phoneNumber;
  File? _pickedImage;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      // Generate a random 15-character alphanumeric tracking ID
      final trackingId = _generateTrackingId(15);

      // Navigate to the confirmation screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ConfirmationScreen(orderTrackingId: trackingId),
        ),
      );
    }
  }

  String _generateTrackingId(int length) {
    const String _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final Random _random = Random.secure();
    return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length)),
    ));
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.95,
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: WaveWidget(
                        config: CustomConfig(
                          gradients: [
                            [
                              ColorsConsts.gradientFStart,
                              ColorsConsts.gradientLStart
                            ],
                            [
                              ColorsConsts.gradientFEnd,
                              ColorsConsts.gradientLEnd
                            ],
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
                      const Padding(
                        padding: EdgeInsets.only(top: 50,bottom: 20), // Add top padding to the title
                        child: Text(
                          'Checkout', // Add the Checkout title here
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Stack(children: [
                      //   Container(margin: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
                      //     child: CircleAvatar(
                      //       radius:71,
                      //       backgroundColor: ColorsConsts.gradientLStart,
                      //       child: CircleAvatar(
                      //         radius: 65,
                      //         backgroundImage: _pickedImage == null?null:FileImage(_pickedImage!),
                      //       ),
                      //     ),
                      //   ),
                      //   Positioned(
                      //       top:120,
                      //       left:110,
                      //       child: RawMaterialButton(
                      //         elevation: 10,
                      //         fillColor: ColorsConsts.gradientLEnd,
                      //         padding: const EdgeInsets.all(15.0),
                      //         shape: const CircleBorder(),
                      //         onPressed: (){
                      //           showDialog(context: context, builder: (BuildContext context){
                      //             return AlertDialog(
                      //               title:Text(
                      //                 'Choose option',
                      //                 style: TextStyle(
                      //                     fontWeight: FontWeight.w600,
                      //                     color: ColorsConsts.gradientLStart),
                      //               ),
                      //               content:SingleChildScrollView(
                      //                 child: ListBody(
                      //                   children: [
                      //                     InkWell(
                      //                       onTap: _pickImageCamera,
                      //                       splashColor: Colors.purpleAccent,
                      //                       child:  Row(
                      //                         children: [
                      //                           const Padding(
                      //                             padding: EdgeInsets.all(8.0),
                      //                             child: Icon(Icons.camera,color: Colors.purpleAccent,
                      //                             ),
                      //                           ),
                      //                           Text(
                      //                             'Camera',
                      //                             style: TextStyle(
                      //                               fontSize: 18,
                      //                               fontWeight: FontWeight.w500,
                      //                               color: ColorsConsts.title,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     InkWell(
                      //                       onTap: _pickImageGallery,
                      //                       splashColor: Colors.purpleAccent,
                      //                       child:  Row(
                      //                         children: [
                      //                           const Padding(
                      //                             padding: EdgeInsets.all(8.0),
                      //                             child: Icon(Icons.image,color: Colors.purpleAccent,
                      //                             ),
                      //                           ),
                      //                           Text(
                      //                             'Gallery',
                      //                             style: TextStyle(
                      //                               fontSize: 18,
                      //                               fontWeight: FontWeight.w500,
                      //                               color: ColorsConsts.title,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     InkWell(
                      //                       onTap: _remove,
                      //                       splashColor: Colors.purpleAccent,
                      //                       child:  const Row(
                      //                         children: [
                      //                           Padding(
                      //                             padding: EdgeInsets.all(8.0),
                      //                             child: Icon(Icons.remove_circle,color: Colors.red,
                      //                             ),
                      //                           ),
                      //                           Text(
                      //                             'Remove',
                      //                             style: TextStyle(
                      //                               fontSize: 18,
                      //                               fontWeight: FontWeight.w500,
                      //                               color: Colors.red,
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //
                      //             );
                      //           });
                      //         },
                      //         child: const Icon(Icons.add_a_photo),
                      //       ))
                      // ],
                      // ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  key: const ValueKey('name'),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'name cannot be null';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(_emailFocusNode),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      filled: true,
                                      prefixIcon: const Icon(Icons.person),
                                      labelText: 'Full name',
                                      fillColor: Theme
                                          .of(context)
                                          .colorScheme
                                          .background),
                                  onSaved: (value) {
                                    _fullName = value!;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  key: const ValueKey('email'),
                                  focusNode: _emailFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty ) {
                                      return 'Please enter a valid email address';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(_passwordFocusNode),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      filled: true,
                                      prefixIcon: const Icon(Icons.home),
                                      labelText: 'Address',
                                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                      fillColor: Theme
                                          .of(context)
                                          .colorScheme
                                          .background),
                                  onSaved: (value) {
                                    _address = value!;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  key: const ValueKey('phone number'),

                                  focusNode: _phoneNumberFocusNode,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter a valid phone number';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: _submitForm,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: const UnderlineInputBorder(),
                                      filled: true,
                                      prefixIcon: const Icon(
                                          Icons.phone_android),
                                      labelText: 'Phone number',
                                      fillColor: Theme
                                          .of(context)
                                          .colorScheme
                                          .background),
                                  onSaved: (value) {
                                    _phoneNumber = int.parse(value!);
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 20),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.8,
                                    height: MediaQuery.of(context).size.height*0.11,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 40),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(30.0),
                                                  side: BorderSide(
                                                      color: ColorsConsts
                                                          .backgroundColor),
                                                ),
                                              )),
                                          onPressed: _submitForm,
                                          child: const Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              Text(
                                                'Confirm Order',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 22),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                            ],
                                          )),
                                    ),
                                  ),
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


