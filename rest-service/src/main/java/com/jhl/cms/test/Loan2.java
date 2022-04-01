package com.jhl.cms.test;

import java.util.Scanner;

public class Loan2 {
    public static int loanMonth(Double amount, Double rate, Double amtPerMonth)  {
        //第一步：判断本金是不是大于0，否则就不用还
        if (amount <= 0) {
            return 0;
        }

        //第二步：计算月利息
        Double interest = amount * rate;
        //如果月利息大于每月还款额，返回-1,表示有错误;
        if (interest > amtPerMonth) {
            return -1;
        }

        //假设剩余月数为n，初始设置为1
        int monthCount = 1;
        //第三步，判断剩余本金是否大于月还款额
        while (amount > amtPerMonth) {
            //每多还一个月，本金减少一个月
            monthCount++;
            amount = amount * (1 + rate) - amtPerMonth;
        }

        //返回结果
        return monthCount;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("请输入贷款金额： ");
        double loanAmount = sc.nextDouble();

        System.out.println("请输入年利率: ");
        double yearRate = sc.nextDouble();

        System.out.println("请输入月付款: ");
        double monthAmount = sc.nextDouble();

        //因为输入的利率不带百分号，因此要多除以100
        double rate = yearRate / (12 * 100.0);

        String s = String.format("计算开始，贷款金额%2f，年利率%2f，月利率%2f,月付款%2f", loanAmount, yearRate, rate, monthAmount);
        System.out.println(s);

        int monthCount = loanMonth(loanAmount, rate, monthAmount);
        if(monthCount == -1) {
            System.out.println("输入有误，每月还款低于第一个月的利息。");
        } else {
            String s1 = String.format("需要还款%d个月。",monthCount);
            System.out.println(s1);
        }
    }
}
