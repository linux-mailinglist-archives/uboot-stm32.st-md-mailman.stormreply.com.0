Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B83D5667
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Jul 2021 11:21:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B685CC597B9;
	Mon, 26 Jul 2021 09:21:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90E84C597B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jul 2021 09:21:51 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16Q9C0XG000712; Mon, 26 Jul 2021 11:21:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1XdZ2CKnxv6qPN+EwwONYoIoJnzGtAhZ+VQQOxruh+0=;
 b=3arn1+zrDx6P/WcAHMg2HfUw4DuUxQ5O7sm9S9K5RrJE1L6Y02TxDK2W5Ja1jc/TQp+i
 20u4qsePerMA+3+2chU9V1Mxn905tjTdqkr7pQ4vcTqLpngvoApuatqdi9BLbWFy5GSA
 +RlQ6+y1L//qH7hfOD0RIQrOGPzk/aG7ZjrDkgBVrgTZ9YL1Chm1TaL3y33VeU2wWUlR
 VaHHFwJ4uK6eUSV182tCxk2XQlEYYIcTJtCGf+JuMbENRyVVj7l27LWHo/yIJqMUpEI1
 NSRLs3i0NplrsS7OEbkox12M53ualf2CVTbJRQmEgdPFltToG05b1/uerz0ZpMy5Lyn0 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a1sy1g52f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Jul 2021 11:21:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA6DA100034;
 Mon, 26 Jul 2021 11:21:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB32621B537;
 Mon, 26 Jul 2021 11:21:43 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Jul 2021 11:21:43
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Jul 2021 11:21:34 +0200
Message-ID: <20210726111931.v3.1.I75c3a4359a6e42c20360fb1774a2e371a08a6270@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
References: <20210726092138.53762-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-26_05:2021-07-26,
 2021-07-26 signatures=0
Cc: Tom Rini <trini@konsulko.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 1/5] arm: stm32mp: add config for
	STM32IMAGE support
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

By default for trusted boot with TF-A, U-Boot (u-boot-nodtb)
is located in FIP container with its device tree and with
the secure monitor (provided by TF-A or OP-TEE).
The FIP file is loaded by TF-A BL2 and each components is
extracted at the final location.

This patch add CONFIG_STM32MP15x_STM32IMAGE to request the
STM32 image generation for SOC STM32MP15x
when FIP container is not used (u-boot.stm32 is loaded by TF-A
as done previously to keep the backward compatibility).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 arch/arm/mach-stm32mp/Kconfig       |  7 +++++++
 arch/arm/mach-stm32mp/config.mk     |  2 +-
 board/st/stm32mp1/stm32mp1.c        | 10 +++++++---
 configs/stm32mp15_trusted_defconfig |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 0e59931679..b9e623bc3c 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -56,6 +56,13 @@ config STM32MP15x
 		dual core A7 for STM32MP157/3, monocore for STM32MP151
 		target all the STMicroelectronics board with SOC STM32MP1 family
 
+config STM32MP15x_STM32IMAGE
+	bool "Support STM32 image for generated U-Boot image"
+	depends on STM32MP15x && TFABOOT
+	help
+		Support of STM32 image generation for SOC STM32MP15x
+		for TF-A boot when FIP container is not used
+
 choice
 	prompt "STM32MP15x board select"
 	optional
diff --git a/arch/arm/mach-stm32mp/config.mk b/arch/arm/mach-stm32mp/config.mk
index c30bf482f7..f7f5b77c41 100644
--- a/arch/arm/mach-stm32mp/config.mk
+++ b/arch/arm/mach-stm32mp/config.mk
@@ -4,7 +4,7 @@
 #
 
 ifndef CONFIG_SPL
-INPUTS-y += u-boot.stm32
+INPUTS-$(CONFIG_STM32MP15x_STM32IMAGE) += u-boot.stm32
 else
 ifdef CONFIG_SPL_BUILD
 INPUTS-y += u-boot-spl.stm32
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 2faf5c81b4..70bd4d1ed5 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -105,10 +105,14 @@ int checkboard(void)
 	const char *fdt_compat;
 	int fdt_compat_len;
 
-	if (IS_ENABLED(CONFIG_TFABOOT))
-		mode = "trusted";
-	else
+	if (IS_ENABLED(CONFIG_TFABOOT)) {
+		if (IS_ENABLED(CONFIG_STM32MP15x_STM32IMAGE))
+			mode = "trusted - stm32image";
+		else
+			mode = "trusted";
+	} else {
 		mode = "basic";
+	}
 
 	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
 				 &fdt_compat_len);
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index a58ea91d3e..6a8ccb1f3d 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -7,6 +7,7 @@ CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_CMD_STM32KEY=y
 CONFIG_CMD_STM32PROG=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
