# Connect Fake Store

Connect Fake Store is a Dart package that provides controllers and services for interacting with a fake store's products and categories through an API.

## Getting started

### Installation

Add connect_fake_store to your pubspec.yaml file:

```yaml
dependencies:
  connect_fake_store: ^1.0.0
```

## Usage

### Initialize Controllers

To start using the package, initialize the controllers for products and categories:

```dart
import 'package:connect_fake_store/connect_fake_store.dart';

void main() {
  // Initialize the ConnectFakeStore instance
  ConnectFakeStore store = ConnectFakeStore();

  // Access the product controller
  ProductController productController = store.productController;

  // Access the category controller
  CategoryController categoryController = store.categoryController;
}
```

### Fetch Products

Fetch all products from the fake store:

```dart
import 'package:connect_fake_store/connect_fake_store.dart';

void fetchProducts() async {
  ConnectFakeStore store = ConnectFakeStore();
  List<ProductModel> products = [];
  
  try {
    // Fetch all products
    Either<List<ProductModel>, int> result = await store.productController.getAllProducts();
    
    result.fold(
      (left) {
        products = left;
        print('Fetched ${products.length} products');
      },
      (right) {
        print('Failed to fetch products. Error code: $right');
      }
    );
  } catch (e) {
    print('Error fetching products: $e');
  }
}
```

### Fetch Categories

Fetch all categories from the fake store:

```dart
import 'package:connect_fake_store/connect_fake_store.dart';

void fetchCategories() async {
  ConnectFakeStore store = ConnectFakeStore();
  List<CategoryModel> categories = [];
  
  try {
    // Fetch all categories
    Either<List<CategoryModel>, int> result = await store.categoryController.getAllCategories();
    
    result.fold(
      (left) {
        categories = left;
        print('Fetched ${categories.length} categories');
      },
      (right) {
        print('Failed to fetch categories. Error code: $right');
      }
    );
  } catch (e) {
    print('Error fetching categories: $e');
  }
}

```

## Documentation
- For more detailed examples and documentation, check out the [GitHub repository](https://github.com/sharfe25/connect_fake_store).

## License
This package is licensed under the MIT License. See the [LICENSE] (https://choosealicense.com/licenses/mit/) file for more details.