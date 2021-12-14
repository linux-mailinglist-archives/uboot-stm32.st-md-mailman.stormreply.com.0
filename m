Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4624748A5
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Dec 2021 17:57:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325D1C5E2C5;
	Tue, 14 Dec 2021 16:57:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3795C5E2C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 16:57:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEB4Es3010387;
 Tue, 14 Dec 2021 17:57:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=xpneZFOY4TLsYfi3d1bjvDxCErKnxmCUnsDLa44aUsI=;
 b=NJw54e7d32ywMkNFzngMtm2rg7+m3lJbSCPvaH/52Wf3rDKJU75pq2il0NhkG5omarcV
 IAHiyTAmyk1q2Z4Y8fMl9WBeEjHmx352z+5c1wKtQrmPiKB36a6W+DP31Diqy2vhV4ZE
 lPl50xjbRj1yCzugZoNXVHYjy03GAYZ1+Md6mCPFdjKHtjzXH87xqtdJ+DCMTdtRbAlg
 PCzu/+m197WcDSHYNb3BgLID4ebMUYoekgysAiSPdDkECBLCW7kkpMpxgEzX5UrAflHi
 3yaGB54IkskuTsaK3HezUifOJqTTZo4dGglCGVIq4XoolbKZtXXnCF3Rbgi2b/VFABmu AQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cxnqb4g59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Dec 2021 17:57:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7259D10003A;
 Tue, 14 Dec 2021 17:57:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A35120A089;
 Tue, 14 Dec 2021 17:57:09 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 14 Dec 2021 17:57:08
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 14 Dec 2021 17:57:02 +0100
Message-ID: <20211214175652.RFC.3.Ie095df1d92aa81e8fc78fd288df631790d5666cb@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
References: <20211214165704.479015-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-14_07,2021-12-14_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>, Rick Chen <rick@andestech.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Paul Burton <paul.burton@mips.com>,
 Thomas Chou <thomas@wytron.com.tw>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Andes <uboot@andestech.com>, Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [Uboot-stm32] [RFC PATCH 3/5] mtd: cfi: change
	CONFIG_SYS_MAX_FLASH_BANKS_DETECT as boolean
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

Prepare migration to Kconfig.

CONFIG_SYS_MAX_FLASH_BANKS_DETECT becomes boolean and
CONFIG_SYS_MAX_FLASH_BANKS define the MAX size, also used
for detection when CONFIG_SYS_MAX_FLASH_BANKS_DETECT=y
(CFI_MAX_FLASH_BANKS = CONFIG_SYS_MAX_FLASH_BANKS).

CONFIG_SYS_MAX_FLASH_BANKS become mandatory when
CONFIG_SYS_MAX_FLASH_BANKS_DETECT is activated.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/mtd/cfi_flash.c          | 2 +-
 include/configs/3c120_devboard.h | 3 ++-
 include/configs/adp-ae3xx.h      | 4 +---
 include/configs/adp-ag101p.h     | 2 --
 include/configs/ax25-ae350.h     | 4 +---
 include/configs/bmips_bcm6338.h  | 3 ++-
 include/configs/bmips_bcm6348.h  | 3 ++-
 include/configs/bmips_bcm6358.h  | 3 ++-
 include/configs/bmips_bcm6368.h  | 3 ++-
 include/configs/boston.h         | 4 +++-
 include/configs/draak.h          | 3 ++-
 include/configs/ebisu.h          | 3 ++-
 include/configs/j721e_evm.h      | 3 ++-
 include/configs/mccmon6.h        | 3 ++-
 include/configs/qemu-arm.h       | 3 ++-
 include/configs/salvator-x.h     | 3 ++-
 include/configs/ulcb.h           | 3 ++-
 include/mtd/cfi_flash.h          | 6 +++---
 18 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/cfi_flash.c b/drivers/mtd/cfi_flash.c
index 71cefc125f..aae3ea0d1b 100644
--- a/drivers/mtd/cfi_flash.c
+++ b/drivers/mtd/cfi_flash.c
@@ -96,7 +96,7 @@ static u16 cfi_flash_config_reg(int i)
 }
 
 #if defined(CONFIG_SYS_MAX_FLASH_BANKS_DETECT)
