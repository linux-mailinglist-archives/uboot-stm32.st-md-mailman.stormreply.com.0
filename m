Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FF424122
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 17:18:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC2B2C5719E;
	Wed,  6 Oct 2021 15:18:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD79DC5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 15:18:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1969w99Z030001; 
 Wed, 6 Oct 2021 17:18:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=lPtn+EL5NYn4cHMUhmuHc+suH7QCyAhbNpQOylsnrJ0=;
 b=awhdlcoD3XmbtbSWBajhNz1AF46bSakk8/JhAbH/dq7BoKc71CcM4RMJEHUw8Cl2dVI4
 Ja1Q2VWjnkPdY7+F6mGbeWR9csp5aY2IwU61GYmY6ozXlDZj30x5v2WgKNy+b9p+ElF3
 SGZ6M+k7/PbT5h4rPS2txCGbIzGk77AY423vn8Z6u0bLCE307y0Q1HBBZvACMiEN1s4O
 YpY1e1KWpWtaHIeRTX/+ddk+TScdd7LqXkWewcDboT5F8VReWq6wfSDyo6D5Y/5ysnuL
 tZRGuPvuU13SzdMW3VFTAHGgn+nM21L8IFwG9hwtyjQ6Nvhl7s/aPCbiVEkKi+7NgsbU ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bh9mv1xtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 17:18:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2EC910002A;
 Wed,  6 Oct 2021 17:18:49 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 994A322D623;
 Wed,  6 Oct 2021 17:18:49 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 6 Oct 2021 17:18:49
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Oct 2021 17:18:42 +0200
Message-ID: <20211006171839.1.I0774e750b5e88f0d91ea2273a4616b784019c1dd@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
Cc: Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH] stv0991: remove specific CONFIG_STV0991
	configs
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

Remove the following STV0991 specific configs:
- CONFIG_STV0991 (never used)
- CONFIG_STV0991_HZ (replaced by generic CONFIG_SYS_HZ)
- CONFIG_STV0991_HZ_CLOCK (replaced by generic CONFIG_SYS_HZ_CLOCK)

This patch allows to reduce the file config_whitelist.txt.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/cpu/armv7/stv0991/timer.c              | 6 +++---
 arch/arm/include/asm/arch-stv0991/stv0991_gpt.h | 4 ++--
 scripts/config_whitelist.txt                    | 3 ---
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/cpu/armv7/stv0991/timer.c b/arch/arm/cpu/armv7/stv0991/timer.c
index 07033acb5c..67764ccf66 100644
--- a/arch/arm/cpu/armv7/stv0991/timer.c
+++ b/arch/arm/cpu/armv7/stv0991/timer.c
@@ -18,7 +18,7 @@ static struct stv0991_cgu_regs *const stv0991_cgu_regs = \
 				(struct stv0991_cgu_regs *) (CGU_BASE_ADDR);
 
 #define READ_TIMER()	(readl(&gpt1_regs_ptr->cnt) & GPT_FREE_RUNNING)
-#define GPT_RESOLUTION	(CONFIG_STV0991_HZ_CLOCK / CONFIG_STV0991_HZ)
+#define GPT_RESOLUTION	(CONFIG_SYS_HZ_CLOCK / CONFIG_SYS_HZ)
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -67,7 +67,7 @@ void __udelay(unsigned long usec)
 {
 	ulong tmo;
 	ulong start = get_timer_masked();
-	ulong tenudelcnt = CONFIG_STV0991_HZ_CLOCK / (1000 * 100);
+	ulong tenudelcnt = CONFIG_SYS_HZ_CLOCK / (1000 * 100);
 	ulong rndoff;
 
 	rndoff = (usec % 10) ? 1 : 0;
@@ -110,5 +110,5 @@ unsigned long long get_ticks(void)
  */
 ulong get_tbclk(void)
 {
-	return CONFIG_STV0991_HZ;
+	return CONFIG_SYS_HZ;
 }
diff --git a/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h b/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
index cd27472ad7..f1d5667c32 100644
--- a/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
+++ b/arch/arm/include/asm/arch-stv0991/stv0991_gpt.h
@@ -36,7 +36,7 @@ struct gpt_regs *const gpt1_regs_ptr =
 #define GPT_FREE_RUNNING		0xFFFF
 
 /* Timer, HZ specific defines */
-#define CONFIG_STV0991_HZ		1000
-#define CONFIG_STV0991_HZ_CLOCK		(27*1000*1000)/GPT_PRESCALER_128
+#define CONFIG_SYS_HZ			1000
+#define CONFIG_SYS_HZ_CLOCK		((27 * 1000 * 1000) / GPT_PRESCALER_128)
 
 #endif
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 61ae682dcd..58f4b02f60 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1303,9 +1303,6 @@ CONFIG_STANDALONE_LOAD_ADDR
 CONFIG_STATIC_BOARD_REV
 CONFIG_STD_DEVICES_SETTINGS
 CONFIG_STM32_FLASH
-CONFIG_STV0991
-CONFIG_STV0991_HZ
-CONFIG_STV0991_HZ_CLOCK
 CONFIG_SXNI855T
 CONFIG_SYSFS
 CONFIG_SYSMGR_ISWGRP_HANDOFF
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
