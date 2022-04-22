Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6750B1C0
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Apr 2022 09:39:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57268C60496;
	Fri, 22 Apr 2022 07:39:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89ADCC60492
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Apr 2022 07:39:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M39spX028996;
 Fri, 22 Apr 2022 09:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=fhIPKyAdBoCUx1hoyCQFycCTSA4AN80VXo4y3o6zd04=;
 b=W4moLoL6/3dGrS2KOHGd2HODxYApjARvWD0TwK5taAL1iOGDhU7Zc//6MYnbSc/PBCWu
 KfvxM1xGa3E6981g984Tf+BpWea6YIkPvTzd9MW4jgS0U9anORcjklb00SpSXlKyTlB/
 Xq6y5hm8nVKztjfsvg65ddHyhF2QHA3iWCeLR8mLXJPS28dqPcThnuaU/0DNxnWLgLdB
 ZK/qao0Uit3/i1Pui2mK8iUOFHRvEA2q8jKKl0zE8QroWobuuA9o6VTas0Y0gTydw9UQ
 CRZWt5C2rVK4wSiW9anubwUg9d894JE8EtrUpU1RFh6uZxZKeKddtPwotqTCno1GSIxH jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fk4fvd7m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Apr 2022 09:39:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E639B10002A;
 Fri, 22 Apr 2022 09:39:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCED6216832;
 Fri, 22 Apr 2022 09:39:04 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 22 Apr
 2022 09:39:04 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 22 Apr 2022 09:39:00 +0200
Message-ID: <20220422073900.15786-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: [Uboot-stm32] [PATCH] phy: stm32-usbphyc: stm32-usbphyc: Add DT phy
	tuning support
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

Add support of phy-tuning properties for sm32-usbphyc's phy tuning
aligned with v5.15 kernel bindings.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/phy/phy-stm32-usbphyc.c | 167 ++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index 9c1dcfae52..d7f7c37f91 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -17,6 +17,8 @@
 #include <usb.h>
 #include <asm/io.h>
 #include <dm/device_compat.h>
+#include <dm/of_access.h>
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <power/regulator.h>
@@ -24,6 +26,7 @@
 /* USBPHYC registers */
 #define STM32_USBPHYC_PLL	0x0
 #define STM32_USBPHYC_MISC	0x8
+#define STM32_USBPHYC_TUNE(X)	(0x10C + ((X) * 0x100))
 
 /* STM32_USBPHYC_PLL bit fields */
 #define PLLNDIV			GENMASK(6, 0)
@@ -40,6 +43,26 @@
 /* STM32_USBPHYC_MISC bit fields */
 #define SWITHOST		BIT(0)
 
+/* STM32_USBPHYC_TUNE bit fields */
+#define INCURREN		BIT(0)
+#define INCURRINT		BIT(1)
+#define LFSCAPEN		BIT(2)
+#define HSDRVSLEW		BIT(3)
+#define HSDRVDCCUR		BIT(4)
+#define HSDRVDCLEV		BIT(5)
+#define HSDRVCURINCR		BIT(6)
+#define FSDRVRFADJ		BIT(7)
+#define HSDRVRFRED		BIT(8)
+#define HSDRVCHKITRM		GENMASK(12, 9)
+#define HSDRVCHKZTRM		GENMASK(14, 13)
+#define OTPCOMP			GENMASK(19, 15)
+#define SQLCHCTL		GENMASK(21, 20)
+#define HDRXGNEQEN		BIT(22)
+#define HSRXOFF			GENMASK(24, 23)
+#define HSFALLPREEM		BIT(25)
+#define SHTCCTCTLPROT		BIT(26)
+#define STAGSEL			BIT(27)
+
 #define MAX_PHYS		2
 
 /* max 100 us for PLL lock and 100 us for PHY init */
@@ -49,6 +72,62 @@
 #define PLL_INFF_MIN_RATE	19200000 /* in Hz */
 #define PLL_INFF_MAX_RATE	38400000 /* in Hz */
 
