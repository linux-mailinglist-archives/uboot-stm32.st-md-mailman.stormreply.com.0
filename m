Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B831A4726
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 16:02:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 804C6C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 Apr 2020 14:02:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 089A7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Apr 2020 14:02:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03ADvEXC028621; Fri, 10 Apr 2020 16:02:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=1CR+aa2Qq9VN4uS1KcbtU8x6c35EgF98C4us9NzL8u8=;
 b=oRmdQtORtgr3R3Iup7P0Vb4LnA3xsFyPZssSuoHd1eDNb/KbaqiK7tA9DQdAx5lo70An
 v2B7cklI+LiLvl+sCV/AAMSX68bkBvaXgoE9+dxiXJh5qOq9D81NI9zMQeHPCON93X7s
 nRoQy9SuVnZ1gZENXkojD2eaNFW1YdxhxLl2/Xy1dyjm1urnIclmuN8ly/uxigvsnfr1
 bdeSKdZLwa+caaFHjbbL2IzJe+0tDWPZmym71JgvvuQOHdSti6ToNL/6wFUp1yC0yfXZ
 eRl6qEIx8Ex477FyBImPKClDCLJmuwdBSfe8ljUElg80ukb8/kh7lIx10D2KWuakaXFo pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3091qkgs67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Apr 2020 16:02:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7011710002A;
 Fri, 10 Apr 2020 16:02:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43B0F2BEC40;
 Fri, 10 Apr 2020 16:02:08 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Apr 2020 16:02:07 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 Apr 2020 16:02:02 +0200
Message-ID: <20200410160158.v2.1.Ib3bfddef91204749326b4bdd0a089ed0bfcac33e@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-10_05:2020-04-09,
 2020-04-10 signatures=0
Cc: Marek Vasut <marex@denx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Simon Glass <sjg@chromium.org>, Pascal Linder <pascal.linder@edu.hefr.ch>,
 Kever Yang <kever.yang@rock-chips.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Holger Brunck <holger.brunck@ch.abb.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>
Subject: [Uboot-stm32] [PATCH v2] configs: migrate CONFIG_SYS_ARM_CACHE_* in
	Kconfig
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

Move CONFIG_SYS_ARM_CACHE_WRITETHROUGH and
CONFIG_SYS_ARM_CACHE_WRITEALLOC into Kconfig done by moveconfig.py.

Kconfig uses a choice between the 3 values supported in U-Boot,
including the new configuration CONFIG_SYS_ARM_CACHE_WRITEBACK
(the default configuration).

The patch also avoids to select simultaneously 2 configurations.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- default SYS_ARM_CACHE_WRITETHROUGH if CPU_PXA || RZA1
  and remove defconfig impacts for grpeach and colibri_pxa270

 arch/arm/Kconfig                            | 28 +++++++++++++++++++++
 arch/arm/include/asm/iproc-common/configs.h |  1 -
 include/configs/grpeach.h                   |  1 -
 include/configs/pxa-common.h                |  2 --
 scripts/config_whitelist.txt                |  1 -
 5 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index bbb1e2738b..f2bffddb44 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -340,6 +340,34 @@ config SYS_CACHELINE_SIZE
 	default 64 if SYS_CACHE_SHIFT_6
 	default 32 if SYS_CACHE_SHIFT_5
 
+choice
+	prompt "Select the ARM data write cache policy"
+	default SYS_ARM_CACHE_WRITETHROUGH if TARGET_BCMCYGNUS || \
+					      TARGET_BCMNSP || CPU_PXA || RZA1
+	default SYS_ARM_CACHE_WRITEBACK
+
+config SYS_ARM_CACHE_WRITEBACK
+	bool "Write-back (WB)"
+	help
+	  A write updates the cache only and marks the cache line as dirty.
+	  External memory is updated only when the line is evicted or explicitly
+	  cleaned.
+
+config SYS_ARM_CACHE_WRITETHROUGH
+	bool "Write-through (WT)"
+	help
+	  A write updates both the cache and the external memory system.
+	  This does not mark the cache line as dirty.
+
+config SYS_ARM_CACHE_WRITEALLOC
+	bool "Write allocation (WA)"
+	help
+	  A cache line is allocated on a write miss. This means that executing a
+	  store instruction on the processor might cause a burst read to occur.
+	  There is a linefill to obtain the data for the cache line, before the
+	  write is performed.
+endchoice
+
 config ARCH_CPU_INIT
 	bool "Enable ARCH_CPU_INIT"
 	help
diff --git a/arch/arm/include/asm/iproc-common/configs.h b/arch/arm/include/asm/iproc-common/configs.h
index 96c4f54f4a..4733c0793c 100644
--- a/arch/arm/include/asm/iproc-common/configs.h
+++ b/arch/arm/include/asm/iproc-common/configs.h
@@ -10,7 +10,6 @@
 
 /* Architecture, CPU, chip, etc */
 #define CONFIG_IPROC
-#define CONFIG_SYS_ARM_CACHE_WRITETHROUGH
 
 /* Memory Info */
 #define CONFIG_SYS_SDRAM_BASE		0x61000000
diff --git a/include/configs/grpeach.h b/include/configs/grpeach.h
index b875f9b132..af5b92443e 100644
--- a/include/configs/grpeach.h
+++ b/include/configs/grpeach.h
@@ -16,7 +16,6 @@
 
 /* Miscellaneous */
 #define CONFIG_SYS_PBSIZE	256
-#define CONFIG_SYS_ARM_CACHE_WRITETHROUGH
 #define CONFIG_CMDLINE_TAG
 
 /* Internal RAM Size (RZ/A1=3M, RZ/A1M=5M, RZ/A1H=10M) */
diff --git a/include/configs/pxa-common.h b/include/configs/pxa-common.h
index e25800a095..2632d48cc9 100644
--- a/include/configs/pxa-common.h
+++ b/include/configs/pxa-common.h
@@ -8,8 +8,6 @@
 #ifndef	__CONFIG_PXA_COMMON_H__
 #define	__CONFIG_PXA_COMMON_H__
 
-#define	CONFIG_SYS_ARM_CACHE_WRITETHROUGH
-
 /*
  * KGDB
  */
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 6908431d03..0f747ac0a3 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1773,7 +1773,6 @@ CONFIG_SYS_AMASK4
 CONFIG_SYS_AMASK5
 CONFIG_SYS_AMASK6
 CONFIG_SYS_AMASK7
-CONFIG_SYS_ARM_CACHE_WRITETHROUGH
 CONFIG_SYS_AT91_CPU_NAME
 CONFIG_SYS_AT91_MAIN_CLOCK
 CONFIG_SYS_AT91_PLLA
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
