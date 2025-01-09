import 'package:flutter/material.dart';

class Chitietsp extends StatefulWidget {
  const Chitietsp({super.key});

  @override
  State<Chitietsp> createState() => ChitietspState();
}

class ChitietspState extends State<Chitietsp> {
  // Danh sách đường dẫn ảnh minh họa
  final List<String> illustrativeImages = [
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
  ];

  // Danh sách sản phẩm liên quan
  final List<Map<String, String>> relatedProducts = [
    {
      'image': 'assets/images/1.jpg',
      'name': 'Bóng rổ Spalding',
      'price': '1.200.000',
    },
    {
      'image': 'assets/images/3.jpg',
      'name': 'Bóng rổ Molten',
      'price': '1.500.000',
    },
    {
      'image': 'assets/images/4.jpg',
      'name': 'Bóng rổ Wilson',
      'price': '1.800.000',
    },
  ];

  @override
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
                      'Chi tiết sản phẩm',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Product Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset(
                'assets/images/2.jpg', // Ảnh chính sản phẩm
                height: 150,
              ),
            ),

            // Product Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quả bóng da Size 7 Li-Ning Babfive',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Giá: 1.190.000',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'Kích thước:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          _SizeOption(size: '5'),
                          _SizeOption(size: '6'),
                          _SizeOption(size: '7', isSelected: true),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Illustrative Images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ảnh minh họa',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: illustrativeImages.map((imagePath) {
                      return Image.asset(
                        imagePath,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Related Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sản phẩm tương tự',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  GridView.builder(
                    shrinkWrap: true, // Giúp GridView vừa với nội dung
                    physics: const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn độc lập
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Số cột trong lưới
                      crossAxisSpacing: 1.0, // Khoảng cách giữa các cột
                      mainAxisSpacing: 8.0, // Khoảng cách giữa các hàng
                      childAspectRatio:1, // Tỉ lệ chiều cao/chiều rộng của ô
                    ),
                    itemCount: relatedProducts.length,
                    itemBuilder: (context, index) {
                      final product = relatedProducts[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            product['image']!,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product['name']!,
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Giá: ${product['price']}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),

            //Mô tả
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Mô tả sản phẩm',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Quả bóng da Size 7 Li-Ning Babfive được làm từ chất liệu cao cấp, '
                  'đảm bảo độ bền cao và khả năng giữ hơi tốt. Sản phẩm thích hợp cho '
                  'người chơi chuyên nghiệp và nghiệp dư. Thiết kế đẹp mắt và bám tay tốt, '
                  'giúp cải thiện hiệu suất chơi.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),

          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String size;
  final bool isSelected;

  const _SizeOption({
    required this.size,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.red : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
