/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package helper;

import java.text.NumberFormat;
import java.util.Currency;
import java.util.Locale;

/**
 *
 * @author toden
 */
public class helper {
    
    public helper(){
        
    }
    public static String convertToVietnameseDong(int amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency vietnameseDong = Currency.getInstance("VND");
        currencyFormatter.setCurrency(vietnameseDong);
        return currencyFormatter.format(amount);
    }

    public static String convertToVietnameseDong(double amount) {
        Locale locale = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency vietnameseDong = Currency.getInstance("VND");
        currencyFormatter.setCurrency(vietnameseDong);
        return currencyFormatter.format(amount);
    }
    
    public static String convertToUSDollar(int amount) {
        Locale locale = new Locale("en", "US");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency usDollar = Currency.getInstance("USD");
        currencyFormatter.setCurrency(usDollar);
        return currencyFormatter.format(amount);
    }

    public static String convertToUSDollar(double amount) {
        Locale locale = new Locale("en", "US");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(locale);
        Currency usDollar = Currency.getInstance("USD");
        currencyFormatter.setCurrency(usDollar);
        return currencyFormatter.format(amount);
    }
}
