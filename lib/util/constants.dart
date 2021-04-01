import 'package:flutter/material.dart';

// App Design Constants
const kPrimaryColor = Color(0xFF00C569);

const kGreyColor = Color(0xFF929292);

const kLightGreyColor = Color(0xFFEEEEEE);

const kBorderColor = Color(0xFFEBEBEB);

const kCursorHeight = 22.0;

const kButtonBorderRadius = 6.0;

const kButtonBorderColor = Color(0xFF475993);

const kPaddingContent = 16.0;

const kListTilePadding = 8.0;

const kIconSize = 15.0;

const kTileHeight = 50.0;
const kProgressColor = Colors.black87;
const kTodoColor = Color(0xffd1d2d7);

// SQLite DB
final String tableCartProduct = 'cartProduct';

final String columnProductId = 'productId';
final String columnName = 'name';
final String columnImage = 'image';
final String columnQuantity = 'quantity';
final String columnPrice = 'price';

// Shared Preferences
const String CACHED_USER_DATA = 'user';

// Enums
enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}

enum Delivery {
  StandardDelivery,
  NextDayDelivery,
  NominatedDelivery,
}