-int cfi_flash_num_flash_banks = CONFIG_SYS_MAX_FLASH_BANKS_DETECT;
+int cfi_flash_num_flash_banks = CFI_MAX_FLASH_BANKS;
 #else
 int cfi_flash_num_flash_banks;
 #endif
diff --git a/include/configs/3c120_devboard.h b/include/configs/3c120_devboard.h
index f7ad7efb0d..e52fedcf39 100644
--- a/include/configs/3c120_devboard.h
+++ b/include/configs/3c120_devboard.h
@@ -20,7 +20,8 @@
  * CFI Flash
  */
 #define CONFIG_SYS_CFI_FLASH_STATUS_POLL /* fix amd flash issue */
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	512
 
 /*
diff --git a/include/configs/adp-ae3xx.h b/include/configs/adp-ae3xx.h
index 973033d6b4..d8fc1758b8 100644
--- a/include/configs/adp-ae3xx.h
+++ b/include/configs/adp-ae3xx.h
@@ -159,7 +159,7 @@
 
 /* support JEDEC */
 #ifdef CONFIG_CFI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #endif
 
 /* Do not use CONFIG_FLASH_CFI_LEGACY to detect on board flash */
@@ -176,9 +176,7 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
  */
-#ifndef CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
-#endif
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/adp-ag101p.h b/include/configs/adp-ag101p.h
index f533ada73f..072cd535c3 100644
--- a/include/configs/adp-ag101p.h
+++ b/include/configs/adp-ag101p.h
@@ -289,9 +289,7 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
  */
-#ifndef CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
-#endif
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/ax25-ae350.h b/include/configs/ax25-ae350.h
index 1c3f957d32..2ad0d1589c 100644
--- a/include/configs/ax25-ae350.h
+++ b/include/configs/ax25-ae350.h
@@ -80,7 +80,7 @@
 
 /* support JEDEC */
 #ifdef CONFIG_CFI_FLASH
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #endif/* Do not use CONFIG_FLASH_CFI_LEGACY to detect on board flash */
 #define PHYS_FLASH_1			0x88000000	/* BANK 0 */
 #define CONFIG_SYS_FLASH_BASE		PHYS_FLASH_1
@@ -95,9 +95,7 @@
  * There are 4 banks supported for this Controller,
  * but we have only 1 bank connected to flash on board
 */
-#ifndef CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_BANKS	1
-#endif
 #define CONFIG_SYS_FLASH_BANKS_SIZES {0x4000000}
 
 /* max number of sectors on one chip */
diff --git a/include/configs/bmips_bcm6338.h b/include/configs/bmips_bcm6338.h
index 6eaca1c31b..b7de3f4058 100644
--- a/include/configs/bmips_bcm6338.h
+++ b/include/configs/bmips_bcm6338.h
@@ -22,6 +22,7 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbfc00000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS		1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6338_H */
diff --git a/include/configs/bmips_bcm6348.h b/include/configs/bmips_bcm6348.h
index 5bfbcb779b..5ed0eebce4 100644
--- a/include/configs/bmips_bcm6348.h
+++ b/include/configs/bmips_bcm6348.h
@@ -29,6 +29,7 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbfc00000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS		1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6348_H */
diff --git a/include/configs/bmips_bcm6358.h b/include/configs/bmips_bcm6358.h
index f8c81f698d..829e9f6b17 100644
--- a/include/configs/bmips_bcm6358.h
+++ b/include/configs/bmips_bcm6358.h
@@ -31,6 +31,7 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xbe000000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6358_H */
diff --git a/include/configs/bmips_bcm6368.h b/include/configs/bmips_bcm6368.h
index 7d321e14ff..0952b98473 100644
--- a/include/configs/bmips_bcm6368.h
+++ b/include/configs/bmips_bcm6368.h
@@ -31,6 +31,7 @@
 
 #define CONFIG_SYS_FLASH_BASE			0xb8000000
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 #endif /* __CONFIG_BMIPS_BCM6368_H */
diff --git a/include/configs/boston.h b/include/configs/boston.h
index cd70e7bd32..7ac044e929 100644
--- a/include/configs/boston.h
+++ b/include/configs/boston.h
@@ -40,7 +40,9 @@
 /*
  * Flash
  */
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT		1024
 
 /*
diff --git a/include/configs/draak.h b/include/configs/draak.h
index d28cc9d336..412c57f150 100644
--- a/include/configs/draak.h
+++ b/include/configs/draak.h
@@ -23,7 +23,8 @@
 #define CONFIG_FLASH_SHOW_PROGRESS	45
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/ebisu.h b/include/configs/ebisu.h
index 48d4c8a948..eef2b69bbd 100644
--- a/include/configs/ebisu.h
+++ b/include/configs/ebisu.h
@@ -27,7 +27,8 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/j721e_evm.h b/include/configs/j721e_evm.h
index 10555d1a6c..acac81ad68 100644
--- a/include/configs/j721e_evm.h
+++ b/include/configs/j721e_evm.h
@@ -60,7 +60,8 @@
 #define CONFIG_CQSPI_REF_CLK		133333333
 
 /* HyperFlash related configuration */
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT 1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 
 /* U-Boot general configuration */
 #define EXTRA_ENV_J721E_BOARD_SETTINGS					\
