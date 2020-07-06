Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9FA21566D
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 13:31:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C48F6C36B29
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Jul 2020 11:31:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 197E9C36B27
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2020 11:31:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066BVg09027702; Mon, 6 Jul 2020 13:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=jDhZAO9yKiPJ8ZsjIAN2k2g6/drlum64/CUGIrN5JgQ=;
 b=F/u8uFSz2pIpNfM7k5EstULKPFmTO1udvh7pTM+jKXd8LRS4ycZKqx6q7SbUiw8RBLTs
 CNYB+Ved4M2Pnzrqam8FlbITzj+ldS+UxqbvbfXp3tQ5AI7aQvx8gCa7Gfo1xXMlcyF0
 VxOh8wfP9oNXpWQcfH5l4CfmOaOIB+OBwKHCRtGE5fkJtwhq9Mk510SltBGZXreeb1Do
 cpxrSQbablPKB3zWSYYEDh7JFdjBylBYDkVkrYcxDnjfnC6/KylTcJujK2ifPbUZXMUt
 INO6A3bZ+JNo5UjZmnkO8a0Bo8TS3YhT/lj8iwGJIvijs7O51/Zt0r566CCW7bQsJYPu Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 322fhuu016-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 13:31:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3669B10002A;
 Mon,  6 Jul 2020 13:31:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25F202BF9CE;
 Mon,  6 Jul 2020 13:31:40 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 6 Jul 2020 13:31:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 6 Jul 2020 13:31:35 +0200
Message-ID: <20200706133132.1.Ib000bc59b2ad7201352c5a0a55ec6072221e1808@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_08:2020-07-06,
 2020-07-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Heiko Schocher <hs@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] i2c: stm32f7: SYSCFG Fast Mode Plus support
	for I2C STM32F7
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

Read SYSCFG bindings to set Fast Mode Plus bits if Fast Mode Plus
speed is selected.

Handle the stm32mp15 specific compatible to handle FastMode+
registers handling which is different on the stm32mp15 compared
to the stm32f7 or stm32h7.
Indeed, on the stm32mp15, the FastMode+ set and clear registers
are separated while on the other platforms (F7 or H7) the control
is done in a unique register.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/i2c/stm32f7_i2c.c | 74 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 593f713d6b..2f60911549 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -8,7 +8,9 @@
 #include <dm.h>
 #include <i2c.h>
 #include <log.h>
+#include <regmap.h>
 #include <reset.h>
