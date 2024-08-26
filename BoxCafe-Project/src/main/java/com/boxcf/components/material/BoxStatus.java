/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package com.boxcf.components.material;

import com.boxcf.constands.BoxState;
import com.boxcf.dao.BoxDao;
import com.boxcf.dao.DatTruocDao;
import com.boxcf.dao.PhieuDatBoxDao;
import com.boxcf.store.Store;

/**
 *
 * @author HP
 */
public class BoxStatus extends javax.swing.JPanel {

    public BoxStatus() {
        initComponents();
        init();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        lblUsed = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        lblBooked = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        lblIsActive = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setPreferredSize(new java.awt.Dimension(500, 50));

        jLabel1.setBackground(new java.awt.Color(109, 191, 184));
        jLabel1.setOpaque(true);

        lblUsed.setText("Trống (1)");

        jLabel4.setBackground(new java.awt.Color(251, 210, 105));
        jLabel4.setOpaque(true);

        lblBooked.setText("Đặt trước (2)");

        jLabel5.setBackground(new java.awt.Color(117, 186, 117));
        jLabel5.setOpaque(true);

        lblIsActive.setText("Đang sử dụng (5)");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lblUsed, javax.swing.GroupLayout.PREFERRED_SIZE, 68, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(12, 12, 12)
                .addComponent(lblBooked, javax.swing.GroupLayout.PREFERRED_SIZE, 88, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(lblIsActive, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(25, 25, 25))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblUsed, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblBooked, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(lblIsActive, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel lblBooked;
    private javax.swing.JLabel lblIsActive;
    private javax.swing.JLabel lblUsed;
    // End of variables declaration//GEN-END:variables

    private void init() {
        Store.bStatus  = this;
        fillState();
    }

    public void fillState() {

        PhieuDatBoxDao dPd = PhieuDatBoxDao.getInstant();

        int booked = dPd.getState(BoxState.booked);
        int active = dPd.getState(BoxState.active);
        int empty = dPd.getState(BoxState.empty);

        String wasBooked = "Đặt trước (" + booked + ")";
        String isActive = "Đang hoạt động (" + active + ")";
        String isEmpty = "Trống (" + empty + ")";

        lblUsed.setText(isEmpty);
        lblIsActive.setText(isActive);
        lblBooked.setText(wasBooked);
    }
}
