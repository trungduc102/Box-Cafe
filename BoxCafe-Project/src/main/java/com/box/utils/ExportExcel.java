/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.box.utils;

import com.boxcf.models.ModelStatistical;
import com.boxcf.models.ThongKeNhanVien;
import com.boxcf.models.ThongKeSanPham;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 *
 * @author PC
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExportExcel {

    private XSSFWorkbook workbook = new XSSFWorkbook();
    private XSSFSheet sheet = workbook.createSheet();

    private String title;
    private String url;
    private List<ModelStatistical> reports;
    private Object[] listTitle;

    private Map<String, Object[]> data = new HashMap<String, Object[]>();

    public ExportExcel(List<ModelStatistical> reports, Object[] listTitle, String url) {
        this.reports = reports;
        this.listTitle = listTitle;
        this.url = url;
    }

    private boolean write() {

        Set<String> keyset = data.keySet();

        int rownum = 0;

        CellStyle rowStyle = ExcelUltil.getRowStyle(workbook);

        sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, listTitle.length - 1));

        int i = 0;
        for (String key : keyset) {

            System.out.println("key data: " + key);

            sheet.autoSizeColumn(rownum);
            Row row = sheet.createRow(rownum++);

            row.setHeightInPoints(40);
            row.setRowStyle(rowStyle);

            Object[] objArr = data.get(i + "");
            int cellnum = 0;

            for (Object obj : objArr) {

                Cell cell = row.createCell(cellnum++);
                cell.setCellStyle(row.getRowStyle());

                if (obj instanceof Date) {
                    cell.setCellValue(XDate.toString((Date) obj, "dd/MM/yyyy"));
                } else if (obj instanceof Boolean) {
                    cell.setCellValue((Boolean) obj);
                } else if (obj instanceof String) {
                    cell.setCellValue((String) obj);
                } else if (obj instanceof Double) {
                    cell.setCellValue((Double) obj);
                } else if (obj instanceof Integer) {
                    cell.setCellValue((Integer) obj);
                } else if (obj instanceof Float) {
                    cell.setCellValue((Float) obj);
                }

            }
            i++;
        }

        try {
            FileOutputStream out = new FileOutputStream(new File(this.url));
            workbook.write(out);
            out.close();
            return true;

        } catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
            return false;
        }
    }

    public boolean writeToExcel() {

        data.clear();

        data.put("0", new Object[]{title});

        data.put("1", listTitle);

        int i = 1;
        int idex = 2;
        for (ModelStatistical md : reports) {
            if (md.getData() instanceof ThongKeSanPham) {
                ThongKeSanPham sp = (ThongKeSanPham) md.getData();
                Object row[] = {i, sp.getMaSP(), sp.getTenSP(), sp.getGia() + " VND", sp.getSoluong()};
                data.put(idex + "", row);
            } else if (md.getData() instanceof ThongKeNhanVien) {
                ThongKeNhanVien nv = (ThongKeNhanVien) md.getData();
                Object row[] = {i, nv.getMaNV(), nv.getTenNV(), nv.getNgayVaoLam(), nv.getSoluong()};
                data.put(idex + "", row);
            } else {

                String time = "";
                if (Validator.isInt(md.getTitle()) && Integer.parseInt(md.getTitle()) <= 12) {
                    time = "Tháng " + md.getTitle();
                } else {
                    time = md.getTitle();
                }
                Object row[] = {i, time, Formats.toCurency(md.getNum())};
                data.put(idex + "", row);
            }
            i++;
            idex++;
        }

        return write();
    }

    public static void main(String[] args) {
        ExportExcel export = new ExportExcel();
        Map<String, Object[]> data = export.getData();

        export.writeToExcel();
    }

}
