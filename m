Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76C2347D9
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 538DDC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A579C36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VEScd3016906; Fri, 31 Jul 2020 16:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=yugJQb49qYHd3ChfJMS81wAX4muafJZKpNs4vQowwjQ=;
 b=Yaoq3FxCNvNCyGbrC1DyLMlI7uNV43VboYpstYM5a/oIMaaOq2dJMoLtZ9t24WSMNEJz
 +5R3vi7MlRQMlhVKdmvYs2KPJbbO9kjUjKR7w5iBQGJibuMd4VZKtG04QPxv+Kq/nris
 0mrM4tSThK1xc7ysfYEC2ipRT3XAIOLmGWB1GM+5OYz0Tr6TR3lSbZYvHjLxnH3MENxV
 DJzei271D/RyprNG/sD1W16lQrGr8mKEG01E9xQBLSpl3DrqsofY2uE9UVvlH5tOt6yL
 7gR48I6SqpNEhzF1nXr5PgZkLD4364FjoBbGAkC2QKBImXscf/XtKv1RBJYK6u6ENZ/N yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmgpu9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95A9310002A;
 Fri, 31 Jul 2020 16:32:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 84D8F2B1899;
 Fri, 31 Jul 2020 16:32:04 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:04 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:51 +0200
Message-ID: <20200731143152.8812-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 10/11] arm: stm32mp: bsec: use IS_ENABLED to
	prevent ifdef
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

Use IS_ENABLED to prevent ifdef in bsec driver.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 86 +++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 40 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 0c56b440f5..a9b9bd0902 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -74,7 +74,6 @@ static bool bsec_read_lock(u32 address, u32 otp)
 	return !!(readl(address + bank) & bit);
 }
 
-#ifndef CONFIG_TFABOOT
 /**
  * bsec_check_error() - Check status of one otp
  * @base: base address of bsec IP
@@ -279,7 +278,6 @@ static int bsec_program_otp(long base, u32 val, u32 otp)
 
 	return ret;
 }
-#endif /* CONFIG_TFABOOT */
 
 /* BSEC MISC driver *******************************************************/
 struct stm32mp_bsec_platdata {
@@ -288,15 +286,17 @@ struct stm32mp_bsec_platdata {
 
 static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
 {
-#ifdef CONFIG_TFABOOT
-	return stm32_smc(STM32_SMC_BSEC,
-			 STM32_SMC_READ_OTP,
-			 otp, 0, val);
-#else
-	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+	struct stm32mp_bsec_platdata *plat;
 	u32 tmp_data = 0;
 	int ret;
 
+	if (IS_ENABLED(CONFIG_TFABOOT))
+		return stm32_smc(STM32_SMC_BSEC,
+				 STM32_SMC_READ_OTP,
+				 otp, 0, val);
+
+	plat = dev_get_platdata(dev);
+
 	/* read current shadow value */
 	ret = bsec_read_shadow(plat->base, &tmp_data, otp);
 	if (ret)
@@ -313,21 +313,22 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
 
 	/* restore shadow value */
 	ret = bsec_write_shadow(plat->base, tmp_data, otp);
+
 	return ret;
-#endif
 }
 
 static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
 {
-#ifdef CONFIG_TFABOOT
-	return stm32_smc(STM32_SMC_BSEC,
-			 STM32_SMC_READ_SHADOW,
-			 otp, 0, val);
-#else
-	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+	struct stm32mp_bsec_platdata *plat;
+
+	if (IS_ENABLED(CONFIG_TFABOOT))
+		return stm32_smc(STM32_SMC_BSEC,
+				 STM32_SMC_READ_SHADOW,
+				 otp, 0, val);
+
+	plat = dev_get_platdata(dev);
 
 	return bsec_read_shadow(plat->base, val, otp);
-#endif
 }
 
 static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
@@ -342,33 +343,38 @@ static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
 
 static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
 {
-#ifdef CONFIG_TFABOOT
-	return stm32_smc_exec(STM32_SMC_BSEC,
-			      STM32_SMC_PROG_OTP,
-			      otp, val);
-#else
-	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+	struct stm32mp_bsec_platdata *plat;
+
+	if (IS_ENABLED(CONFIG_TFABOOT))
+		return stm32_smc_exec(STM32_SMC_BSEC,
+				      STM32_SMC_PROG_OTP,
+				      otp, val);
+
+	plat = dev_get_platdata(dev);
 
 	return bsec_program_otp(plat->base, val, otp);
-#endif
+
 }
 
 static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
 {
-#ifdef CONFIG_TFABOOT
-	return stm32_smc_exec(STM32_SMC_BSEC,
-			      STM32_SMC_WRITE_SHADOW,
-			      otp, val);
-#else
-	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+	struct stm32mp_bsec_platdata *plat;
+
+	if (IS_ENABLED(CONFIG_TFABOOT))
+		return stm32_smc_exec(STM32_SMC_BSEC,
+				      STM32_SMC_WRITE_SHADOW,
+				      otp, val);
+
+	plat = dev_get_platdata(dev);
 
 	return bsec_write_shadow(plat->base, val, otp);
-#endif
 }
 
 static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
 {
-#ifdef CONFIG_TFABOOT
+	if (!IS_ENABLED(CONFIG_TFABOOT))
+		return -ENOTSUPP;
+
 	if (val == 1)
 		return stm32_smc_exec(STM32_SMC_BSEC,
 				      STM32_SMC_WRLOCK_OTP,
@@ -377,9 +383,6 @@ static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
 		return 0; /* nothing to do */
 
 	return -EINVAL;
-#else
-	return -ENOTSUPP;
-#endif
 }
 
 static int stm32mp_bsec_read(struct udevice *dev, int offset,
@@ -481,18 +484,21 @@ static int stm32mp_bsec_ofdata_to_platdata(struct udevice *dev)
 
 static int stm32mp_bsec_probe(struct udevice *dev)
 {
-#if !defined(CONFIG_TFABOOT) && !defined(CONFIG_SPL_BUILD)
 	int otp;
-	struct stm32mp_bsec_platdata *plat = dev_get_platdata(dev);
+	struct stm32mp_bsec_platdata *plat;
 
 	/*
 	 * update unlocked shadow for OTP cleared by the rom code
 	 * only executed in U-Boot proper when TF-A is not used
 	 */
-	for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
-		if (!bsec_read_SR_lock(plat->base, otp))
-			bsec_shadow_register(plat->base, otp);
-#endif
+
+	if (!IS_ENABLED(CONFIG_TFABOOT) && !IS_ENABLED(CONFIG_SPL_BUILD)) {
+		plat = dev_get_platdata(dev);
+
+		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
+			if (!bsec_read_SR_lock(plat->base, otp))
+				bsec_shadow_register(plat->base, otp);
+	}
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
