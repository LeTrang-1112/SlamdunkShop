import 'package:flutter/material.dart';

class ManHinhThongTinNguoiDung extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin người dùng"),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.brown[400],
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://../..", // Thay ảnh thực tế ở đây
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 16,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 20,
                right: 16,
                child: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                OThongTin(label: "Tên", giaTri: "Hải Yến"),
                OThongTin(label: "Email", giaTri: "haiyeniuu@gmail.com"),
                OThongTin(
                    label: "Địa chỉ giao hàng",
                    giaTri: "Phước Bình, Long Thành, Đồng Nai"),
                OThongTin(label: "Mật khẩu", giaTri: "************"),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("Chi tiết thanh toán"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(context, '/chi-tiet-thanh-toan');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Lịch sử đơn hàng"),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    Navigator.pushNamed(context, '/lichSuDonHang');
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.logout),
                      label: Text("Đăng xuất"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        foregroundColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OThongTin extends StatelessWidget {
  final String label;
  final String giaTri;

  const OThongTin({
    required this.label,
    required this.giaTri,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controller: TextEditingController(text: giaTri),
        readOnly: true,
      ),
    );
  }
}