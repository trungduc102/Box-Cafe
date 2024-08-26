/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.box.utils;

import java.io.File;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUltil {

    public static String getTypeFile(File file) {
        if (file.getName().endsWith(".xls")) {
            return "xls";
        } else if (file.getName().endsWith(".xlsx")) {

            return "xlsx";
        } else {
            System.err.println("File format should be XLS or XLSX only.");
            return null;
        }
    }

    public static CellStyle getRowStyle(XSSFWorkbook workbook) {
        CellStyle rowStyle = workbook.createCellStyle();

        rowStyle.setAlignment(HorizontalAlignment.CENTER.CENTER);
        rowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        rowStyle.setWrapText(true);

        return rowStyle;
    }

    public static String getValue(XSSFSheet sheet, int row, int column) {

        String value;

        XSSFCell cell = sheet.getRow(row).getCell(column);
        try {
            if (cell.getCellType() == CellType.STRING) {
                value = cell.getStringCellValue();
            } else if (cell.getCellType() == CellType.NUMERIC) {
                value = String.format("%.0f", cell.getStringCellValue());
            } else {
                value = "";
            }
        } catch (Exception e) {
            value = "";
        }

        return value;
    }

}
