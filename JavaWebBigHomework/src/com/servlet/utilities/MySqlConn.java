package com.servlet.utilities;

import com.servlet.model.Barrage;
import com.servlet.model.Post;
import com.servlet.model.User;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Properties;
import java.util.function.Function;

public class MySqlConn {

    private static final String JDBC_DRIVER;
    private static final String DB_URL;
    private static final String DB_USER;
    private static final String DB_PASS;

    static {
        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream(Objects.requireNonNull(MySqlConn.class.getClassLoader().getResource("db.properties")).getFile())) {
            properties.load(fis);
            JDBC_DRIVER = properties.getProperty("JDBC_DRIVER");
            DB_URL = properties.getProperty("DB_URL");
            DB_USER = properties.getProperty("DB_USER");
            DB_PASS = properties.getProperty("DB_PASSWORD");
            Class.forName(JDBC_DRIVER);
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException("Failed to load database properties or JDBC driver", e);
        }
    }

    private static <T> T executeWithConnection(Function<Connection, T> function) {
        try (Connection conn = getConnection()) {
            return function.apply(conn);
        } catch (SQLException e) {
            throw new RuntimeException("Database operation failed", e);
        }
    }

    private static Connection getConnection() {
        try {
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to connect to the database", e);
        }
    }

    public static boolean authenticateUser(String username, String password) {
        String hashedPassword = hashPassword(password);
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, hashedPassword);
                try (ResultSet rs = pstmt.executeQuery()) {
                    return rs.next();
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static boolean registerUser(String username, String password, String email, String account) {
        String hashedPassword = hashPassword(password);
        String sql = "INSERT INTO users (username, password, email, account) VALUES (?, ?, ?,?)";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                pstmt.setString(2, hashedPassword);
                pstmt.setString(3, email);
                pstmt.setString(4, account);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    // 更新用户信息  1-密码 2-邮箱 3-年龄 4-性别 5-包含2-4
    public static boolean updateUserInfo(String username, String password, String email, int age, int gender, int flag) {
        if (checkUserExists(username)) {
            if (flag == 1) {
                String hashedPassword = hashPassword(password);
                String sql = "UPDATE users SET password = ? WHERE username = ?";
                return updateInfo(username, hashedPassword, sql);
            }
            else if (flag == 2) {
                String sql = "UPDATE users SET email = ? WHERE username = ?";
                return updateInfo(username, email, sql);
            }
            else if (flag == 3) {
                String sql = "UPDATE users SET age = ? WHERE username = ?";
                return updateInfo(username, String.valueOf(age), sql);
            }
            else if (flag == 4) {
                String sql = "UPDATE users SET gender = ? WHERE username = ?";
                return executeWithConnection(conn -> {
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setInt(1, gender);
                        pstmt.setString(2, username);
                        int rowsAffected = pstmt.executeUpdate();
                        return rowsAffected > 0;
                    }catch (SQLException e) {
                        throw new RuntimeException("Failed to execute query", e);
                    }
                });
            }
            else if (flag == 5){
                String sql = "UPDATE users SET email = ?, age = ?, gender = ? WHERE username = ?";
                return executeWithConnection(conn -> {
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, email);
                        pstmt.setInt(2, age);
                        pstmt.setInt(3, gender);
                        pstmt.setString(4, username);
                        int rowsAffected = pstmt.executeUpdate();
                        return rowsAffected > 0;
                    }catch (SQLException e){
                        throw new RuntimeException("Failed to execute query", e);
                    }
                });
            }
        }
        return false;
    }

    private static boolean updateInfo(String username, String updateValue, String sql) {
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, updateValue);
                pstmt.setString(2, username);
                int rowsAffected = pstmt.executeUpdate();
                return rowsAffected > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }


    public static boolean deleteUser(int userId) {
        String deleteCommentsSql = "DELETE FROM barrages WHERE user_id = ?";
        String deletePostSql = "DELETE FROM posts WHERE user_id = ?";
        String sql = "DELETE FROM users WHERE id = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt1 = conn.prepareStatement(sql);
                 PreparedStatement pstmt2 = conn.prepareStatement(deleteCommentsSql);
                 PreparedStatement pstmt3 = conn.prepareStatement(deletePostSql)) {
                pstmt1.setInt(1, userId);
                pstmt2.setInt(1, userId);
                pstmt3.setInt(1, userId);
                pstmt1.executeUpdate();
                pstmt2.executeUpdate();
                return pstmt3.executeUpdate() > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static boolean checkUserExists(String checkValue) {
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, checkValue);
                try (ResultSet rs = pstmt.executeQuery()) {
                    rs.next();
                    int count = rs.getInt(1);
                    return count > 0;
                }catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    private static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for (byte b : hashBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Failed to hash password", e);
        }
    }

    public static boolean createPost(int userId, String title, String content) {
        String sql = "INSERT INTO posts (user_id, title, content) VALUES (?, ?, ?)";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                pstmt.setString(2, title);
                pstmt.setString(3, content);
                return pstmt.executeUpdate() > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static boolean addBarrage(int userId, String content) {
        String sql = "INSERT INTO barrages (user_id, content) VALUES (?, ?)";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                pstmt.setString(2, content);
                return pstmt.executeUpdate() > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static boolean deletePost(int postId) {
        String sql = "DELETE FROM posts WHERE id = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, postId);
                return pstmt.executeUpdate() > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
   }

    public static List<Post> searchPostsFuzzy(String keyword) {
        String sql = "SELECT * FROM posts WHERE title LIKE ? OR content LIKE ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, "%" + keyword + "%");
                pstmt.setString(2, "%" + keyword + "%");
                try (ResultSet rs = pstmt.executeQuery()) {
                    List<Post> posts = new ArrayList<>();
                    while (rs.next()) {
                        Post post = new Post(rs.getInt("id"),
                                rs.getInt("user_id"),
                                rs.getString("title"),
                                rs.getString("content"),
                                rs.getTimestamp("created_at"));
                        posts.add(post);
                    }
                    return posts;
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }


    public static boolean deleteBarrage(int postId) {
        String deleteCommentsSql = "DELETE FROM barrages WHERE id = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt1 = conn.prepareStatement(deleteCommentsSql)){
                pstmt1.setInt(1, postId);
                return pstmt1.executeUpdate() > 0;
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }


    public static List<User> getAllUsers() {
        String sql = "SELECT id, username, email, created_at, age, gender , account, is_banned, is_admin  FROM users";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    List<User> users = new ArrayList<>();
                    while (rs.next()) {
                        User user = new User(
                                rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("email"),
                                rs.getTimestamp("created_at"),
                                rs.getInt("age"),
                                rs.getString("gender"),
                                rs.getString("account"),
                                rs.getBoolean("is_banned"),
                                rs.getBoolean("is_admin")
                        );
                        users.add(user);
                    }
                    return users;
                } catch (SQLException e) {
                    throw new RuntimeException("执行查询失败！", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static List<Post> getAllPosts() {
        String sql = "SELECT id, user_id, title, content, created_at FROM posts";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    List<Post> posts = new ArrayList<>();
                    while (rs.next()) {
                        Post post = new Post(
                                rs.getInt("id"),
                                rs.getInt("user_id"),
                                rs.getString("title"),
                                rs.getString("content"),
                                rs.getTimestamp("created_at")
                        );
                        posts.add(post);
                    }
                    return posts;
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static List<Barrage> getAllBarrages() {
        String sql = "SELECT id, user_id, content, created_at FROM barrages";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    List<Barrage> barrages = new ArrayList<>();
                    while (rs.next()) {
                        Barrage barrage = new Barrage(
                                rs.getInt("id"),
                                rs.getInt("user_id"),
                                rs.getString("content"),
                                rs.getTimestamp("created_at")
                        );
                        barrages.add(barrage);
                    }
                    return barrages;
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
        });
    }

    public static User getUserByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ? ";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, username);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        return new User(rs.getInt("id"),
                                rs.getString("username"),
                                rs.getString("email"),
                                rs.getTimestamp("created_at"),
                                rs.getInt("age"),
                                rs.getString("gender"),
                                rs.getString("account"),
                                rs.getBoolean("is_banned"),
                                rs.getBoolean("is_admin")
                        );
                    }
                }catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            }catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
            return null;
        });
    }

    public static int getGenderCount(int gender) {
        String sql = "SELECT COUNT(*) AS count FROM users WHERE users.gender = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, gender);
                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    return rs.getInt("count");
                }
            } catch (SQLException e) {
                throw new RuntimeException("Failed to execute query", e);
            }
            return 0;
        });
    }

    public static int getUsersCount() {
        String sql = "SELECT COUNT(*) AS count FROM users";
        return getCounts(sql);
    }

    public static int getPostsCount() {
        String sql = "SELECT COUNT(*) AS count FROM posts";
        return getCounts(sql);
    }

    public static int getBarragesCount() {
        String sql = "SELECT COUNT(*) AS count FROM barrages";
        return getCounts(sql);
    }

    public static int getBannedUsersCount() {
        String sql = "SELECT COUNT(*) AS count FROM users WHERE is_banned = 1";
        return getCounts(sql);
    }

    private static int getCounts(String sql) {
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt("count");
                    }
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            }catch (SQLException e){
                throw new RuntimeException(e);
            }
            return 0;
        });
    }

    public static boolean banUser(int userId) {
        String sql = "UPDATE users SET is_banned = 1 WHERE id = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                return pstmt.executeUpdate() > 0;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        });
    }

    public static boolean unbanUser(int userId) {
        String sql = "UPDATE users SET is_banned = 0 WHERE id = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                return pstmt.executeUpdate() > 0;
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        });
    }

    public static boolean isBanned(int userId) {
        String sql = "SELECT is_banned FROM users WHERE username = ?";
        return executeWithConnection(conn -> {
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, userId);
                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getBoolean("is_banned");
                    }
                } catch (SQLException e) {
                    throw new RuntimeException("Failed to execute query", e);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return null;
        });
    }
}
