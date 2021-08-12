import 'package:flutter/material.dart';
import 'package:magalu_project/models/item.dart';
import 'package:magalu_project/provider/items.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Ofertas do dia"),
          leading:Image.asset("assets/logo.jpg"),
          bottom: PreferredSize(child: Image.asset("assets/linha.jpg"), preferredSize: Size(0, 0))
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          Item item = items.elementAt(index);
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5
            ),
            child: ListTile(
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      item.isFavorite = !item.isFavorite;
                    });
                  },
                  color: Colors.red,
                  icon: (item.isFavorite)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_outline)
              ),
              title: Row(
                  children: [
                    ClipRect(
                      child: Image.asset(
                        item.picture,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Expanded( child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2
                          ),
                          child: Text(
                            item.details,
                            style: TextStyle(
                                fontSize: 10
                            ),
                          ),
                        ),
                        Text(
                          "R\$ ${item.price.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue
                          ),
                        ),
                        Text(
                          "${item.parcels}x de R\$ ${item.fee} sem juros",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue
                          ),
                        ),
                      ],
                    ),
                    ),
                  ]
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
      backgroundColor: Colors.white,
    );
  }
}