Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5D6FCD2
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 17:26:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86FACC35E03
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Apr 2019 15:26:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB0A5C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2019 15:26:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3UFNEYe003609; Tue, 30 Apr 2019 17:26:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cSaPa3kpXJj6Z9REFFTN0WrnUwD9cv6+sbfI4DlrWzg=;
 b=yE44buPaCvkTl4XALvKHHvIFHUQXhdkgoR8hnIGx1DJ2McNGsFO/TN+GWV6dn/bUkftn
 zpTpOD3Mpf+s6gpVTvmxQTF6SPohm0TOqlEVNgjaCpign4jVVZevHwCd3YW7ych7nXv3
 3kVVdLHdjZu9gaObGzhnx3PsqHHOHvKZEJTojFiDjDMiGn/dmvoRKApaVN072abqqBQP
 4mSqyD5AefPRVCkRW9emcGLpv0YL9PBcRS6M12coSWh+mfWU8eeSxx2XTv45KQnkKq/Z
 ok646BKvyqk7HqQ2Ph+pxeNeGZ1IYACGeRJQU5KbU+Ezd7B4gYaCPB5dxJxUBkaEGKUB TQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2s6rs8g27m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Apr 2019 17:26:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8F1138;
 Tue, 30 Apr 2019 15:26:30 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B09E228B8;
 Tue, 30 Apr 2019 15:26:30 +0000 (GMT)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Tue, 30 Apr 2019 17:26:30 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>, <michal.simek@xilinx.com>, <sr@denx.de>,
 <u-boot@lists.denx.de>
Date: Tue, 30 Apr 2019 17:26:20 +0200
Message-ID: <1556637983-5654-2-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
References: <1556637983-5654-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 1/4] watchdog: Kconfig: Sort entry
	alphabetically
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

To make adding new entry easier, sort Kconfig entries in
alphabetical order.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
Reviewed-by: Stefan Roese <sr@denx.de>
---

Changes in v2: None

 drivers/watchdog/Kconfig | 87 ++++++++++++++++++++++++------------------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 3bce0aa..4a3ff7a 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -26,6 +26,13 @@ config BCM2835_WDT
 	  This provides basic infrastructure to support BCM2835/2836 watchdog
 	  hardware, with a max timeout of ~15secs.
 
+config IMX_WATCHDOG
+	bool "Enable Watchdog Timer support for IMX and LSCH2 of NXP"
+	select HW_WATCHDOG
+	help
+	   Select this to enable the IMX and LSCH2 of Layerscape watchdog
+	   driver.
+
 config OMAP_WATCHDOG
 	bool "TI OMAP watchdog driver"
 	depends on ARCH_OMAP2PLUS
@@ -59,14 +66,6 @@ config WDT
 	  What exactly happens when the timer expires is up to a particular
 	  device/driver.
 
-config WDT_SANDBOX
-	bool "Enable Watchdog Timer support for Sandbox"
-	depends on SANDBOX && WDT
-	help
-	  Enable Watchdog Timer support in Sandbox. This is a dummy device that
-	  can be probed and supports all of the methods of WDT, but does not
-	  really do anything.
-
 config WDT_ARMADA_37XX
 	bool "Marvell Armada 37xx watchdog timer support"
 	depends on WDT && ARMADA_3700
@@ -87,6 +86,13 @@ config WDT_ASPEED
 	  It currently does not support Boot Flash Addressing Mode Detection or
 	  Second Boot.
 
+config WDT_AT91
+	bool "AT91 watchdog timer support"
+	depends on WDT
+	help
+	   Select this to enable Microchip watchdog timer, which can be found on
+	   some AT91 devices.
+
 config WDT_BCM6345
 	bool "BCM6345 watchdog timer support"
 	depends on WDT && (ARCH_BMIPS || ARCH_BCM6858 || ARCH_BCM63158)
@@ -95,14 +101,6 @@ config WDT_BCM6345
 	  The watchdog timer is stopped when initialized.
 	  It performs full SoC reset.
 
-config WDT_ORION
-	bool "Orion watchdog timer support"
-	depends on WDT
-	select CLK
-	help
-	   Select this to enable Orion watchdog timer, which can be found on some
-	   Marvell Armada chips.
-
 config WDT_CDNS
 	bool "Cadence watchdog timer support"
 	depends on WDT
@@ -111,6 +109,20 @@ config WDT_CDNS
 	   Select this to enable Cadence watchdog timer, which can be found on some
 	   Xilinx Microzed Platform.
 
+config WDT_MPC8xx
+	bool "MPC8xx watchdog timer support"
+	depends on WDT && MPC8xx
+	select CONFIG_MPC8xx_WATCHDOG
+	help
+	   Select this to enable mpc8xx watchdog timer
+
+config WDT_MT7621
+	bool "MediaTek MT7621 watchdog timer support"
+	depends on WDT && ARCH_MT7620
+	help
+	   Select this to enable Ralink / Mediatek watchdog timer,
+	   which can be found on some MediaTek chips.
+
 config WDT_MTK
 	bool "MediaTek watchdog timer support"
 	depends on WDT && ARCH_MEDIATEK
@@ -119,39 +131,28 @@ config WDT_MTK
 	  The watchdog timer is stopped when initialized.
 	  It performs full SoC reset.
 
-config XILINX_TB_WATCHDOG
-	bool "Xilinx Axi watchdog timer support"
+config WDT_ORION
+	bool "Orion watchdog timer support"
 	depends on WDT
-	imply WATCHDOG
+	select CLK
 	help
-	   Select this to enable Xilinx Axi watchdog timer, which can be found on some
-	   Xilinx Microblaze Platforms.
+	   Select this to enable Orion watchdog timer, which can be found on some
+	   Marvell Armada chips.
 
-config IMX_WATCHDOG
-	bool "Enable Watchdog Timer support for IMX and LSCH2 of NXP"
-	select HW_WATCHDOG
+config WDT_SANDBOX
+	bool "Enable Watchdog Timer support for Sandbox"
+	depends on SANDBOX && WDT
 	help
-	   Select this to enable the IMX and LSCH2 of Layerscape watchdog
-	   driver.
+	  Enable Watchdog Timer support in Sandbox. This is a dummy device that
+	  can be probed and supports all of the methods of WDT, but does not
+	  really do anything.
 
-config WDT_AT91
-	bool "AT91 watchdog timer support"
+config XILINX_TB_WATCHDOG
+	bool "Xilinx Axi watchdog timer support"
 	depends on WDT
+	imply WATCHDOG
 	help
-	   Select this to enable Microchip watchdog timer, which can be found on
-	   some AT91 devices.
-
-config WDT_MT7621
-	bool "MediaTek MT7621 watchdog timer support"
-	depends on WDT && ARCH_MT7620
-	help
-	   Select this to enable Ralink / Mediatek watchdog timer,
-	   which can be found on some MediaTek chips.
-
-config WDT_MPC8xx
-	bool "MPC8xx watchdog timer support"
-	depends on WDT && MPC8xx
-	help
-	   Select this to enable mpc8xx watchdog timer
+	   Select this to enable Xilinx Axi watchdog timer, which can be found on some
+	   Xilinx Microblaze Platforms.
 
 endmenu
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
