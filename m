Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C192A9B76
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 823E9C3FAE2;
	Fri,  6 Nov 2020 18:02:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1750C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwEna022600; Fri, 6 Nov 2020 19:02:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=g+JGRp5gBbqc1Kmn9WihlH0we+vnGu1mlTKPcHGIFJs=;
 b=Fl5ztuTTN8pwwaavM0T14HpSxLQVWaZebJSAKH9WkBpcsY8IdGodDxQbTvcNunC3MxJ7
 1BQ+Ze8/DGTxcH4wGo4/puwzFrLigRRfC7aSqkySHH5/BnXz2hi4Cql1q8I06lQCGwSY
 BBo09k8tObn+o0GFsMSkJ5yXG5eKHSPQlBHPCIodRtArIx/2r3QaFSV6GUatkoA+h/tp
 2t0VkY9X9skvLvvqRPwGbZwSqOZzR1vDFw0XBF8mXDV9PkEp9GIziQoB8/sqAo4kvvEU
 cquPOR7qXP5N2YeMtAhL+uw3wf6GX02D/9JjnL+WhVP+aR0VVDluhp+84hGaXcZ5WuN6 RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:38 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4980100038;
 Fri,  6 Nov 2020 19:02:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDA1B24C7A5;
 Fri,  6 Nov 2020 19:02:37 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:36
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:47 +0100
Message-ID: <20201106180201.31784-20-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v2 19/33] clk: clk_stm32h7: migrate trace to
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

Change debug and pr_ macro to dev macro and define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/clk/clk_stm32h7.c | 70 +++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk_stm32h7.c b/drivers/clk/clk_stm32h7.c
index 5e6abca56f..1a9d3775b4 100644
--- a/drivers/clk/clk_stm32h7.c
+++ b/drivers/clk/clk_stm32h7.c
@@ -4,6 +4,8 @@
  * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
@@ -11,6 +13,7 @@
 #include <regmap.h>
 #include <syscon.h>
 #include <asm/io.h>
+#include <dm/device_compat.h>
 #include <dm/root.h>
 #include <linux/bitops.h>
 
@@ -465,18 +468,18 @@ static ulong stm32_get_rate(struct stm32_rcc_regs *regs, enum pllsrc pllsrc)
 	int ret;
 	const char *name = pllsrc_name[pllsrc];
 
-	debug("%s name %s\n", __func__, name);
+	log_debug("pllsrc name %s\n", name);
 
 	clk.id = 0;
 	ret = uclass_get_device_by_name(UCLASS_CLK, name, &fixed_clock_dev);
 	if (ret) {
-		pr_err("Can't find clk %s (%d)", name, ret);
+		log_err("Can't find clk %s (%d)", name, ret);
 		return 0;
 	}
 
 	ret = clk_request(fixed_clock_dev, &clk);
 	if (ret) {
-		pr_err("Can't request %s clk (%d)", name, ret);
+		log_err("Can't request %s clk (%d)", name, ret);
 		return 0;
 	}
 
@@ -484,8 +487,7 @@ static ulong stm32_get_rate(struct stm32_rcc_regs *regs, enum pllsrc pllsrc)
 	if (pllsrc == HSI)
 		divider = stm32_get_HSI_divider(regs);
 
-	debug("%s divider %d rate %ld\n", __func__,
-	      divider, clk_get_rate(&clk));
+	log_debug("divider %d rate %ld\n", divider, clk_get_rate(&clk));
 
 	return clk_get_rate(&clk) >> divider;
 };
@@ -516,7 +518,7 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
 		break;
 	case RCC_PLLCKSELR_PLLSRC_NO_CLK:
 		/* shouldn't happen */
-		pr_err("wrong value for RCC_PLLCKSELR register\n");
+		log_err("wrong value for RCC_PLLCKSELR register\n");
 		pllsrc = 0;
 		break;
 	}
@@ -546,10 +548,10 @@ static u32 stm32_get_PLL1_rate(struct stm32_rcc_regs *regs,
 	vco = (pllsrc / divm1) * divn1;
 	rate = (pllsrc * fracn1) / (divm1 * 8192);
 
-	debug("%s divm1 = %d divn1 = %d divp1 = %d divq1 = %d divr1 = %d\n",
-	      __func__, divm1, divn1, divp1, divq1, divr1);
-	debug("%s fracn1 = %d vco = %ld rate = %ld\n",
-	      __func__, fracn1, vco, rate);
+	log_debug("divm1 = %d divn1 = %d divp1 = %d divq1 = %d divr1 = %d\n",
+		  divm1, divn1, divp1, divq1, divr1);
+	log_debug("fracn1 = %d vco = %ld rate = %ld\n",
+		  fracn1, vco, rate);
 
 	switch (output) {
 	case PLL1_P_CK:
@@ -610,7 +612,7 @@ u32 psc = stm32_get_apb_psc(regs, apb);
 		case 16:
 			return sysclk / 4;
 		default:
-			pr_err("unexpected prescaler value (%d)\n", psc);
+			log_err("unexpected prescaler value (%d)\n", psc);
 			return 0;
 		}
 	else
@@ -623,7 +625,7 @@ u32 psc = stm32_get_apb_psc(regs, apb);
 		case 16:
 			return sysclk / psc;
 		default:
-			pr_err("unexpected prescaler value (%d)\n", psc);
+			log_err("unexpected prescaler value (%d)\n", psc);
 			return 0;
 		}
 };
