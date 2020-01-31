Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A054814EEA3
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 15:40:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68632C36B0F
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 14:40:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4A91C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 14:40:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VENPOE001705
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=vUGhEM9/SVUr+E6Gke3pJq4+UiYyyxfi0mBxP4vcu84=;
 b=Rk+0anHsNTqA1GuS7WLkcoffrY76g+hMnSPh2A6BSfWOMxgnB/nqde8U/QpC2D9oPWtB
 c7TuiLsjjItgMrrjMv7252umdFupyeq9XPAUJf7dZSdn0Kp0TXnqO/ark4NcDOeEbAXU
 ti+sSNcj6R/Zgj+qIoAz0qTYhe0KsumkYxXTpecSYF4T/IseMrIPaI+8VmjVCTIyD43l
 0Qt1xfhBa6iyxIPdtah3OdsuiFUmXBByRg+LgZYaynKwFUqpkxe/OoqmeWNipumsKRmP
 AtsiOdWpUrxs9TlDbg9k18lw7HuhC+mXhd9Ey5Pl7B6/Ge9+QaoqW0+Rh8bcmiGgt0/A AA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcayecf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0AD510002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB5F72BF9CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:09 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jan 2020 15:40:09 +0100
From: <patrice.chotard@st.com>
To: <patrice.chotard@st.com>, <alexandre.torgue@st.com>,
 <loic.pallardy@st.com>, <benjamin.gaignard@st.com>,
 <gerald.baeza@st.com>, <kamel.kholti@st.com>
Date: Fri, 31 Jan 2020 15:40:04 +0100
Message-ID: <20200131144004.3396-4-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131144004.3396-1-patrice.chotard@st.com>
References: <20200131144004.3396-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [U-BOOT INTERNAL REVIEW][PATCH 3/3] board: stm32:
	remove fdt_high and initrd_high
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

From: Patrice Chotard <patrice.chotard@st.com>

For stm32 f4, f7 and h7 boards, remove fdt_high and
initrd_high as they shouldn't be used, this allows the fdt
and initrd relocation.
This implies to set CONFIG_SYS_BOOTMAPSZ to indicate the
amount of memory available to contain kernel, device tree
and initrd for relocation.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 include/configs/stm32f429-evaluation.h | 7 +++++--
 include/configs/stm32f469-discovery.h  | 7 +++++--
 include/configs/stm32f746-disco.h      | 7 +++++--
 include/configs/stm32h743-disco.h      | 6 ++++--
 include/configs/stm32h743-eval.h       | 6 ++++--
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index f74d027e5d..a7150312ca 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -7,6 +7,11 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 16MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_16M
+
 #define CONFIG_SYS_FLASH_BASE		0x08000000
 
 #define CONFIG_SYS_INIT_SP_ADDR		0x10010000
@@ -44,8 +49,6 @@
 			"scriptaddr=0x00418000\0"		\
 			"pxefile_addr_r=0x00428000\0" \
 			"ramdisk_addr_r=0x00438000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 23ed02ab52..8212fb63de 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -7,6 +7,11 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 12MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_8M + SZ_4M
+
 #define CONFIG_SYS_FLASH_BASE		0x08000000
 
 #define CONFIG_SYS_INIT_SP_ADDR		0x10010000
@@ -44,8 +49,6 @@
 			"scriptaddr=0x00418000\0"		\
 			"pxefile_addr_r=0x00428000\0" \
 			"ramdisk_addr_r=0x00438000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 6d82a9cdd1..45343d2323 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -7,6 +7,11 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 6MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_4M + SZ_2M
+
 #define CONFIG_SYS_FLASH_BASE		0x08000000
 #define CONFIG_SYS_INIT_SP_ADDR		0x20050000
 
@@ -52,8 +57,6 @@
 			"scriptaddr=0xC0418000\0"		\
 			"pxefile_addr_r=0xC0428000\0" \
 			"ramdisk_addr_r=0xC0438000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
index 312f2916d1..39c93ee6f9 100644
--- a/include/configs/stm32h743-disco.h
+++ b/include/configs/stm32h743-disco.h
@@ -8,6 +8,10 @@
 #define __CONFIG_H
 
 #include <config.h>
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 16MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_16M
 
 #define CONFIG_SYS_FLASH_BASE		0x08000000
 #define CONFIG_SYS_INIT_SP_ADDR		0x24040000
@@ -39,8 +43,6 @@
 			"scriptaddr=0xD0418000\0"		\
 			"pxefile_addr_r=0xD0428000\0" \
 			"ramdisk_addr_r=0xD0438000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
index 9f7194ab0b..8eb94c1ad4 100644
--- a/include/configs/stm32h743-eval.h
+++ b/include/configs/stm32h743-eval.h
@@ -8,6 +8,10 @@
 #define __CONFIG_H
 
 #include <config.h>
+#include <linux/sizes.h>
+
+/* For booting Linux, use the first 16MB of memory */
+#define CONFIG_SYS_BOOTMAPSZ		SZ_16M
 
 #define CONFIG_SYS_FLASH_BASE		0x08000000
 #define CONFIG_SYS_INIT_SP_ADDR		0x24040000
@@ -39,8 +43,6 @@
 			"scriptaddr=0xD0418000\0"		\
 			"pxefile_addr_r=0xD0428000\0" \
 			"ramdisk_addr_r=0xD0438000\0"		\
-			"fdt_high=0xffffffffffffffff\0"		\
-			"initrd_high=0xffffffffffffffff\0"	\
 			BOOTENV
 
 /*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
