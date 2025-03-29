package org.example.chickenstock.model.repository;

import io.github.cdimascio.dotenv.Dotenv;
import org.example.chickenstock.model.dto.Account;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountRepository implements JDBCRepository {
    final Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
    final String URL = dotenv.get("DB_URL");
    final String USER = dotenv.get("DB_USER");
    final String PASSWORD = dotenv.get("DB_PASSWORD");

    public List<String> findAll() throws Exception {
        List<String> accounts = new ArrayList<>();
        try (Connection conn = getConnection(URL, USER, PASSWORD)) {

            String query = "SELECT account_id, nickname FROM accounts ORDER BY account_id";
            PreparedStatement pstmt = conn.prepareStatement(query);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String formatted = String.format("ID: %d, 닉네임: %s",
                        rs.getLong("account_id"),
                        rs.getString("nickname"));

                accounts.add(formatted);
            }
        }
        return accounts;
    }


    public void save(Account account) throws Exception {
        try (Connection conn = getConnection(URL, USER, PASSWORD)) {
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO accounts (nickname) VALUES ( '%s')".formatted(account.nickname()); // 작은따옴표 주의!
            int rowsAffected = stmt.executeUpdate(query);
            System.out.println("Rows affected: " + rowsAffected);
        }
    }

    public void delete(long id) throws Exception {
        try (Connection conn = getConnection(URL, USER, PASSWORD)) {
            Statement stmt = conn.createStatement();
            String query = "DELETE FROM accounts WHERE account_id = %d".formatted(id); // 숫자는 작은 따옴표 없어도 된다
            int rowsAffected = stmt.executeUpdate(query);
            System.out.println("Rows affected: " + rowsAffected);
        }
    }
}