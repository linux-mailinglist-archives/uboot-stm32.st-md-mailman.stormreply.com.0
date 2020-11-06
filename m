Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA82A9B75
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B357C3FAD5;
	Fri,  6 Nov 2020 18:02:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45609C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwKH0022850; Fri, 6 Nov 2020 19:02:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4QMhh48ojvIjeGcb9BQYrTVxM87F0pT9RJZSOazDCPY=;
 b=lMWU3g0rYdNK22hH6Ty2z5AYA4PXy1ctW91PxXfTr5kBUaGxJHimrgu6RZ8zmUo9q0tc
 4NUQtBrVleR5d/MoDdMuwflHS4/005JYZfgKy7i6pHjdL3xWizzIw7fbkekQCR9IcUW+
 J/pN5PyWwGibHZDjL+++do545ghK3fZsQMUnYmJZ+mbAmHyfeKDyh3KKwTaHscKhmnBl
 zbY7nIVwe2Knggc3zGNhe/oTmVc1UgLFK/0+jfTYFGoi60mUSp7m9zQMaHGd+iO0UIhq
 8qPcjifD4Cq7K6BP2W02uBCZjxMVmFdEsFw4owQODOEQdAETqV6dZuwPyl9aXIHupqsO /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewua8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7E3BE10002A;
 Fri,  6 Nov 2020 19:02:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7751325079D;
 Fri,  6 Nov 2020 19:02:42 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:41
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:50 +0100
Message-ID: <20201106180201.31784-23-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Heiko Schocher <hs@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 22/33] i2c: stm32f7_i2c: migrate trace to
	dev and log macro
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

Change debug to dev_dbg macro and define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/i2c/stm32f7_i2c.c | 74 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 2f60911549..a407cc02ab 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -3,6 +3,8 @@
  * (C) Copyright 2017 STMicroelectronics
  */
 
+#define LOG_CATEGORY UCLASS_I2C
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -11,10 +13,10 @@
 #include <regmap.h>
 #include <reset.h>
 #include <syscon.h>
+#include <dm/device.h>
+#include <dm/device_compat.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
-
-#include <dm/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
 
