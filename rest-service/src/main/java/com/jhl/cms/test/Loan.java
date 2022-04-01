package com.jhl.cms.test;

import java.util.Scanner;

public class Loan {
    public static Integer loanMonth(Double amount, Double rate, Double amtPerMonth) throws Exception {
        Integer result = 0;
        if (amount > 0 && amount < amtPerMonth) {
            result = 1;
        } else if (amount > amtPerMonth) {
            Double interest = amount * rate;
            if (interest > amtPerMonth) {
                throw new Exception("本金小于利息！");
            }
            Double newAmount = amount - (amtPerMonth - interest);
            //System.out.println("还款一次，还款利息：" + interest + "，剩余本金：" + newAmount);
            result = 1 + loanMonth(newAmount, rate, amtPerMonth);
        }
        return result;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("请输入贷款金额： ");
        double loanAmount = sc.nextDouble();

        System.out.println("请输入年利率: ");
        double yearRate = sc.nextDouble();

        System.out.println("请输入月付款: ");
        double monthAmount = sc.nextDouble();

        double rate = yearRate / 1200.0;

        String s = String.format("计算开始，贷款金额%2f，年利率%2f，月利率%2f,月付款%2f", loanAmount, yearRate, rate, monthAmount);
        //System.out.println(s);

        Integer monthCount = 0;
        try {
            monthCount = loanMonth(loanAmount, rate, monthAmount);
        } catch (Exception e) {
            System.out.println("出现错误，" + e.getMessage());
            return;
        }
        System.out.println("计算完成，结果是：");
        System.out.println(monthCount);
    }
}
