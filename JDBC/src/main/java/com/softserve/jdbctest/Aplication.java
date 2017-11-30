package com.softserve.jdbctest;

import java.sql.*;
import java.util.Scanner;


public class Aplication {
//    private static final String url = "jdbc:sqlserver://ANDRIY-PC:1433;database=DB_JDBC;user=sa;password=1";
private static final String url ="jdbc:mysql://localhost:3306/db_jbdc";
    private static final String user = "root";
    private static final String password = "root";

    private static Connection connection=null;
    private static Statement statement=null;
    private static ResultSet rs=null;

    public static void main(String args[]){
        try {
//region    0. This will load the MySQL driver, each DB has its own driver //
            Class.forName("com.mysql.jdbc.Driver");
            //endregion

//region    1. Get a connection to database //
            connection = DriverManager.getConnection(url,user,password);
            //endregion

//region  2. Create a statement
            // Statements allow to issue SQL queries to the database
            statement=connection.createStatement();
            //endregion

            //readData();

            //updateDataUniversity();
            //readData();

            insertDataUniversity();
            readData();

            //DeleteDataCity();

            //CallProcedureForInsertToPersonBook();


        } catch (ClassNotFoundException e) {
            System.out.println("MS SQL Server Driver is not loaded");

        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());

        } finally {
            //close connection ,statement and resultset
            if (rs != null) try { rs.close(); } catch (SQLException e) { } // ignore
            if (statement != null) try { statement.close(); } catch (SQLException e) { }
            if (connection != null) try { connection.close(); } catch (SQLException e) { }
        }
    }

    private static void readData() throws SQLException {
//region    SELECT COUNT(*) FROM Person //
            // 3. executing SELECT query
            rs=statement.executeQuery("SELECT COUNT(*) FROM Studik");

            // 4. Process the result set
            while (rs.next()) {
                int count = rs.getInt(1);
                // Simply Print the results
                System.out.format("\ncount: %d\n", count);
            }
            //endregion

//region    SELECT * FROM Person //
            // 3. executing SELECT query
            rs=statement.executeQuery("SELECT * FROM Studik");

            // 4. Process the result set
            System.out.format("\nTable Studik --------------------\n");
            System.out.format("%3s %-12s %-12s %-10s %s\n", "IDStudika", "Surname", "Name","NumOfKomisiy", "NameOfUniver", "Email");
            while (rs.next())
            {
                int idStudika=rs.getInt("IDStudika");
                String surname = rs.getString("Surname");
                String name = rs.getString("Name");
                String numOfKomisiy =rs.getString("NumOfKomisiy");
                String nameOfUniver = rs.getString("NameOfUniver");
                String email=rs.getString("Email");
                // Simply Print the results
                System.out.format("%3d %-12s %-12s %-10s %s\n", idStudika, surname, name, numOfKomisiy,nameOfUniver, email);
            }
            //endregion

//region    SELECT * FROM Book //
            // 3. executing SELECT query
            rs=statement.executeQuery("SELECT * FROM Komisiya");

            // 4. Process the result set
            System.out.format("\nTable Komisiya --------------------\n");
            System.out.format("%3s %-18s %-18s %s\n", "IDKomisiyi", "Name", "Student", "Teacher");
            while (rs.next())
            {
                int idKomisiyi=rs.getInt("IDKomisiyi");
                String name = rs.getString("Name");
                String student = rs.getString("Student");
                String teacher=rs.getString("Teacher");
                // Simply Print the results
                System.out.format("%3d %-18s %-18s %s\n", idKomisiyi, name, student, teacher);
            }
            //endregion

//region    SELECT * FROM City //
            // 3. executing SELECT query
            rs=statement.executeQuery("SELECT * FROM University");

            // 4. Process the result set
            System.out.format("\nTable University --------------------\n");
            System.out.format("%s\n", "University");
            while (rs.next())
            {
                String nameOfUniver = rs.getString("NameOfUniver");
                // Simply Print the results
                System.out.format("%s\n", nameOfUniver);
            }
            //endregion

//region    SELECT * FROM PersonBook //
            // 3. executing SELECT query
            String query="Select " +
                    "(SELECT Surname FROM Studik WHERE IDStudika=P.IDStudika) AS Surname, " +
                    "(SELECT Name FROM Komisiya WHERE IDKomisiyi=P.IDKomisiyi1) AS Name "+
                    "FROM Vykladach AS P";
            rs=statement.executeQuery(query);

            // 4. Process the result set
            System.out.format("\nJoining Table Vykladach --------------------\n");
            System.out.format("%-15s %s\n", "Surname", "Name");
            while (rs.next())
            {
                String surname = rs.getString("Surname");
                String Name = rs.getString("Name");
                // Simply Print the results
                System.out.format("%-15s %s\n", surname, Name);
            }
            //endregion

    }

    private static void updateDataUniversity() throws SQLException {
        Scanner input = new Scanner(System.in);
        System.out.println("Input name university what you want to update: ");
        String university = input.next();
        System.out.println("Input new name university for %s: "+ university);
        String universitynew = input.next();

        // 3. executing SELECT query
// 1
        statement.execute("UPDATE University SET NameOfUniver='"+universitynew+"' WHERE NameOfUniver='"+university+"';");

// 2  Returns count of updated rows
//        int n=statement.executeUpdate("UPDATE city SET City='"+citynew+"' WHERE City='"+city+"';");
//        System.out.println("Count rows that updated: "+n);

// 3  PreparedStatements can use variables and are more efficient
//        PreparedStatement preparedStatement;
//        preparedStatement=connection.prepareStatement("UPDATE city SET City=? WHERE City=?;");
//        preparedStatement.setString(1, citynew);
//        preparedStatement.setString(2, city);
//        int n=preparedStatement.executeUpdate();
//        System.out.println("Count rows that updated: "+n);

    }

    private static void insertDataUniversity() throws SQLException {
        Scanner input = new Scanner(System.in);
        System.out.println("Input a new name university: ");
        String universitynew = input.next();

        // 3. executing SELECT query
        //   PreparedStatements can use variables and are more efficient
        PreparedStatement preparedStatement;
        preparedStatement=connection.prepareStatement("INSERT University VALUES (?)");
        preparedStatement.setString(1, universitynew);
        int n=preparedStatement.executeUpdate();
        System.out.println("Count rows that inserted: "+n);

    }

    private static void DeleteDataUniversity() throws SQLException {
        Scanner input = new Scanner(System.in);
        System.out.println("Input a name university for delete: ");
        String university = input.next();

        // 3. executing SELECT query
        //   PreparedStatements can use variables and are more efficient
        PreparedStatement preparedStatement;
        preparedStatement=connection.prepareStatement("DELETE FROM University WHERE University=?");
        preparedStatement.setString(1, university);
        int n=preparedStatement.executeUpdate();
        System.out.println("Count rows that deleted: "+n);
    }

    private static void CallProcedureForInsertToVykladach() throws SQLException {
        Scanner input = new Scanner(System.in);
        System.out.println("\nInput Surname for Studik: ");
        String surname = input.next();
        System.out.println("Input Name for Komisiya: ");
        String komisiya = input.next();

        CallableStatement callableStatement;
        callableStatement= connection.prepareCall("{call InsertVykladach(?, ?)}");
        callableStatement.setString("SurmanePersonIn",surname);
        callableStatement.setString("BookNameIN",komisiya);
        ResultSet rs = callableStatement.executeQuery();

        while (rs.next())
        {
            String msg = rs.getString(1);
            // Simply Print the results
            System.out.format("\nResult: "+msg);
        }
    }

}
