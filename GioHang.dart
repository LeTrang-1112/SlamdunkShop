import 'package:flutter/material.dart';

class ManHinhGioHang extends StatefulWidget {
  @override
  _TrangThaiManHinhGioHang createState() => _TrangThaiManHinhGioHang();
}

class _TrangThaiManHinhGioHang extends State<ManHinhGioHang> {
  List<Map<String, dynamic>> gioHang = [
    {
      'ten': 'Bóng rổ A',
      'moTa': 'Mô tả sản phẩm A',
      'gia': 199.99,
      'soLuong': 1,
      'hinhAnh': 'https://via.placeholder.com/80',
    },
    {
      'ten': 'Bóng rổ B',
      'moTa': 'Mô tả sản phẩm B',
      'gia': 149.99,
      'soLuong': 1,
      'hinhAnh': 'https://via.placeholder.com/80',
    },
    {
      'ten': 'Bóng rổ C',
      'moTa': 'Mô tả sản phẩm C',
      'gia': 299.99,
      'soLuong': 1,
      'hinhAnh': 'https://via.placeholder.com/80',
    },
  ];

  void _tangSoLuong(int index) {
    setState(() {
      gioHang[index]['soLuong']++;
    });
  }

  void _giamSoLuong(int index) {
    setState(() {
      if (gioHang[index]['soLuong'] > 1) {
        gioHang[index]['soLuong']--;
      }
    });
  }

  void _xoaSanPham(int index) {
    setState(() {
      gioHang.removeAt(index);
    });
  }

  double tinhTong() {
    return gioHang.fold(
        0, (tong, sanPham) => tong + sanPham['gia'] * sanPham['soLuong']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: gioHang.length,
                itemBuilder: (context, index) {
                  final sanPham = gioHang[index];
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            sanPham['hinhAnh'],
                            width: 80,
                            height: 80,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sanPham['ten'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  sanPham['moTa'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () =>
                                              _giamSoLuong(index),
                                        ),
                                        Text(
                                          '${sanPham['soLuong']}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () =>
                                              _tangSoLuong(index),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${(sanPham['gia'] * sanPham['soLuong']).toStringAsFixed(2)} đ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _xoaSanPham(index),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${tinhTong().toStringAsFixed(2)} đ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
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
              onPressed: () {
                // Xử lý logic thanh toán
                Navigator.pushNamed(context, '/thanhToan');
              },
              child: Text(
                'Thanh toán',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
