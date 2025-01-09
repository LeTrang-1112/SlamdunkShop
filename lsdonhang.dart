import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      'storeName': '3TL SPORTS',
      'productName': 'Bóng rổ Spalding',
      'size': 'Size 7',
      'material': 'Da tổng hợp',
      'originalPrice': 1200000,
      'discountPrice': 890000,
      'totalPrice': 890000,
    },
    {
      'storeName': 'SLAM DUNK SHOP',
      'productName': 'Bóng rổ Molten',
      'size': 'Size 6',
      'material': 'Cao su tự nhiên',
      'originalPrice': 900000,
      'discountPrice': 750000,
      'totalPrice': 750000,
    },
    {
      'storeName': 'BASKETBALL PRO',
      'productName': 'Bóng rổ Wilson Evolution',
      'size': 'Size 7',
      'material': 'Da microfiber',
      'originalPrice': 1500000,
      'discountPrice': 1200000,
      'totalPrice': 1200000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          // Header
          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Color(0xFF5E3023),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Lịch Sử Đặt Hàng',
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Danh sách các đơn hàng gần đây',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailPage(order: order),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order['storeName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            order['productName'],
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text('Kích thước: ${order['size']}'),
                          Text('Chất liệu: ${order['material']}'),
                          const SizedBox(height: 8),
                          Text(
                            'Giá gốc: ${order['originalPrice']} ₫',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                            ),
                          ),
                          Text('Giá giảm: ${order['discountPrice']} ₫'),
                          const SizedBox(height: 8),
                          Text(
                            'Tổng tiền: ${order['totalPrice']} ₫',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailPage extends StatelessWidget {
   final Map<String, dynamic> order;

  const OrderDetailPage({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin đơn hàng'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF5E3023),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trạng thái đơn hàng
            Container(
              color: Colors.green[100],
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Đơn hàng đã hoàn thành',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Thông tin vận chuyển',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'SPX Express: SPXVN04573515080B',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Giao hàng thành công - 20-11-2024 12:39',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Địa chỉ nhận hàng
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Địa chỉ nhận hàng',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Nguyen Van A'),
                  Text(
                    '+84 1234566',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text('Dia Chi'),
                ],
              ),
            ),
            const Divider(),
            // Danh sách sản phẩm
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Bóng rổ Spalding',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.red),
                        ),
                        SizedBox(height: 8),
                        Text('Noi dung.....'),
                        Text('Noi dung............'),
                        SizedBox(height: 8),
                        Text(
                          'đ295.000',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Tổng thanh toán
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Thành tiền:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'đ268.450',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Các tùy chọn hỗ trợ
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.undo, color: Colors.orange),
                    title: const Text('Gửi yêu cầu Trả hàng/Hoàn tiền'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.chat, color: Colors.blue),
                    title: const Text('Liên hệ Shop'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.help, color: Colors.grey),
                    title: const Text('Trung tâm Hỗ trợ'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            // Nút mua lại
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Mua lại',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}