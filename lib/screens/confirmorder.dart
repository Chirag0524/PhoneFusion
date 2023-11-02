import 'dart:math';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  static const routeName = '/ConfirmationScreen';
  final String orderTrackingId;

  ConfirmationScreen({required this.orderTrackingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Your order is confirmed!',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            Text(
              'Order Tracking ID: $orderTrackingId',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Other details will be shared via email',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
