Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C6D4137AF
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Sep 2021 18:36:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2DB0C5A4CC;
	Tue, 21 Sep 2021 16:36:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 881DEC57189
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Sep 2021 16:36:20 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18LDWTU0024317; 
 Tue, 21 Sep 2021 18:36:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HH91IlqEGuHjYonby7/W5GwCJFB0deRWK5NzwO8CRyE=;
 b=Ozm9KwF1TwC0J66bA0JWUYcYZzxB1RXqXuf3bQ6xcE/xrxvlpPzZJkLhM1W9wQHQf9yG
 8Zf5mFjqLBi8ZnvPpRfZAt4w2xowiZ1DgR53pTXSMV9BMDvlohNs2HyuLbxxmq54wBcp
 UcKZ3dEpiv0H5rTQGkqoI8QVZd9stEaRD9q/IWdTiNlTKAl895D8KtoSE8dPbp+16yiF
 Fi/DW0qQQq9yAbgO9ODmovkiz8w94tU31jTPjGe0YTckpZ4hLhoxAT9E6iTGRMCL/ArI
 v5x2IMY++x/V9zdwzZiE7UTMC3IjEeLcABhP/b3CeNYV2wvLrgzXDJgnCs00df1wcqNx eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3b7arrjq1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 18:36:06 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1F3E310002A;
 Tue, 21 Sep 2021 18:36:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BE72C23656D;
 Tue, 21 Sep 2021 18:36:05 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep 2021 18:36:05
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 21 Sep 2021 18:36:03 +0200
Message-ID: <20210921183600.1.I82d7f080bc204e75e2f305a8056363038d3d9c0d@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-21_04,2021-09-20_01,2020-04-07_01
Cc: Stefan Roese <sr@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH] configs: Migrate CONFIG_ST_SMI to Kconfig
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

Use moveconfig.py script to convert the define CONFIG_ST_SMI to Kconfig
and move this entries to defconfigs.

Before migration, the st_smi.c driver was empty when CONFIG_MTD_NOR_FLASH
wasn't activated; it is now managed in Kconfig by the "depends on" and
this driver is not compiled.

After this patch, the driver st_smic.c is no more used in U-Boot;
it was only used in SPEAr products before commit 570c3dcfc153 ("arm:
Remove spear600 boards and the rest of SPEAr support").

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
In the first migration process (without depends on) the config
CONFIG_ST_SMI was added in bcm7445_defconfig and bcm7260_defconfig.

But after adding the "depends on MTD_NOR_FLASH" and a Rsync all defconfig
files using moveconfig.py the CONFIG_ST_SMI is also deactivated in these
2 last users:
- bcm7260_defconfig
- bcm7445_defconfig

The U-Boot size don't change for these 2 defconfig (tested with buildman).

 drivers/mtd/Kconfig          | 7 +++++++
 drivers/mtd/st_smi.c         | 3 ---
 include/configs/bcmstb.h     | 1 -
 scripts/config_whitelist.txt | 1 -
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index b303fabe0f..9ba163bdab 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -109,6 +109,13 @@ config HBMC_AM654
 	 This is the driver for HyperBus controller on TI's AM65x and
 	 other SoCs
 
+config ST_SMI
+	bool "SMI driver"
+	depends on MTD_NOR_FLASH
+	help
+	  This enables access to the serial memory interface controller (SMI)
+	  used in STMicroelectronics SPEAr products.
+
 source "drivers/mtd/nand/Kconfig"
 
 source "drivers/mtd/spi/Kconfig"
diff --git a/drivers/mtd/st_smi.c b/drivers/mtd/st_smi.c
index 7c652e6c53..9b9393fbb1 100644
--- a/drivers/mtd/st_smi.c
+++ b/drivers/mtd/st_smi.c
@@ -13,8 +13,6 @@
 #include <asm/io.h>
 #include <asm/arch/hardware.h>
 
-#if defined(CONFIG_MTD_NOR_FLASH)
-
 static struct smi_regs *const smicntl =
     (struct smi_regs * const)CONFIG_SYS_SMI_BASE;
 static ulong bank_base[CONFIG_SYS_MAX_FLASH_BANKS] =
@@ -562,4 +560,3 @@ int flash_erase(flash_info_t *info, int s_first, int s_last)
 	puts(" done\n");
 	return rcode;
 }
-#endif
diff --git a/include/configs/bcmstb.h b/include/configs/bcmstb.h
index 7f1c298cdc..54e5655af6 100644
--- a/include/configs/bcmstb.h
+++ b/include/configs/bcmstb.h
@@ -127,7 +127,6 @@ extern phys_addr_t prior_stage_fdt_address;
 /*
  * Flash configuration.
  */
-#define CONFIG_ST_SMI
 #define CONFIG_SPI_FLASH_STMICRO
 #define CONFIG_SPI_FLASH_MACRONIX
 
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 36b8cc1db0..6c8277cba9 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1308,7 +1308,6 @@ CONFIG_STM32_FLASH
 CONFIG_STV0991
 CONFIG_STV0991_HZ
 CONFIG_STV0991_HZ_CLOCK
-CONFIG_ST_SMI
 CONFIG_SXNI855T
 CONFIG_SYSFS
 CONFIG_SYSMGR_ISWGRP_HANDOFF
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
