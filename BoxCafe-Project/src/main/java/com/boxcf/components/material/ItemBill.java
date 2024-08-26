/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package com.boxcf.components.material;

import com.box.utils.Formats;
import com.boxcf.events.interfaces.EventItem;
import com.boxcf.models.ModelItem;
import java.awt.Color;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;
import javax.swing.border.MatteBorder;

/**
 *
 * @author PC
 */
public class ItemBill extends javax.swing.JPanel {

    private ModelItem data;
    private EventItem event;

    public EventItem getEvent() {
        return event;
    }

    public void setEvent(EventItem event) {
        this.event = event;
    }

    public JLabel getBtnXoa() {
        return btnXoa;
    }

    public ItemBill() {
        initComponents();
        setOpaque(false);
        setBorder(new MatteBorder(0, 0, 1, 0, Color.decode("#C8B6A6")));
        btnXoa.addMouseListener(new MouseAdapter() {
            @Override
            public void mousePressed(MouseEvent me) {
                if (SwingUtilities.isLeftMouseButton(me)) {
                    event.itemClick(btnXoa, data);
                }
            }
        });

    }
    //item trong combo
    public ItemBill( boolean isComboItem) {
        if( isComboItem){
            initComponents();
            setOpaque(false);
            setBorder(new MatteBorder(0, 0, 1, 0, Color.decode("#C8B6A6")));
            btnXoa.setVisible(false);
        }
        
    }

    public ModelItem getData() {
        return data;
    }

    public void setData(ModelItem data) {
        this.data = data;
        String suffixes = "";
        lblGia.setText(Formats.toCurency(data.getGia()));
        if (data.getLoaiBox() != null) {
            suffixes = " giờ";
        }
        lblSoluong.setText(data.getSoLuong() + suffixes);
        lblTen.setText(data.getTen());
    }

    public void tangLen(int quantity) {
        data.setSoLuong(quantity);
        this.setData(data);
        this.repaint();
        this.revalidate();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        lblSoluong = new javax.swing.JLabel();
        lblTen = new javax.swing.JLabel();
        btnXoa = new javax.swing.JLabel();
        lblGia = new javax.swing.JLabel();

        setMaximumSize(new java.awt.Dimension(400, 40));
        setMinimumSize(new java.awt.Dimension(400, 40));
        setPreferredSize(new java.awt.Dimension(400, 40));

        lblSoluong.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        lblSoluong.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lblSoluong.setText("01");

        lblTen.setFont(new java.awt.Font("Montserrat SemiBold", 1, 14)); // NOI18N
        lblTen.setText("Dừa");

        btnXoa.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        btnXoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/boxcf/images/icon/icons8_close_30px_2.png"))); // NOI18N
        btnXoa.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));

        lblGia.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        lblGia.setText("230k");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblTen, javax.swing.GroupLayout.PREFERRED_SIZE, 172, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblSoluong, javax.swing.GroupLayout.DEFAULT_SIZE, 51, Short.MAX_VALUE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lblGia, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnXoa, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(btnXoa, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                .addComponent(lblGia, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lblTen, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lblSoluong, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel btnXoa;
    private javax.swing.JLabel lblGia;
    private javax.swing.JLabel lblSoluong;
    private javax.swing.JLabel lblTen;
    // End of variables declaration//GEN-END:variables

    @Override
    public String toString() {
        return "ItemBill{" + "data=" + data + '}';
    }

}
