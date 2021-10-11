Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA58428825
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Oct 2021 09:53:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 481D2C5C827;
	Mon, 11 Oct 2021 07:53:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA604C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 07:53:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B7GLbP020232; 
 Mon, 11 Oct 2021 09:52:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=o9Y0NsbOFIylxVE+2T/kumAsR0mSD12YFf3HEZU9Gm0=;
 b=jCtrhZTqKieST2BG/R20vy9w97qT5t6Aaf7gXiGAbk3Llez34EubBcB9XlGrla26VpLJ
 C1yxI9m7AFSjiQaEmx4/a2dr8vdrLJnyRGqM6lIVsbxS4D92rHaeyfj0B3i4QNalhuiK
 VrsR8WB9REcnwa1amrxl5qN3ne/q9VDqDsTrIgECVSBZ61oUlXqZX/5kgDJQHlIM9aWF
 rWKKPYFmQ/KzzOyOBCwTcUop2dRtH+2o1ok46eeuY7rHeLK8Uz1rdXwWwNe6fqkB7jzG
 NwDOj/y1cBOxCfgeNPyVt61EajR5CeywvBKRSCC12XRP7Z1EfS2RkRfGadpPhH5aqSZh 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmgqu87bv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 09:52:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5335100038;
 Mon, 11 Oct 2021 09:52:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D52021513A;
 Mon, 11 Oct 2021 09:52:58 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct 2021 09:52:58
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 11 Oct 2021 09:52:51 +0200
Message-ID: <20211011075244.4.Id047d97a30c68f46ac2bcb57014faa42067dd1ba@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
References: <20211011075244.1.Icb805e47dd8102559236013264342b52c187813f@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_02,2021-10-07_02,2020-04-07_01
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/4] stm32mp15: tidy up #ifdefs in cpu.c
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

We should avoid #ifdef in C modules and the unused functions
are eliminated by the linker.

Use the more readable IS_ENABLE() instead.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cpu.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 7421ea42a1..325d710100 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -93,7 +93,6 @@ u8 early_tlb[PGTABLE_SIZE] __section(".data") __aligned(0x4000);
 
 struct lmb lmb;
 
-#if defined(CONFIG_SPL_BUILD)
 static void security_init(void)
 {
 	/* Disable the backup domain write protection */
@@ -208,7 +207,6 @@ static void update_bootmode(void)
 			TAMP_BOOT_MODE_MASK,
 			boot_mode << TAMP_BOOT_MODE_SHIFT);
 }
-#endif /* defined(CONFIG_SPL_BUILD) */
 
 u32 get_bootmode(void)
 {
@@ -286,28 +284,26 @@ int arch_cpu_init(void)
 	/* early armv7 timer init: needed for polling */
 	timer_init();
 
-#if defined(CONFIG_SPL_BUILD)
-	security_init();
-	update_bootmode();
-#endif
+	if (IS_ENABLED(CONFIG_SPL_BUILD)) {
+		security_init();
+		update_bootmode();
+	}
 /* reset copro state in SPL, when used, or in U-Boot */
-#if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
-	/* Reset Coprocessor state unless it wakes up from Standby power mode */
-	if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
-		writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
-		writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
+	if (!IS_ENABLED(CONFIG_SPL) || IS_ENABLED(CONFIG_SPL_BUILD)) {
+		/* Reset Coprocessor state unless it wakes up from Standby power mode */
+		if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
+			writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
+			writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
+		}
 	}
-#endif
 
 	boot_mode = get_bootmode();
 
 	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
 	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
 		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
-#if defined(CONFIG_DEBUG_UART) && defined(CONFIG_SPL_BUILD)
-	else
+	else if (IS_ENABLED(CONFIG_DEBUG_UART) && IS_ENABLED(CONFIG_SPL_BUILD))
 		debug_uart_init();
-#endif
 
 	return 0;
 }
@@ -461,7 +457,7 @@ void get_soc_name(char name[SOC_NAME_SIZE])
 		 soc_type[type], soc_pkg[pkg], soc_rev[rev]);
 }
 
-#if defined(CONFIG_DISPLAY_CPUINFO)
+/* used when CONFIG_DISPLAY_CPUINFO is activated */
 int print_cpuinfo(void)
 {
 	char name[SOC_NAME_SIZE];
@@ -471,7 +467,6 @@ int print_cpuinfo(void)
 
 	return 0;
 }
-#endif /* CONFIG_DISPLAY_CPUINFO */
 
 static void setup_boot_mode(void)
 {
@@ -601,13 +596,15 @@ static void setup_boot_mode(void)
  */
 __weak int setup_mac_address(void)
 {
-#if defined(CONFIG_NET)
 	int ret;
 	int i;
 	u32 otp[2];
 	uchar enetaddr[6];
 	struct udevice *dev;
 
+	if (!IS_ENABLED(CONFIG_NET))
+		return 0;
+
 	/* MAC already in environment */
 	if (eth_env_get_enetaddr("ethaddr", enetaddr))
 		return 0;
@@ -634,7 +631,6 @@ __weak int setup_mac_address(void)
 	ret = eth_env_set_enetaddr("ethaddr", enetaddr);
 	if (ret)
 		log_err("Failed to set mac address %pM from OTP: %d\n", enetaddr, ret);
-#endif
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
