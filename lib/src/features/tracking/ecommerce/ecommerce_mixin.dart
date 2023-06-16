import 'ecommerce.dart';

mixin Ecommerce {
  void logViewItemList({
    String? itemListId,
    String? itemListName,
    List<EcommerceItem>? items,
  });

  void logSelectItem({
    String? itemListId,
    String? itemListName,
    List<EcommerceItem>? items,
  });
}