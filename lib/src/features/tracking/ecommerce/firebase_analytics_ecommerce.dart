import 'package:firebase_analytics/firebase_analytics.dart';

import '../tracking.dart';

extension AnalyticsEventItemFromEcommerceItem on EcommerceItem {
  AnalyticsEventItem get toAnalytics => AnalyticsEventItem(
        itemId: itemId,
        itemName: itemName,
        itemListId: itemListId,
        itemListName: itemListName,
        itemCategory: itemCategory,
      );
}

class FirebaseAnalyticsEcommerce with Ecommerce {
  FirebaseAnalyticsEcommerce({
    this.analytics,
    AnalyticsEventItem Function(EcommerceItem item)? mapper,
  }) : mapper = defaultMapper;

  static AnalyticsEventItem defaultMapper(EcommerceItem item) =>
      item.toAnalytics;

  factory FirebaseAnalyticsEcommerce.tryInit() {
    FirebaseAnalytics? analytics;
    try {
      analytics = FirebaseAnalytics.instance;
    } catch (e) {
      Log.error(e);
      analytics = null;
    }
    return FirebaseAnalyticsEcommerce(analytics: analytics);
  }

  final FirebaseAnalytics? analytics;
  final AnalyticsEventItem Function(EcommerceItem item) mapper;

  @override
  void logSelectItem({
    String? itemListId,
    String? itemListName,
    List<EcommerceItem>? items,
  }) {
    analytics?.logSelectItem(
      itemListId: itemListId,
      itemListName: itemListName,
      items: items?.map(mapper).toList(growable: false),
    );
  }

  @override
  void logViewItemList({
    String? itemListId,
    String? itemListName,
    List<EcommerceItem>? items,
  }) {
    analytics?.logViewItemList(
      itemListId: itemListId,
      itemListName: itemListName,
      items: items?.map(mapper).toList(growable: false),
    );
  }
}
