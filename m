Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA94B6F83
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Feb 2022 16:09:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D80CC5F1F2;
	Tue, 15 Feb 2022 15:09:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A0AC23E53
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 15:09:03 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FAAIJA023893;
 Tue, 15 Feb 2022 16:08:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=0fMGiXvnMYmNRiad5dRW+pNtjJ2NE4hj595vm0HvRWU=;
 b=jmTyYud86S1ghoSj7TnEnumSmakFVOn1R6TJfeb/OW1/uxl5oKuSpJdUiqyNFyd3tBvT
 PVYkUXaDjQaRdKfL3QjIwe/9IdPVFmOYoAjqKHKO4z/YeVKB8BZSfIEfF5igaaAxBoBf
 2vhGkt1HLVYQFhjIOrEelM1EUPKehGhL2SuqZPhUEDYJsboN1joeKPCzY54FfmP/W4hC
 ut5FQISkihfJcRZb8lVBFspXZixodSND3KuSpxqHrvGgu6X6hwRinvaL5qPAV8AA0vYR
 Bxi5D+OeleE/cer1Ge3H4lzHbgH2DCJfoSXCmtGiW1n1lc7Y8SPnoLgubdGqHR1/Yu9U QA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e84wwkd9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 16:08:54 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9C80510002A;
 Tue, 15 Feb 2022 16:08:53 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92558229A8E;
 Tue, 15 Feb 2022 16:08:53 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 15 Feb 2022 16:08:53
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 15 Feb 2022 16:08:50 +0100
Message-ID: <20220215160841.1.Ieacd0bc93c53f5b38d6e1d228a498bc40758f121@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Johann Neuhauser <jneuhauser@dh-electronics.com>
Subject: [Uboot-stm32] [PATCH 1/2] stm32mp: bsec: add permanent lock write
	support
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

Add support of the permanent lock support in U-Boot proper
when BSEC is not managed by secure monitor (TF-A SP_MIN or OP-TEE).

This patch avoid issue with stm32key command and fuse command
on basic boot for this missing feature of U-Boot BSEC driver.

Reported-by: Johann Neuhauser <jneuhauser@dh-electronics.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 90 +++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 27d1829501..fd6e1a3957 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -18,6 +18,7 @@
 #include <linux/iopoll.h>
 
 #define BSEC_OTP_MAX_VALUE		95
+#define BSEC_OTP_UPPER_START		32
 #define BSEC_TIMEOUT_US			10000
 
 /* BSEC REGISTER OFFSET (base relative) */
@@ -41,6 +42,7 @@
 /* BSEC_CONTROL Register */
 #define BSEC_READ			0x000
 #define BSEC_WRITE			0x100
+#define BSEC_LOCK			0x200
 
 /* LOCK Register */
 #define OTP_LOCK_MASK			0x1F
@@ -61,6 +63,11 @@
  */
 #define BSEC_LOCK_PROGRAM		0x04
 
+/*
+ * OTP status: bit 0 permanent lock
+ */
+#define BSEC_LOCK_PERM			BIT(0)
+
 /**
  * bsec_lock() - manage lock for each type SR/SP/SW
  * @address: address of bsec IP register
@@ -284,6 +291,65 @@ static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
 	return ret;
 }
 
+/**
+ * bsec_permanent_lock_otp() - permanent lock of OTP in SAFMEM
+ * @dev: bsec IP device
+ * @base: base address of bsec IP
+ * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
+ * Return: 0 if no error
+ */
+static int bsec_permanent_lock_otp(struct udevice *dev, long base, uint32_t otp)
+{
+	int ret;
+	bool power_up = false;
+	u32 val, addr;
+
+	/* check if safemem is power up */
+	if (!(readl(base + BSEC_OTP_STATUS_OFF) & BSEC_MODE_PWR_MASK)) {
+		ret = bsec_power_safmem(base, true);
+		if (ret)
+			return ret;
+
+		power_up = true;
+	}
+
+	/*
+	 * low OTPs = 2 bits word for low OTPs, 1 bits per word for upper OTP
+	 * and only 16 bits used in WRDATA
+	 */
+	if (otp < BSEC_OTP_UPPER_START) {
+		addr = otp / 8;
+		val = 0x03 << ((otp * 2) & 0xF);
+	} else {
+		addr = BSEC_OTP_UPPER_START / 8 +
+		       ((otp - BSEC_OTP_UPPER_START) / 16);
+		val = 0x01 << (otp & 0xF);
+	}
+
+	/* set value in write register*/
+	writel(val, base + BSEC_OTP_WRDATA_OFF);
+
+	/* set BSEC_OTP_CTRL_OFF with the otp addr and lock request*/
+	writel(addr | BSEC_WRITE | BSEC_LOCK, base + BSEC_OTP_CTRL_OFF);
+
+	/* check otp status*/
+	ret = readl_poll_timeout(base + BSEC_OTP_STATUS_OFF,
+				 val, (val & BSEC_MODE_BUSY_MASK) == 0,
+				 BSEC_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	if (val & BSEC_MODE_PROGFAIL_MASK)
+		ret = -EACCES;
+	else
+		ret = bsec_check_error(base, otp);
+
+	if (power_up)
+		bsec_power_safmem(base, false);
+
+	return ret;
+}
+
 /* BSEC MISC driver *******************************************************/
 struct stm32mp_bsec_plat {
 	u32 base;
@@ -339,9 +405,14 @@ static int stm32mp_bsec_read_shadow(struct udevice *dev, u32 *val, u32 otp)
 static int stm32mp_bsec_read_lock(struct udevice *dev, u32 *val, u32 otp)
 {
 	struct stm32mp_bsec_plat *plat = dev_get_plat(dev);
+	u32 wrlock;
 
 	/* return OTP permanent write lock status */
-	*val = bsec_read_lock(plat->base + BSEC_WRLOCK_OFF, otp);
+	wrlock = bsec_read_lock(plat->base + BSEC_WRLOCK_OFF, otp);
+
+	*val = 0;
+	if (wrlock)
+		*val = BSEC_LOCK_PERM;
 
 	return 0;
 }
@@ -377,15 +448,22 @@ static int stm32mp_bsec_write_shadow(struct udevice *dev, u32 val, u32 otp)
 
 static int stm32mp_bsec_write_lock(struct udevice *dev, u32 val, u32 otp)
 {
-	if (!IS_ENABLED(CONFIG_ARM_SMCCC) || IS_ENABLED(CONFIG_SPL_BUILD))
-		return -ENOTSUPP;
+	struct stm32mp_bsec_plat *plat;
+
+	/* only permanent write lock is supported in U-Boot */
+	if (!(val & BSEC_LOCK_PERM)) {
+		dev_dbg(dev, "lock option without BSEC_LOCK_PERM: %x\n", val);
+		return 0; /* nothing to do */
+	}
 
-	if (val == 1)
+	if (IS_ENABLED(CONFIG_ARM_SMCCC) && !IS_ENABLED(CONFIG_SPL_BUILD))
 		return stm32_smc_exec(STM32_SMC_BSEC,
 				      STM32_SMC_WRLOCK_OTP,
 				      otp, 0);
-	if (val == 0)
-		return 0; /* nothing to do */
+
+	plat = dev_get_plat(dev);
+
+	return bsec_permanent_lock_otp(dev, plat->base, otp);
 
 	return -EINVAL;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
