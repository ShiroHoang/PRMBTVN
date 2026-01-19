import 'dart:async';

class Product {
  final int productID;
  final String productName;
  final int quantity;
  final double price;

  Product({
    required this.productID,
    required this.productName,
    required this.quantity,
    required this.price,
  });

  @override
  String toString() {
    return 'Product(productID: $productID, productName: $productName, quantity: $quantity, price: $price)';
  }
}

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Stream<Product> liveProductStream();
}

class ProductRepositoryImpl implements ProductRepository {
  final List<Product> _products = [
    Product(productID: 1, productName: 'Laptop', quantity: 10, price: 1500),
    Product(productID: 2, productName: 'Mouse', quantity: 50, price: 25),
  ];

  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(Duration(seconds: 1)); // simulate latency
    return _products;
  }

  @override
  Stream<Product> liveProductStream() {
    return _controller.stream;
  }

  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product); // emit to stream
  }

  void dispose() {
    _controller.close();
  }
}

void main() async {
  final repository = ProductRepositoryImpl();

  print(' --- Fetching product list --- ');
  final products = await repository.getProducts();
  for (var p in products) {
    print(p);
  }

  print('\n --- Listening for live product updates --- ');
  repository.liveProductStream().listen((product) {
    print('Live update: $product');
  });
  await Future.delayed(Duration(seconds: 2));
  repository.addProduct(
    Product(productID: 3, productName: 'Keyboard', quantity: 20, price: 45),
  );

  await Future.delayed(Duration(seconds: 2));
  repository.addProduct(
    Product(productID: 4, productName: 'Monitor', quantity: 15, price: 300),
  );

  await Future.delayed(Duration(seconds: 1));
  repository.dispose();
}