diff --git a/include/configs/mccmon6.h b/include/configs/mccmon6.h
index 11b9ceb547..aa95864516 100644
--- a/include/configs/mccmon6.h
+++ b/include/configs/mccmon6.h
@@ -37,7 +37,8 @@
 #define CONFIG_FLASH_VERIFY
 
 /* NOR Flash MTD */
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT 1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ (CONFIG_SYS_FLASH_BASE) }
 #define CONFIG_SYS_FLASH_BANKS_SIZES	{ (32 * SZ_1M) }
 
diff --git a/include/configs/qemu-arm.h b/include/configs/qemu-arm.h
index 1287fd1671..fe958ef3c5 100644
--- a/include/configs/qemu-arm.h
+++ b/include/configs/qemu-arm.h
@@ -42,7 +42,8 @@
 #define CONFIG_SYS_CBSIZE 512
 
 #define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_TEXT_BASE
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	2
+#define CONFIG_SYS_MAX_FLASH_BANKS	2
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256 /* Sector: 256K, Bank: 64M */
 #define CONFIG_CFI_FLASH_USE_WEAK_ACCESSORS
 
diff --git a/include/configs/salvator-x.h b/include/configs/salvator-x.h
index 1eafff10ff..a866517a75 100644
--- a/include/configs/salvator-x.h
+++ b/include/configs/salvator-x.h
@@ -25,7 +25,8 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/configs/ulcb.h b/include/configs/ulcb.h
index 1ce844f492..4be522f866 100644
--- a/include/configs/ulcb.h
+++ b/include/configs/ulcb.h
@@ -25,7 +25,8 @@
 #define CONFIG_SYS_FLASH_BANKS_LIST	{ 0x08000000 }
 #define CONFIG_SYS_FLASH_CFI
 #define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_16BIT
-#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT	1
+#define CONFIG_SYS_MAX_FLASH_BANKS	1
+#define CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #define CONFIG_SYS_MAX_FLASH_SECT	256
 #define CONFIG_SYS_WRITE_SWAPPED_DATA
 
diff --git a/include/mtd/cfi_flash.h b/include/mtd/cfi_flash.h
index d62c8f18fc..34225c190e 100644
--- a/include/mtd/cfi_flash.h
+++ b/include/mtd/cfi_flash.h
@@ -158,8 +158,9 @@ struct cfi_pri_hdr {
  * cfi_flash_num_flash_banks when CONFIG_SYS_MAX_FLASH_BANKS_DETECT is defined
  * or CONFIG_SYS_MAX_FLASH_BANKS
  */
-#if defined(CONFIG_SYS_MAX_FLASH_BANKS_DETECT)
-#define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS_DETECT
+#define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS
+
+#ifdef CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 /* map to cfi_flash_num_flash_banks only when supported */
 #if IS_ENABLED(CONFIG_FLASH_CFI_DRIVER) && \
     (!IS_ENABLED(CONFIG_SPL_BUILD) || IS_ENABLED(CONFIG_SPL_MTD_SUPPORT))
@@ -170,7 +171,6 @@ extern int cfi_flash_num_flash_banks;
 #define CFI_FLASH_BANKS		CONFIG_SYS_MAX_FLASH_BANKS_DETECT
 #endif
 #else
-#define CFI_MAX_FLASH_BANKS	CONFIG_SYS_MAX_FLASH_BANKS
 #define CFI_FLASH_BANKS		CONFIG_SYS_MAX_FLASH_BANKS
 #endif
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
