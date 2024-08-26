/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.box.utils;

import com.boxcf.dao.BoxDao;
import com.boxcf.dao.ComboCTDao;
import com.boxcf.dao.ComboDao;
import com.boxcf.dao.PhieuDatBoxDao;
import com.boxcf.dao.SanPhamDao;
import com.boxcf.models.ComboCT;
import com.boxcf.models.HoaDonCT;
import com.boxcf.models.PhieuDatBox;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;

import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Section;

import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author trung
 */
public class Printer {

    private int maHD;
    private String Ngay;
    private String tenNV;
    private String tenKH;
    private List<HoaDonCT> list;
    private String sl;
    private String TongThanhTien;
    private String KM;
    private String TongCong;

    public Printer(int maHD, String Ngay, String tenNV, String tenKH, List<HoaDonCT> list, String sl, String TongThanhTien, String KM, String TongCong) {
        this.maHD = maHD;
        this.Ngay = Ngay;
        this.tenNV = tenNV;
        this.tenKH = tenKH;
        this.list = list;
        this.sl = sl;
        this.TongThanhTien = TongThanhTien;
        this.KM = KM;
        this.TongCong = TongCong;

    }

    public static final String FONT = "src/main/resources/Font/times.ttf";
    public static final String FONTBD = "src/main/resources/Font/timesbd.ttf";

    public void setAttributes(Document document, String maHD) {

        //Set attributes here
        document.addAuthor("Anonymous");
        document.addCreationDate();
        document.addCreator("Anonymous");
        document.addTitle("Hoa don " + maHD);
        document.addSubject("");

    }

    public Font setFont(String font, int size) throws DocumentException, IOException {
        BaseFont bf = BaseFont.createFont(font, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font f = new Font(bf, size);
        return f;
    }

    public void setHeader(Document document, String maHD, String tenKH, String tenNV, String Ngay) throws DocumentException, IOException {
        //setFont
        Font f = setFont(FONT, 12);
        Font fbd = setFont(FONTBD, 18);
        Paragraph paragraph = new Paragraph();
        //set header
        PdfPTable tableCenter = new PdfPTable(1); // 5 columns.
        tableCenter.setWidthPercentage(100); //Width 100%
//                float[] columnWidthsC = {5f};
//
//        tableCenter.setWidths(columnWidthsC);
        PdfPCell cellCenter = new PdfPCell(new Paragraph("HOÁ ĐƠN THANH TOÁN", fbd));
        cellCenter.setBorder(Rectangle.NO_BORDER);

        cellCenter.setPaddingLeft(10);
        cellCenter.setHorizontalAlignment(Element.ALIGN_CENTER);
        cellCenter.setVerticalAlignment(Element.ALIGN_MIDDLE);
        tableCenter.addCell(cellCenter);
        document.add(tableCenter);

        addEmptyLine(paragraph, 1);
        document.add(paragraph);

        PdfPTable table = new PdfPTable(4); // 5 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table

        //Set Column widths
        float[] columnWidths = {1f, 0.8f, 1f, 1f};
        table.setWidths(columnWidths);

        PdfPCell cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell1.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell2.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell3 = new PdfPCell(new Paragraph("MÃ HD:", f));
        setCellLeft(cell3);
        cell3.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell4 = new PdfPCell(new Paragraph(maHD, f));
        setCellLeft(cell4);
        cell4.setBorder(Rectangle.NO_BORDER);

        table.addCell(cell1);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell2);

        cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell3 = new PdfPCell(new Paragraph("NGÀY:", f));
        setCellLeft(cell3);
        cell4 = new PdfPCell(new Paragraph(Ngay, f));
        setCellLeft(cell4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell2);

//        cell1 = new PdfPCell(new Paragraph("", f));
//        setCell(cell1);
//        cell2 = new PdfPCell(new Paragraph("", f));
//        setCell(cell2);
//        cell3 = new PdfPCell(new Paragraph("KHÁCH HÀNG:", f));
//        setCellLeft(cell3);
//        cell4 = new PdfPCell(new Paragraph("", f));
//        setCellLeft(cell4);
//        cell1.setBorder(Rectangle.NO_BORDER);
//        cell2.setBorder(Rectangle.NO_BORDER);
//        cell3.setBorder(Rectangle.NO_BORDER);
//        cell4.setBorder(Rectangle.NO_BORDER);
//
//        table.addCell(cell1);
//        table.addCell(cell3);
//        table.addCell(cell4);
//        table.addCell(cell2);
        cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell3 = new PdfPCell(new Paragraph("NHÂN VIÊN:", f));
        setCellLeft(cell3);
        cell4 = new PdfPCell(new Paragraph(tenNV, f));
        setCellLeft(cell4);

        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);

