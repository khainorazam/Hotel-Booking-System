/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.User;
import java.util.List;

public interface UserDAO {
    public void register(User u);
    public void update(User u);
}