+#include <syscon.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 
@@ -154,6 +156,7 @@ struct stm32_i2c_spec {
  * @fall_time: Fall time (ns)
  * @dnf: Digital filter coefficient (0-16)
  * @analog_filter: Analog filter delay (On/Off)
+ * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
  */
 struct stm32_i2c_setup {
 	u32 speed_freq;
@@ -162,6 +165,7 @@ struct stm32_i2c_setup {
 	u32 fall_time;
 	u8 dnf;
 	bool analog_filter;
+	u32 fmp_clr_offset;
 };
 
 /**
@@ -181,11 +185,26 @@ struct stm32_i2c_timings {
 	u8 scll;
 };
 
+/**
+ * struct stm32_i2c_priv - private data of the controller
+ * @regs: I2C registers address
+ * @clk: hw i2c clock
+ * @setup: I2C timing setup parameters
+ * @speed: I2C clock frequency of the controller. Standard, Fast or Fast+
+ * @regmap: holds SYSCFG phandle for Fast Mode Plus bit
+ * @regmap_sreg: register address for setting Fast Mode Plus bits
+ * @regmap_creg: register address for clearing Fast Mode Plus bits
+ * @regmap_mask: mask for Fast Mode Plus bits
+ */
 struct stm32_i2c_priv {
 	struct stm32_i2c_regs *regs;
 	struct clk clk;
 	struct stm32_i2c_setup *setup;
 	u32 speed;
+	struct regmap *regmap;
+	u32 regmap_sreg;
+	u32 regmap_creg;
+	u32 regmap_mask;
 };
 
 static const struct stm32_i2c_spec i2c_specs[] = {
@@ -237,6 +256,14 @@ static const struct stm32_i2c_setup stm32f7_setup = {
 	.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE,
 };
 
+static const struct stm32_i2c_setup stm32mp15_setup = {
+	.rise_time = STM32_I2C_RISE_TIME_DEFAULT,
+	.fall_time = STM32_I2C_FALL_TIME_DEFAULT,
+	.dnf = STM32_I2C_DNF_DEFAULT,
+	.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE,
+	.fmp_clr_offset = 0x40,
+};
+
 static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
 {
 	struct stm32_i2c_regs *regs = i2c_priv->regs;
@@ -761,6 +788,29 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 	return 0;
 }
 
+static int stm32_i2c_write_fm_plus_bits(struct stm32_i2c_priv *i2c_priv)
+{
+	int ret;
+	bool enable = i2c_priv->speed > I2C_SPEED_FAST_RATE;
+
+	/* Optional */
+	if (IS_ERR_OR_NULL(i2c_priv->regmap))
+		return 0;
+
+	if (i2c_priv->regmap_sreg == i2c_priv->regmap_creg)
+		ret = regmap_update_bits(i2c_priv->regmap,
+					 i2c_priv->regmap_sreg,
+					 i2c_priv->regmap_mask,
+					 enable ? i2c_priv->regmap_mask : 0);
+	else
+		ret = regmap_write(i2c_priv->regmap,
+				   enable ? i2c_priv->regmap_sreg :
+					    i2c_priv->regmap_creg,
+				   i2c_priv->regmap_mask);
+
+	return ret;
+}
+
 static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
 {
 	struct stm32_i2c_regs *regs = i2c_priv->regs;
@@ -775,6 +825,11 @@ static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
 	/* Disable I2C */
 	clrbits_le32(&regs->cr1, STM32_I2C_CR1_PE);
 
+	/* Setup Fast mode plus if necessary */
+	ret = stm32_i2c_write_fm_plus_bits(i2c_priv);
+	if (ret)
+		return ret;
+
 	/* Timing settings */
 	timing |= STM32_I2C_TIMINGR_PRESC(t.presc);
 	timing |= STM32_I2C_TIMINGR_SCLDEL(t.scldel);
@@ -850,6 +905,7 @@ static int stm32_ofdata_to_platdata(struct udevice *dev)
 {
 	struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
 	u32 rise_time, fall_time;
+	int ret;
 
 	i2c_priv->setup = (struct stm32_i2c_setup *)dev_get_driver_data(dev);
 	if (!i2c_priv->setup)
@@ -863,6 +919,22 @@ static int stm32_ofdata_to_platdata(struct udevice *dev)
 	if (fall_time)
 		i2c_priv->setup->fall_time = fall_time;
 
+	/* Optional */
+	i2c_priv->regmap = syscon_regmap_lookup_by_phandle(dev,
+							   "st,syscfg-fmp");
+	if (!IS_ERR(i2c_priv->regmap)) {
+		u32 fmp[3];
+
+		ret = dev_read_u32_array(dev, "st,syscfg-fmp", fmp, 3);
+		if (ret)
+			return ret;
+
+		i2c_priv->regmap_sreg = fmp[1];
+		i2c_priv->regmap_creg = fmp[1] +
+					i2c_priv->setup->fmp_clr_offset;
+		i2c_priv->regmap_mask = fmp[2];
+	}
+
 	return 0;
 }
 
@@ -873,7 +945,7 @@ static const struct dm_i2c_ops stm32_i2c_ops = {
 
 static const struct udevice_id stm32_i2c_of_match[] = {
 	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_setup },
-	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32f7_setup },
+	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32mp15_setup },
 	{}
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
