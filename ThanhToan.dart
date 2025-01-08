import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManHinhThanhToan extends StatefulWidget {
  @override
  _ManHinhThanhToanState createState() => _ManHinhThanhToanState();
}

class _ManHinhThanhToanState extends State<ManHinhThanhToan> {
  final _formKey = GlobalKey<FormState>();
  int phuongThucThanhToan = 0;
  final TextEditingController tenController = TextEditingController();
  final TextEditingController sdtController = TextEditingController();
  final TextEditingController diaChiController = TextEditingController();

  void chonPhuongThucThanhToan(int index) {
    setState(() {
      phuongThucThanhToan = index;
    });
  }

  void thucHienThanhToan() {
    if (_formKey.currentState!.validate()) {
      if (phuongThucThanhToan == 0) {
        // Hiển thị màn hình "Đặt hàng thành công"
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Đặt hàng thành công'),
            content: Text('Đơn hàng của bạn đã được đặt thành công!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else if (phuongThucThanhToan == 1) {
        // Liên kết tới Ví MoMo (giả lập)
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Thanh toán qua Ví MoMo'),
            content: Text('Đang chuyển hướng tới Ví MoMo để thanh toán...'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
        // Ở đây bạn có thể tích hợp SDK hoặc API của MoMo để xử lý thanh toán thực tế
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin giao hàng',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: tenController,
                decoration: InputDecoration(
                  labelText: 'Tên người nhận',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên người nhận';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: sdtController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  if (value.length != 10) {
                    return 'Số điện thoại phải có 10 chữ số';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                controller: diaChiController,
                decoration: InputDecoration(
                  labelText: 'Địa chỉ giao hàng',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập địa chỉ';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Tóm tắt đơn hàng',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              DongTomTat(label: 'Đơn hàng', soTien: '\$16.48'),
              DongTomTat(label: 'Phí giao hàng', soTien: '\$1.80'),
              Divider(),
              DongTomTat(label: 'Tổng cộng:', soTien: '\$18.19', dam: true),
              SizedBox(height: 4),
              Text(
                'Thời gian giao hàng dự kiến: 2 - 5 ngày',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 16),
              Text(
                'Phương thức thanh toán',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () => chonPhuongThucThanhToan(0),
                child: ThePhuongThucThanhToan(
                  icon: Icons.delivery_dining,
                  loaiThe: 'Thanh toán khi nhận hàng',
                  duocChon: phuongThucThanhToan == 0,
                ),
              ),
              GestureDetector(
                onTap: () => chonPhuongThucThanhToan(1),
                child: ThePhuongThucThanhToan(
                  icon: Icons.phone_android,
                  loaiThe: 'Ví MoMo',
                  duocChon: phuongThucThanhToan == 1,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng giá',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$18.19',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: thucHienThanhToan,
                child: Text(
                  'Thanh toán ngay',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class DongTomTat extends StatelessWidget {
  final String label;
  final String soTien;
  final bool dam;

  DongTomTat({required this.label, required this.soTien, this.dam = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: dam ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            soTien,
            style: TextStyle(
              fontSize: 16,
              fontWeight: dam ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class ThePhuongThucThanhToan extends StatelessWidget {
  final IconData icon;
  final String loaiThe;
  final bool duocChon;

  ThePhuongThucThanhToan({
    required this.icon,
    required this.loaiThe,
    this.duocChon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: duocChon ? Colors.black : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: duocChon ? Colors.white : Colors.black,
          ),
          SizedBox(width: 16),
          Text(
            loaiThe,
            style: TextStyle(
              fontSize: 14,
              color: duocChon ? Colors.white : Colors.black,
            ),
          ),
          Spacer(),
          if (duocChon)
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}
