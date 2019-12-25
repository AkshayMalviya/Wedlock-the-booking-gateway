import java.sql.*;

        
        public class LoginCheck1 {
            public static String validate(String name, String pass) {
                boolean status = false;
                String category="";
                Connection conn = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                String url = "jdbc:mysql://localhost:3306/";
                String dbName = "bookgate";
                String driver = "com.mysql.jdbc.Driver";
                String userName = "root";
                String password = "root";
                try {
                    Class.forName(driver).newInstance();
                    conn = DriverManager.getConnection(url + dbName, userName, password);

                    pst = conn.prepareStatement("SELECT * FROM retail WHERE retailername=? AND rpassword=?"); //working

                    pst.setString(1, name);
                    pst.setString(2, pass);

                    rs = pst.executeQuery();
                    //status = rs.next();
                    if(rs.next()){
                        category=rs.getString("catagory");
                    }

                } catch (Exception e) {
                    System.out.println(e);
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (pst != null) {
                        try {
                            pst.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                    if (rs != null) {
                        try {
                            rs.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
                return category;
            }
        }