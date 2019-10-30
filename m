Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F1E9C71
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 14:38:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A5EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 13:38:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08D58C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 13:38:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9UDboMj008191; Wed, 30 Oct 2019 14:38:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SW1xPiVZH1A4Yf2FcG6NbkJ9XTCdZ5jNUUP8oK8vKwE=;
 b=KjhSEsY3cLCCt40+cdRUyGzBO2skCgszzNSmj6kcIu0OHqJuU6DSJCByNHLHtSathVU4
 MSxvAqMfsEMtiZdkStokai5YFDsAE7rxmQmgSGGqYXxFO8ILIvqNxzxbE/lvL3MAqeBa
 Ry+TcsSgXTiBc7lX2oQSJ/+Mxi5YeTHimMQL/fXy7MeinhwN5Wxn2A6QcnlMEhuo6MxN
 Euzwy/Kvp32ssJGn1Ju5+GeI2scK7r+afhy1wcExjxOD+iKFpYD90TnuEKQ1rXxjoOat
 jKqYVK8wWYU4yhYQ1L9E7Tkj5YPDKfv0gdx+UFKOceR7lcYy+GPxpnwugDvdA5hv0u98 mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vxwhe3xuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 14:38:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ABB39100039;
 Wed, 30 Oct 2019 14:38:47 +0100 (CET)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A1E542BEC75;
 Wed, 30 Oct 2019 14:38:47 +0100 (CET)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct
 2019 14:38:47 +0100
Received: from localhost (10.201.23.25) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 30 Oct 2019 14:38:47
 +0100
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>, "Lokesh
 Vutla" <lokeshvutla@ti.com>, Suman Anna <s-anna@ti.com>
Date: Wed, 30 Oct 2019 14:38:30 +0100
Message-ID: <1572442713-26353-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
References: <1572442713-26353-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-30_06:2019-10-30,2019-10-30 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/6] stm32mp1: reset coprocessor status at
	cold boot
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

Reset ResourceTableAddress and CoprocessorState at cold boot, preserve
these values at standby wakeup.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 arch/arm/mach-stm32mp/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index a46e843..e24abf5 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -34,7 +34,9 @@
 #define TAMP_CR1		(STM32_TAMP_BASE + 0x00)
 
 #define PWR_CR1			(STM32_PWR_BASE + 0x00)
+#define PWR_MCUCR		(STM32_PWR_BASE + 0x14)
 #define PWR_CR1_DBP		BIT(8)
+#define PWR_MCUCR_SBF		BIT(6)
 
 /* DBGMCU register */
 #define DBGMCU_IDC		(STM32_DBGMCU_BASE + 0x00)
@@ -205,6 +207,11 @@ int arch_cpu_init(void)
 	security_init();
 	update_bootmode();
 #endif
+	/* Reset Coprocessor state unless it wakes up from Standby power mode */
+	if (!(readl(PWR_MCUCR) & PWR_MCUCR_SBF)) {
+		writel(TAMP_COPRO_STATE_OFF, TAMP_COPRO_STATE);
+		writel(0, TAMP_COPRO_RSC_TBL_ADDRESS);
+	}
 #endif
 
 	boot_mode = get_bootmode();
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
