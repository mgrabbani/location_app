import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:location_app/login_page.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({@required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String _name;
  LatLng _center ;
  Position currentPosition;
  Stream<QuerySnapshot> _iceCreamStores;

  int _uploadPeriod = 2;
  Timer timer;

  BitmapDescriptor myIcon;

  @override
  void initState() {
    super.initState();
    readRunnerName();
    _iceCreamStores = Firestore.instance
        .collection("ice_cream_stores")
        .orderBy('name')
        .snapshots();
    timer = Timer.periodic(Duration(seconds: _uploadPeriod * 60), (Timer t) => getUserLocation());
    getUserLocation();
  }

  readRunnerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Reading runner name from prefs");
    String name;
    name = (prefs.getString('name') ?? "");
    print("Runner name read from prefs: $name");
    if (name == "" && name == null) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => RunnerNameInput()));
    } else {
      _name = name;
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  getUserLocation() async {
    currentPosition = await locateUser();
    setState(() {
      _center = LatLng(currentPosition.latitude, currentPosition.longitude);
    });
    print('$_center');
    print('$_name');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMd().add_jms().format(now);
    print(formattedDate);

    Firestore.instance
        .collection("ice_cream_stores").document(_name).updateData(
        {
          'name': _name[0].toUpperCase() + _name.substring(1),
          'time': formattedDate,
          'latitude': currentPosition.latitude,
          'longitude': currentPosition.longitude,
        }
    );
  }

  Future<Position> locateUser() async {
    return Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        width: 250,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 100,
                child: DrawerHeader(
                  child: Text(
                    "Runners",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Akash",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      MarkerId("akash");
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Aminul",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pavel",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Mannan",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Ahad",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Omi",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Rabbani",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Faisal",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Nirjhor",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Selina",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Main",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Container(
                height: 50,
                child: Card(
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shipu",
                        style: TextStyle(
                            fontSize: 18),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: _iceCreamStores,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'),);
            }
            if (!snapshot.hasData) {
              return Center(child: Text('Loading...'),);
            }
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: const LatLng(45.534267, -122.830717),
                zoom: 12,
              ),
              myLocationEnabled: true,
              markers: snapshot.data.documents.map((document) => Marker(
                markerId: MarkerId(document['name']),
                icon: myIcon,
                position: LatLng(
                  document['latitude'],
                  document['longitude'],
                ),
                infoWindow: InfoWindow(
                  title: document['name'],
                  snippet: '@' + document['time'],
                ),
              )).toSet(),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          getUserLocation();
        },
        tooltip: 'Increment',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}

const _pinkHue = 350.0;

class StoreMap extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final LatLng initialPosition;

  const StoreMap({
    Key key,
    @required this.documents,
    @required this.initialPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: initialPosition,
            zoom: 12,
          ),
          myLocationEnabled: true,
          markers: documents
              .map((document) => Marker(
            markerId: MarkerId(document['name']),
            icon: BitmapDescriptor.defaultMarkerWithHue(_pinkHue),
            position: LatLng(
              document['latitude'],
              document['longitude'],
            ),
            infoWindow: InfoWindow(
              title: document['name'],
              snippet: // document['latitude'].toString() + ',' + document['longitude'].toString() +
              '@' + document['time'],
            ),
          )).toSet(),
        ),
      ],
    );
  }
}