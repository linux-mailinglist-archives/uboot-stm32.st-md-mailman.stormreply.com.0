Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF001151C0
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 15:02:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BDA7C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2019 14:02:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F4E3C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 14:02:12 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6DqVkj016300; Fri, 6 Dec 2019 15:01:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=TP5B9P3uFw7eGL7Xg5r6bcDx/nx5d4OWeU5xKFZ72eM=;
 b=FJm/hQZBK8s3OMzQM1NN8VIYnLBgjh8ZWctDRgnb1tnc+py+uMAO4wJDEfrDwLsyY+CJ
 Ty17NmzUq8dHlMIyD1ZUHq4gvyH/X48ah+mMBUj5yD1pTh5t7NXZEj7twFgFYVoRPtW8
 Rj7vZk/ZMKRqyesQSXBT0iY+9SS9j31GDcC7MNhxDxWhX13yqvfgTjW04pLxYOgQpzFI
 WYPu6Eo+FWCitcG8xm9dPcC9zP5GMDn+BKF4vNYoePIyevdpU3CfNOBLB8QbHiVK2SIy
 szRigq5tsP9FzZjC/Ob+zE7Sc0kJPg+64V8A9HxyswFBao1GvhFmWg3HUwa9rvg8F0y7 JA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wkf2y8ssy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 15:01:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D902100038;
 Fri,  6 Dec 2019 15:01:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 565B52B3F24;
 Fri,  6 Dec 2019 15:01:53 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Dec 2019 15:01:52 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Dec 2019 15:01:49 +0100
Message-ID: <20191206140149.7426-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206140149.7426-1-patrice.chotard@st.com>
References: <20191206140149.7426-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_03:2019-12-05,2019-12-06 signatures=0
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pankit Garg <pankit.garg@nxp.com>,
 "Albert ARIBAUD \(3ADEV\)" <albert.aribaud@3adev.fr>,
 Fabien Parent <fparent@baylibre.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>, Udit Agarwal <udit.agarwal@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Vinitha V Pillai <vinitha.pillai@nxp.com>,
 Peter Robinson <pbrobinson@gmail.com>, Stefan Roese <sr@denx.de>,
 Otavio Salvador <otavio@ossystems.com.br>,
 Mingming lee <mingming.lee@mediatek.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Mian Yousaf Kaukab <ykaukab@suse.de>,
 Vabhav Sharma <vabhav.sharma@nxp.com>, Michal Simek <monstr@monstr.eu>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [Uboot-stm32] [PATCH v1 2/2] treewide: Remove
	CONFIG_SYS_UBOOT_START from configs board files
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

As previous CONFIG_SYS_UBOOT_START is now set by default to
CONFIG_SYS_TEXT_BASE when not defined, CONFIG_SYS_UBOOT_START
can be removed from include/configs board files.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

---

 include/configs/gardena-smart-gateway-at91sam.h | 1 -
 include/configs/ls1046a_common.h                | 1 -
 include/configs/mccmon6.h                       | 1 -
 include/configs/microblaze-generic.h            | 2 --
 include/configs/mt7623.h                        | 1 -
 include/configs/mt7629.h                        | 1 -
 include/configs/mt8518.h                        | 1 -
 include/configs/omap3_cairo.h                   | 1 -
 include/configs/pumpkin.h                       | 1 -
 include/configs/tegra-common.h                  | 1 -
 include/configs/x600.h                          | 1 -
 include/configs/xilinx_zynqmp_r5.h              | 2 --
 include/configs/zynq-common.h                   | 2 --
 13 files changed, 16 deletions(-)

diff --git a/include/configs/gardena-smart-gateway-at91sam.h b/include/configs/gardena-smart-gateway-at91sam.h
index 482e4714b1..f5ee65cb8a 100644
--- a/include/configs/gardena-smart-gateway-at91sam.h
+++ b/include/configs/gardena-smart-gateway-at91sam.h
@@ -64,7 +64,6 @@
 #define CONFIG_SPL_NAND_RAW_ONLY
 #define CONFIG_SYS_NAND_U_BOOT_OFFS	0x40000
 #define CONFIG_SYS_NAND_U_BOOT_SIZE	0xa0000
-#define	CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #define	CONFIG_SYS_NAND_U_BOOT_START	CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_NAND_U_BOOT_DST	CONFIG_SYS_TEXT_BASE
 
diff --git a/include/configs/ls1046a_common.h b/include/configs/ls1046a_common.h
index cc8f4c0210..6543cfd868 100644
--- a/include/configs/ls1046a_common.h
+++ b/include/configs/ls1046a_common.h
@@ -98,7 +98,6 @@
 					CONFIG_SPL_BSS_MAX_SIZE)
 #define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
 #define CONFIG_SYS_MONITOR_LEN		0x100000
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #endif
 
 /* NAND SPL */
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index 045a9f7bdf..0aee1e1cf6 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -12,7 +12,6 @@
 #define CONFIG_SPL_LIBCOMMON_SUPPORT
 #include "imx6_spl.h"
 
-#define CONFIG_SYS_UBOOT_START CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_UBOOT_BASE (CONFIG_SYS_FLASH_BASE + 0x80000)
 #define CONFIG_SYS_SPL_ARGS_ADDR	0x18000000
 
diff --git a/include/configs/microblaze-generic.h b/include/configs/microblaze-generic.h
index 385b30c99b..8ca0e83c78 100644
--- a/include/configs/microblaze-generic.h
+++ b/include/configs/microblaze-generic.h
@@ -173,8 +173,6 @@
 /* Just for sure that there is a space for stack */
 #define CONFIG_SPL_STACK_SIZE		0x100
 
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
-
 #define CONFIG_SPL_MAX_FOOTPRINT	(CONFIG_SYS_INIT_RAM_SIZE - \
 					 CONFIG_SYS_INIT_RAM_ADDR - \
 					 CONFIG_SYS_MALLOC_F_LEN - \
