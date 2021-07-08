Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD13BF75F
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Jul 2021 11:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADA7CC57B5B;
	Thu,  8 Jul 2021 09:17:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75E1FC57B5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Jul 2021 09:17:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1689Dj2r028238; Thu, 8 Jul 2021 11:17:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=mtfmob0ADQO7LfboGSUkr9LwSw+QaTH9Wzw4x7Rg38U=;
 b=6Fy3NnO22vQ+vfNjXoxsLLzcEz4qkqfAtGpR3/P2VhwA8it3i3sZ+izwsQmQcnW2ni44
 i41t1RNrUrDlwXnb9x9YKlt2Y0hULgivsZJe1Tg8keW6ME0R2APVoKsUF3CjEQU2lxAE
 9WzlD33AQWESRA7VurL4YZ5KzaD1gSUjOzqh98CdvCf7oWWSmZopHJKAEbW1oWLmDTP8
 NQ6YSPxkLz3NjhnosZkxrn3pynnA782g1fF4yCtt2bmMP/N3hSPUgmq1bRmVzKC/Q+eB
 n1IBLT04wYGVaDaLUEyXdJrVR2EDkKKuX3KUNJKWX0JEHtF91hn13C9BRj8V0Q9+t0yA TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39nqk0jf6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 11:17:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4C13C100034;
 Thu,  8 Jul 2021 11:17:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FF7D218132;
 Thu,  8 Jul 2021 11:17:50 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 11:17:49
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 8 Jul 2021 11:17:43 +0200
Message-ID: <20210708111743.1.I75c3a4359a6e42c20360fb1774a2e371a08a6270@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
References: <20210708091747.317500-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_04:2021-07-06,
 2021-07-08 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/5] arm: stm32mp: add config for STM32IMAGE
	support
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
---

 arch/arm/mach-stm32mp/Kconfig       |  7 +++++++
 arch/arm/mach-stm32mp/config.mk     |  2 +-
 board/st/stm32mp1/stm32mp1.c        | 10 +++++++---
 configs/stm32mp15_trusted_defconfig |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 7c25266f33..09d0b4096f 100644
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
index 261ec15e1b..d8335efa53 100644
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
index 5bc5e79400..e008d1fba7 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -7,6 +7,7 @@ CONFIG_SYS_MEMTEST_END=0xc4000000
 CONFIG_ENV_OFFSET=0x280000
 CONFIG_ENV_SECT_SIZE=0x40000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
+CONFIG_STM32MP15x_STM32IMAGE=y
 CONFIG_TARGET_ST_STM32MP15x=y
 CONFIG_CMD_STM32PROG=y
 CONFIG_ENV_OFFSET_REDUND=0x2C0000
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
