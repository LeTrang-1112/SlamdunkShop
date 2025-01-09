import 'package:flutter/material.dart';


class Mhc extends StatefulWidget {
  const Mhc({super.key});

  @override
  State<Mhc> createState() => MhcState();
}

class MhcState extends State<Mhc> {
  int _currentIndex = 0; // Biến để lưu chỉ mục của tab được chọn
  int _selectedTab = 0; // Biến để lưu trạng thái của tab hiện tại

  // Danh sách các sản phẩm với các thông tin như giá, giảm giá và loại sản phẩm
  final List<Product> products = [
    Product(
      title: "Quả Bóng Da Size 7 Li-Ning Badfive",
      price: "1.190.000",
      discount: null, // Sản phẩm không có giảm giá
      type: ProductType.regular, // Sản phẩm bình thường
    ),
    Product(
      title: "Quả Bóng Da Size 5 Li-Ning Badfive",
      price: "1.500.000",
      discount: null, // Sản phẩm không có giảm giá
      type: ProductType.regular,
    ),
    Product(
      title: "Quả Bóng Da Size 4 Li-Ning Badfive",
      price: "1.250.000",
      discount: "1.119.000", // Sản phẩm có giảm giá
      type: ProductType.sale,
    ),
    Product(
      title: "Quả Bóng Da Size 6 Li-Ning Badfive",
      price: "950.000",
      discount: null, // Sản phẩm không có giảm giá
      type: ProductType.regular,
    ),
    Product(
      title: "Quả Bóng Da Size 7 Li-Ning Badfive",
      price: "2.000.000",
      discount: null, // Sản phẩm không có giảm giá
      type: ProductType.regular,
    ),
    Product(
      title: "Quả Bóng Da Size 6 Li-Ning Badfive",
      price: "1.800.000",
      discount: null, // Sản phẩm không có giảm giá
      type: ProductType.newProduct, // Sản phẩm mới
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Lọc các sản phẩm theo tab hiện tại
    List<Product> filteredProducts = [];
    if (_selectedTab == 0) {
      filteredProducts = products; // Hiển thị tất cả sản phẩm
    } else if (_selectedTab == 1) {
      filteredProducts = products.where((product) => product.type == ProductType.newProduct).toList();
    } else if (_selectedTab == 2) {
      filteredProducts = products.where((product) => product.type == ProductType.run).toList();
    } else if (_selectedTab == 3) {
      filteredProducts = products.where((product) => product.type == ProductType.sale).toList();
    }

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
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
          // Thanh tìm kiếm
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
          // Các tab (Tất cả, Mới, Bán chạy, Giảm giá)
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
                      _selectedTab = 0; // Khi nhấn "All", hiển thị tất cả sản phẩm
                    });
                  },
                ),
                FilterTab(
                  title: "New",
                  isSelected: _selectedTab == 1,
                  onTap: () {
                    setState(() {
                      _selectedTab = 1; // Khi nhấn "New", chỉ hiển thị sản phẩm mới
                    });
                  },
                ),
                FilterTab(
                  title: "Run",
                  isSelected: _selectedTab == 2,
                  onTap: () {
                    setState(() {
                      _selectedTab = 2; // Khi nhấn "Run", hiển thị sản phẩm bán chạy
                    });
                  },
                ),
                FilterTab(
                  title: "Sale",
                  isSelected: _selectedTab == 3,
                  onTap: () {
                    setState(() {
                      _selectedTab = 3; // Khi nhấn "Sale", chỉ hiển thị sản phẩm giảm giá
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Hiển thị các sản phẩm dưới dạng lưới
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredProducts.length, // Sử dụng danh sách sản phẩm đã lọc
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ProductCard(
                  imageUrl: 'assets/images/${index + 1}.jpg', // Đường dẫn đến ảnh sản phẩm
                  title: product.title,
                  price: product.price,
                  discount: product.discount,
                  type: product.type,
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

// Component nút Tab lọc
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

// Enum để phân biệt các loại sản phẩm
enum ProductType {
  regular,  // Sản phẩm bình thường
  sale,     // Sản phẩm giảm giá
  newProduct,  // Sản phẩm mới
  run,      // Sản phẩm bán chạy
}

// Lớp để lưu trữ thông tin của một sản phẩm
class Product {
  final String title;
  final String price;
  final String? discount;
  final ProductType type;

  Product({
    required this.title,
    required this.price,
    this.discount,
    required this.type,
  });
}

// Component để hiển thị thông tin của mỗi sản phẩm
class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String? discount;
  final ProductType type;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.discount,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tính toán phần trăm giảm giá
    double discountPercentage = 0.0;
    if (discount != null) {
      double originalPrice = double.tryParse(price.replaceAll(',', '').replaceAll('.', '')) ?? 0;
      double discountedPrice = double.tryParse(discount!.replaceAll(',', '').replaceAll('.', '')) ?? 0;
      if (originalPrice > 0 && discountedPrice > 0) {
        discountPercentage = ((originalPrice - discountedPrice) / originalPrice) * 100;
      }
    }

    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
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
                  "Giá gốc: $price", // Hiển thị giá gốc của sản phẩm
                  style: TextStyle(
                    fontSize: 12,
                    decoration: discount != null
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              if (discount != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Giảm giá: $discount", // Hiển thị giá sau khi giảm
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
          // Nếu có giảm giá, hiển thị phần trăm giảm giá
          if (discount != null)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${discountPercentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          // Nếu là sản phẩm mới, hiển thị nhãn "New"
          if (type == ProductType.newProduct)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  'New',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
