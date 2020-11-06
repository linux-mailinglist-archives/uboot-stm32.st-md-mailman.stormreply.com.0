Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9022A9B65
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 278F3C36B36;
	Fri,  6 Nov 2020 18:02:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F0EBC3FAD9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:18 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwEnT022600; Fri, 6 Nov 2020 19:02:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WBEznb3TQlvWDgPxwwJp1HrcgjFUleRx3rQFc/303bc=;
 b=rpqfplur28cbLimddP+HE+FrOchVk6e+zN9eGtCIMkIRpsmNsv32Ldd8cY8m2AAWhET1
 nU95bnPVW6Kw7zg0ALDfEJzKIHXvevSEXSc20t4Piger8UDt2xXuDWXlenxy58l2KpKw
 fZd/OIpcTae6tVCD6u9/6SPrh/V0WWeA9TITVPyzqPf3RIYWkjPnuxGiKzhX6AgLahQ4
 nK5xxY3b5uZ4fwW6dmCWoYy8z8pY4aG/i1VvKY1wUjvJ7BJoPmzToa11+vO2rypV/eId
 ZR/VyKm5j+ovKoEVAyoHraQFUDN0j9U/VADoSxGxVek8LN5p6EGB4Fgu+63UuaI4CYlh 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14F0310002A;
 Fri,  6 Nov 2020 19:02:10 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0B43524C782;
 Fri,  6 Nov 2020 19:02:10 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:09
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:31 +0100
Message-ID: <20201106180201.31784-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 03/33] arm: stm32mp: bsec: migrate trace to
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
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2:
- Add dm/device_compat.h

 arch/arm/mach-stm32mp/bsec.c | 38 ++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index a9b9bd0902..d0a9e6a835 100644
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
@@ -10,6 +12,7 @@
 #include <asm/io.h>
 #include <asm/arch/bsec.h>
 #include <asm/arch/stm32mp1_smc.h>
+#include <dm/device_compat.h>
 #include <linux/arm-smccc.h>
 #include <linux/iopoll.h>
 
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