+enum boosting_vals {
+	BOOST_1000_UA = 1000,
+	BOOST_2000_UA = 2000,
+};
+
+enum dc_level_vals {
+	DC_MINUS_5_TO_7_MV,
+	DC_PLUS_5_TO_7_MV,
+	DC_PLUS_10_TO_14_MV,
+	DC_MAX,
+};
+
+enum current_trim {
+	CUR_NOMINAL,
+	CUR_PLUS_1_56_PCT,
+	CUR_PLUS_3_12_PCT,
+	CUR_PLUS_4_68_PCT,
+	CUR_PLUS_6_24_PCT,
+	CUR_PLUS_7_8_PCT,
+	CUR_PLUS_9_36_PCT,
+	CUR_PLUS_10_92_PCT,
+	CUR_PLUS_12_48_PCT,
+	CUR_PLUS_14_04_PCT,
+	CUR_PLUS_15_6_PCT,
+	CUR_PLUS_17_16_PCT,
+	CUR_PLUS_19_01_PCT,
+	CUR_PLUS_20_58_PCT,
+	CUR_PLUS_22_16_PCT,
+	CUR_PLUS_23_73_PCT,
+	CUR_MAX,
+};
+
+enum impedance_trim {
+	IMP_NOMINAL,
+	IMP_MINUS_2_OHMS,
+	IMP_MINUS_4_OMHS,
+	IMP_MINUS_6_OHMS,
+	IMP_MAX,
+};
+
+enum squelch_level {
+	SQLCH_NOMINAL,
+	SQLCH_PLUS_7_MV,
+	SQLCH_MINUS_5_MV,
+	SQLCH_PLUS_14_MV,
+	SQLCH_MAX,
+};
+
+enum rx_offset {
+	NO_RX_OFFSET,
+	RX_OFFSET_PLUS_5_MV,
+	RX_OFFSET_PLUS_10_MV,
+	RX_OFFSET_MINUS_5_MV,
+	RX_OFFSET_MAX,
+};
+
 struct pll_params {
 	u8 ndiv;
 	u16 frac;
@@ -327,6 +406,90 @@ static int stm32_usbphyc_of_xlate(struct phy *phy,
 	return 0;
 }
 
+static void stm32_usbphyc_tuning(struct udevice *dev, ofnode node, u32 index)
+{
+	struct stm32_usbphyc *usbphyc = dev_get_priv(dev);
+	u32 reg = STM32_USBPHYC_TUNE(index);
+	u32 otpcomp, val, tune = 0;
+	int ret;
+
+	/* Backup OTP compensation code */
+	otpcomp = FIELD_GET(OTPCOMP, readl(usbphyc->base + reg));
+
+	ret = ofnode_read_u32(node, "st,current-boost-microamp", &val);
+	if (!ret && (val == BOOST_1000_UA || val == BOOST_2000_UA)) {
+		val = (val == BOOST_2000_UA) ? 1 : 0;
+		tune |= INCURREN | FIELD_PREP(INCURRINT, val);
+	} else if (ret != -EINVAL) {
+		dev_warn(dev, "phy%d: invalid st,current-boost-microamp value\n", index);
+	}
+
+	if (!ofnode_read_bool(node, "st,no-lsfs-fb-cap"))
+		tune |= LFSCAPEN;
+
+	if (ofnode_read_bool(node, "st,decrease-hs-slew-rate"))
+		tune |= HSDRVSLEW;
+
+	ret = ofnode_read_u32(node, "st,tune-hs-dc-level", &val);
+	if (!ret && val < DC_MAX) {
+		if (val == DC_MINUS_5_TO_7_MV) {
+			tune |= HSDRVDCCUR;
+		} else {
+			val = (val == DC_PLUS_10_TO_14_MV) ? 1 : 0;
+			tune |= HSDRVCURINCR | FIELD_PREP(HSDRVDCLEV, val);
+		}
+	} else if (ret != -EINVAL) {
+		dev_warn(dev, "phy%d: invalid st,tune-hs-dc-level value\n", index);
+	}
+
+	if (ofnode_read_bool(node, "st,enable-fs-rftime-tuning"))
+		tune |= FSDRVRFADJ;
+
+	if (ofnode_read_bool(node, "st,enable-hs-rftime-reduction"))
+		tune |= HSDRVRFRED;
+
+	ret = ofnode_read_u32(node, "st,trim-hs-current", &val);
+	if (!ret && val < CUR_MAX)
+		tune |= FIELD_PREP(HSDRVCHKITRM, val);
+	else if (ret != -EINVAL)
+		dev_warn(dev, "phy%d: invalid st,trim-hs-current value\n", index);
+
+	ret = ofnode_read_u32(node, "st,trim-hs-impedance", &val);
+	if (!ret && val < IMP_MAX)
+		tune |= FIELD_PREP(HSDRVCHKZTRM, val);
+	else if (ret != -EINVAL)
+		dev_warn(dev, "phy%d: invalid trim-hs-impedance value\n", index);
+
+	ret = ofnode_read_u32(node, "st,tune-squelch-level", &val);
+	if (!ret && val < SQLCH_MAX)
+		tune |= FIELD_PREP(SQLCHCTL, val);
+	else if (ret != -EINVAL)
+		dev_warn(dev, "phy%d: invalid st,tune-squelch-level value\n", index);
+
+	if (ofnode_read_bool(node, "st,enable-hs-rx-gain-eq"))
+		tune |= HDRXGNEQEN;
+
+	ret = ofnode_read_u32(node, "st,tune-hs-rx-offset", &val);
+	if (!ret && val < RX_OFFSET_MAX)
+		tune |= FIELD_PREP(HSRXOFF, val);
+	else if (ret != -EINVAL)
+		dev_warn(dev, "phy%d: invalid st,tune-hs-rx-offset value\n", index);
+
+	if (ofnode_read_bool(node, "st,no-hs-ftime-ctrl"))
+		tune |= HSFALLPREEM;
+
+	if (!ofnode_read_bool(node, "st,no-lsfs-sc"))
+		tune |= SHTCCTCTLPROT;
+
+	if (ofnode_read_bool(node, "st,enable-hs-tx-staggering"))
+		tune |= STAGSEL;
+
+	/* Restore OTP compensation code */
+	tune |= FIELD_PREP(OTPCOMP, otpcomp);
+
+	writel(tune, usbphyc->base + reg);
+}
+
 static const struct phy_ops stm32_usbphyc_phy_ops = {
 	.init = stm32_usbphyc_phy_init,
 	.exit = stm32_usbphyc_phy_exit,
@@ -389,6 +552,10 @@ static int stm32_usbphyc_probe(struct udevice *dev)
 				phy_id, ofnode_get_name(node));
 			return -ENOENT;
 		}
+
+		/* Configure phy tuning */
+		stm32_usbphyc_tuning(dev, node, phy_id);
+
 		usbphyc_phy = usbphyc->phys + phy_id;
 		usbphyc_phy->init = false;
 		usbphyc_phy->powered = false;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
