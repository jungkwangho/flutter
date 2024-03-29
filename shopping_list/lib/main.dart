import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget{
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key:ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart?Colors.black54:Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if(!inCart) return null;
    return const TextStyle(
      color: Colors.black54,
      decoration:  TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context),),
    );
  }
}

class ShoppingList extends StatefulWidget{
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _StateShoppingList();
}

class _StateShoppingList extends State<ShoppingList>{

  final _shoppinCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart){
    setState((){
      if (!inCart){
        _shoppinCart.add(product);
      }else{
        _shoppinCart.remove(product);
      }
    });
  }

  @override
  void initState(){
    print("initState is called just once when an State instance created");
    super.initState();
  }

  @override
  void dispose(){
    print("initState is called just once when an State instance isn't needed anymore");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build is called when an State instance created or setState called");
    return Scaffold(
      appBar: AppBar(title: const Text("Shopping List")),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product){
          return ShoppingListItem(
            product: product, 
            inCart: _shoppinCart.contains(product), 
            onCartChanged: _handleCartChanged);
        }).toList(),
      ),
    );
  }

}

void main() {
  runApp(
    const MaterialApp(
      title: "Shopping App",
      home:  ShoppingList(
            products: [Product(name:'apple'), Product(name:'banana'), Product(name:'avocado')]
          ),
        ),
    );
}