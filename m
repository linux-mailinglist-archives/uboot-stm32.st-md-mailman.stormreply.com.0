Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F72199AD4
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 18:05:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 150F6C36B1E
	for <lists+uboot-stm32@lfdr.de>; Tue, 31 Mar 2020 16:05:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37AFEC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 16:05:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VG3EHl025802; Tue, 31 Mar 2020 18:05:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YKa1zSu24O5oAN1msWUI2SylFxW07raZlPy3yCYk5/Q=;
 b=S15u3kyfinPSM3HOnGTkg6i7g94xGS0C+o3L+cBkCf4RxEhsTMWbatGnIwERPIAoMCyQ
 kckQBOyyroyavs7I6P1ahe0NnZe5OXkkr5OOhzoGz3UP1pPVpgSq3fgRPU4d/9iLzlE4
 JUhadMskmSNuaujWih5HnUrCkiNoeDtSILUnAxnci0IEqNnB0Bzn0uXok627j6ZFGqYG
 fmv1PaJxiCwhVkV24cX1sLjnoCyQ/YhdbXN/WjDLDedYi6z9BsJ9TwXPw20aDC7LmcIL
 6VusJs4pv6FM/58QvlRc+cORowt+0DF078tA6uEsQEdV4kK61UJjIAKCNqWqnGkGQTbS Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 301vkdrd50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 18:05:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EAE2100034;
 Tue, 31 Mar 2020 18:05:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 977CC2BEC70;
 Tue, 31 Mar 2020 18:05:03 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 31 Mar 2020 18:05:03 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 31 Mar 2020 18:04:29 +0200
Message-ID: <20200331180330.12.Ia5fd6d6f4787d69ef9b4b5cebb334e5f2dc81ed3@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
References: <20200331180330.1.Ied6708bad5048382a57618f95d67c549aae49f42@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_05:2020-03-31,
 2020-03-31 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 12/16] board: stm32mp1: add timeout for I/O
	compensation ready
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

This patch avoids infinite loop when I/O compensation failed,
it adds a 1s timeout to detect error.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index fff4cef2c2..75aac6d66c 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -35,6 +35,7 @@
 #include <asm/arch/sys_proto.h>
 #include <jffs2/load_kernel.h>
 #include <linux/err.h>
+#include <linux/iopoll.h>
 #include <power/regulator.h>
 #include <usb/dwc2_udc.h>
 
@@ -473,10 +474,10 @@ static void sysconf_init(void)
 	struct udevice *pwr_dev;
 	struct udevice *pwr_reg;
 	struct udevice *dev;
-	int ret;
 	u32 otp = 0;
 #endif
-	u32 bootr;
+	int ret;
+	u32 bootr, val;
 
 	syscfg = (u8 *)syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
 
@@ -553,8 +554,15 @@ static void sysconf_init(void)
 	 */
 	writel(SYSCFG_CMPENSETR_MPU_EN, syscfg + SYSCFG_CMPENSETR);
 
-	while (!(readl(syscfg + SYSCFG_CMPCR) & SYSCFG_CMPCR_READY))
-		;
+	/* poll until ready (1s timeout) */
+	ret = readl_poll_timeout(syscfg + SYSCFG_CMPCR, val,
+				 val & SYSCFG_CMPCR_READY,
+				 1000000);
+	if (ret) {
+		pr_err("SYSCFG: I/O compensation failed, timeout.\n");
+		led_error_blink(10);
+	}
+
 	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
 #endif
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
