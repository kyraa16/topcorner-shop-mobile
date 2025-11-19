import 'package:flutter/material.dart';
import 'package:topcorner_shop/models/product_entry.dart';
import 'package:topcorner_shop/widgets/left_drawer.dart';
import 'package:topcorner_shop/screens/product_detail.dart';
import 'package:topcorner_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool initialShowAll;
  
  const ProductEntryListPage({
    super.key, 
    this.initialShowAll = true,  // Default ke All Products
  });

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  // State untuk filter
  late bool showAllProducts;

  @override
  void initState() {
    super.initState();
    // Set initial filter dari parameter
    showAllProducts = widget.initialShowAll;
  }
  
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // endpoint berdasarkan filter
    final url = showAllProducts
        ? 'http://localhost:8000/json/' // All products
        : 'http://localhost:8000/json/my-products/'; // My products only

    final response = await request.get(url);

    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Column(
        children: [
          // Filter Toggle Section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[100],
            child: Row(
              children: [
                const Text(
                  'Filter:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment<bool>(
                        value: true,
                        label: Text('All Products'),
                      ),
                      ButtonSegment<bool>(
                        value: false,
                        label: Text('My Products'),
                      ),
                    ],
                    selected: {showAllProducts},
                    onSelectionChanged: (Set<bool> newSelection) {
                      setState(() {
                        showAllProducts = newSelection.first;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Product List Section
          Expanded(
            child: FutureBuilder(
              // Key untuk force rebuild ketika filter berubah
              key: ValueKey(showAllProducts),
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 60,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          showAllProducts
                              ? 'No products available yet.'
                              : 'You haven\'t added any products yet.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      setState(() {});
                    },
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
