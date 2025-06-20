Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2BEAE1F7E
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 Jun 2025 17:54:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F69C3F933;
	Fri, 20 Jun 2025 15:54:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76BF6C3F932
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Jun 2025 15:54:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KD6Vdg008345;
 Fri, 20 Jun 2025 17:54:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 WEli/A4Q3I6u2EDJ86EAfYm6EusmxuNZkUrVUW6oVlc=; b=p3qbk4XroWlsP43J
 CNRiZKD4dvGlaKDfcNutGDfZs8bxkDoYJg6P5F5d2s8EW/jB1hmHkkx+csk5oI+a
 V61bLHlYjaW6Bk00GegLMI3lDxi7gnkWDusD5MXnfHuR3do9hw+dmw5piDpIgBgu
 GE+t6Luu1mIYd91OktkqLzH6AI6N45Z7LbYXBdzH26R/FKxzT9HWBe0ejnVTPM+t
 u2aZLiYBp5yCnpQysBVYowzJKTUQ2c8IfcMM9HaAM29rTnngbZQhzAY7yEpCEnRP
 w+wrmK/IIyjmE8GgMTGKiQf5XdKHeItxzyiVnfq+KnXIdsLckWojCldOuZLEZOEf
 yOkPmQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x7af64d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jun 2025 17:54:49 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0EEC24007F;
 Fri, 20 Jun 2025 17:54:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 669E7B2970C;
 Fri, 20 Jun 2025 17:51:15 +0200 (CEST)
Received: from localhost (10.48.86.135) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Jun
 2025 17:51:15 +0200
From: Cheick Traore <cheick.traore@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 20 Jun 2025 17:49:58 +0200
Message-ID: <20250620155000.1258718-2-cheick.traore@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250620155000.1258718-1-cheick.traore@foss.st.com>
References: <20250620155000.1258718-1-cheick.traore@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.135]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, Cheick Traore <cheick.traore@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 1/3] arm: stm32mp2: add multifunction timer
	support for stm32mp25
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

Add support for STM32MP25 SoC.
Identification and hardware configuration registers allow to read the
timer version and capabilities (counter width, ...).
So, rework the probe to avoid touching ARR register by simply read the
counter width when available. This may avoid messing with a possibly
running timer.
Also add useful bit fields to stm32-timers header file.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
---

 arch/arm/mach-stm32mp/include/mach/timers.h |  9 ++++++
 arch/arm/mach-stm32mp/timers.c              | 34 ++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/include/mach/timers.h b/arch/arm/mach-stm32mp/include/mach/timers.h
index a84465bb28e..8209dd84911 100644
--- a/arch/arm/mach-stm32mp/include/mach/timers.h
+++ b/arch/arm/mach-stm32mp/include/mach/timers.h
@@ -29,6 +29,10 @@
 #define TIM_DMAR	0x4C	/* DMA register for transfer */
 #define TIM_TISEL	0x68	/* Input Selection         */
 
+#define TIM_HWCFGR2	0x3EC	/* hardware configuration 2 Reg (MP25)	*/
+#define TIM_HWCFGR1	0x3F0	/* hardware configuration 1 Reg (MP25)	*/
+#define TIM_IPIDR	0x3F8	/* IP identification Reg (MP25)		*/
+
 #define TIM_CR1_CEN	BIT(0)	/* Counter Enable	   */
 #define TIM_CR1_ARPE	BIT(7)
 #define TIM_CCER_CCXE	(BIT(0) | BIT(4) | BIT(8) | BIT(12))
@@ -40,11 +44,16 @@
 #define TIM_CCMR_M1	(BIT(6) | BIT(5))  /* Channel PWM Mode 1 */
 #define TIM_BDTR_MOE	BIT(15)	/* Main Output Enable      */
 #define TIM_EGR_UG	BIT(0)	/* Update Generation       */
+#define TIM_HWCFGR2_CNT_WIDTH	GENMASK(15, 8)	/* Counter width */
+#define TIM_HWCFGR1_NB_OF_DT	GENMASK(7, 4)	/* Complementary outputs & dead-time generators */
 
 #define MAX_TIM_PSC		0xFFFF
 
+#define STM32MP25_TIM_IPIDR	0x00120002
+
 struct stm32_timers_plat {
 	void __iomem *base;
+	u32 ipidr;
 };
 
 struct stm32_timers_priv {
diff --git a/arch/arm/mach-stm32mp/timers.c b/arch/arm/mach-stm32mp/timers.c
index a3207895f40..1940ba42f74 100644
--- a/arch/arm/mach-stm32mp/timers.c
+++ b/arch/arm/mach-stm32mp/timers.c
@@ -10,6 +10,7 @@
 #include <asm/io.h>
 #include <asm/arch/timers.h>
 #include <dm/device_compat.h>
+#include <linux/bitfield.h>
 
 static void stm32_timers_get_arr_size(struct udevice *dev)
 {
@@ -29,6 +30,33 @@ static void stm32_timers_get_arr_size(struct udevice *dev)
 	writel(arr, plat->base + TIM_ARR);
 }
 
+static int stm32_timers_probe_hwcfgr(struct udevice *dev)
+{
+	struct stm32_timers_plat *plat = dev_get_plat(dev);
+	struct stm32_timers_priv *priv = dev_get_priv(dev);
+	u32 val;
+
+	if (!plat->ipidr) {
+		/* fallback to legacy method for probing counter width */
+		stm32_timers_get_arr_size(dev);
+		return 0;
+	}
+
+	val = readl(plat->base + TIM_IPIDR);
+	/* Sanity check on IP identification register */
+	if (val != plat->ipidr) {
+		dev_err(dev, "Unexpected identification: %u\n", val);
+		return -EINVAL;
+	}
+
+	val = readl(plat->base + TIM_HWCFGR2);
+	/* Counter width in bits, max reload value is BIT(width) - 1 */
+	priv->max_arr = BIT(FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val)) - 1;
+	dev_dbg(dev, "TIM width: %ld\n", FIELD_GET(TIM_HWCFGR2_CNT_WIDTH, val));
+
+	return 0;
+}
+
 static int stm32_timers_of_to_plat(struct udevice *dev)
 {
 	struct stm32_timers_plat *plat = dev_get_plat(dev);
@@ -38,6 +66,7 @@ static int stm32_timers_of_to_plat(struct udevice *dev)
 		dev_err(dev, "can't get address\n");
 		return -ENOENT;
 	}
+	plat->ipidr = (u32)dev_get_driver_data(dev);
 
 	return 0;
 }
@@ -60,13 +89,16 @@ static int stm32_timers_probe(struct udevice *dev)
 
 	priv->rate = clk_get_rate(&clk);
 
-	stm32_timers_get_arr_size(dev);
+	ret = stm32_timers_probe_hwcfgr(dev);
+	if (ret)
+		clk_disable(&clk);
 
 	return ret;
 }
 
 static const struct udevice_id stm32_timers_ids[] = {
 	{ .compatible = "st,stm32-timers" },
+	{ .compatible = "st,stm32mp25-timers", .data = STM32MP25_TIM_IPIDR },
 	{}
 };
 
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
