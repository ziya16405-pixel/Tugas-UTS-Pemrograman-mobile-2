import 'package:flutter/material.dart';

void main() {
  runApp(const FishStoreApp());
}

// ==============================
// MODEL DATA IKAN HIAS
// ==============================
class OrnamentalFish {
  final String id;
  final String name;
  final String scientificName;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final String difficulty; // Easy, Medium, Hard
  final String waterType; // Freshwater, Saltwater, Brackish
  final String size; // Small, Medium, Large
  final int stock;
  final double rating;

  OrnamentalFish({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.difficulty,
    required this.waterType,
    required this.size,
    required this.stock,
    required this.rating,
  });
}

// Data dummy ikan hias
final List<OrnamentalFish> fishList = [
  OrnamentalFish(
    id: '1',
    name: 'Koi',
    scientificName: 'Cyprinus rubrofuscus',
    description: 'Ikan koi Jepang dengan pola warna indah, simbol keberuntungan',
    price: 250000,
    imageUrl: 'https://cdn.pixabay.com/photo/2021/04/04/05/43/animal-6149183_960_720.jpg',
    category: 'Pond Fish',
    difficulty: 'Medium',
    waterType: 'Freshwater',
    size: 'Large',
    stock: 15,
    rating: 4.8,
  ),
  OrnamentalFish(
    id: '2',
    name: 'Molly',
    scientificName: 'Poecilia sphenops',
    description: 'Ikan kecil yang mudah dipelihara, cocok untuk pemula',
    price: 15000,
    imageUrl: 'https://cdn.pixabay.com/photo/2018/03/10/18/34/fishy-3214876_1280.jpg',
    category: 'Community Fish',
    difficulty: 'Easy',
    waterType: 'Freshwater',
    size: 'Small',
    stock: 50,
    rating: 4.3,
  ),
  OrnamentalFish(
    id: '3',
    name: 'Arwana',
    scientificName: 'Scleropages formosus',
    description: 'Ikan naga, simbol kemakmuran dan status',
    price: 5000000,
    imageUrl: 'https://cdn.pixabay.com/photo/2024/09/30/23/32/fish-9086899_1280.jpg',
    category: 'Premium Fish',
    difficulty: 'Hard',
    waterType: 'Freshwater',
    size: 'Large',
    stock: 3,
    rating: 4.9,
  ),
  OrnamentalFish(
    id: '4',
    name: 'Cupang',
    scientificName: 'Betta splendens',
    description: 'Ikan cupang dengan sirip indah, dikenal sebagai fighting fish',
    price: 75000,
    imageUrl: 'https://cdn.pixabay.com/photo/2021/08/13/07/10/fish-6542424_640.jpg',
    category: 'Betta',
    difficulty: 'Easy',
    waterType: 'Freshwater',
    size: 'Small',
    stock: 35,
    rating: 4.5,
  ),
  OrnamentalFish(
    id: '5',
    name: 'Discus',
    scientificName: 'Symphysodon',
    description: 'Raja akuarium air tawar dengan warna menakjubkan',
    price: 350000,
    imageUrl: 'https://cdn.pixabay.com/photo/2016/12/31/21/22/discus-fish-1943755_1280.jpg',
    category: 'Premium Fish',
    difficulty: 'Hard',
    waterType: 'Freshwater',
    size: 'Medium',
    stock: 12,
    rating: 4.7,
  ),
  OrnamentalFish(
    id: '6',
    name: 'Goldfish',
    scientificName: 'Carassius auratus',
    description: 'Ikan mas koki klasik dengan berbagai variasi',
    price: 45000,
    imageUrl: 'https://cdn.pixabay.com/photo/2014/06/08/19/45/goldfish-365083_1280.jpg',
    category: 'Coldwater Fish',
    difficulty: 'Easy',
    waterType: 'Freshwater',
    size: 'Medium',
    stock: 40,
    rating: 4.4,
  ),
  OrnamentalFish(
    id: '7',
    name: 'Clownfish',
    scientificName: 'Amphiprioninae',
    description: 'Ikan badut yang populer dari film Finding Nemo',
    price: 185000,
    imageUrl: 'https://cdn.pixabay.com/photo/2017/04/19/09/32/fish-2241634_960_720.jpg',
    category: 'Marine Fish',
    difficulty: 'Medium',
    waterType: 'Saltwater',
    size: 'Small',
    stock: 20,
    rating: 4.7,
  ),
  OrnamentalFish(
    id: '8',
    name: 'Guppy',
    scientificName: 'Poecilia reticulata',
    description: 'Ikan guppy dengan ekor warna-warni, mudah berkembang biak',
    price: 10000,
    imageUrl: 'https://cdn.pixabay.com/photo/2019/08/30/01/24/water-tank-4440191_1280.jpg',
    category: 'Livebearers',
    difficulty: 'Easy',
    waterType: 'Freshwater',
    size: 'Small',
    stock: 100,
    rating: 4.2,
  ),
  OrnamentalFish(
    id: '9',
    name: 'Neon Tetra',
    scientificName: 'Paracheirodon innesi',
    description: 'Ikan kecil dengan garis neon biru dan merah yang cerah',
    price: 12000,
    imageUrl: 'https://cdn.pixabay.com/photo/2021/02/14/19/49/neon-tetra-6015626_1280.jpg',
    category: 'Schooling Fish',
    difficulty: 'Easy',
    waterType: 'Freshwater',
    size: 'Small',
    stock: 80,
    rating: 4.5,
  ),
];

