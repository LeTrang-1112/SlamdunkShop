import 'package:flutter/material.dart';

class DuyetDonHang extends StatelessWidget {
  const DuyetDonHang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E3023),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '3TL SLAMDUNK',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Duyệt đơn hàng',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonHangThanhCong(),
                ),
              );
            },
            child: const Text(
              'Đã giao',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DonHangKhongThanhCong(),
                ),
              );
            },
            child: const Text(
              'Không thành công',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/download.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Thông tin đơn hàng bên cạnh
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(
                                  'Đơn hàng #${index + 1}',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text('Tên sản phẩm: Sản phẩm A\nKhách hàng: Nguyễn Văn A\nTổng tiền: 1,000,000 VNĐ'),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Đã duyệt đơn hàng #${index + 1}');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Duyệt'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Đã hủy đơn hàng #${index + 1}');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text('Hủy đơn'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

class DonHangThanhCong extends StatelessWidget {
  const DonHangThanhCong({super.key});

  final List<Map<String, String>> orders = const [
    {'id': '1', 'name': 'Sản phẩm A', 'customer': 'Nguyễn Văn B', 'price': '1,500,000 VNĐ'},
    {'id': '2', 'name': 'Sản phẩm C', 'customer': 'Trần Thị C', 'price': '2,000,000 VNĐ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng đã giao'),
        backgroundColor: const Color(0xFF5E3023),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green[200],
                child: const Icon(Icons.check, color: Colors.white),
              ),
              title: Text('Đơn hàng #${order['id']}'),
              subtitle: Text(
                'Tên sản phẩm: ${order['name']}\nKhách hàng: ${order['customer']}\nTổng tiền: ${order['price']}',
              ),
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/download.png',  // Đường dẫn hình ảnh
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DonHangKhongThanhCong extends StatelessWidget {
  const DonHangKhongThanhCong({super.key});

  final List<Map<String, String>> orders = const [
    {'id': '3', 'name': 'Sản phẩm X', 'customer': 'Lê Văn D', 'price': '1,200,000 VNĐ'},
    {'id': '4', 'name': 'Sản phẩm Y', 'customer': 'Phạm Thị E', 'price': '800,000 VNĐ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng không thành công'),
        backgroundColor: const Color(0xFF5E3023),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red[200],
                child: const Icon(Icons.close, color: Colors.white),
              ),
              title: Text('Đơn hàng #${order['id']}'),
              subtitle: Text(
                'Tên sản phẩm: ${order['name']}\nKhách hàng: ${order['customer']}\nTổng tiền: ${order['price']}',
              ),
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/download.png',  // Đường dẫn hình ảnh
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
