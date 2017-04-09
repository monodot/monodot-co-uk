---
layout: post
title:  "Prepping credit card data for YNAB"
date:   2017-04-11 08:00:00 +0000
categories: hacking
comments: true
---

Got a QIF file from your bank, but all your credit card transactions are the wrong way round for YNAB? (expects purchases to be negative, balance payments to be positive).

Then use this script on your QIF file. It'll turn all the `T` lines from negative to positive, and vice versa.

    awk -F "T" ' \
        function neg(x) {return -x} \
        /^T/ {printf("T%.2f\n", neg($2)); next} 1 \
    ' yourfile.qif

