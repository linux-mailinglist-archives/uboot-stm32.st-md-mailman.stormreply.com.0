Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E13A17B9DE
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 11:09:22 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E64C36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Mar 2020 10:09:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FE7BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 10:09:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 026A3VP1010338; Fri, 6 Mar 2020 11:09:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sdgmHbMClcGxgkEoB8CbcnXaRon3mpqUI/aLECEpJ6g=;
 b=XOzXgnXngnB0G5QqtN+bq+DA8H3CRhlu8VoqxK1GpFh3C3H4/vtVsSAOp78AOQGNR95D
 VuUnKL0ZazIRkvG4sK1ZMyvfNsoRHu/hBzoBHcThlVIKf+5NFCBOFPy+A1DNBuWTTbI1
 dawGhHEummrOTgTTMuxPCoYSDJBKVwXaCIWClI6abOmBMz7VTwGCBtNleP79oo+gndXP
 W0/4A2flhAlnnmVzg/SW85B8+g0IoHb16uS1+XcFi/itHS4qrghl+NJJCla1o8W2avFn
 87uGXao2OKD0asH0ilRMTOmGduZ8bCPWc0ww/vEHav+222RBYaRU8/lOV3UO3EORHQsD DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfdydevu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Mar 2020 11:09:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0797C100039;
 Fri,  6 Mar 2020 11:09:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F070C2A7161;
 Fri,  6 Mar 2020 11:09:16 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 6 Mar 2020 11:09:16 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Mar 2020 11:09:14 +0100
Message-ID: <20200306100914.9022-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-06_02:2020-03-05,
 2020-03-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Alain Volmat <alain.volmat@st.com>, Heiko Schocher <hs@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] i2c: stm32f7_i2c: allows for any bus frequency
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

From: Alain Volmat <alain.volmat@st.com>

Do not limit to 3 (100KHz, 400KHz, 1MHz) bus frequencies, but
instead allow for any frequency. Depending on the requested
frequency (via the clock-frequency DT entry), use the spec
data from either Standard, Fast or Fast Plus mode.

In order to do so, the driver do not use anymore spec identifier
by directly handle the requested frequency and from it retrieve
the corresponding spec data to be used for the computation
of the timing register.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/i2c/stm32f7_i2c.c | 105 +++++++++++++++++++++-----------------
 1 file changed, 59 insertions(+), 46 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 7d046c1a1e..fc5c1221e1 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -7,10 +7,10 @@
 #include <clk.h>
 #include <dm.h>
 #include <i2c.h>
-#include <malloc.h>
 #include <reset.h>
 
 #include <dm/device.h>
+#include <linux/err.h>
 #include <linux/io.h>
 
 /* STM32 I2C registers */
