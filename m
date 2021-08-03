Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4403DEA5E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Aug 2021 12:05:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CEABC5A4D9;
	Tue,  3 Aug 2021 10:05:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93570C597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Aug 2021 10:05:37 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173A3Rin005727; Tue, 3 Aug 2021 12:05:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=5jp8FzYswVNIodIjTlLOgWdUhrQWFt9mAJkUukArYs0=;
 b=rNm8Afvu95elEW3oPQT9WRsj4JHpuqLzuytXuVIAzF79uE9keATYmS7JuIYK0SrNkRaw
 4wQ7dwmgT/WymCXN8syb6YknWw917gzmZEkpbeGx3OYM6lxXTN3ocJZmtLhhceK0VCXs
 GI4F4oJhzbROb6uleaklNZrZ7I3F5OjsUBsoZ/QjS0ISTpU9jVXWkMzc0pmpAXIsjTOf
 +o+X4ef7DTRlnEDQfi2xvY6vSnyzXx75aEDqm6IAnaAFvy/rM6GnrPEhu9ysfhLF7ihJ
 RCD7xdzXF9H/7qMc0Hh25iIsJTJkNIjLcmDrJDxNgUyZATfXZyssWbne8KiULiAJdsgo EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3a73jug22q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:05:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9F7210002A;
 Tue,  3 Aug 2021 12:05:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E023321BF5A;
 Tue,  3 Aug 2021 12:05:35 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 12:05:35
 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Aug 2021 12:05:14 +0200
Message-ID: <20210803100515.29383-7-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803100515.29383-1-patrice.chotard@foss.st.com>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-03,
 2021-08-03 signatures=0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v1 6/7] i2c: stm32f7: add support for DNF
	i2c-digital-filter binding
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

Add the support for the i2c-digital-filter binding, allowing to enable
the digital filter via the device-tree and indicate its value in the DT

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 drivers/i2c/stm32f7_i2c.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 7e6c65fadc..2b2dae67a3 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -107,7 +107,6 @@ struct stm32_i2c_regs {
 
 #define STM32_I2C_MAX_LEN			0xff
 
-#define STM32_I2C_DNF_DEFAULT			0
 #define STM32_I2C_DNF_MAX			15
 
 #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
@@ -204,6 +203,7 @@ struct stm32_i2c_timings {
  * @regmap_sreg: register address for setting Fast Mode Plus bits
  * @regmap_creg: register address for clearing Fast Mode Plus bits
  * @regmap_mask: mask for Fast Mode Plus bits
+ * @dnf_dt: value of digital filter requested via dt
  */
 struct stm32_i2c_priv {
 	struct stm32_i2c_regs *regs;
@@ -214,6 +214,7 @@ struct stm32_i2c_priv {
 	u32 regmap_sreg;
 	u32 regmap_creg;
 	u32 regmap_mask;
+	u32 dnf_dt;
 };
 
 static const struct stm32_i2c_spec i2c_specs[] = {
@@ -684,6 +685,7 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 	const struct stm32_i2c_spec *specs;
 	struct stm32_i2c_timings *v, *_v;
 	struct list_head solutions;
+	u32 i2cclk = DIV_ROUND_CLOSEST(STM32_NSEC_PER_SEC, setup->clock_src);
 	int ret;
 
 	specs = get_specs(setup->speed_freq);
@@ -701,6 +703,8 @@ static int stm32_i2c_compute_timing(struct stm32_i2c_priv *i2c_priv,
 		return -EINVAL;
 	}
 
+	/*  Analog and Digital Filters */
+	setup->dnf = DIV_ROUND_CLOSEST(i2c_priv->dnf_dt, i2cclk);
 	if (setup->dnf > STM32_I2C_DNF_MAX) {
 		log_err("DNF out of bound %d/%d\n",
 			setup->dnf, STM32_I2C_DNF_MAX);
@@ -923,7 +927,10 @@ static int stm32_of_to_plat(struct udevice *dev)
 	fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
 					 STM32_I2C_FALL_TIME_DEFAULT);
 
-	i2c_priv->setup.dnf = STM32_I2C_DNF_DEFAULT;
+	i2c_priv->dnf_dt = dev_read_u32_default(dev, "i2c-digital-filter-width-ns", 0);
+	if (!dev_read_bool(dev, "i2c-digital-filter"))
+		i2c_priv->dnf_dt = 0;
+
 	i2c_priv->setup.analog_filter = dev_read_bool(dev, "i2c-analog-filter");
 
 	/* Optional */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