// ==============================
// WIDGET KARTU IKAN HIAS
// ==============================
class OrnamentalFishCard extends StatelessWidget {
  final OrnamentalFish fish;
  final VoidCallback onAddToCart;

  const OrnamentalFishCard({
    Key? key,
    required this.fish,
    required this.onAddToCart,
  }) : super(key: key);

  Color getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case 'Easy':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color getWaterTypeColor(String waterType) {
    switch (waterType) {
      case 'Freshwater':
        return Colors.blue;
      case 'Saltwater':
        return Colors.purple;
      case 'Brackish':
        return Colors.brown;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar Ikan
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(fish.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),

                // Info Ikan
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              fish.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                fish.rating.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        fish.scientificName,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      
                      // Badges
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: getDifficultyColor(fish.difficulty).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              fish.difficulty,
                              style: TextStyle(
                                color: getDifficultyColor(fish.difficulty),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: getWaterTypeColor(fish.waterType).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              fish.waterType,
                              style: TextStyle(
                                color: getWaterTypeColor(fish.waterType),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              fish.size,
                              style: const TextStyle(
                                color: Colors.teal,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      Text(
                        fish.description,
                        style: const TextStyle(fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            // Footer dengan harga dan stock
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp ${fish.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.inventory, size: 14, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          'Stock: ${fish.stock}',
                          style: TextStyle(
                            fontSize: 12,
                            color: fish.stock > 10 ? Colors.green : Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                ElevatedButton.icon(
                  onPressed: fish.stock > 0 ? onAddToCart : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(Icons.shopping_bag, size: 18),
                  label: Text(
                    fish.stock > 0 ? 'Tambah' : 'Habis',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==============================
// WIDGET KERANJANG
// ==============================
class CartBottomSheet extends StatelessWidget {
  final List<OrnamentalFish> cartItems;
  final double totalPrice;
  final Function(OrnamentalFish) onRemove;
  final VoidCallback onCheckout;

  const CartBottomSheet({
    Key? key,
    required this.cartItems,
    required this.totalPrice,
    required this.onRemove,
    required this.onCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '🛒 Keranjang Belanja',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${cartItems.length} item',
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          if (cartItems.isEmpty)
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Keranjang masih kosong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tambahkan ikan hias favorit Anda',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final fish = cartItems[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(fish.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        fish.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            'Rp ${fish.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            fish.category,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        onPressed: () => onRemove(fish),
                      ),
                    ),
                  );
                },
              ),
            ),
          
          if (cartItems.isNotEmpty) ...[
            const Divider(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      'Termasuk pajak dan pengiriman',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  'Rp ${totalPrice.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.teal),
                    ),
                    child: const Text(
                      'Lanjut Belanja',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onCheckout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Checkout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// ==============================
// HALAMAN UTAMA
// ==============================
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['Semua', 'Premium Fish', 'Community Fish', 'Betta', 'Marine Fish'];
  String selectedCategory = 'Semua';
  List<OrnamentalFish> cartItems = [];
  String searchQuery = '';

  List<OrnamentalFish> get filteredFish {
    List<OrnamentalFish> filtered = fishList;
    
    // Filter kategori
    if (selectedCategory != 'Semua') {
      filtered = filtered.where((fish) => fish.category == selectedCategory).toList();
    }
    
    // Filter pencarian
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((fish) =>
        fish.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
        fish.scientificName.toLowerCase().contains(searchQuery.toLowerCase()) ||
        fish.description.toLowerCase().contains(searchQuery.toLowerCase())
      ).toList();
    }
    
    return filtered;
  }

  void addToCart(OrnamentalFish fish) {
    if (fish.stock <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${fish.name} sudah habis'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    setState(() {
      cartItems.add(fish);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${fish.name} ditambahkan ke keranjang'),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void removeFromCart(OrnamentalFish fish) {
    setState(() {
      cartItems.remove(fish);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${fish.name} dihapus dari keranjang'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  double getTotalPrice() {
    return cartItems.fold(0, (total, fish) => total + fish.price);
  }

  void checkout() {
    if (cartItems.isEmpty) return;
    
    final total = getTotalPrice();
    Navigator.pop(context);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 10),
            Text('Pesanan Berhasil!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Terima kasih telah berbelanja di AquaStore!'),
            const SizedBox(height: 15),
            for (var fish in cartItems)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: NetworkImage(fish.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fish.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('Rp ${fish.price.toStringAsFixed(0)}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rp ${total.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Pesanan akan diproses dalam 1x24 jam',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
              Navigator.pop(context);
            },
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🐠 AquaStore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 3,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => CartBottomSheet(
                      cartItems: cartItems,
                      totalPrice: getTotalPrice(),
                      onRemove: removeFromCart,
                      onCheckout: checkout,
                    ),
                  );
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      cartItems.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal.shade50, Colors.blue.shade50],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Toko Ikan Hias Terlengkap',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Kualitas premium • Garansi hidup • Gratis konsultasi',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.teal.shade700,
                  ),
                ),
                const SizedBox(height: 15),
                
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Cari ikan hias...',
                      prefixIcon: Icon(Icons.search, color: Colors.teal),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Kategori Filter
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            height: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 4),
                  child: Text(
                    'Kategori:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          selectedColor: Colors.teal,
                          labelStyle: TextStyle(
                            color: selectedCategory == category
                                ? Colors.white
                                : Colors.blueGrey,
                            fontWeight: FontWeight.w500,
                          ),
                          onSelected: (selected) {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Info Keranjang
          if (cartItems.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.teal.withOpacity(0.1),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag, color: Colors.teal.shade700),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '${cartItems.length} ikan dalam keranjang',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Text(
                    'Rp ${getTotalPrice().toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),

          // List Ikan
          Expanded(
            child: filteredFish.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.filter_vintage,
                          size: 80,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ikan tidak ditemukan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Coba kata kunci atau kategori lain',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredFish.length,
                    itemBuilder: (context, index) {
                      final fish = filteredFish[index];
                      return OrnamentalFishCard(
                        fish: fish,
                        onAddToCart: () => addToCart(fish),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: cartItems.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => CartBottomSheet(
                    cartItems: cartItems,
                    totalPrice: getTotalPrice(),
                    onRemove: removeFromCart,
                    onCheckout: checkout,
                  ),
                );
              },
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.shopping_cart_checkout),
              label: Text('${cartItems.length}'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            )
          : null,
    );
  }
}

// ==============================
// APLIKASI UTAMA
// ==============================
class FishStoreApp extends StatelessWidget {
  const FishStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AquaStore - Toko Ikan Hias',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}