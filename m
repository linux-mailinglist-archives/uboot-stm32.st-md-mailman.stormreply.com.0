Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7296228DC8A
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36F1FC424B8;
	Wed, 14 Oct 2020 09:17:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221BEC424B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:16:59 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CpjE010617; Wed, 14 Oct 2020 11:16:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=CA0qSrHFUe8S8X/EniKb/vSE4r1eKpDtb1dqyArrsEU=;
 b=zoOje0N2cw4pedGILSexgFCWg3N/+NfKKgzODsP6ooFa5iIk9nCsF+QJu1n4Wgn3gake
 H0igZQkU+pPSrbq5sycQbQOtu+3hWP6nXYJeYEDMEKox/fnA9aJj1TgXnUWdyvMUxlYu
 MgOJawKwRu8jOlFWTcBUWrFn+K/Z1L6HhOHn6tPKo/ZUyzUY8CosrYdcH+EgbxlAJ5rF
 yapdxUhp5AkmVr91sx1Dvd3VTMLkYGeaDvkVOvYOidc3/9bOMlRJQElCXBDatfXrWN64
 2tx0bwMAAoyrWnwYoiDeWRDCs3RrRO93HGvI3I3SvdSMLoRJOP19GI/yZwftLJcD+m1Z xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8gc6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 12F4F100034;
 Wed, 14 Oct 2020 11:16:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 093E62ABA3E;
 Wed, 14 Oct 2020 11:16:52 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:51
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:16 +0200
Message-ID: <20201014091646.4233-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/33] arm: stm32mp: bsec: migrate trace to
	log macro
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

Define LOG_CATEGORY, change pr_debug to dev_dbg and remove "bsec:"
header as it is managed by log macro (dev->name is displayed)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index a9b9bd0902..70650cfbf7 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2018, STMicroelectronics - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_MISC
+
 #include <common.h>
 #include <dm.h>
 #include <log.h>
@@ -11,6 +13,7 @@
 #include <asm/arch/bsec.h>
 #include <asm/arch/stm32mp1_smc.h>
 #include <linux/arm-smccc.h>
+#include <linux/compat.h>
 #include <linux/iopoll.h>
 
 #define BSEC_OTP_MAX_VALUE		95
@@ -160,7 +163,7 @@ static int bsec_power_safmem(u32 base, bool power)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_shadow_register(u32 base, u32 otp)
+static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
 {
 	u32 val;
 	int ret;
@@ -168,7 +171,8 @@ static int bsec_shadow_register(u32 base, u32 otp)
 
 	/* check if shadowing of otp is locked */
 	if (bsec_read_SR_lock(base, otp))
-		pr_debug("bsec : OTP %d is locked and refreshed with 0\n", otp);
+		dev_dbg(dev, "OTP %d is locked and refreshed with 0\n",
+			otp);
 
 	/* check if safemem is power up */
 	val = readl(base + BSEC_OTP_STATUS_OFF);
@@ -203,7 +207,7 @@ static int bsec_shadow_register(u32 base, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_read_shadow(u32 base, u32 *val, u32 otp)
+static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
 {
 	*val = readl(base + BSEC_OTP_DATA_OFF + otp * sizeof(u32));
 
@@ -217,11 +221,11 @@ static int bsec_read_shadow(u32 base, u32 *val, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_write_shadow(u32 base, u32 val, u32 otp)
+static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
 {
 	/* check if programming of otp is locked */
 	if (bsec_read_SW_lock(base, otp))
-		pr_debug("bsec : OTP %d is lock, write will be ignore\n", otp);
+		dev_dbg(dev, "OTP %d is lock, write will be ignore\n", otp);
 
 	writel(val, base + BSEC_OTP_DATA_OFF + otp * sizeof(u32));
 
@@ -236,16 +240,16 @@ static int bsec_write_shadow(u32 base, u32 val, u32 otp)
  * after the function the otp data is not refreshed in shadow
  * Return: 0 if no error
  */
-static int bsec_program_otp(long base, u32 val, u32 otp)
+static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
 {
 	u32 ret;
 	bool power_up = false;
 
 	if (bsec_read_SP_lock(base, otp))
-		pr_debug("bsec : OTP %d locked, prog will be ignore\n", otp);
+		dev_dbg(dev, "OTP %d locked, prog will be ignore\n", otp);
 
 	if (readl(base + BSEC_OTP_LOCK_OFF) & (1 << BSEC_LOCK_PROGRAM))
-		pr_debug("bsec : Global lock, prog will be ignore\n");
+		dev_dbg(dev, "Global lock, prog will be ignore\n");
 
 	/* check if safemem is power up */
 	if (!(readl(base + BSEC_OTP_STATUS_OFF) & BSEC_MODE_PWR_MASK)) {
@@ -298,21 +302,21 @@ static int stm32mp_bsec_read_otp(struct udevice *dev, u32 *val, u32 otp)
 	plat = dev_get_platdata(dev);
 
 	/* read current shadow value */
-	ret = bsec_read_shadow(plat->base, &tmp_data, otp);
+	ret = bsec_read_shadow(dev, plat->base, &tmp_data, otp);
 	if (ret)
 		return ret;
 
 	/* copy otp in shadow */
-	ret = bsec_shadow_register(plat->base, otp);
+	ret = bsec_shadow_register(dev, plat->base, otp);
 	if (ret)
 		return ret;
 
-	ret = bsec_read_shadow(plat->base, val, otp);
+	ret = bsec_read_shadow(dev, plat->base, val, otp);
 	if (ret)
 		return ret;
 
 	/* restore shadow value */
-	ret = bsec_write_shadow(plat->base, tmp_data, otp);
+	ret = bsec_write_shadow(dev, plat->base, tmp_data, otp);
 
 	return ret;
 }
@@ -328,7 +332,7 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
 
 	plat = dev_get_platdata(dev);
 
-	return bsec_read_shadow(plat->base, val, otp);
+	return bsec_read_shadow(dev, plat->base, val, otp);
 }
 
 static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
@@ -352,7 +356,7 @@ static int stm32mp_bsec_write_otp(struct udevice *dev, u32 val, u32 otp)
 
 	plat = dev_get_platdata(dev);
 
-	return bsec_program_otp(plat->base, val, otp);
+	return bsec_program_otp(dev, plat->base, val, otp);
 
 }
 
@@ -367,7 +371,7 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
 
 	plat = dev_get_platdata(dev);
 
-	return bsec_write_shadow(plat->base, val, otp);
+	return bsec_write_shadow(dev, plat->base, val, otp);
 }
 
 static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
@@ -497,7 +501,7 @@ static int stm32mp_bsec_probe(struct udevice *dev)
 
 		for (otp = 57; otp <= BSEC_OTP_MAX_VALUE; otp++)
 			if (!bsec_read_SR_lock(plat->base, otp))
-				bsec_shadow_register(plat->base, otp);
+				bsec_shadow_register(dev, plat->base, otp);
 	}
 
 	return 0;
@@ -527,7 +531,7 @@ bool bsec_dbgswenable(void)
 	ret = uclass_get_device_by_driver(UCLASS_MISC,
 					  DM_GET_DRIVER(stm32mp_bsec), &dev);
 	if (ret || !dev) {
-		pr_debug("bsec driver not available\n");
+		log_debug("bsec driver not available\n");
 		return false;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
