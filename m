Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1922C1CD
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 11:13:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE00CC36B25
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jul 2020 09:13:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA806C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 09:13:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O97sHb028019; Fri, 24 Jul 2020 11:13:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=KpZtMIyd3Iy/l4Jjdcy6a/wEHp4dsVSQCyW8Sitx1B0=;
 b=LVY2o2MDmTwyiwsSIrsSDV4w7LTyFIi7SxJIoGNsNfIRyVMurbQH8w6f0fiqC1O99F9U
 qgxzIinlSmauhZu2ECatJur5qA89Kj1xj3VrJ47nfBGm0NMaBH1CZRBZZxDgDnBirIRk
 ghYNTl9DS34nM6VphC/d4MSh5CWNvH0ZN0Jt14uvzQLaC5zJDIDsrjRAWSXYXSvFBMJs
 F2CeRXWzbxsZ7XKxRvXoccXhJnHYjZFYv7y9q4BSnTa6qDi+na0VJ/IaPyXxny1mxWBW
 kb7sP9xqcJvWPvXZ0nfsAWixnMav2DGJthbIGzgdbVuj3/6uGc1IqxiVFPwqrCz/eAyW Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsfpya85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 11:13:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 711D810002A;
 Fri, 24 Jul 2020 11:13:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6053E2A5438;
 Fri, 24 Jul 2020 11:13:37 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jul 2020 11:13:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jul 2020 11:13:31 +0200
Message-ID: <20200724091331.12195-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_02:2020-07-24,
 2020-07-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: move dbgmcu_init call when DT
	is ready
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

As the dbgmcu_init use the function bsec_dbgswenable which is based
on the DM and DT, its call can't be done before the spl is initialized
(driver model, DT and malloc) in board_init_f::spl_early_init().

This function call is moved later in spl_board_init().

Fixes: bd3f60d29c24 ("arm: stm32mp: protect DBGMCU_IDC access with BSEC")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/Kconfig |  1 +
 arch/arm/mach-stm32mp/cpu.c   | 12 ++++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 4003c2e38b..478fd2f17d 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -1,6 +1,7 @@
 if ARCH_STM32MP
 
 config SPL
+	select SPL_BOARD_INIT
 	select SPL_CLK
 	select SPL_DM
 	select SPL_DM_SEQ_ALIAS
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 382067190c..56092c8bf6 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -154,15 +154,20 @@ static void security_init(void)
  */
 static void dbgmcu_init(void)
 {
-	setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
-
 	/*
 	 * Freeze IWDG2 if Cortex-A7 is in debug mode
 	 * done in TF-A for TRUSTED boot and
 	 * DBGMCU access is controlled by BSEC_DENABLE.DBGSWENABLE
 	*/
-	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable())
+	if (!IS_ENABLED(CONFIG_TFABOOT) && bsec_dbgswenable()) {
+		setbits_le32(RCC_DBGCFGR, RCC_DBGCFGR_DBGCKEN);
 		setbits_le32(DBGMCU_APB4FZ1, DBGMCU_APB4FZ1_IWDG2);
+	}
+}
+
+void spl_board_init(void)
+{
+	dbgmcu_init();
 }
 #endif /* !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD) */
 
@@ -241,7 +246,6 @@ int arch_cpu_init(void)
 	timer_init();
 
 #if !defined(CONFIG_SPL) || defined(CONFIG_SPL_BUILD)
-	dbgmcu_init();
 #ifndef CONFIG_TFABOOT
 	security_init();
 	update_bootmode();
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
