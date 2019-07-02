Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C115CE57
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 13:26:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8291EC6A5F0
	for <lists+uboot-stm32@lfdr.de>; Tue,  2 Jul 2019 11:26:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4850C6A5F0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 11:26:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62BLTK1017858; Tue, 2 Jul 2019 13:26:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2m1lPUPVsz4QeymhSKnCbyEvx0A+IzZs5hjd1nRTflo=;
 b=UdMq6BQVAUzXaOVo+/axZ79GlGrwEW0mqTv+yu3Lakq5PGdnyFh1K2ePSUC52ppGV+PK
 xQ4ceLe1+Vxf2mXn5G4RpghXe4yQ2yjwCQ/YYPttgYNQf1YkoYbwi+gCHm/LpQO1sNI+
 Zs8vLo7ccn8Yz5zoXsJPPewqSZ7QWOLHlJgtyBn3V5F7eRiEJJPOSzN0zFKYt76i6eqB
 gIInp99tpNtYbc8sTVeCJ9i62H0b7R1Lp8S7DVMLARH38bcQvwjaMLwunCm8r6RqXyh7
 iwxH6Ibizv1HZKY0NVf22Xo8Cvzye85P79rZ4Dfpys9USX7qFkTyf/0KhT2WW3PYjqL7 VQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvhucmu-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 13:26:17 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FD4441;
 Tue,  2 Jul 2019 11:26:16 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A3FF27FF;
 Tue,  2 Jul 2019 11:26:16 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 13:26:16 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 13:26:16
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 2 Jul 2019 13:26:07 +0200
Message-ID: <1562066767-8221-4-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
References: <1562066767-8221-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/3] stm32mp1: activate OF_BOARD_SETUP and
	FDT_FIXUP_PARTITIONS
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

Update kernel MTD partition in device tree with U-Boot information.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig       |  1 +
 board/st/stm32mp1/stm32mp1.c        | 18 ++++++++++++++++++
 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_optee_defconfig   |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 5 files changed, 22 insertions(+)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index a00c8ab..50594c6 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -38,6 +38,7 @@ config TARGET_STM32MP1
 	select CPU_V7A
 	select CPU_V7_HAS_NONSEC if !STM32MP1_TRUSTED
 	select CPU_V7_HAS_VIRT
+	select OF_BOARD_SETUP
 	select PINCTRL_STM32
 	select STM32_RCC
 	select STM32_RESET
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index d62d180..475af25 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -13,6 +13,8 @@
 #include <i2c.h>
 #include <led.h>
 #include <misc.h>
+#include <mtd.h>
+#include <mtd_node.h>
 #include <phy.h>
 #include <reset.h>
 #include <syscon.h>
@@ -21,6 +23,7 @@
 #include <asm/gpio.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
+#include <jffs2/load_kernel.h>
 #include <power/regulator.h>
 #include <usb/dwc2_udc.h>
 
@@ -747,3 +750,18 @@ void board_mtdparts_default(const char **mtdids, const char **mtdparts)
 	debug("%s:mtdids=%s & mtdparts=%s\n", __func__, ids, parts);
 }
 #endif
+
+#if defined(CONFIG_OF_BOARD_SETUP)
+int ft_board_setup(void *blob, bd_t *bd)
+{
+#ifdef CONFIG_FDT_FIXUP_PARTITIONS
+	struct node_info nodes[] = {
+		{ "st,stm32f469-qspi",		MTD_DEV_TYPE_NOR,  },
+		{ "st,stm32mp15-fmc2",		MTD_DEV_TYPE_NAND, },
+	};
+	fdt_fixup_mtdparts(blob, nodes, ARRAY_SIZE(nodes));
+#endif
+
+	return 0;
+}
+#endif
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 4aa184f..f2fb254 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -112,3 +112,4 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index f3e4ea6..f63c122 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -101,3 +101,4 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
 CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 5fe9477..94c610b 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -102,3 +102,4 @@ CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_WDT=y
 CONFIG_WDT_STM32MP=y
+CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
