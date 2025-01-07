import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Authentication Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  bool _isOtpSent = false;
  bool _isLoading = false;

  // Gửi OTP đến số điện thoại
  Future<void> sendOtp() async {
    setState(() {
      _isLoading = true;
    });

    final phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Vui lòng nhập số điện thoại')));
      setState(() {
        _isLoading = false;
      });
      return;
    }

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        setState(() {
          _isOtpSent = false;
          _isLoading = false;
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Xác thực thất bại: ${e.message}")));
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          _isOtpSent = true;
          _verificationId = verificationId;
          _isLoading = false;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  // Xác thực OTP
  Future<void> verifyOtp() async {
    setState(() {
      _isLoading = true;
    });

    final smsCode = _otpController.text.trim();
    if (smsCode.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Vui lòng nhập mã OTP')));
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );

    try {
      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Đăng nhập thành công!")));
      setState(() {
        _isOtpSent = false;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Lỗi xác thực OTP")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Nhập số điện thoại'),
              keyboardType: TextInputType.phone,
            ),
            if (_isOtpSent)
              TextField(
                controller: _otpController,
                decoration: InputDecoration(labelText: 'Nhập mã OTP'),
                keyboardType: TextInputType.number,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isOtpSent ? verifyOtp : sendOtp,
              child: _isLoading
                  ? CircularProgressIndicator() // Hiển thị loading khi gửi OTP hoặc xác thực OTP
                  : Text(_isOtpSent ? 'Xác thực OTP' : 'Gửi OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
