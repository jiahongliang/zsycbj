package com.jhl.cms.test;

import java.util.Scanner;

public class TP221 {


    public static void main(String[] args) {
        final int TAILLE_TAB = 5;
        int tab[] = new int[TAILLE_TAB];
        int valeurSupprimer;

        Scanner sc = new Scanner(System.in);

        for (int i = 0; i < tab.length; i++) {
            System.out.println("Taper le " + i + " ème élément ");
            tab[i] = sc.nextInt();

        }

        System.out.print("Mon tableau :");
        afficherTableau(tab);

        triABulles(tab);

        System.out.println();  //jhl：增加这一行用于换行
        System.out.print("Le tableau trié :");
        afficherTableau(tab);

        System.out.println();  //jhl：增加这一行用于换行
        System.out.println("Entrez la valeur à supprimer :");  //jhl:将print改成了println
        valeurSupprimer = sc.nextInt();

        int pos = rechercherDichotomique(tab, valeurSupprimer);
        if (pos == -1) {
            System.out.println("Valeur introuvable ");
            return;
        }

        System.out.println("Valeur trouvé a la position :" + pos);
        tab = supprimer(tab, pos);

        System.out.println("le tableau mis à jour (après la suppression):");
        afficherTableau(tab);
    }

    /**
     * 显示数组内容
     * @param tab 待显示数组
     */
    private static void afficherTableau(int[] tab) {
        for (int i = 0; i < tab.length; i++) {
            System.out.print(tab[i] + "\t");
        }
    }

    /**
     * 原来的冒泡排序函数，没变
     * @param tab 待排序数组
     */
    private static void triABulles(int[] tab) {
        int temp;

        for (int j = 0; j < tab.length - 1; j++) {
            for (int i = 0; i < tab.length - (1 + j); i++) {
                if (tab[i] > tab[i + 1]) {
                    temp = tab[i];
                    tab[i] = tab[i + 1];
                    tab[i + 1] = temp;
                }
            }
        }
    }

    /**
     * 二分法查找
     * @param arr  待查找的数字
     * @param valeur  待查找的数值
     * @return  返回查找位置
     */
    private static int rechercherDichotomique(int[] arr, int valeur) {
        int low = 0;
        int high = arr.length - 1;
        while (low <= high) {
            int middle = (low + high) / 2;
            if (valeur == arr[middle]) {
                return middle;
            }

            if (valeur > arr[middle]) {
                low = middle + 1;
            }
            if (valeur < arr[middle]) {
                high = middle - 1;
            }
        }
        return -1;
    }


    /**
     * 删除指定位置的元素
     *
     * @param tab  原数组
     * @param pos  删除的位置
     * @return 删除后的数组
     */
    private static int[] supprimer(int[] tab, int pos) {
        int[] newTab = new int[tab.length - 1];
        for (int j = 0; j < pos; j++) {
            newTab[j] = tab[j];
        }
        for (int j = pos + 1; j < tab.length; j++) {
            newTab[j - 1] = tab[j];
        }
        return newTab;
    }
}
