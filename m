Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAEC1FECAA
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 09:42:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C9E4C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2020 07:42:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4B5EC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 07:42:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05I7YDDu021609; Thu, 18 Jun 2020 09:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=0TPmqSqT3CzTrkVXluimMkKDh36wRCOreiDxLUShm40=;
 b=uxF+uuI0feZWXta5I5uHPbKillSn0IcHcVs0MkCGNM1qFrjuBSgQeuX49PZ983s1fSnS
 COlNvEQVEJjatKke4taRvMjMRojKoYouK4SoxRswm5+e9vCcOlwU7r6QLdtnoH6MAkVY
 Ia2lM1BixKT8AyBKHsjEV4F2pB4ffJxez12ii/AaTe9FpOxrjKGAdeBE7CHajnwICTh+
 TrmZbSaJtBUr+8U8380CaEpHphff32diAketbdZksv6b6X/IZ3+myjOfq7/po86+dHcZ
 O7Um9fkzR5Pq6NS5lFQEp530rueseflGrDHysKJw3yq2xp4CgkQumK8SD3izXqRv3e5R ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q64ah4kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 09:41:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EE63310002A;
 Thu, 18 Jun 2020 09:41:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2631E21FE82;
 Thu, 18 Jun 2020 09:41:40 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 18 Jun 2020 09:41:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 18 Jun 2020 09:41:34 +0200
Message-ID: <20200618074134.26629-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_04:2020-06-17,
 2020-06-18 signatures=0
Cc: Peter.Chubb@data61.csiro.au,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Warren <twarren@nvidia.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Trevor Woerner <twoerner@gmail.com>
Subject: [Uboot-stm32] [PATCH] configs: cei-tk1-som: remove
	CONFIG_ARMV7_PSCI in include file
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

Activate ARCH_SUPPORT_PSCI as other TEGRA124 target and remove
CONFIG_ARMV7_PSCI and CONFIG_ARMV7_PSCI_NR_CPUS in configs file as they
are migrated in Kconfig.

Select CONFIG_ARMV7_PSCI_0_1 (the first PSCI version),
because CONFIG_ARMV7_PSCI_0_2 and CONFIG_ARMV7_PSCI_1_0
are not activated in this product.


Hi,

This patch depend on the previous serie [1].

I don't test this patch on real hardware but
after this patch the size of the binary don't change.

In .config we have:
  CONFIG_ARCH_SUPPORT_PSCI=y
  CONFIG_ARMV7_PSCI=y
  # CONFIG_ARMV7_PSCI_1_0 is not set
  # CONFIG_ARMV7_PSCI_0_2 is not set
  CONFIG_ARMV7_PSCI_0_1=y
  CONFIG_ARMV7_PSCI_NR_CPUS=4

In u-boot.cfg, this patch only add the 2 lines
  #define CONFIG_ARCH_SUPPORT_PSCI 1
  #define CONFIG_ARMV7_PSCI_0_1 1

[1] "Convert CONFIG_ARMV7_PSCI_1_0 and CONFIG_ARMV7_PSCI_0_2 to Kconfig"
http://patchwork.ozlabs.org/project/uboot/list/?series=184029

Regards
Patrick

END

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/cpu/armv7/Kconfig           | 3 +++
 arch/arm/mach-tegra/tegra124/Kconfig | 1 +
 configs/cei-tk1-som_defconfig        | 1 +
 include/configs/cei-tk1-som.h        | 2 --
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/cpu/armv7/Kconfig b/arch/arm/cpu/armv7/Kconfig
index 8eee801dce..0107aaa947 100644
--- a/arch/arm/cpu/armv7/Kconfig
+++ b/arch/arm/cpu/armv7/Kconfig
@@ -53,6 +53,9 @@ config ARMV7_PSCI_1_0
 
 config ARMV7_PSCI_0_2
 	bool "PSCI V0.2"
+
+config ARMV7_PSCI_0_1
+	bool "PSCI V0.1"
 endchoice
 
 config ARMV7_PSCI_NR_CPUS
diff --git a/arch/arm/mach-tegra/tegra124/Kconfig b/arch/arm/mach-tegra/tegra124/Kconfig
index 6fa31ea0a1..fb016aa46c 100644
--- a/arch/arm/mach-tegra/tegra124/Kconfig
+++ b/arch/arm/mach-tegra/tegra124/Kconfig
@@ -19,6 +19,7 @@ config TARGET_JETSON_TK1
 
 config TARGET_CEI_TK1_SOM
 	bool "Colorado Engineering Inc Tegra124 TK1-som board"
+	select ARCH_SUPPORT_PSCI
 	select BOARD_LATE_INIT
 	select CPU_V7_HAS_NONSEC if !SPL_BUILD
 	select CPU_V7_HAS_VIRT if !SPL_BUILD
diff --git a/configs/cei-tk1-som_defconfig b/configs/cei-tk1-som_defconfig
index 366a90dd42..8380e316b6 100644
--- a/configs/cei-tk1-som_defconfig
+++ b/configs/cei-tk1-som_defconfig
@@ -6,6 +6,7 @@ CONFIG_ENV_OFFSET=0xFFFFE000
 CONFIG_NR_DRAM_BANKS=2
 CONFIG_TEGRA124=y
 CONFIG_TARGET_CEI_TK1_SOM=y
+CONFIG_ARMV7_PSCI_0_1=y
 CONFIG_SPL_TEXT_BASE=0x80108000
 CONFIG_OF_SYSTEM_SETUP=y
 CONFIG_CONSOLE_MUX=y
diff --git a/include/configs/cei-tk1-som.h b/include/configs/cei-tk1-som.h
index dbebef34e3..2541f2fc27 100644
--- a/include/configs/cei-tk1-som.h
+++ b/include/configs/cei-tk1-som.h
@@ -32,8 +32,6 @@
 #include "tegra-common-usb-gadget.h"
 #include "tegra-common-post.h"
 
-#define CONFIG_ARMV7_PSCI			1
-#define CONFIG_ARMV7_PSCI_NR_CPUS		4
 /* Reserve top 1M for secure RAM */
 #define CONFIG_ARMV7_SECURE_BASE		0xfff00000
 #define CONFIG_ARMV7_SECURE_RESERVE_SIZE	0x00100000
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