@@ -665,8 +667,8 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 	if (!sysclk)
 		return sysclk;
 
-	debug("%s system clock: source = %d freq = %ld\n",
-	      __func__, source, sysclk);
+	dev_dbg(clk->dev, "system clock: source = %d freq = %ld\n",
+		source, sysclk);
 
 	d1cfgr = readl(&regs->d1cfgr);
 
@@ -685,8 +687,8 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 
 	gate_offset = clk_map[clk->id].gate_offset;
 
-	debug("%s clk->id=%ld gate_offset=0x%x sysclk=%ld\n",
-	      __func__, clk->id, gate_offset, sysclk);
+	dev_dbg(clk->dev, "clk->id=%ld gate_offset=0x%x sysclk=%ld\n",
+		clk->id, gate_offset, sysclk);
 
 	switch (gate_offset) {
 	case RCC_AHB3ENR:
@@ -704,8 +706,8 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 			sysclk = sysclk / prescaler_table[idx];
 		}
 
-		debug("%s system clock: freq after APB3 prescaler = %ld\n",
-		      __func__, sysclk);
+		dev_dbg(clk->dev, "system clock: freq after APB3 prescaler = %ld\n",
+			sysclk);
 
 		return sysclk;
 		break;
@@ -719,8 +721,9 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 			sysclk = sysclk / prescaler_table[idx];
 		}
 
-		debug("%s system clock: freq after APB4 prescaler = %ld\n",
-		      __func__, sysclk);
+		dev_dbg(clk->dev,
+			"system clock: freq after APB4 prescaler = %ld\n",
+			sysclk);
 
 		return sysclk;
 		break;
@@ -741,8 +744,9 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 			return stm32_get_timer_rate(priv, sysclk, APB1);
 		}
 
-		debug("%s system clock: freq after APB1 prescaler = %ld\n",
-		      __func__, sysclk);
+		dev_dbg(clk->dev,
+			"system clock: freq after APB1 prescaler = %ld\n",
+			sysclk);
 
 		return (sysclk / stm32_get_apb_psc(regs, APB1));
 		break;
@@ -758,15 +762,17 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 			return stm32_get_timer_rate(priv, sysclk, APB2);
 		}
 
-		debug("%s system clock: freq after APB2 prescaler = %ld\n",
-		      __func__, sysclk);
+		dev_dbg(clk->dev,
+			"system clock: freq after APB2 prescaler = %ld\n",
+			sysclk);
 
 		return (sysclk / stm32_get_apb_psc(regs, APB2));
 
 		break;
 
 	default:
-		pr_err("unexpected gate_offset value (0x%x)\n", gate_offset);
+		dev_err(clk->dev, "unexpected gate_offset value (0x%x)\n",
+			gate_offset);
 		return -EINVAL;
 		break;
 	}
@@ -783,9 +789,9 @@ static int stm32_clk_enable(struct clk *clk)
 	gate_offset = clk_map[clk_id].gate_offset;
 	gate_bit_index = clk_map[clk_id].gate_bit_idx;
 
-	debug("%s: clkid=%ld gate offset=0x%x bit_index=%d name=%s\n",
-	      __func__, clk->id, gate_offset, gate_bit_index,
-	      clk_map[clk_id].name);
+	dev_dbg(clk->dev, "clkid=%ld gate offset=0x%x bit_index=%d name=%s\n",
+		clk->id, gate_offset, gate_bit_index,
+		clk_map[clk_id].name);
 
 	setbits_le32(&regs->cr + (gate_offset / 4), BIT(gate_bit_index));
 
@@ -810,13 +816,13 @@ static int stm32_clk_probe(struct udevice *dev)
 					   "st,syscfg", &syscon);
 
 	if (err) {
-		pr_err("unable to find syscon device\n");
+		dev_err(dev, "unable to find syscon device\n");
 		return err;
 	}
 
 	priv->pwr_regmap = syscon_get_regmap(syscon);
 	if (!priv->pwr_regmap) {
-		pr_err("unable to find regmap\n");
+		dev_err(dev, "unable to find regmap\n");
 		return -ENODEV;
 	}
 
@@ -829,7 +835,7 @@ static int stm32_clk_of_xlate(struct clk *clk,
 			struct ofnode_phandle_args *args)
 {
 	if (args->args_count != 1) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
@@ -852,7 +858,7 @@ static int stm32_clk_of_xlate(struct clk *clk,
 		clk->id = 0;
 	}
 
-	debug("%s clk->id %ld\n", __func__, clk->id);
+	dev_dbg(clk->dev, "clk->id %ld\n", clk->id);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
