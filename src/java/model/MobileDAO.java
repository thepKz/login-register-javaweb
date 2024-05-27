package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import utils.DBUtils;

public class MobileDAO {
    public List<Mobile> searchDeviceByIdOrName(String idOrName) {
        System.out.println("searchDEV CHECK");
        List<Mobile> list = new ArrayList<>();
        String sql = "SELECT * FROM tbl_Mobile WHERE mobileId LIKE ? OR mobileName LIKE ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + idOrName + "%"); // Luôn tìm kiếm gần đúng theo ID
            stmt.setString(2, "%" + idOrName + "%"); // Luôn tìm kiếm gần đúng theo tên

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Mobile mobile = new Mobile();
                    mobile.setMobileId(rs.getString("mobileId"));
                    mobile.setDescription(rs.getString("description"));
                    mobile.setPrice(rs.getFloat("price"));
                    mobile.setMobileName(rs.getString("mobileName"));
                    mobile.setYearOfProduction(rs.getInt("yearOfProduction"));
                    mobile.setQuantity(rs.getInt("quantity"));
                    mobile.setNotSale(rs.getBoolean("notSale"));
                    list.add(mobile);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteMobile(String mobileId) {
        String sql = "DELETE FROM tbl_Mobile WHERE mobileId = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, mobileId);
            return stmt.executeUpdate() > 0; // Trả về true nếu xóa thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateMobile(Mobile mobile) {
        String sql = "UPDATE tbl_Mobile SET description = ?, price = ?, mobileName = ?, " +
                "yearOfProduction = ?, quantity = ?, notSale = ? WHERE mobileId = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, mobile.getDescription());
            stmt.setFloat(2, mobile.getPrice());
            stmt.setString(3, mobile.getMobileName()); // Gán giá trị cho mobileName
            stmt.setInt(4, mobile.getYearOfProduction());
            stmt.setInt(5, mobile.getQuantity());
            int notSaleValue = mobile.isNotSale() ? 0 : 1;
            stmt.setInt(6, notSaleValue);
            stmt.setString(7, mobile.getMobileId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertMobile(Mobile mobile) {
        String sql = "INSERT INTO tbl_Mobile VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, mobile.getMobileId());
            stmt.setString(2, mobile.getDescription());
            stmt.setFloat(3, mobile.getPrice());
            stmt.setString(4, mobile.getMobileName()); // Gán giá trị cho mobileName
            stmt.setInt(5, mobile.getYearOfProduction());
            stmt.setInt(6, mobile.getQuantity());
            int notSaleValue = mobile.isNotSale() ? 0 : 1;
            stmt.setInt(7, notSaleValue);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Mobile> searchDeviceByPriceRange(float min, float max) {
        List<Mobile> list = new ArrayList<>();
        String sql = "SELECT * FROM tbl_Mobile WHERE price BETWEEN ? AND ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setFloat(1, min);
            stmt.setFloat(2, max);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Mobile mobile = new Mobile();
                    mobile.setMobileId(rs.getString("mobileId"));
                    mobile.setDescription(rs.getString("description"));
                    mobile.setPrice(rs.getFloat("price"));
                    mobile.setMobileName(rs.getString("mobileName"));
                    mobile.setYearOfProduction(rs.getInt("yearOfProduction"));
                    mobile.setQuantity(rs.getInt("quantity"));
                    mobile.setNotSale(rs.getBoolean("notSale"));
                    list.add(mobile);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addMobileToCart(String userId, String mobileId, HttpSession session) {
        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        cart.add(mobileId);
        return true; // Thêm thành công
    }

    public List<Mobile> viewMobileCart(String userId, HttpSession session) {
        List<Mobile> list = new ArrayList<>();

        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
            StringBuilder inClauseBuilder = new StringBuilder("(");
            for (int i = 0; i < cart.size(); i++) {
                inClauseBuilder.append("?");
                if (i < cart.size() - 1) {
                    inClauseBuilder.append(",");
                }
            }
            inClauseBuilder.append(")");
            String sql = "SELECT * FROM tbl_Mobile WHERE mobileId IN " + inClauseBuilder;

            try (Connection conn = DBUtils.getConnection();
                    PreparedStatement stmt = conn.prepareStatement(sql)) {
                for (int i = 0; i < cart.size(); i++) {
                    stmt.setString(i + 1, cart.get(i));
                }
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Mobile mobile = new Mobile();
                        mobile.setMobileId(rs.getString("mobileId"));
                        mobile.setDescription(rs.getString("description"));
                        mobile.setPrice(rs.getFloat("price"));
                        mobile.setMobileName(rs.getString("mobileName"));
                        mobile.setYearOfProduction(rs.getInt("yearOfProduction"));
                        mobile.setQuantity(rs.getInt("quantity"));
                        mobile.setNotSale(rs.getBoolean("notSale"));
                        list.add(mobile);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public boolean removeItemFromCart(String userId, String mobileId, HttpSession session) {
        List<String> cart = (List<String>) session.getAttribute("cart");
        if (cart != null) {
            return cart.remove(mobileId); // Trả về true nếu xóa thành công
        }
        return false;
    }

    public Mobile getMobileById(String mobileId) {
        Mobile mobile = null;
        String sql = "SELECT * FROM tbl_Mobile WHERE mobileId = ?";
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, mobileId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    mobile = new Mobile();
                    mobile.setMobileId(rs.getString("mobileId"));
                    mobile.setDescription(rs.getString("description"));
                    mobile.setPrice(rs.getFloat("price"));
                    mobile.setMobileName(rs.getString("mobileName"));
                    mobile.setYearOfProduction(rs.getInt("yearOfProduction"));
                    mobile.setQuantity(rs.getInt("quantity"));
                    mobile.setNotSale(rs.getBoolean("notSale"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mobile;
    }
}