@@ -346,7 +348,7 @@ static int stm32_i2c_wait_flags(struct stm32_i2c_priv *i2c_priv,
 	*status = readl(&regs->isr);
 	while (!(*status & flags)) {
 		if (get_timer(time_start) > CONFIG_SYS_HZ) {
-			debug("%s: i2c timeout\n", __func__);
+			log_debug("i2c timeout\n");
 			return -ETIMEDOUT;
 		}
 
@@ -369,7 +371,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
 		return ret;
 
 	if (status & STM32_I2C_ISR_BERR) {
-		debug("%s: Bus error\n", __func__);
+		log_debug("Bus error\n");
 
 		/* Clear BERR flag */
 		setbits_le32(&regs->icr, STM32_I2C_ICR_BERRCF);
@@ -378,7 +380,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
 	}
 
 	if (status & STM32_I2C_ISR_ARLO) {
-		debug("%s: Arbitration lost\n", __func__);
+		log_debug("Arbitration lost\n");
 
 		/* Clear ARLO flag */
 		setbits_le32(&regs->icr, STM32_I2C_ICR_ARLOCF);
@@ -387,7 +389,7 @@ static int stm32_i2c_check_end_of_message(struct stm32_i2c_priv *i2c_priv)
 	}
 
 	if (status & STM32_I2C_ISR_NACKF) {
-		debug("%s: Receive NACK\n", __func__);
+		log_debug("Receive NACK\n");
 
 		/* Clear NACK flag */
 		setbits_le32(&regs->icr, STM32_I2C_ICR_NACKCF);
@@ -535,8 +537,8 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
 	if (sdadel_max < 0)
 		sdadel_max = 0;
 
-	debug("%s: SDADEL(min/max): %i/%i, SCLDEL(Min): %i\n", __func__,
-	      sdadel_min, sdadel_max, scldel_min);
+	log_debug("SDADEL(min/max): %i/%i, SCLDEL(Min): %i\n",
+		  sdadel_min, sdadel_max, scldel_min);
 
 	/* Compute possible values for PRESC, SCLDEL and SDADEL */
 	for (p = 0; p < STM32_PRESC_MAX; p++) {
@@ -572,7 +574,7 @@ static int stm32_i2c_compute_solutions(struct stm32_i2c_setup *setup,
 	}
 
 	if (list_empty(solutions)) {
-		pr_err("%s: no Prescaler solution\n", __func__);
+		log_err("no Prescaler solution\n");
 		ret = -EPERM;
 	}
 
@@ -656,7 +658,7 @@ static int stm32_i2c_choose_solution(struct stm32_i2c_setup *setup,
 	}
 
 	if (!sol_found) {
-		pr_err("%s: no solution at all\n", __func__);
+		log_err("no solution at all\n");
 		ret = -EPERM;
 	}
 
@@ -686,23 +688,22 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 
 	specs = get_specs(setup->speed_freq);
 	if (specs == ERR_PTR(-EINVAL)) {
-		pr_err("%s: speed out of bound {%d}\n", __func__,
-		       setup->speed_freq);
+		log_err("speed out of bound {%d}\n",
+			setup->speed_freq);
 		return -EINVAL;
 	}
 
 	if (setup->rise_time > specs->rise_max ||
 	    setup->fall_time > specs->fall_max) {
-		pr_err("%s :timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
-		       __func__,
-		       setup->rise_time, specs->rise_max,
-		       setup->fall_time, specs->fall_max);
+		log_err("timings out of bound Rise{%d>%d}/Fall{%d>%d}\n",
+			setup->rise_time, specs->rise_max,
+			setup->fall_time, specs->fall_max);
 		return -EINVAL;
 	}
 
 	if (setup->dnf > STM32_I2C_DNF_MAX) {
-		pr_err("%s: DNF out of bound %d/%d\n", __func__,
-		       setup->dnf, STM32_I2C_DNF_MAX);
+		log_err("DNF out of bound %d/%d\n",
+			setup->dnf, STM32_I2C_DNF_MAX);
 		return -EINVAL;
 	}
 
@@ -715,10 +716,10 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 	if (ret)
 		goto exit;
 
-	debug("%s: Presc: %i, scldel: %i, sdadel: %i, scll: %i, sclh: %i\n",
-	      __func__, output->presc,
-	      output->scldel, output->sdadel,
-	      output->scll, output->sclh);
+	log_debug("Presc: %i, scldel: %i, sdadel: %i, scll: %i, sclh: %i\n",
+		  output->presc,
+		  output->scldel, output->sdadel,
+		  output->scll, output->sclh);
 
 exit:
 	/* Release list and memory */
@@ -751,20 +752,19 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 	setup->clock_src = clk_get_rate(&i2c_priv->clk);
 
 	if (!setup->clock_src) {
-		pr_err("%s: clock rate is 0\n", __func__);
+		log_err("clock rate is 0\n");
 		return -EINVAL;
 	}
 
 	do {
 		ret = stm32_i2c_compute_timing(i2c_priv, setup, timing);
 		if (ret) {
-			debug("%s: failed to compute I2C timings.\n",
-			      __func__);
+			log_debug("failed to compute I2C timings.\n");
 			if (setup->speed_freq > I2C_SPEED_STANDARD_RATE) {
 				setup->speed_freq =
 					get_lower_rate(setup->speed_freq);
-				debug("%s: downgrade I2C Speed Freq to (%i)\n",
-				      __func__, setup->speed_freq);
+				log_debug("downgrade I2C Speed Freq to (%i)\n",
+					  setup->speed_freq);
 			} else {
 				break;
 			}
@@ -772,16 +772,16 @@ static int stm32_i2c_setup_timing(struct stm32_i2c_priv *i2c_priv,
 	} while (ret);
 
 	if (ret) {
-		pr_err("%s: impossible to compute I2C timings.\n", __func__);
+		log_err("impossible to compute I2C timings.\n");
 		return ret;
 	}
 
-	debug("%s: I2C Freq(%i), Clk Source(%i)\n", __func__,
-	      setup->speed_freq, setup->clock_src);
-	debug("%s: I2C Rise(%i) and Fall(%i) Time\n", __func__,
-	      setup->rise_time, setup->fall_time);
-	debug("%s: I2C Analog Filter(%s), DNF(%i)\n", __func__,
-	      setup->analog_filter ? "On" : "Off", setup->dnf);
+	log_debug("I2C Freq(%i), Clk Source(%i)\n",
+		  setup->speed_freq, setup->clock_src);
+	log_debug("I2C Rise(%i) and Fall(%i) Time\n",
+		  setup->rise_time, setup->fall_time);
+	log_debug("I2C Analog Filter(%s), DNF(%i)\n",
+		  setup->analog_filter ? "On" : "Off", setup->dnf);
 
 	i2c_priv->speed = setup->speed_freq;
 
@@ -848,12 +848,12 @@ static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
 	return 0;
 }
 
-static int stm32_i2c_set_bus_speed(struct udevice *bus, unsigned int speed)
+static int stm32_i2c_set_bus_speed(struct udevice *dev, unsigned int speed)
 {
-	struct stm32_i2c_priv *i2c_priv = dev_get_priv(bus);
+	struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
 
 	if (speed > I2C_SPEED_FAST_PLUS_RATE) {
-		debug("%s: Speed %d not supported\n", __func__, speed);
+		dev_dbg(dev, "Speed %d not supported\n", speed);
 		return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
