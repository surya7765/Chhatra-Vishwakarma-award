import 'package:flutter/material.dart';
import 'package:vishwakarma/screen/cart.dart';
import 'package:vishwakarma/screen/objects.dart';

class BuyProducts extends StatefulWidget {
  BuyProducts({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BuyProductsState createState() => _BuyProductsState();
}

class _BuyProductsState extends State<BuyProducts> {
  List<Dish> _dishes = List<Dish>();

  List<Dish> _cartList = List<Dish>();

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Products"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      body: _buildGridView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _dishes.length,
      itemBuilder: (context, index) {
        var item = _dishes[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: Card(
            elevation: 4.0,
            child: ListTile(
              leading: Image.network(item.urls),
              title: Text(item.name),
              trailing: GestureDetector(
                child: (!_cartList.contains(item))
                    ? Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item))
                      _cartList.add(item);
                    else
                      _cartList.remove(item);
                  });
                },
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        (item.urls == null)
                            ? "https://cdn.shopify.com/s/files/1/0148/5482/products/dr-trust-usa-glucose-monitor-glucometer-sugar-check-test-10-strips-113-14973940072494_592x592.jpg?v=1617185294"
                            : item.urls,
                        height: 80.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: (!_cartList.contains(item))
                            ? Icon(
                                Icons.add_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                        onTap: () {
                          setState(() {
                            if (!_cartList.contains(item))
                              _cartList.add(item);
                            else
                              _cartList.remove(item);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'BP checker',
        urls:
            "https://images-na.ssl-images-amazon.com/images/I/81eIfnfHiIL._SX679_.jpg",
        color: Colors.amber,
      ),
      Dish(
        name: 'Otoscope',
        urls:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjqyQIL6f-vcpIDnyNqy1briyoxy-t8ocs9g&usqp=CAU",
        color: Colors.deepOrange,
      ),
      Dish(
        name: 'Thermometer',
        urls:
            "https://cdn.shopify.com/s/files/1/0293/6432/2403/products/IR-988-2_540x.jpg?v=1617963165",
        color: Colors.brown,
      ),
      Dish(
        name: 'Stethoscope',
        urls:
            "https://images-na.ssl-images-amazon.com/images/I/41GNQYs04DL.jpg",
        color: Colors.green,
      ),
      Dish(
        name: 'surgical blades',
        urls:
            "https://st2.depositphotos.com/1177973/12276/i/950/depositphotos_122761106-stock-photo-flat-lay-of-medical-instruments.jpg",
        color: Colors.purple,
      ),
      Dish(
        name: 'Glucometer',
        urls:
            "https://cdn.shopify.com/s/files/1/0148/5482/products/dr-trust-usa-glucose-monitor-glucometer-sugar-check-test-10-strips-113-14973940072494_592x592.jpg?v=1617185294",
        color: Colors.blueGrey,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}
