Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 123713DEA60
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79D2EC5A4DB;
	Tue,  3 Aug 2021 10:05:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CFDDC5A4D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173A3R5x005781; Tue, 3 Aug 2021 12:05:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=Zx89xSz6I5DrVp592+fqV+X5R+Ov3xiG91ku4Dpu1bI=;
 b=jgQBiDLcJUAtHnMgyOFnlN3FcDrYKDrAXlV42mq5/fY6Lnp1Ek1TdhLKYeMLzOCxfeqH
 BAVuQCdvhgpwImXW31/E7vbqaj4u7wHrPNh7N8yKB7UXFVa0xj6NoGOVe36A6ocHW7b6
 xLU9/4BVWQxIVWzwZ583FAboUlizgWNcDAu1na/jFUEKEc1Y+gQuGClTI2ajG9YhWjSL
 iWSjlb/8KfbjDv/GGmCnu5fcxS0ihIdCZbipTplV/UoWVHGiKEuC3pd2H2YZLn3e/nyM
 lFL2zoVoyEGR9ggxgdZ7mYFSj/MXc1FJGqrETkJ4F9kVUSgYZkWZ79JDkod2OnPmYDn5 zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a73jug22j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F343100034;
 Tue,  3 Aug 2021 12:05:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93BDF21BF5A;
 Tue,  3 Aug 2021 12:05:32 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:32
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:09 +0200
Message-ID: <20210803100515.29383-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803100515.29383-1-patrice.chotard@foss.st.com>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v1 1/7] i2c: stm32f7: move driver data of each
	instance in a privdata
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

From: Patrick Delaunay <patrick.delaunay@foss.st.com>

Today all the I2C instance point on the same global
variable stm32_i2c_setup according the compatible: i2c_priv->setup =
pointer to the same driver data.

This patch changes this driver data (stm32f7_setup and stm32mp15_setup)
to a const struct and move the timing struct 'setup' as element of i2c
privdata, initialized in stm32_ofdata_to_platdata() with the driver
configuration data.

This patch solves issues when several I2C instance have not the same
clock source or not the same configuration: each timing setup is saved
is the I2C privdata.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/i2c/stm32f7_i2c.c | 53 ++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 7b04a09de0..b449084b5f 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -158,7 +158,6 @@ struct stm32_i2c_spec {
  * @fall_time: Fall time (ns)
  * @dnf: Digital filter coefficient (0-16)
  * @analog_filter: Analog filter delay (On/Off)
- * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
  */
 struct stm32_i2c_setup {
 	u32 speed_freq;
@@ -167,6 +166,13 @@ struct stm32_i2c_setup {
 	u32 fall_time;
 	u8 dnf;
 	bool analog_filter;
+};
+
+/**
+ * struct stm32_i2c_data - driver data for I2C configuration by compatible
+ * @fmp_clr_offset: Fast Mode Plus clear register offset from set register
+ */
+struct stm32_i2c_data {
 	u32 fmp_clr_offset;
 };
 
@@ -201,7 +207,7 @@ struct stm32_i2c_timings {
 struct stm32_i2c_priv {
 	struct stm32_i2c_regs *regs;
 	struct clk clk;
-	struct stm32_i2c_setup *setup;
+	struct stm32_i2c_setup setup;
 	u32 speed;
 	struct regmap *regmap;
 	u32 regmap_sreg;
@@ -251,18 +257,11 @@ static const struct stm32_i2c_spec i2c_specs[] = {
 	},
 };
 
-static const struct stm32_i2c_setup stm32f7_setup = {
-	.rise_time = STM32_I2C_RISE_TIME_DEFAULT,
-	.fall_time = STM32_I2C_FALL_TIME_DEFAULT,
-	.dnf = STM32_I2C_DNF_DEFAULT,
-	.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE,
+static const struct stm32_i2c_data stm32f7_data = {
+	.fmp_clr_offset = 0x00,
 };
 
-static const struct stm32_i2c_setup stm32mp15_setup = {
-	.rise_time = STM32_I2C_RISE_TIME_DEFAULT,
-	.fall_time = STM32_I2C_FALL_TIME_DEFAULT,
-	.dnf = STM32_I2C_DNF_DEFAULT,
-	.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE,
+static const struct stm32_i2c_data stm32mp15_data = {
 	.fmp_clr_offset = 0x40,
 };
 
@@ -745,7 +744,7 @@ static u32 get_lower_rate(u32 rate)
 static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 				  struct stm32_i2c_timings *timing)
 {
-	struct stm32_i2c_setup *setup = i2c_priv->setup;
+	struct stm32_i2c_setup *setup = &i2c_priv->setup;
 	int ret = 0;
 
 	setup->speed_freq = i2c_priv->speed;
@@ -839,10 +838,11 @@ static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
 	writel(timing, &regs->timingr);
 
 	/* Enable I2C */
-	if (i2c_priv->setup->analog_filter)
+	if (i2c_priv->setup.analog_filter)
 		clrbits_le32(&regs->cr1, STM32_I2C_CR1_ANFOFF);
 	else
 		setbits_le32(&regs->cr1, STM32_I2C_CR1_ANFOFF);
+
 	setbits_le32(&regs->cr1, STM32_I2C_CR1_PE);
 
 	return 0;
@@ -903,21 +903,23 @@ clk_free:
 
 static int stm32_of_to_plat(struct udevice *dev)
 {
+	const struct stm32_i2c_data *data;
 	struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
 	u32 rise_time, fall_time;
 	int ret;
 
-	i2c_priv->setup = (struct stm32_i2c_setup *)dev_get_driver_data(dev);
-	if (!i2c_priv->setup)
+	data = (const struct stm32_i2c_data *)dev_get_driver_data(dev);
+	if (!data)
 		return -EINVAL;
 
-	rise_time = dev_read_u32_default(dev, "i2c-scl-rising-time-ns", 0);
-	if (rise_time)
-		i2c_priv->setup->rise_time = rise_time;
+	rise_time = dev_read_u32_default(dev, "i2c-scl-rising-time-ns",
+					 STM32_I2C_RISE_TIME_DEFAULT);
+
+	fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
+					 STM32_I2C_FALL_TIME_DEFAULT);
 
-	fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns", 0);
-	if (fall_time)
-		i2c_priv->setup->fall_time = fall_time;
+	i2c_priv->setup.dnf = STM32_I2C_DNF_DEFAULT;
+	i2c_priv->setup.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE;
 
 	/* Optional */
 	i2c_priv->regmap = syscon_regmap_lookup_by_phandle(dev,
@@ -930,8 +932,7 @@ static int stm32_of_to_plat(struct udevice *dev)
 			return ret;
 
 		i2c_priv->regmap_sreg = fmp[1];
-		i2c_priv->regmap_creg = fmp[1] +
-					i2c_priv->setup->fmp_clr_offset;
+		i2c_priv->regmap_creg = fmp[1] + data->fmp_clr_offset;
 		i2c_priv->regmap_mask = fmp[2];
 	}
 
@@ -944,8 +945,8 @@ static const struct dm_i2c_ops stm32_i2c_ops = {
 };
 
 static const struct udevice_id stm32_i2c_of_match[] = {
-	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_setup },
-	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32mp15_setup },
+	{ .compatible = "st,stm32f7-i2c", .data = (ulong)&stm32f7_data },
+	{ .compatible = "st,stm32mp15-i2c", .data = (ulong)&stm32mp15_data },
 	{}
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
