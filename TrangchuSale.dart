import 'package:flutter/material.dart';

class Trangchusale extends StatefulWidget {
  const Trangchusale({super.key});

  @override
  State<Trangchusale> createState() => TrangchusaleState();
}

class TrangchusaleState extends State<Trangchusale> {
  int _currentIndex = 0; // Biến để lưu chỉ mục được chọn
  int _selectedTab = 0; // Biến để lưu trạng thái của tab được chọn

  final List<Product> products = [
    Product(
      title: "Quả Bóng Da Size 7 Li-Ning Badfive",
      imageUrl: 'assets/images/1.jpg',
      originalPrice: "1.190.000",
      discountPrice: "595.000",
      sale: "Sale 50%",
    ),
    Product(
      title: "Quả Bóng Da Size 5 Li-Ning Badfive",
      imageUrl: 'assets/images/2.jpg',
      originalPrice: "2.500.000",
      discountPrice: "1.875.000",
      sale: "Sale 25%",
    ),
    Product(
      title: "Quả Bóng Da Size 6 Badfive",
      imageUrl: 'assets/images/3.jpg',
      originalPrice: "1.200.000",
      discountPrice: "720.000",
      sale: "Sale 40%",
    ),
    Product(
      title: "Quả Bóng Da Size 7 Li-Ning Badfive",
      imageUrl: 'assets/images/4.jpg',
      originalPrice: "2.000.000",
      discountPrice: "1.200.000",
      sale: "Sale 60%",
    ),
  ];

  @override
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
                            // Thực hiện hành động khi nhấn vào icon giỏ hàng
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
                  const SizedBox(height: 5),
                  const Text(
                    'Welcome to the Basketball store',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Tabs (All, New, Run, Sale)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterTab(
                  title: "All",
                  isSelected: _selectedTab == 0,
                  onTap: () {
                    setState(() {
                      _selectedTab = 0;
                    });
                  },
                ),
                FilterTab(
                  title: "New",
                  isSelected: _selectedTab == 1,
                  onTap: () {
                    setState(() {
                      _selectedTab = 1;
                    });
                  },
                ),
                FilterTab(
                  title: "Run",
                  isSelected: _selectedTab == 2,
                  onTap: () {
                    setState(() {
                      _selectedTab = 2;
                    });
                  },
                ),
                FilterTab(
                  title: "Sale",
                  isSelected: _selectedTab == 3,
                  onTap: () {
                    setState(() {
                      _selectedTab = 3;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Product grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: products.length, // Số lượng sản phẩm
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  imageUrl: product.imageUrl,
                  title: product.title,
                  originalPrice: product.originalPrice,
                  discountPrice: product.discountPrice,
                  sale: product.sale,
                );
              },
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
        ),
      ),
    );
  }
}

// Tab Button Component
class FilterTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTab({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.red : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Text(title),
    );
  }
}

// Product class to hold product information
class Product {
  final String title;
  final String imageUrl;
  final String originalPrice;
  final String discountPrice;
  final String sale;

  Product({
    required this.title,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountPrice,
    required this.sale,
  });
}

// Product Card Component
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String originalPrice;
  final String discountPrice;
  final String sale; // Thêm thuộc tính cho sale

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.discountPrice,
    required this.sale, // Khởi tạo sale
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Ảnh sản phẩm
              Expanded(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              // Nhãn Sale nếu có
              if (sale.isNotEmpty) Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    sale,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Giá gốc: $originalPrice",
              style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Giảm giá: $discountPrice",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.red,
              ),
            ),
          ),
        ],
      )
    );
  }
}