@@ -145,7 +145,6 @@ struct stm32_i2c_spec {
 
 /**
  * struct stm32_i2c_setup - private I2C timing setup parameters
- * @speed: I2C speed mode (standard, Fast Plus)
  * @speed_freq: I2C speed frequency  (Hz)
  * @clock_src: I2C clock source frequency (Hz)
  * @rise_time: Rise time (ns)
@@ -154,7 +153,6 @@ struct stm32_i2c_spec {
  * @analog_filter: Analog filter delay (On/Off)
  */
 struct stm32_i2c_setup {
-	enum i2c_speed_mode speed;
 	u32 speed_freq;
 	u32 clock_src;
 	u32 rise_time;
@@ -184,10 +182,11 @@ struct stm32_i2c_priv {
 	struct stm32_i2c_regs *regs;
 	struct clk clk;
 	struct stm32_i2c_setup *setup;
-	int speed;
+	u32 speed;
 };
 
 static const struct stm32_i2c_spec i2c_specs[] = {
+	/* Standard speed - 100 KHz */
 	[IC_SPEED_MODE_STANDARD] = {
 		.rate = I2C_SPEED_STANDARD_RATE,
 		.rate_min = 8000,
@@ -200,6 +199,7 @@ static const struct stm32_i2c_spec i2c_specs[] = {
 		.l_min = 4700,
 		.h_min = 4000,
 	},
+	/* Fast speed - 400 KHz */
 	[IC_SPEED_MODE_FAST] = {
 		.rate = I2C_SPEED_FAST_RATE,
 		.rate_min = 320000,
@@ -212,6 +212,7 @@ static const struct stm32_i2c_spec i2c_specs[] = {
 		.l_min = 1300,
 		.h_min = 600,
 	},
+	/* Fast Plus Speed - 1 MHz */
 	[IC_SPEED_MODE_FAST_PLUS] = {
 		.rate = I2C_SPEED_FAST_PLUS_RATE,
 		.rate_min = 800000,
@@ -474,6 +475,7 @@ static int stm32_i2c_xfer(struct udevice *bus, struct i2c_msg *msg,
 }
 
 static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
+				       const struct stm32_i2c_spec *specs,
 				       struct list_head *solutions)
 {
 	struct stm32_i2c_timings *v;
@@ -490,13 +492,13 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
 	af_delay_max = setup->analog_filter ?
 		       STM32_I2C_ANALOG_FILTER_DELAY_MAX : 0;
 
-	sdadel_min = i2c_specs[setup->speed].hddat_min + setup->fall_time -
+	sdadel_min = specs->hddat_min + setup->fall_time -
 		     af_delay_min - (setup->dnf + 3) * i2cclk;
 
-	sdadel_max = i2c_specs[setup->speed].vddat_max - setup->rise_time -
+	sdadel_max = specs->vddat_max - setup->rise_time -
 		     af_delay_max - (setup->dnf + 4) * i2cclk;
 
-	scldel_min = setup->rise_time + i2c_specs[setup->speed].sudat_min;
+	scldel_min = setup->rise_time + specs->sudat_min;
 
 	if (sdadel_min < 0)
 		sdadel_min = 0;
@@ -548,6 +550,7 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
 }
 
 static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
+				     const struct stm32_i2c_spec *specs,
 				     struct list_head *solutions,
 				     struct stm32_i2c_timings *s)
 {
@@ -570,8 +573,8 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 	dnf_delay = setup->dnf * i2cclk;
 
 	tsync = af_delay_min + dnf_delay + (2 * i2cclk);
-	clk_max = STM32_NSEC_PER_SEC / i2c_specs[setup->speed].rate_min;
-	clk_min = STM32_NSEC_PER_SEC / i2c_specs[setup->speed].rate_max;
+	clk_max = STM32_NSEC_PER_SEC / specs->rate_min;
+	clk_min = STM32_NSEC_PER_SEC / specs->rate_max;
 
 	/*
 	 * Among Prescaler possibilities discovered above figures out SCL Low
@@ -589,7 +592,7 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 		for (l = 0; l < STM32_SCLL_MAX; l++) {
 			u32 tscl_l = (l + 1) * prescaler + tsync;
 
-			if ((tscl_l < i2c_specs[setup->speed].l_min) ||
+			if (tscl_l < specs->l_min ||
 			    (i2cclk >=
 			     ((tscl_l - af_delay_min - dnf_delay) / 4))) {
 				continue;
@@ -601,7 +604,7 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 					   setup->rise_time + setup->fall_time;
 
 				if ((tscl >= clk_min) && (tscl <= clk_max) &&
-				    (tscl_h >= i2c_specs[setup->speed].h_min) &&
+				    (tscl_h >= specs->h_min) &&
 				    (i2cclk < tscl_h)) {
 					u32 clk_error;
 
@@ -630,26 +633,40 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 	return ret;
 }
 
+static const struct stm32_i2c_spec *get_specs(u32 rate)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(i2c_specs); i++)
+		if (rate <= i2c_specs[i].rate)
+			return &i2c_specs[i];
+
+	/* NOT REACHED */
+	return ERR_PTR(-EINVAL);
+}
+
 static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 				    struct stm32_i2c_setup *setup,
 				    struct stm32_i2c_timings *output)
 {
+	const struct stm32_i2c_spec *specs;
 	struct stm32_i2c_timings *v, *_v;
 	struct list_head solutions;
 	int ret;
 
-	if (setup->speed >= ARRAY_SIZE(i2c_specs)) {
-		pr_err("%s: speed out of bound {%d/%d}\n", __func__,
-		       setup->speed, ARRAY_SIZE(i2c_specs) - 1);
+	specs = get_specs(setup->speed_freq);
+	if (specs == ERR_PTR(-EINVAL)) {
+		pr_err("%s: speed out of bound {%d}\n", __func__,
+		       setup->speed_freq);
 		return -EINVAL;
 	}
 
-	if ((setup->rise_time > i2c_specs[setup->speed].rise_max) ||
-	    (setup->fall_time > i2c_specs[setup->speed].fall_max)) {
+	if (setup->rise_time > specs->rise_max ||
+	    setup->fall_time > specs->fall_max) {
 		pr_err("%s :timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
 		       __func__,
-		       setup->rise_time, i2c_specs[setup->speed].rise_max,
-		       setup->fall_time, i2c_specs[setup->speed].fall_max);
+		       setup->rise_time, specs->rise_max,
+		       setup->fall_time, specs->fall_max);
 		return -EINVAL;
 	}
 
@@ -659,18 +676,12 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 		return -EINVAL;
 	}
 
-	if (setup->speed_freq > i2c_specs[setup->speed].rate) {
-		pr_err("%s: Freq {%d/%d}\n", __func__,
-		       setup->speed_freq, i2c_specs[setup->speed].rate);
-		return -EINVAL;
-	}
-
 	INIT_LIST_HEAD(&solutions);
-	ret = stm32_i2c_compute_solutions(setup, &solutions);
+	ret = stm32_i2c_compute_solutions(setup, specs, &solutions);
 	if (ret)
 		goto exit;
 
-	ret = stm32_i2c_choose_solution(setup, &solutions, output);
+	ret = stm32_i2c_choose_solution(setup, specs, &solutions, output);
 	if (ret)
 		goto exit;
 
@@ -689,14 +700,24 @@ exit:
 	return ret;
 }
 
+static u32 get_lower_rate(u32 rate)
+{
+	int i;
+
+	for (i = ARRAY_SIZE(i2c_specs) - 1; i >= 0; i--)
+		if (rate > i2c_specs[i].rate)
+			return i2c_specs[i].rate;
+
+	return i2c_specs[0].rate;
+}
+
 static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 				  struct stm32_i2c_timings *timing)
 {
 	struct stm32_i2c_setup *setup = i2c_priv->setup;
 	int ret = 0;
 
-	setup->speed = i2c_priv->speed;
-	setup->speed_freq = i2c_specs[setup->speed].rate;
+	setup->speed_freq = i2c_priv->speed;
 	setup->clock_src = clk_get_rate(&i2c_priv->clk);
 
 	if (!setup->clock_src) {
@@ -709,13 +730,11 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 		if (ret) {
 			debug("%s: failed to compute I2C timings.\n",
 			      __func__);
-			if (i2c_priv->speed > IC_SPEED_MODE_STANDARD) {
-				i2c_priv->speed--;
-				setup->speed = i2c_priv->speed;
+			if (setup->speed_freq > I2C_SPEED_STANDARD_RATE) {
 				setup->speed_freq =
-					i2c_specs[setup->speed].rate;
+					get_lower_rate(setup->speed_freq);
 				debug("%s: downgrade I2C Speed Freq to (%i)\n",
-				      __func__, i2c_specs[setup->speed].rate);
+				      __func__, setup->speed_freq);
 			} else {
 				break;
 			}
@@ -727,13 +746,15 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 		return ret;
 	}
 
-	debug("%s: I2C Speed(%i), Freq(%i), Clk Source(%i)\n", __func__,
-	      setup->speed, setup->speed_freq, setup->clock_src);
+	debug("%s: I2C Freq(%i), Clk Source(%i)\n", __func__,
+	      setup->speed_freq, setup->clock_src);
 	debug("%s: I2C Rise(%i) and Fall(%i) Time\n", __func__,
 	      setup->rise_time, setup->fall_time);
 	debug("%s: I2C Analog Filter(%s), DNF(%i)\n", __func__,
 	      setup->analog_filter ? "On" : "Off", setup->dnf);
 
+	i2c_priv->speed = setup->speed_freq;
+
 	return 0;
 }
 
@@ -773,21 +794,13 @@ static int stm32_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
 {
 	struct stm32_i2c_priv *i2c_priv = dev_get_priv(bus);
 
-	switch (speed) {
-	case I2C_SPEED_STANDARD_RATE:
-		i2c_priv->speed = IC_SPEED_MODE_STANDARD;
-		break;
-	case I2C_SPEED_FAST_RATE:
-		i2c_priv->speed = IC_SPEED_MODE_FAST;
-		break;
-	case I2C_SPEED_FAST_PLUS_RATE:
-		i2c_priv->speed = IC_SPEED_MODE_FAST_PLUS;
-		break;
-	default:
+	if (speed > I2C_SPEED_FAST_PLUS_RATE) {
 		debug("%s: Speed %d not supported\n", __func__, speed);
 		return -EINVAL;
 	}
 
+	i2c_priv->speed = speed;
+
 	return stm32_i2c_hw_config(i2c_priv);
 }
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
