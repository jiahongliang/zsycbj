package com.jhl.cms.test;

import java.util.Scanner;

public class TP22 {


    public static void triABulles(int[] tab) {
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

    public static void chercher(int tab[], int cle) {
        boolean trouve = false;

        int pos = -1;  //jhl:此变量存储找到的位置，如果没找到，我们认为是-1

        for (int i = 0; i < tab.length; i++) {
            if (tab[i] == cle) {
                System.out.println("Valeur trouvé a la position :" + i);
                trouve = true;
                pos = i;
                break;
            }
        }
        if (trouve == false) {
            System.out.println("Valeur introuvable ");
        } else {
            //jhl:此处增加代码进行删除操作。思路是创建一个新数组，长度减一，然后跳过要删除的元素，挨个拷贝。
            int[] newTab = new int[tab.length - 1];
            for (int j = 0; j < pos; j++) {
                System.out.println(j);
                newTab[j] = tab[j];
            }
            for (int j = pos + 1; j < tab.length; j++) {
                System.out.println(j);
                newTab[j - 1] = tab[j];
            }

            System.out.println("le tableau mis à jour (après la suppression):");

            for (int i = 0; i < newTab.length; i++) {
                System.out.print(newTab[i] + "\t");
            }
        }

    }

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
        for (int i = 0; i < tab.length; i++) {
            System.out.print(tab[i] + "\t");//这个地方结果显示为一行，如何像图例那样分行显示呢？
        }

        triABulles(tab);

        System.out.println();  //jhl：增加这一行用于换行
        System.out.print("Le tableau trié :");

        for (int i = 0; i < tab.length; i++) {
            System.out.print(tab[i] + "\t");
        }

        System.out.println();  //jhl：增加这一行用于换行
        System.out.println("Entrez la valeur à supprimer :");  //jhl:将print改成了println
        valeurSupprimer = sc.nextInt();
        chercher(tab, valeurSupprimer);

    }

}