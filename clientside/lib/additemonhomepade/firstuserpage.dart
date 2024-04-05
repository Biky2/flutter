import 'package:flutter/material.dart';

class Pickcard extends StatelessWidget {
  final String name;
  final double price;
  final String offertag;
  final String imgurl;
  final Function press;
  const Pickcard({
    super.key,
    required this.name,
    required this.price,
    required this.imgurl,
    required this.offertag,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                // 'https://pbs.twimg.com/profile_images/572395168905457664/lCtqj0ak_400x400.jpeg',
                imgurl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Rs: $price',
                style: TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
                child: Text(
                  '$offertag % off',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
