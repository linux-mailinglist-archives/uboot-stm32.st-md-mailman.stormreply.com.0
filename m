Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5161FD1D1
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 18:19:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9630C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Jun 2020 16:19:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBF8FC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 16:19:55 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05HGE8bv028201; Wed, 17 Jun 2020 18:19:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=4CNwgdQlOGpBUja0BZl2EAxWxRgrhWA92AxRSE3HYx0=;
 b=S5dMxQkb/rff4p6rXV/ARbyQWHMP/c84x+6BGHkCEqAh9OnqDzdqMFnok4DHJLvBbwXH
 U+xcreTdBZTM4gjGF2+UU24sq2S2nE7g64O8O09gW4KNabHz1qIFn6S1NNTxdprmlhZy
 v5lBVY02NTa0mote891acPDA2LbKXHrx/Du49omfCx6MwC6iwfEUCVKT+DgK9lcdXbtW
 i5j0otzBC/8kn0brmWe8SmeKTOVpiTVq4kx4q8RkJmkruOUc2q6zJi9qaIiwhc0gkoIa
 doNtD7PCCUZjZzNg/fjFA+xQb+9VpCtSE8pwxO+kCOJpd4kENzvMfJwuAtjDDZFqsLr4 kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q649d9b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jun 2020 18:19:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7BB510002A;
 Wed, 17 Jun 2020 18:19:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8406B2C0D0C;
 Wed, 17 Jun 2020 18:19:28 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 17 Jun 2020 18:19:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 17 Jun 2020 18:19:18 +0200
Message-ID: <20200617161918.7540-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-17_06:2020-06-17,
 2020-06-17 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Pascal Linder <pascal.linder@edu.hefr.ch>, Sumit Garg <sumit.garg@nxp.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Breno Matheus Lima <breno.lima@nxp.com>, Adam Ford <aford173@gmail.com>,
 Simon Glass <sjg@chromium.org>, Alison Wang <alison.wang@nxp.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Holger Brunck <holger.brunck@ch.abb.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Stefan Roese <sr@denx.de>,
 Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Trevor Woerner <twoerner@gmail.com>
Subject: [Uboot-stm32] [PATCH] Convert CONFIG_ARMV7_PSCI_1_0 and
	CONFIG_ARMV7_PSCI_0_2 to Kconfig
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

This converts the following to Kconfig:
CONFIG_ARMV7_PSCI_1_0
CONFIG_ARMV7_PSCI_0_2

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/cpu/armv7/Kconfig   | 14 ++++++++++++++
 include/configs/ls1021aqds.h |  2 --
 include/configs/ls1021atwr.h |  2 --
 include/configs/mx7_common.h |  2 --
 include/configs/stm32mp1.h   |  1 -
 include/configs/uniphier.h   |  2 --
 scripts/config_whitelist.txt |  1 -
 7 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
index 14569e560b..8eee801dce 100644
--- a/arch/arm/cpu/armv7/Kconfig
+++ b/arch/arm/cpu/armv7/Kconfig
@@ -41,6 +41,20 @@ config ARMV7_PSCI
 	help
 	  Say Y here to enable PSCI support.
 
+choice
+	prompt "Supported PSCI version"
+	depends on ARMV7_PSCI
+	default ARMV7_PSCI_1_0
+	help
+	  Select the supported PSCI version.
+
+config ARMV7_PSCI_1_0
+	bool "PSCI V1.0"
+
+config ARMV7_PSCI_0_2
+	bool "PSCI V0.2"
+endchoice
+
 config ARMV7_PSCI_NR_CPUS
 	int "Maximum supported CPUs for PSCI"
 	depends on ARMV7_NONSEC
diff --git a/include/configs/ls1021aqds.h b/include/configs/ls1021aqds.h
index e069467b53..f3b8f60287 100644
--- a/include/configs/ls1021aqds.h
+++ b/include/configs/ls1021aqds.h
@@ -7,8 +7,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define CONFIG_ARMV7_PSCI_1_0
-
 #define CONFIG_ARMV7_SECURE_BASE	OCRAM_BASE_S_ADDR
 
 #define CONFIG_SYS_FSL_CLK
diff --git a/include/configs/ls1021atwr.h b/include/configs/ls1021atwr.h
index 53a10ba4dd..6e52ea86f8 100644
--- a/include/configs/ls1021atwr.h
+++ b/include/configs/ls1021atwr.h
@@ -7,8 +7,6 @@
 #ifndef __CONFIG_H
 #define __CONFIG_H
 
-#define CONFIG_ARMV7_PSCI_1_0
-
 #define CONFIG_ARMV7_SECURE_BASE	OCRAM_BASE_S_ADDR
 
 #define CONFIG_SYS_FSL_CLK
diff --git a/include/configs/mx7_common.h b/include/configs/mx7_common.h
index cc07e858d5..4728361c0a 100644
--- a/include/configs/mx7_common.h
+++ b/include/configs/mx7_common.h
@@ -44,8 +44,6 @@
 
 #define CONFIG_ARMV7_SECURE_BASE	0x00900000
 
-#define CONFIG_ARMV7_PSCI_1_0
-
 #ifdef CONFIG_SPL_BUILD
 #define CONFIG_SPL_DRIVERS_MISC_SUPPORT
 #endif
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index f271b84a59..0e80344b41 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -12,7 +12,6 @@
 
 #ifndef CONFIG_TFABOOT
 /* PSCI support */
-#define CONFIG_ARMV7_PSCI_1_0
 #define CONFIG_ARMV7_SECURE_BASE		STM32_SYSRAM_BASE
 #define CONFIG_ARMV7_SECURE_MAX_SIZE		STM32_SYSRAM_SIZE
 #endif
diff --git a/include/configs/uniphier.h b/include/configs/uniphier.h
index 55fa85ed62..7cd0cc3fe6 100644
--- a/include/configs/uniphier.h
+++ b/include/configs/uniphier.h
@@ -39,8 +39,6 @@
 #define BOOTENV
 #endif
 
-#define CONFIG_ARMV7_PSCI_1_0
-
 /*-----------------------------------------------------------------------
  * MMU and Cache Setting
  *----------------------------------------------------------------------*/
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index f6bf6f2474..477e6aea2b 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -45,7 +45,6 @@ CONFIG_ARMADA100
 CONFIG_ARMADA100_FEC
 CONFIG_ARMADA168
 CONFIG_ARMADA_39X
-CONFIG_ARMV7_PSCI_1_0
 CONFIG_ARMV7_SECURE_BASE
 CONFIG_ARMV7_SECURE_MAX_SIZE
 CONFIG_ARMV7_SECURE_RESERVE_SIZE
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
