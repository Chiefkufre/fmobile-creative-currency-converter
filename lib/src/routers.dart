import 'package:flutter/material.dart';
import 'package:test/currency_converter.dart';
// import 'package:test/music.dart';

import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: CurrencyConverterHome(),
        ),
    "/settings": (_) => const MaterialPage(
          child: Placeholder(),
        ),
  },
);
