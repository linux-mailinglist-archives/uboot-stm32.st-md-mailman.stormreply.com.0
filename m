Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0FE2347D3
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 675B6C36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1744BC36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:01 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VEScd0016906; Fri, 31 Jul 2020 16:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qFuuIzd0Ev36tDFMMGjTAa7zZS7j8IAyqYX9vPv+L6k=;
 b=z7bu+WnRJVaRQkWzuVBk/zUoUsVDoVEisUCu6f+eZpr2D+ej/KMTNR8zdFXZHo9uOP/N
 b6ldbVdazBJF47Ync+1hWkvfRp3rTvErwR0MjrI1mTLig3lYXXWHbkrrhITG9tq1rj7a
 KYNYSkxH4HA/KbFfOV/2Xw1sOpKfnzNl3TGOb7D0/SHRm9ND1l6wSOWK6DpbPwQgnuFa
 jILJz1jrBqJdjKDklKeGtFPjGFToZPbdopEJBv0Y37pQKIGVPadoa9FOk/Vm9LIhwUz4
 LOZVu3+ZGG94iDQxiff/On3qYP5z5pTQ4EfUvdJuNC+HCu/PAh5Du3L+bw3jfB0mVq96 Qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgpu9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 930CC100034;
 Fri, 31 Jul 2020 16:31:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8C68D2B1899;
 Fri, 31 Jul 2020 16:31:59 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:31:59 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:45 +0200
Message-ID: <20200731143152.8812-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 04/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in sysconf_init
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

Use IS_ENABLED to prevent ifdef in sysconf_init.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 3182f44598..a0a2f9978f 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -428,14 +428,11 @@ static int board_check_usb_power(void)
 
 static void sysconf_init(void)
 {
-#ifndef CONFIG_TFABOOT
 	u8 *syscfg;
-#ifdef CONFIG_DM_REGULATOR
 	struct udevice *pwr_dev;
 	struct udevice *pwr_reg;
 	struct udevice *dev;
 	u32 otp = 0;
-#endif
 	int ret;
 	u32 bootr, val;
 
@@ -453,7 +450,6 @@ static void sysconf_init(void)
 	bootr |= (bootr & SYSCFG_BOOTR_BOOT_MASK) << SYSCFG_BOOTR_BOOTPD_SHIFT;
 	writel(bootr, syscfg + SYSCFG_BOOTR);
 
-#ifdef CONFIG_DM_REGULATOR
 	/* High Speed Low Voltage Pad mode Enable for SPI, SDMMC, ETH, QSPI
 	 * and TRACE. Needed above ~50MHz and conditioned by AFMUX selection.
 	 * The customer will have to disable this for low frequencies
@@ -470,7 +466,7 @@ static void sysconf_init(void)
 	ret = uclass_get_device_by_driver(UCLASS_PMIC,
 					  DM_GET_DRIVER(stm32mp_pwr_pmic),
 					  &pwr_dev);
-	if (!ret) {
+	if (!ret && IS_ENABLED(CONFIG_DM_REGULATOR)) {
 		ret = uclass_get_device_by_driver(UCLASS_MISC,
 						  DM_GET_DRIVER(stm32mp_bsec),
 						  &dev);
@@ -507,7 +503,6 @@ static void sysconf_init(void)
 			debug("VDD unknown");
 		}
 	}
-#endif
 
 	/* activate automatic I/O compensation
 	 * warning: need to ensure CSI enabled and ready in clock driver
@@ -524,7 +519,6 @@ static void sysconf_init(void)
 	}
 
 	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
-#endif
 }
 
 #ifdef CONFIG_DM_REGULATOR
@@ -647,7 +641,8 @@ int board_init(void)
 	regulators_enable_boot_on(_DEBUG);
 #endif
 
-	sysconf_init();
+	if (!IS_ENABLED(CONFIG_TFABOOT))
+		sysconf_init();
 
 	if (CONFIG_IS_ENABLED(LED))
 		led_default_state();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
