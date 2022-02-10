/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.HelpCenter;

/**
 *
 * @author khain
 */
public interface HelpCenterDAO {
    public void message(HelpCenter h);
    public void reply(HelpCenter h);
}
