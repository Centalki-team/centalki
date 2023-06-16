class EcommerceItem {
  EcommerceItem({
    this.itemId,
    this.itemListId,
    this.itemListName,
    this.itemName,
    this.itemCategory,
  });

  /// The ID of the item.
  /// One of [itemId] or [itemName] is required.
  /// e.g. SKU_12345
  final String? itemId;

  /// The ID of the list in which the item was presented to the user.
  /// e.g. related_products
  final String? itemListId;

  /// The name of the list in which the item was presented to the user.
  /// e.g. Related products
  final String? itemListName;

  /// The name of the item.
  /// One of [itemId] or [itemName] is required.
  /// e.g. Stan and Friends Tee
  final String? itemName;

  /// The category of the item. If used as part of a category hierarchy or
  /// taxonomy then this will be the first category.
  /// e.g. Apparel
  final String? itemCategory;
}
