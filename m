Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE2452F0A6
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 18:27:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71391C0D2B9;
	Fri, 20 May 2022 16:27:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 847F3C5F1ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 16:27:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KAXfot014061;
 Fri, 20 May 2022 18:27:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=3P95FoDld8q2We7m41O5xwf+l6dZyslvlmBtzIsSmqU=;
 b=r2iRVdRxI13gIkSqhBqFoQr0q2veSkt2bS++S8u4UeOYL2sQtc6LWXBlNude64BonBkd
 KSCKTndI0IRAp7rR6fVGqMLGn6F7GcwsIsan5GYFxa5Yu2kvzOi/wC8Nb/QN/oLfAtZq
 G9QYA/pnFT3yS/1IkzjfFd8fisuwVLBFH6TpSmD3CvW5W4ttfjnLq33LJrCXgZUPRMYB
 cv746WpxDA4A5jXdkexnXCPdgqEEOTbsrvAy1IjN+DYvahS+qUh6ISIgxZgEpL6144VE
 aqLmLpl24yxQ2UiX9aWbS3JgmpXm2xCMmUrCrx4w2LzPUQwURKdShYdGrljcs4VriX/F iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23aj9apx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 18:27:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09C87100044;
 Fri, 20 May 2022 18:27:49 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 617D326026B;
 Fri, 20 May 2022 18:27:12 +0200 (CEST)
Received: from localhost (10.75.127.46) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 18:26:15 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 May 2022 18:24:45 +0200
Message-ID: <20220520182444.v2.7.Ifb968953516a3d73a38718892a7c58726bf641ae@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
References: <20220520162454.1864832-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 07/16] arm: stm32mp: add
	CONFIG_STM32MP15_PWR
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

Add config CONFIG_STM32MP15_PWR to handle the
access to regulators managed by the PWR driver defined in
pwr_regulator.c

This driver is only used in U-Boot by STM32MP15x family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- fix commit message

 arch/arm/mach-stm32mp/Kconfig.15x | 16 ++++++++++++++++
 arch/arm/mach-stm32mp/Makefile    |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig.15x b/arch/arm/mach-stm32mp/Kconfig.15x
index 19f161cf5c..d516270292 100644
--- a/arch/arm/mach-stm32mp/Kconfig.15x
+++ b/arch/arm/mach-stm32mp/Kconfig.15x
@@ -77,6 +77,22 @@ config TARGET_ICORE_STM32MP1
 
 endchoice
 
+config STM32MP15_PWR
+	bool "Enable driver for STM32MP15x PWR"
+	depends on DM_REGULATOR && DM_PMIC
+	default y
+	help
+		This config enables implementation of driver-model pmic and
+		regulator uclass features for access to STM32MP15x PWR.
+
+config SPL_STM32MP15_PWR
+	bool "Enable driver for STM32MP15x PWR in SPL"
+	depends on SPL && SPL_DM_REGULATOR && SPL_DM_PMIC
+	default y
+	help
+		This config enables implementation of driver-model pmic and
+		regulator uclass features for access to STM32MP15x PWR in SPL.
+
 config SYS_TEXT_BASE
 	default 0xC0100000
 
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index d362104fee..0ffec6e02f 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -21,5 +21,5 @@ obj-$(CONFIG_ARMV7_PSCI) += psci.o
 obj-$(CONFIG_TFABOOT) += boot_params.o
 endif
 
-obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
+obj-$(CONFIG_$(SPL_)STM32MP15_PWR) += pwr_regulator.o
 obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
