import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Khởi tạo Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Phone Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneAuthPage(),
    );
  }
}

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId = "";
  bool isOtpSent = false;

  // Gửi OTP
  Future<void> verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneController.text.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Nếu Firebase tự động xác thực, đăng nhập ngay
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed: ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        // Lưu ID của việc xác thực OTP
        setState(() {
          this.verificationId = verificationId;
          isOtpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Xử lý timeout (nếu có)
        print("Timeout reached: $verificationId");
      },
    );
  }

  // Xác thực OTP
  Future<void> signInWithPhoneNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: _otpController.text.trim(),
      );
      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Đăng nhập thành công!"),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Lỗi: ${e.toString()}"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Xác thực số điện thoại")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: "Nhập số điện thoại"),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            isOtpSent
                ? Column(
                    children: [
                      TextField(
                        controller: _otpController,
                        decoration: InputDecoration(labelText: "Nhập mã OTP"),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: signInWithPhoneNumber,
                        child: Text("Xác thực OTP"),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: verifyPhoneNumber,
                    child: Text("Gửi OTP"),
                  ),
          ],
        ),
      ),
    );
  }
}
