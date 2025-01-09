import 'package:flutter/material.dart';

class ShippingForm extends StatefulWidget {
  const ShippingForm({super.key});

  @override
  State<ShippingForm> createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  final TextEditingController email = TextEditingController();
  final TextEditingController ho = TextEditingController();
  final TextEditingController ten = TextEditingController();
  final TextEditingController diaChi = TextEditingController();
  final TextEditingController thanhPho = TextEditingController();
  final TextEditingController maBuuDien = TextEditingController();
  final TextEditingController dienThoai = TextEditingController();

  bool isSubscribed = false;
  String? selectedTinh;
  String? selectedQuan;
  String? selectedPhuong;
  String? thanhToan;
  final List<String> tinh = ['Hà Nội', 'Hồ Chí Minh', 'Đà Nẵng'];
  final List<String> quan = ['Quận 1', 'Quận 2', 'Quận 3'];
  final List<String> phuong = ['Phường 1', 'Phường 2', 'Phường 3'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin liên lạc',
            style: TextStyle(fontSize: 24,
             fontWeight: FontWeight.bold
             ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              hintText: 'Nhập email',
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: isSubscribed,
                onChanged: (bool? value) {
                  setState(() {
                    isSubscribed = value ?? false;
                  });
                },
              ),
              const Text('Gửi cho tôi tin tức và ưu đãi qua email'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Giao hàng',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Chọn Tỉnh/Thành phố',
              border: OutlineInputBorder(),
            ),
            value: selectedTinh,
            items: tinh
                .map((tinh) => DropdownMenuItem(
                      value: tinh,
                      child: Text(tinh),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedTinh = value;
              });
            },
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Chọn Quận/Huyện',
              border: OutlineInputBorder(),
            ),
            value: selectedQuan,
            items: quan
                .map((quan) => DropdownMenuItem(
                      value: quan,
                      child: Text(quan),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedQuan = value;
              });
            },
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Chọn Phường/Xã',
              border: OutlineInputBorder(),
            ),
            value: selectedPhuong,
            items: phuong
                .map((phuong) => DropdownMenuItem(
                      value: phuong,
                      child: Text(phuong),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedPhuong = value;
              });
            },
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Quốc gia/Khu vực',
              border: OutlineInputBorder(),
              hintText: 'Việt Nam',
            ),
            enabled: false,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ho,
                  decoration: const InputDecoration(
                    labelText: 'Họ',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: ten,
                  decoration: const InputDecoration(
                    labelText: 'Tên',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: diaChi,
            decoration: const InputDecoration(
              labelText: 'Địa chỉ nhận hàng (Số nhà, đường phố, hẻm, Căn hộ...)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: thanhPho,
                  decoration: const InputDecoration(
                    labelText: 'Thành phố',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: maBuuDien,
                  decoration: const InputDecoration(
                    labelText: 'Mã bưu điện',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: diaChi,
            decoration: const InputDecoration(
              labelText: 'Điện thoại',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.question_mark), 
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: isSubscribed,
                onChanged: (bool? value) {
                  setState(() {
                    isSubscribed = value ?? false;
                  });
                },
              ),
              const Text('Lưu địa chỉ này'),
            ],
          ),
          const Text(
            'Vận chuyển',
            style: TextStyle(fontSize: 24,
             fontWeight: FontWeight.bold
             ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'Phí vận chuyển',
              border: OutlineInputBorder(),
              hintText: 'Nhập phí vận chuyển',
            ),
          ),
          const SizedBox(height: 10),
           const Text(
            'Thanh toán',
            style: TextStyle(fontSize: 24,
             fontWeight: FontWeight.bold
             ),
          ),
          const Text(
            'Địa chỉ thanh toán của phương thức thanh toán phải khớp với địa chỉ giao hàng.',
            style: TextStyle(fontSize: 14),
          ),
          const Text(
            'Toàn bộ các giao dịch được bảo mật và mã hóa.',
          style: TextStyle(fontSize: 14),
          ),
          RadioListTile<String>(
              title: const Text('Thanh toán qua MoMo'),
              value: 'MoMo',
              groupValue: thanhToan,
              onChanged: (value) {
                setState(() {
                  thanhToan = value;
                });
              },
            ),
            RadioListTile<String>(
              title: const Text('Thanh toán khi nhận hàng (COD)'),
              value: 'COD',
              groupValue: thanhToan,
              onChanged: (value) {
                setState(() {
                  thanhToan = value;
                });
              },
            ),
        ],
      ),
    );
  }
}
