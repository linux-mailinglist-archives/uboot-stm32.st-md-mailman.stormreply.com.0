Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994D7D9BE3
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Oct 2023 16:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C6B8C6C855;
	Fri, 27 Oct 2023 14:44:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70660C6C841
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 14:44:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39RCdkCP027442; Fri, 27 Oct 2023 16:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=22UvaXqXCXq1iEOWje7lL2ibxdggyPzCQO2Y6OkXCoE=; b=y+
 hjEUCs7dXdFy4jMnO6X/3jwQq7vwVkSEIkR0r33ePhaYLx2XuZ6/dDAs5Z2FnOeb
 GdYcQNgDMPQidbB85Lnw7vnsV7V1Dai67dw3z8V/vK71L3rk//ENKG8M+ltKOd8f
 D9aexHEXtFCoZeHRP34m6UMdQkfYTunRfqYouB3E1ZCJMTionl6wWqnAVbCoA5og
 +VqGvBKWbiI3nqpmltvf4kPYZiQ8Eax3r3Xox0/UAsRSc8RH3deVFu1TpCj51HpU
 hmXDVVe62hXYzX1KW2KTyz6wxp2s9VPi6ZjEO8AkLRn5Uw15w/aA3C6OL3mzgQyY
 pcwCooFve8sm08m6aJ+Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tywqsc8xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Oct 2023 16:44:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 610D2100062;
 Fri, 27 Oct 2023 16:44:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A1CF26A0BD;
 Fri, 27 Oct 2023 16:44:12 +0200 (CEST)
Received: from localhost (10.201.20.38) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 27 Oct
 2023 16:44:12 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 27 Oct 2023 16:43:00 +0200
Message-ID: <20231027144304.1002307-6-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
References: <20231027144304.1002307-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_13,2023-10-27_01,2023-05-22_02
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v1 5/9] stm32mp: bsec: Fix AARCH64 compilation
	warnings
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

When building with AARCH64 defconfig, we got warnings, fix them.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 arch/arm/mach-stm32mp/bsec.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-stm32mp/bsec.c b/arch/arm/mach-stm32mp/bsec.c
index 599e63a93dd..28a8280b280 100644
--- a/arch/arm/mach-stm32mp/bsec.c
+++ b/arch/arm/mach-stm32mp/bsec.c
@@ -110,7 +110,7 @@
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: true if locked else false
  */
-static bool bsec_read_lock(u32 address, u32 otp)
+static bool bsec_read_lock(void __iomem *address, u32 otp)
 {
 	u32 bit;
 	u32 bank;
@@ -118,7 +118,7 @@ static bool bsec_read_lock(u32 address, u32 otp)
 	bit = 1 << (otp & OTP_LOCK_MASK);
 	bank = ((otp >> OTP_LOCK_BANK_SHIFT) & OTP_LOCK_MASK) * sizeof(u32);
 
-	return !!(readl(address + bank) & bit);
+	return !!(readl((address + bank)) & bit);
 }
 
 /**
@@ -127,7 +127,7 @@ static bool bsec_read_lock(u32 address, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error, -EAGAIN or -ENOTSUPP
  */
-static u32 bsec_check_error(u32 base, u32 otp)
+static u32 bsec_check_error(void __iomem *base, u32 otp)
 {
 	u32 bit;
 	u32 bank;
@@ -149,7 +149,7 @@ static u32 bsec_check_error(u32 base, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: true if locked else false
  */
-static bool bsec_read_SR_lock(u32 base, u32 otp)
+static bool bsec_read_SR_lock(void __iomem *base, u32 otp)
 {
 	return bsec_read_lock(base + BSEC_SRLOCK_OFF, otp);
 }
@@ -160,7 +160,7 @@ static bool bsec_read_SR_lock(u32 base, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: true if locked else false
  */
-static bool bsec_read_SP_lock(u32 base, u32 otp)
+static bool bsec_read_SP_lock(void __iomem *base, u32 otp)
 {
 	return bsec_read_lock(base + BSEC_SPLOCK_OFF, otp);
 }
@@ -171,7 +171,7 @@ static bool bsec_read_SP_lock(u32 base, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: true if locked else false
  */
-static bool bsec_read_SW_lock(u32 base, u32 otp)
+static bool bsec_read_SW_lock(void __iomem *base, u32 otp)
 {
 	return bsec_read_lock(base + BSEC_SWLOCK_OFF, otp);
 }
@@ -182,7 +182,7 @@ static bool bsec_read_SW_lock(u32 base, u32 otp)
  * @power: true to power up , false to power down
  * Return: 0 if succeed
  */
-static int bsec_power_safmem(u32 base, bool power)
+static int bsec_power_safmem(void __iomem *base, bool power)
 {
 	u32 val;
 	u32 mask;
@@ -208,7 +208,7 @@ static int bsec_power_safmem(u32 base, bool power)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
+static int bsec_shadow_register(struct udevice *dev, void __iomem *base, u32 otp)
 {
 	u32 val;
 	int ret;
@@ -253,7 +253,8 @@ static int bsec_shadow_register(struct udevice *dev, u32 base, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
+static int bsec_read_shadow(struct udevice *dev, void __iomem *base, u32 *val,
+			    u32 otp)
 {
 	*val = readl(base + BSEC_OTP_DATA_OFF + otp * sizeof(u32));
 
@@ -268,7 +269,7 @@ static int bsec_read_shadow(struct udevice *dev, u32 base, u32 *val, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
+static int bsec_write_shadow(struct udevice *dev, void __iomem *base, u32 val, u32 otp)
 {
 	/* check if programming of otp is locked */
 	if (bsec_read_SW_lock(base, otp))
@@ -288,7 +289,7 @@ static int bsec_write_shadow(struct udevice *dev, u32 base, u32 val, u32 otp)
  * after the function the otp data is not refreshed in shadow
  * Return: 0 if no error
  */
-static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
+static int bsec_program_otp(struct udevice *dev, void __iomem *base, u32 val, u32 otp)
 {
 	u32 ret;
 	bool power_up = false;
@@ -338,7 +339,7 @@ static int bsec_program_otp(struct udevice *dev, long base, u32 val, u32 otp)
  * @otp: otp number (0 - BSEC_OTP_MAX_VALUE)
  * Return: 0 if no error
  */
-static int bsec_permanent_lock_otp(struct udevice *dev, long base, uint32_t otp)
+static int bsec_permanent_lock_otp(struct udevice *dev, void __iomem *base, uint32_t otp)
 {
 	int ret;
 	bool power_up = false;
@@ -392,7 +393,7 @@ static int bsec_permanent_lock_otp(struct udevice *dev, long base, uint32_t otp)
 
 /* BSEC MISC driver *******************************************************/
 struct stm32mp_bsec_plat {
-	u32 base;
+	void __iomem *base;
 };
 
 struct stm32mp_bsec_priv {
@@ -724,7 +725,7 @@ static int stm32mp_bsec_of_to_plat(struct udevice *dev)
 {
 	struct stm32mp_bsec_plat *plat = dev_get_plat(dev);
 
-	plat->base = (u32)dev_read_addr_ptr(dev);
+	plat->base = dev_read_addr_ptr(dev);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
