Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C1A9A0ED
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:08:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC9E4C78F70;
	Thu, 24 Apr 2025 06:08:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 645B4C78F70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:08:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O60IA6002626;
 Thu, 24 Apr 2025 08:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 esOblP3tIuu1hIYV1osuRVThdbjQr6dC9uNoaE3XdYk=; b=eha9G06/ObMkEbAS
 5jEudgCGyR+bSbAL0stipLCKulTDOU0MpZsdX7Oa1j9JOMOPTtn8FFnV9vX7dkkM
 Bea4KHgPMlidOFkkBMLBShKPOTVG6MIygNmvo2NgN1qCSXRXg2qSQs0JAb6eY6KK
 pmFm/Hq1s5agBDMbO1lE3e5Y7ly9A3nFiNzBrIz4S0+bYp/Hs1oqg9h0bK4FqoPU
 JcOa56U9776R5i9W5bNjvlrWODnf5gWrl2Ydme97AhbesoDX7Z0JqeL2ZB5B62s8
 q4RVWYC7R0x/xGruByPfp2+TKu8TzCDctTmGZcZRZbwwi2Fg/HHzoFoQCrmI5NBr
 DvBzww==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jk2e2vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:08:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98E5B40052;
 Thu, 24 Apr 2025 08:08:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC710A4C097;
 Thu, 24 Apr 2025 08:07:52 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:52 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:17 +0200
Message-ID: <20250424060723.2695014-16-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
References: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 15/21] arm: stm32mp: disable console for UART
	serial boot
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

For UART serial boot, the console need to be deactivated to avoid issue
with tools STM32CubeProgrammer.

This patch adds also the missing dependency for CMD_STM32PROG_SERIAL,
to allow the silent and disable console. This avoid to add is on
board level for STM32MP15 (with TARGET_ST_STM32MP15X or
TARGET_ST_STM32MP13X)

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig |  2 ++
 arch/arm/mach-stm32mp/stm32mp2/cpu.c        | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
index 589276282e4..490097e98be 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
@@ -27,6 +27,8 @@ config CMD_STM32PROG_USB
 config CMD_STM32PROG_SERIAL
 	bool "support stm32prog over UART"
 	depends on CMD_STM32PROG
+	imply DISABLE_CONSOLE
+	imply SILENT_CONSOLE
 	default y
 	help
 		activate the command "stm32prog serial" for STM32MP soc family
diff --git a/arch/arm/mach-stm32mp/stm32mp2/cpu.c b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
index 9548b27cfa7..c3b87d7f981 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/cpu.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/cpu.c
@@ -55,6 +55,19 @@ int arch_cpu_init(void)
 	return 0;
 }
 
+int mach_cpu_init(void)
+{
+	u32 boot_mode;
+
+	boot_mode = get_bootmode();
+
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
+	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
+		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
+
+	return 0;
+}
+
 void enable_caches(void)
 {
 	/* deactivate the data cache, early enabled in arch_cpu_init() */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
