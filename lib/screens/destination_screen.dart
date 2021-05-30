import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/constants.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_travel_ui_starter/components/startTimeWidget.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen(this.destination);

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0)
                  ],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.sort),
                          iconSize: 30.0,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.destination.city}',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '${widget.destination.country}',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.add_location,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (BuildContext context, int i) {
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 0.0, 20.0, 7.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 120.0,
                                child: Text(
                                  '${widget.destination.activities[i].name}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: kActivityTitle,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '\$${widget.destination.activities[i].price}',
                                    style: kActivityTitle,
                                  ),
                                  Text(
                                    'per pax',
                                    style: kSupportingText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            '${widget.destination.activities[i].type}',
                            style: kSupportingText,
                          ),
                          Destination.buildStars(
                              widget.destination.activities[i].rating),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              StartTimeWidget(widget
                                  .destination.activities[i].startTimes[0]),
                              SizedBox(
                                width: 10.0,
                              ),
                              StartTimeWidget(widget
                                  .destination.activities[i].startTimes[1]),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 15.0,
                      left: 20.0,
                      top: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                              widget.destination.activities[i].imageUrl),
                         fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: widget.destination.activities.length,
            ),
          ),
        ],
      ),
    );
  }
}
