package com.cydeo.jdbctests.day1;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {

    //CONNECTION STRING
    String dbUrl = "jdbc:oracle:thin:@52.3.242.161:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = statement.executeQuery("select first_name, last_name from employees");

        //first row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        //second row
        rs.next();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

      //last method
      /* what if I want to get last row data ?
        ResultSet.TYPE_SCROLL_INSENSITIVE --> to do flexible navigation between rows
        ResultSet.CONCUR_READ_ONLY --> do not update anything from database, only read
      */
        rs.last();
        System.out.println(rs.getString(1)+" "+rs.getString(2));

        //how many rows we have (last + getRow)
        int rowNumber = rs.getRow();// the current row number; 0 if there is no current row
        System.out.println("rowNumber = " + rowNumber);


        System.out.println("--------ABSOLUTE---------");
        //when you write the row number, it gives you full name where the person stays on the that row
        rs.absolute(46); //true if the cursor is moved to a position in this ResultSet object; false if the cursor is before the first row or after the last row
        System.out.println(rs.getString(1)+" "+rs.getString(2)); //Alexander Hunold

        System.out.println("-------PREVIOUS----------"); //gives the previous person of the absolute method
        rs.previous();//true if the cursor is now positioned on a valid row; false if the cursor is positioned before the first row
        System.out.println(rs.getString(1)+" "+rs.getString(2)); //Guy Himuro


        //print the whole table
        rs.first(); //jump to first row

        rs.beforeFirst(); //jump into before first row

        System.out.println("---PRINTING TABLE----");
        while(rs.next()){
            System.out.println(rs.getString(1)+" "+rs.getString(2));

        }

        rs.close();
        statement.close();
        conn.close();

    }

    }
