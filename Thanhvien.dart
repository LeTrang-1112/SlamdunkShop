import 'package:flutter/material.dart';

class Thanhvien extends StatefulWidget {
  const Thanhvien({super.key});
  @override
  State<Thanhvien> createState() => ThanhvienState();
}

class ThanhvienState extends State<Thanhvien> {
  @override
  int _currentIndex = 0; // Biến để lưu chỉ mục của tab được chọn
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Phần header của giao diện
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
                    const Text(
                      '3TL SLAMDUNK',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Thành viên',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // User Information
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/1.jpg'), // Replace with local asset path
                ),
                SizedBox(width: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thùy Trang',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 200,),
                    Text(
                      'Thành viên',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Order Section
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OrderButton(
                          icon: Icons.pending_actions,
                          label: 'Chờ xác nhận',
                        ),
                        OrderButton(
                          icon: Icons.store,
                          label: 'Chờ lấy hàng',
                        ),
                        OrderButton(
                          icon: Icons.local_shipping,
                          label: 'Chờ giao hàng',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Utilities Section
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UtilityButton(
                      label: 'Liên kết ví',
                      icon: Icons.account_balance_wallet,
                    ),
                    UtilityButton(
                      label: 'Kho Voucher',
                      icon: Icons.card_giftcard,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Support Section
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SupportButton(
                      label: 'Trung tâm trợ giúp',
                      icon: Icons.help_center,
                    ),
                    Divider(),
                    SupportButton(
                      label: 'Trò chuyện cùng SlamDunk',
                      icon: Icons.chat,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cập nhật chỉ mục khi người dùng nhấn vào mục menu
          });
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(color: Colors.red),
        unselectedLabelStyle: const TextStyle(color: Colors.red),
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
    );
  }
}

class OrderButton extends StatelessWidget {
  final IconData icon;
  final String label;

  OrderButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.redAccent),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

class UtilityButton extends StatelessWidget {
  final IconData icon;
  final String label;

  UtilityButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.redAccent),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}

class SupportButton extends StatelessWidget {
  final IconData icon;
  final String label;

  SupportButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 32, color: Colors.redAccent),
        SizedBox(width: 16),
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
