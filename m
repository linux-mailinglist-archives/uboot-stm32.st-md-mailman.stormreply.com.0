Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C01442654B
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 09:34:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19537C597B2;
	Fri,  8 Oct 2021 07:34:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A44E9C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 07:34:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZJGj021166; 
 Fri, 8 Oct 2021 09:34:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=/Cq++qeT8qtF+m+W3DZ288c4hnv/IwpnsKdm/Epn3fY=;
 b=EeI534M4PwVXrHc7mor1sGEsUSbF2KfDCiz5bS5t4X49QgpZSn6OHXcKw/Tm/joty6pY
 Hp5i8xyC+3VaCqZOBTgO9EKNzIc/jHP+hT5aC2vEfRYvu7MjzKACDuEb3XFZVxCk4Bha
 rt4zik167a6+IWjC9CFqgHdoKRxpAOSn8IygnlwoTSaZZWKUaZIHq0NRgCiHEHUNMk17
 ksgFVJh2ub1ZQTyd1oH29ms4Pqxuo/klZAje2WfAfkeQ1LRm68zpRPsDuxqwU5YF/Phd
 mm49oBv1KnHnSPPiiFTFzT5VJvnE2WvJTupOfe0JA5BVtjTdcgyjHYu4Jq+8+2o6zBMe HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbxn9ynk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 09:34:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AFCA10002A;
 Fri,  8 Oct 2021 09:34:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B4A5217B7A;
 Fri,  8 Oct 2021 09:34:49 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 09:34:48
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 8 Oct 2021 09:34:46 +0200
Message-ID: <20211008093443.1.Ic6dad451e1dc50483b0d69ebebb481ce70dbe27f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH] stm32mp: add binman support for STM32MP15x
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

Use binman to add the stm32image header on SPL binary for basic boot
or on U-Boot binary when it is required, i.e. for TF-A boot without FIP
support, when CONFIG_STM32MP15x_STM32IMAGE is activated.

The "binman" tool is the recommended tool for specific image generation.
This patch allows to suppress the config.mk file and it is a preliminary
step to manage FIT generation with binman.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/dts/stm32mp15-u-boot.dtsi | 29 +++++++++++++++++++++++++++++
 arch/arm/mach-stm32mp/Kconfig      |  1 +
 arch/arm/mach-stm32mp/config.mk    | 29 -----------------------------
 3 files changed, 30 insertions(+), 29 deletions(-)
 delete mode 100644 arch/arm/mach-stm32mp/config.mk

diff --git a/arch/arm/dts/stm32mp15-u-boot.dtsi b/arch/arm/dts/stm32mp15-u-boot.dtsi
index 43a7909978..db23d80eef 100644
--- a/arch/arm/dts/stm32mp15-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp15-u-boot.dtsi
@@ -21,6 +21,10 @@
 		pinctrl1 = &pinctrl_z;
 	};
 
+	binman: binman {
+		multiple-images;
+	};
+
 	clocks {
 		u-boot,dm-pre-reloc;
 	};
@@ -228,3 +232,28 @@
 	resets = <&rcc UART8_R>;
 };
 
+#if defined(CONFIG_STM32MP15x_STM32IMAGE)
+&binman {
+	u-boot-stm32 {
+		filename = "u-boot.stm32";
+		mkimage {
+			args = "-T stm32image -a 0xC0100000 -e 0xC0100000";
+			u-boot {
+			};
+		};
+	};
+};
+#endif
+
+#if defined(CONFIG_SPL)
+&binman {
+	spl-stm32 {
+		filename = "u-boot-spl.stm32";
+		mkimage {
+			args = "-T stm32image -a 0x2FFC2500 -e 0x2FFC2500";
+			u-boot-spl {
+			};
+		};
+	};
+};
+#endif
diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 69d56c23e1..4acb29333c 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -37,6 +37,7 @@ config STM32MP15x
 	bool "Support STMicroelectronics STM32MP15x Soc"
 	select ARCH_SUPPORT_PSCI if !TFABOOT
 	select ARM_SMCCC if TFABOOT
+	select BINMAN
 	select CPU_V7A
 	select CPU_V7_HAS_NONSEC if !TFABOOT
 	select CPU_V7_HAS_VIRT
diff --git a/arch/arm/mach-stm32mp/config.mk b/arch/arm/mach-stm32mp/config.mk
deleted file mode 100644
index f7f5b77c41..0000000000
--- a/arch/arm/mach-stm32mp/config.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
-#
-# Copyright (C) 2018, STMicroelectronics - All Rights Reserved
-#
-
-ifndef CONFIG_SPL
-INPUTS-$(CONFIG_STM32MP15x_STM32IMAGE) += u-boot.stm32
-else
-ifdef CONFIG_SPL_BUILD
-INPUTS-y += u-boot-spl.stm32
-endif
-endif
-
-MKIMAGEFLAGS_u-boot.stm32 = -T stm32image -a $(CONFIG_SYS_TEXT_BASE) -e $(CONFIG_SYS_TEXT_BASE)
-
-u-boot.stm32: MKIMAGEOUTPUT = u-boot.stm32.log
-
-u-boot.stm32: u-boot.bin FORCE
-	$(call if_changed,mkimage)
-
-MKIMAGEFLAGS_u-boot-spl.stm32 = -T stm32image -a $(CONFIG_SPL_TEXT_BASE) -e $(CONFIG_SPL_TEXT_BASE)
-
-spl/u-boot-spl.stm32: MKIMAGEOUTPUT = spl/u-boot-spl.stm32.log
-
-spl/u-boot-spl.stm32: spl/u-boot-spl.bin FORCE
-	$(call if_changed,mkimage)
-
-u-boot-spl.stm32 : spl/u-boot-spl.stm32
-	$(call if_changed,copy)
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
