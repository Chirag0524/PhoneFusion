import 'package:PhoneFusion/screens/bottom_bar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:PhoneFusion/consts/colors.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';
// import 'databasehelper.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  // String? _emailAddress = '';
  // String? _password = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }
  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;

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

    // Check if the email and password combination exists
    bool isLoginSuccessful = false;
    if (values != null) {
      for (final row in values) {
        if (row.length >= 3 && row[1] == email && row[2] == password) {
          isLoginSuccessful = true;
          break;
        }
      }
    }

    if (isLoginSuccessful) {
      // Login successful; proceed to the desired screen
      // Clear text fields after login
      emailController.clear();
      passwordController.clear();
      _showSuccessMessage();
    } else {
      // Login failed; show an error message
      emailController.clear();
      passwordController.clear();
      _showErrorMessage();
    }

    // Close the client
    client.close();
  }

  void _showSuccessMessage() {
    Flushbar(
      message: 'Login successful!',
      duration: const Duration(seconds: 2),
      icon: const Icon(FeatherIcons.check, color: Colors.red),
      backgroundColor: Colors.grey,
    ).show(context).then((_) {
      Navigator.of(context).pushReplacementNamed(BottomBarScreen.routeName);
    });
  }

  void _showErrorMessage() {
    Flushbar(
      message: 'Login failed. User not found. Or Credentials are wrong.',
      duration: const Duration(seconds: 2),
      icon: const Icon(FeatherIcons.x, color: Colors.red),
      backgroundColor: Colors.grey,
    ).show(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  heightPercentages: [0.20, 0.25],
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
              Container(
                margin: const EdgeInsets.only(top: 80),
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  //  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://icons.iconarchive.com/icons/paomedia/small-n-flat/256/shop-icon.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          controller: emailController,
                          key: const ValueKey('email'),
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
                        padding: const EdgeInsets.all(12.0),
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
                          onEditingComplete: login,
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
                              onPressed: login,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Login',
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
    );
  }
}