diff --git a/include/configs/mt7623.h b/include/configs/mt7623.h
index e5182aeea8..faab0913fc 100644
--- a/include/configs/mt7623.h
+++ b/include/configs/mt7623.h
@@ -31,7 +31,6 @@
 #define CONFIG_ENV_OVERWRITE
 
 /* Preloader -> Uboot */
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE + SZ_2M - \
 					 GENERATED_GBL_DATA_SIZE)
 
diff --git a/include/configs/mt7629.h b/include/configs/mt7629.h
index 4aef894c6e..6a6c2f2414 100644
--- a/include/configs/mt7629.h
+++ b/include/configs/mt7629.h
@@ -40,7 +40,6 @@
 #define CONFIG_SYS_UBOOT_BASE		(CONFIG_SPI_ADDR + CONFIG_SPL_PAD_TO)
 
 /* SPL -> Uboot */
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE + SZ_2M - \
 					 GENERATED_GBL_DATA_SIZE)
 
diff --git a/include/configs/mt8518.h b/include/configs/mt8518.h
index a7fe83a605..514722be99 100644
--- a/include/configs/mt8518.h
+++ b/include/configs/mt8518.h
@@ -29,7 +29,6 @@
 #define CONFIG_SYS_BOOTM_LEN			SZ_64M
 
 /* Uboot definition */
-#define CONFIG_SYS_UBOOT_START			CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_INIT_SP_ADDR			(CONFIG_SYS_TEXT_BASE + \
 						SZ_2M - \
 						GENERATED_GBL_DATA_SIZE)
diff --git a/include/configs/omap3_cairo.h b/include/configs/omap3_cairo.h
index 1b1a56d7cd..c76c81ddd5 100644
--- a/include/configs/omap3_cairo.h
+++ b/include/configs/omap3_cairo.h
@@ -26,7 +26,6 @@
  * other needs.  We use this rather than the inherited defines from
  * ti_armv7_common.h for backwards compatibility.
  */
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #define CONFIG_SPL_BSS_START_ADDR	0x80000000
 #define CONFIG_SPL_BSS_MAX_SIZE		(512 << 10)	/* 512 KB */
 #define CONFIG_SYS_SPL_MALLOC_START	0x80208000
diff --git a/include/configs/pumpkin.h b/include/configs/pumpkin.h
index 35e28be950..9c52cae41d 100644
--- a/include/configs/pumpkin.h
+++ b/include/configs/pumpkin.h
@@ -23,7 +23,6 @@
 #define CONFIG_SYS_NS16550_COM1		0x11005000
 #define CONFIG_SYS_NS16550_CLK		26000000
 
-#define CONFIG_SYS_UBOOT_START		CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_TEXT_BASE + SZ_2M - \
 						 GENERATED_GBL_DATA_SIZE)
 
diff --git a/include/configs/tegra-common.h b/include/configs/tegra-common.h
index b4da1f8428..f2cdd9c019 100644
--- a/include/configs/tegra-common.h
+++ b/include/configs/tegra-common.h
@@ -61,7 +61,6 @@
 #define PHYS_SDRAM_1		NV_PA_SDRC_CS0
 #define PHYS_SDRAM_1_SIZE	0x20000000	/* 512M */
 
-#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
 
 #define CONFIG_SYS_BOOTMAPSZ	(256 << 20)	/* 256M */
diff --git a/include/configs/x600.h b/include/configs/x600.h
index 63092b24a5..8b6caae7be 100644
--- a/include/configs/x600.h
+++ b/include/configs/x600.h
@@ -27,7 +27,6 @@
 #define CONFIG_SYS_SPL_LEN			CONFIG_SPL_PAD_TO
 #define CONFIG_SYS_UBOOT_BASE			(CONFIG_SYS_FLASH_BASE + \
 						 CONFIG_SYS_SPL_LEN)
-#define CONFIG_SYS_UBOOT_START			CONFIG_SYS_TEXT_BASE
 #define CONFIG_SYS_MONITOR_BASE			CONFIG_SYS_FLASH_BASE
 #define CONFIG_SYS_MONITOR_LEN			0x60000
 
diff --git a/include/configs/xilinx_zynqmp_r5.h b/include/configs/xilinx_zynqmp_r5.h
index 38d952d0c0..155d7fe883 100644
--- a/include/configs/xilinx_zynqmp_r5.h
+++ b/include/configs/xilinx_zynqmp_r5.h
@@ -35,8 +35,6 @@
 /* Extend size of kernel image for uncompression */
 #define CONFIG_SYS_BOOTM_LEN	(60 * 1024 * 1024)
 
-#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
-
 #define CONFIG_SKIP_LOWLEVEL_INIT
 
 /* 0x0 - 0x40 is used for placing exception vectors */
diff --git a/include/configs/zynq-common.h b/include/configs/zynq-common.h
index 274cc19112..189ca81bbe 100644
--- a/include/configs/zynq-common.h
+++ b/include/configs/zynq-common.h
@@ -274,6 +274,4 @@
 
 #define CONFIG_SPL_LOAD_FIT_ADDRESS 0x10000000
 
-#define CONFIG_SYS_UBOOT_START	CONFIG_SYS_TEXT_BASE
-
 #endif /* __CONFIG_ZYNQ_COMMON_H */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
