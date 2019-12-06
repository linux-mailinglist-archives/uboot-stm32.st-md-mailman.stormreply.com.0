Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EB11151BF
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 15:02:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F1BBC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 14:02:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5721C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 14:02:05 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6DqSAw015701; Fri, 6 Dec 2019 15:01:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=6LuJ3FTqrWEnJNWn0ZXQXAWC/b+GxnKdBXZPPKJexBw=;
 b=0fCN74skwuKKy0GqK7dWhAmyJkRpQpAUhW00kBCHJ0m+blBCw2xjw6IoaN1s4RBT7RxM
 2U+Q01OZfvB97As2R4t60tM7mSRFNOoZZFLxLCygkXF2UvLfIG4xQuAoPWKxF+ir4vC9
 F07ivZdgH1R3EwiPgS3DeBfwTYjaOaWtbVBfXOs5aGzW99dlwsXz9SNE/g57Tz2TeqWP
 bjNrxrKWGSG/6ZRmzm5s5NAVaivEWFPlRe+AZogZwuCtnFNB7/a0TPthLSDWpEf9d1r5
 X/MzaC69HcApk6Ts5s9TzP/10YmUzxMAehafdRkNMGbTPyEE3I1pyb1n2snO/wS0WSnD XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wkg6m0mg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 15:01:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DE44100034;
 Fri,  6 Dec 2019 15:01:52 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 798F92B3F24;
 Fri,  6 Dec 2019 15:01:52 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Dec 2019 15:01:51 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Dec 2019 15:01:48 +0100
Message-ID: <20191206140149.7426-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206140149.7426-1-patrice.chotard@st.com>
References: <20191206140149.7426-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_03:2019-12-05,2019-12-06 signatures=0
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Chris Packham <judge.packham@gmail.com>
Subject: [Uboot-stm32] [PATCH v1 1/2] Makefile: Fix CONFIG_SYS_UBOOT_START
	default value
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

This patches restores boot on boards which rely on
CONFIG_SYS_UBOOT_START equal to CONFIG_SYS_TEXT_BASE when using SPL

Fixes: d3e97b53c1f2 ("spl: fix entry_point equal to load_addr")

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0ee0c70102..d679459305 100644
--- a/Makefile
+++ b/Makefile
@@ -1265,7 +1265,7 @@ u-boot.ldr.hex u-boot.ldr.srec: u-boot.ldr FORCE
 # from the SPL U-Boot version.
 #
 ifndef CONFIG_SYS_UBOOT_START
-CONFIG_SYS_UBOOT_START := 0
+CONFIG_SYS_UBOOT_START := $(CONFIG_SYS_TEXT_BASE)
 endif
 
 # Boards with more complex image requirements can provide an .its source file
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
