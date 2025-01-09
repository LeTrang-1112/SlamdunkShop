import 'package:flutter/material.dart';

class Thongbao  extends StatefulWidget{
  const Thongbao ({super.key});
  @override
State<Thongbao> createState()=> ThongbaoState();
}
class ThongbaoState extends State<Thongbao>
{
   @override
   int _currentIndex = 0; // Biến để lưu chỉ mục của tab được chọn
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
  children: [
    // Header
    Container(
      height: 160,
      decoration: const BoxDecoration(
        color: Color(0xFF5E3023),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dòng chữ SLAMDUNK và icon giỏ hàng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  const Text(
                    '3TL SLAMDUNK',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Giỏ hàng')),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Thông báo',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    ),
    const SizedBox(height: 8),

    // Expanded để ListView chiếm phần còn lại của màn hình
    Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 8),
          // Khuyến mãi Section
          _notificationTile(
            context,
            icon: Icons.local_offer,
            title: "Khuyến mãi",
            count: 10,
          ),
          _notificationTile(
            context,
            icon: Icons.update,
            title: "Cập nhật",
            count: 1,
          ),
          // Cập nhật đơn hàng Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Cập nhật đơn hàng",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {}, // Thực hiện hành động khi nhấn
                  child: const Text(
                    "Đọc tất cả(1)",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          _orderUpdateCard(),
          const SizedBox(height: 16),
        ],
      ),
    ),
  ],
),
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cập nhật chỉ mục khi người dùng nhấn
          });
        },
        selectedItemColor: Colors.red, // Màu biểu tượng được chọn
        unselectedItemColor: Colors.black, // Màu biểu tượng không được chọn
        selectedLabelStyle: const TextStyle(color: Colors.red), // Màu chữ được chọn
        unselectedLabelStyle: const TextStyle(color: Colors.red), // Màu chữ không được chọn
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      // Floating Action Button
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft, // Đặt nút bên trái
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 40), // Khoảng cách từ cạnh dưới và bên trái
          child: FloatingActionButton(
            onPressed: () {
              // Thực hiện hành động khi nhấn nút Chat
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chat với chúng tôi!')),
              );
            },
            backgroundColor: Colors.blue, // Màu sắc nổi bật
            child: const Text(
              'Chat',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),   
        )
      )
    );
  }
}
  // Widget hiển thị thông báo dạng ListTile
  Widget _notificationTile(BuildContext context,
      {required IconData icon, required String title, required int count}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.red, size: 32),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  // Widget hiển thị cập nhật đơn hàng
  Widget _orderUpdateCard() {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Thay CircleAvatar bằng hình ảnh
          ClipRRect(
            borderRadius: BorderRadius.circular(12), // Bo góc ảnh
            child: Image.asset(
              'assets/images/2.jpg', // Đường dẫn đến ảnh
              width: 48,
              height: 48,
              fit: BoxFit.cover, // Đảm bảo ảnh hiển thị đầy đủ
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Đơn hàng đã hoàn tất",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "Mã đơn hàng: 2412040RH3U6UP",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "12:00 14/12/2024",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    ),
  );
}

