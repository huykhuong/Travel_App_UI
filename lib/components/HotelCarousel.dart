import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/hotel_model.dart';
import 'package:flutter_travel_ui_starter/constants.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Exclusive Hotels',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => print('yo'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15.0),
          height: 300.0,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int i) {
              return Container(
                width: 240.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 120.0,
                        width: 230.0,
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${hotels[i].name}',
                                style: kPlaceTitle,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                '${hotels[i].address}',
                                style: kSupportingText,
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text('\$${hotels[i].price} / night')
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [BoxShadow(
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                          color: Colors.black26,
                        )],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 210.0,
                          image: AssetImage('${hotels[i].imageUrl}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: hotels.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