        table.addCell(cell1);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell2);

        document.add(table);

        addEmptyLine(paragraph, 1);
        document.add(paragraph);

    }

    public void setFooter(Document document) throws DocumentException, IOException {
        //setFont
        Font f = setFont(FONT, 12);
        Paragraph paragraph = new Paragraph();
        //set Footer
        addEmptyLine(paragraph, 1);
        document.add(paragraph);

        PdfPTable table = new PdfPTable(4); // 5 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table

        //Set Column widths
        float[] columnWidths = {1f, 2f, 1f, 1f};
        table.setWidths(columnWidths);

        PdfPCell cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell1.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell2.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell3 = new PdfPCell(new Paragraph("Tổng số lượng:", f));
        setCellLeft(cell3);
        cell3.setBorder(Rectangle.NO_BORDER);
        PdfPCell cell4 = new PdfPCell(new Paragraph(sl, f));
        setCellRight(cell4);
        cell4.setBorder(Rectangle.NO_BORDER);

        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);

        cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell3 = new PdfPCell(new Paragraph("Tổng thành tiền:", f));
        setCellLeft(cell3);
        cell4 = new PdfPCell(new Paragraph(TongThanhTien, f));
        setCellRight(cell4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell3 = new PdfPCell(new Paragraph("Khuyến mãi:", f));
        setCellLeft(cell3);
        cell4 = new PdfPCell(new Paragraph(KM, f));
        setCellRight(cell4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);

        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        cell1 = new PdfPCell(new Paragraph("", f));
        setCell(cell1);
        cell2 = new PdfPCell(new Paragraph("", f));
        setCell(cell2);
        cell3 = new PdfPCell(new Paragraph("Tổng cộng:", f));
        setCellLeft(cell3);
        cell4 = new PdfPCell(new Paragraph(TongCong, f));
        setCellRight(cell4);
        cell1.setBorder(Rectangle.NO_BORDER);
        cell2.setBorder(Rectangle.NO_BORDER);
        cell3.setBorder(Rectangle.NO_BORDER);
        cell4.setBorder(Rectangle.NO_BORDER);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);

        document.add(table);

    }

    public void setCell(PdfPCell cell) throws DocumentException, IOException {
        Font f = setFont(FONT, 12);
        cell.setBorderColor(BaseColor.BLACK);
        cell.setPaddingLeft(10);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
    }

    public void setCellLeft(PdfPCell cell) throws DocumentException, IOException {
        Font f = setFont(FONT, 12);
        cell.setBorderColor(BaseColor.BLACK);
        cell.setPaddingLeft(10);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
    }

    public void setCellRight(PdfPCell cell) throws DocumentException, IOException {
        Font f = setFont(FONT, 12);
        cell.setBorderColor(BaseColor.BLACK);
        cell.setPaddingRight(10);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
    }

    public void createTable(Document document, List<HoaDonCT> list) throws DocumentException, IOException {

        //setFont
        Font f = setFont(FONT, 12);
        Font fTitle = setFont(FONTBD, 12);

        Paragraph paragraph = new Paragraph();

        PdfPTable table = new PdfPTable(5); // 5 columns.
        table.setWidthPercentage(100); //Width 100%
        table.setSpacingBefore(10f); //Space before table
        table.setSpacingAfter(10f); //Space after table

        //Set Column widths
        float[] columnWidths = {1f, 3, 1f, 1f, 1f};
        table.setWidths(columnWidths);

        PdfPCell cell1 = new PdfPCell(new Paragraph("STT", fTitle));
        cell1.setBorderColor(BaseColor.BLACK);
        cell1.setPaddingLeft(10);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);

        PdfPCell cell2 = new PdfPCell(new Paragraph("Sản Phẩm", fTitle));
        cell2.setBorderColor(BaseColor.BLACK);
        cell2.setPaddingLeft(10);
        cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell2.setVerticalAlignment(Element.ALIGN_MIDDLE);

        PdfPCell cell3 = new PdfPCell(new Paragraph("Đơn giá", fTitle));
        cell3.setBorderColor(BaseColor.BLACK);
        cell3.setPaddingLeft(10);
        cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell3.setVerticalAlignment(Element.ALIGN_MIDDLE);

        PdfPCell cell4 = new PdfPCell(new Paragraph("Số lượng", fTitle));
        cell4.setBorderColor(BaseColor.BLACK);
        cell4.setPaddingLeft(10);
        cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell4.setVerticalAlignment(Element.ALIGN_MIDDLE);

        PdfPCell cell5 = new PdfPCell(new Paragraph("Thành tiền", fTitle));
        cell5.setBorderColor(BaseColor.BLACK);
        cell5.setPaddingLeft(10);
        cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell5.setVerticalAlignment(Element.ALIGN_MIDDLE);

        //To avoid having the cell border and the content overlap, if you are having thick cell borders
        //cell1.setUserBorderPadding(true);
        //cell2.setUserBorderPadding(true);
        //cell3.setUserBorderPadding(true);
        table.addCell(cell1);
        table.addCell(cell2);
        table.addCell(cell3);
        table.addCell(cell4);
        table.addCell(cell5);
        double i = 1;

        List<ComboCT> listCombo = ComboCTDao.getInstant().selectByHd(maHD);

        if (listCombo != null) {
            for (ComboCT item : listCombo) {
                String tenCB = ComboDao.getInstant().selectById(item.getMaCB()).getTenCB();
                long giaCB = ComboDao.getInstant().selectById(item.getMaCB()).getGia();

                cell1 = new PdfPCell(new Paragraph(String.valueOf(i).replace(".0", ""), f));
                setCell(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(tenCB), f));
                setCellLeft(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(giaCB).replace(".0", ""), f));
                setCellRight(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(1), f));
                setCell(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(giaCB).replace(".0", ""), f));
                setCellRight(cell1);
                table.addCell(cell1);

                i++;

                break;
            }
        }

        for (HoaDonCT item : list) {
            double thanhtien = item.getThanhTien() * item.getSoLuong();
            String tenSP = SanPhamDao.getInstant().selectById(item.getMaSP()).getTenSP();

            cell1 = new PdfPCell(new Paragraph(String.valueOf(i).replace(".0", ""), f));
            setCell(cell1);
            table.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(tenSP, f));
            setCellLeft(cell1);
            table.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(String.valueOf(item.getThanhTien()).replace(".0", ""), f));
            setCellRight(cell1);
            table.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(String.valueOf(item.getSoLuong()), f));
            setCell(cell1);
            table.addCell(cell1);
            cell1 = new PdfPCell(new Paragraph(String.valueOf(thanhtien).replace(".0", ""), f));
            setCellRight(cell1);
            table.addCell(cell1);

            i++;
        }

        List<PhieuDatBox> listBox = PhieuDatBoxDao.getInstant().selectByHd(maHD);
        if (listBox != null) {
            for (PhieuDatBox item : listBox) {
                String tenSP = BoxDao.getInstance().selectById(item.getMaBox()).getTenBox();
                cell1 = new PdfPCell(new Paragraph(String.valueOf(i).replace(".0", ""), f));
                setCell(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(tenSP), f));
                setCellLeft(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(item.getThanhTien()).replace(".0", ""), f));
                setCellRight(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(item.getSoGio()), f));
                setCell(cell1);
                table.addCell(cell1);
                cell1 = new PdfPCell(new Paragraph(String.valueOf(item.getThanhTien()).replace(".0", ""), f));
                setCellRight(cell1);
                table.addCell(cell1);

                i++;
            }
        }

        document.add(table);

    }

    public void createBill() {
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream("HoaDon/HD" + maHD + ".pdf"));
            document.open();
            setAttributes(document, String.valueOf(maHD));
            setHeader(document, String.valueOf(maHD), tenKH, tenNV, Ngay);
            createTable(document, list);
            setFooter(document);

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}
