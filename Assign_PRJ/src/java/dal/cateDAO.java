/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author DELL
 */
public class cateDAO extends MyDAO{
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        xSql = "select * from category";
        try {
            ps = conn.prepareStatement(xSql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cid"), rs.getString("cname")));
                }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        cateDAO dao = new cateDAO();
        List<Category> list = dao.getAllCategory();
        for (Category c : list) {
            System.out.println(c.getCname());
        }
    }
}
