Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D146B6A3
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Dec 2021 10:06:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A263C5F1EA;
	Tue,  7 Dec 2021 09:06:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 079A1C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 09:06:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1B740h79018633;
 Tue, 7 Dec 2021 10:06:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=Yx+w2t8FGWsQaFD3klD7aZ53rCF/il7iYpilQwc4r/g=;
 b=VMMo4V2cFfZaUUfqcv/5P3Y17iHoPWLg7veto4R+4wT3LpKheTDCYiGlREMqEJTU5U3o
 o+GTj5q0Q2TZvMZpJZUh6j7VQ6tNu15Nota2EEHIbgmbyN1Jb6+sQxQOhAJ67jmwiERt
 FOJWgFoA+42SP0TWxvfFejLsmZj7SgHIijhJaFncAN/DuegTOIUgD7AprFeOxcizoao8
 yqBbwiCFyzYKcPTfpPxkP9pVf9mWM/lle2NRi2M6Zfhllg8hKoanpMq008X/rjNFDiIX
 9h+B9K79npbDCBh7EfR5CVXMvJkj1XAI86DH3o1grKwXPONuIJm+qdE4S6BWKoo+ZZfS Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3csp32bqdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 10:06:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F1DE10002A;
 Tue,  7 Dec 2021 10:06:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EBA2B229A81;
 Tue,  7 Dec 2021 10:06:07 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 7 Dec 2021 10:06:07
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 7 Dec 2021 10:05:58 +0100
Message-ID: <20211207100549.1.Iafe36c0d5ba0a3fbd8016d9ae07ef5db77c553c7@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp: remove the bootcount activation
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

Today the bootcount is not managed by the Linux kernel for STM32MP15 as
we don't have driver to update the used backup register in TAMP and the
recovery command still executes the normal bootcmd with
'altbootcmd=run bootcmd'.

So the bootcount feature is never used, the config CONFIG_BOOTCOUNT_LIMIT
and the associated environment variable 'altbootcmd' can be removed to
reduce the U-Boot size.

Each boards can re-enable this feature later in their defconfig, if it is
needed, with the expected backend, for example CONFIG_BOOTCOUNT_GENERIC
or CONFIG_BOOTCOUNT_ENV.

CC: Marek Vasut <marex@denx.de>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Kconfig      | 8 --------
 include/configs/stm32mp15_common.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index a6c7fc5bfd..2fa4ea4d5c 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -68,9 +68,7 @@ choice
 config TARGET_ST_STM32MP15x
 	bool "STMicroelectronics STM32MP15x boards"
 	select STM32MP15x
-	imply BOOTCOUNT_LIMIT
 	imply BOOTSTAGE
-	imply CMD_BOOTCOUNT
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
 	imply DISABLE_CONSOLE
@@ -85,9 +83,7 @@ config TARGET_ST_STM32MP15x
 config TARGET_MICROGEA_STM32MP1
 	bool "Engicam MicroGEA STM32MP1 SOM"
 	select STM32MP15x
-	imply BOOTCOUNT_LIMIT
 	imply BOOTSTAGE
-	imply CMD_BOOTCOUNT
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
 	imply DISABLE_CONSOLE
@@ -112,9 +108,7 @@ config TARGET_MICROGEA_STM32MP1
 config TARGET_ICORE_STM32MP1
 	bool "Engicam i.Core STM32MP1 SOM"
 	select STM32MP15x
-	imply BOOTCOUNT_LIMIT
 	imply BOOTSTAGE
-	imply CMD_BOOTCOUNT
 	imply CMD_BOOTSTAGE
 	imply CMD_CLS if CMD_BMP
 	imply DISABLE_CONSOLE
@@ -136,8 +130,6 @@ config TARGET_ICORE_STM32MP1
 config TARGET_DH_STM32MP1_PDK2
 	bool "DH STM32MP1 PDK2"
 	select STM32MP15x
-	imply BOOTCOUNT_LIMIT
-	imply CMD_BOOTCOUNT
 	help
 		Target the DH PDK2 development kit with STM32MP15x SoM.
 
diff --git a/include/configs/stm32mp15_common.h b/include/configs/stm32mp15_common.h
index dab679f71e..8cf97d73ad 100644
--- a/include/configs/stm32mp15_common.h
+++ b/include/configs/stm32mp15_common.h
@@ -138,7 +138,6 @@
 #endif
 
 #define STM32MP_EXTRA \
-	"altbootcmd=run bootcmd\0" \
 	"env_check=if env info -p -d -q; then env save; fi\0" \
 	"boot_net_usb_start=true\0"
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
