part of '../utilities.dart';

Future<bool> isConnected() async => await DataConnectionChecker().hasConnection;
