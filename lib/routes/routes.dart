import 'package:flutter/material.dart';
import 'package:pcn_erp/screens/home.dart';
import 'package:pcn_erp/screens/hymnal/rch/hymnlist.dart';

const String homeRoute = '/';

const String hymnRoute = '/hymnrch';
const String pcCv = '/pcCV';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{//
  homeRoute: (BuildContext context) => MyHomePage(),
  hymnRoute: (BuildContext context) => RchApp(),
    
        // When navigating to the "/" route, build the FirstScreen widget.
       
   
  //hymnRoute: (BuildContext context) => PcHome(),
};
