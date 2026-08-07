package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    // Stores menuId as Key and CartItem as Value
    private Map<Integer, CartItem> items;

    // Constructor
    public Cart() {
        items = new HashMap<>();
    }

    // Getter
    public Map<Integer, CartItem> getItems() {
        return items;
    }

    // ===========================
    // Add Item to Cart
    // ===========================

    public void addItem(CartItem cartItem) {

        int menuId = cartItem.getMenuid();

        if (items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQty(
                    existingItem.getQty() + cartItem.getQty());

        } else {

            items.put(menuId, cartItem);

        }
    }

    // ===========================
    // Update Quantity
    // ===========================

    public void updateItem(int menuId, int qty) {

        if (items.containsKey(menuId)) {

            if (qty > 0) {

                items.get(menuId).setQty(qty);

            } else {

                items.remove(menuId);

            }
        }
    }

    // ===========================
    // Increase Quantity
    // ===========================

    public void increaseQty(int menuId) {

        if (items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            item.setQty(item.getQty() + 1);

        }
    }

    // ===========================
    // Decrease Quantity
    // ===========================

    public void decreaseQty(int menuId) {

        if (items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            if (item.getQty() > 1) {

                item.setQty(item.getQty() - 1);

            } else {

                items.remove(menuId);

            }
        }
    }

    // ===========================
    // Remove Item
    // ===========================

    public void removeItem(int menuId) {

        items.remove(menuId);

    }

    // ===========================
    // Clear Entire Cart
    // ===========================

    public void clearCart() {

        items.clear();

    }

    // ===========================
    // Total Number of Items
    // ===========================

    public int getTotalItems() {

        int total = 0;

        for (CartItem item : items.values()) {

            total += item.getQty();

        }

        return total;
    }

    // ===========================
    // Check Cart Empty
    // ===========================

    public boolean isEmpty() {

        return items.isEmpty();

    }

}