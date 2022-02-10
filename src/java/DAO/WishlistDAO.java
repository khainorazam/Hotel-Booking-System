/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Wishlist;

/**
 *
 * @author khain
 */
public interface WishlistDAO {
    public void insertWishlist(Wishlist w);
    public void removeWishlist(Wishlist w);
}
