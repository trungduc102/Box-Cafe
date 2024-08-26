/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.box.utils;

import com.boxcf.components.material.ItemBill;
import com.boxcf.models.ModelStatistical;
import com.boxcf.models.ThongKeSanPham;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 *
 * @author PC
 */
public class Sort {

    public static void sortIncreased(ArrayList list) {

        Comparator<ItemBill> compar = new Comparator<ItemBill>() {
            @Override
            public int compare(ItemBill o1, ItemBill o2) {

                return o1.getData().getMaItem().toString().compareTo(o2.getData().getMaItem().toString());

            }

        };

        Collections.sort(list, compar);
    }

    public static void sort(List<ModelStatistical> list) {

        Comparator<ModelStatistical> compar = new Comparator<ModelStatistical>() {
            @Override
            public int compare(ModelStatistical o1, ModelStatistical o2) {

                if (o1.getData() instanceof ThongKeSanPham && o2.getData() instanceof ThongKeSanPham) {
                    ThongKeSanPham sp1 = (ThongKeSanPham) o1.getData();
                    ThongKeSanPham sp2 = (ThongKeSanPham) o2.getData();
                    return  sp2.getSoluong() - sp1.getSoluong();
                }

                return (int) ( o2.getNum() - o1.getNum());
            }

        };

        Collections.sort(list, compar);
    }

}
