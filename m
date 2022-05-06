Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21851D9ED
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 May 2022 16:07:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26A78C628AB;
	Fri,  6 May 2022 14:07:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E81C628AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:07:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246BVQLo026488;
 Fri, 6 May 2022 16:07:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=N3waA06oMKUFvToAtEVuzon2S8flJWbFW1oA9tP2n3A=;
 b=zP7JsiLqsuADJR1sCfdc7UkYy5JX1U004QJFDlTAVfWSZiiwLcCYGrykoDzMccYt0p0r
 lch0H1lUi8xiCiqJfOpjAWWtAWl9ww7eja5WZB/usV6h+Ins8j0cr4jZMwWxPmuUcApP
 uHdffKEL1ZK/tWhNqjF6x0pRrwSyaCNxmWE+T3zcrZlJyU49WOq+QvUV08e6QvXvH3l+
 ZI5GE2URoZ7W6lRjBRduDhprDlv01L+jqe2eN+T7pKJRAtdpfCIN2YhC0zLoC9MZuAjl
 8rewXSJG16eCRQaZn3egLUmzG8ZYz2v4auhuEJwK2Y/swKuaWzT9BXlyFP/j3m/ndLDJ vg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frt89b7hh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:07:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 25BED100039;
 Fri,  6 May 2022 16:07:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 204EF2248D3;
 Fri,  6 May 2022 16:07:33 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 6 May 2022 16:07:32
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 May 2022 16:06:14 +0200
Message-ID: <20220506160540.7.Ifb968953516a3d73a38718892a7c58726bf641ae@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 07/16] arm: stm32mp: add CONFIG_STM32MP15_PWR
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
access on regulators managed by the PWR driver defined in
pwr_regulator.c

This driver is only used in U-Boot by STM32MP15x family.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

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
