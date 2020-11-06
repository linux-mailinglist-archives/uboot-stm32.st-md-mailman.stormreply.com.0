Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A91932A9B74
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FAEC36B36;
	Fri,  6 Nov 2020 18:02:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0241C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwGRo022715; Fri, 6 Nov 2020 19:02:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=7QBakP+9VC3xf3dO9UseWoQJnmq8D/wSrwPjvnIy7L0=;
 b=TntSkVI+RC57/9FqzGtHB268AuwQdITUuv8d/Sg0B+gpeVxmPveAkZtNckyk9BUL8zgV
 Zh4ysD72ktm2+vDwpT45y6/FRXSo6t6inkfR0FJKpvaf9DqKviRdUuz/dLEwSTVaCEgl
 Id1Ky72RDWycS5FbZX0Ba1oTX8VTLekJVQm2buZxfONZptWXgvXBjs6LAr5QAq0p9jrF
 W7AKh9Z4jpi/wNxuP19etq4LnkhIHkZCiUY7Evjbry4fv34/H8ZthYa3JM8/MAlO0Kad
 I7tN8jVNmEHxUnsb/W95d2jvYcFmZp4YZCA7o9Gt869+nLFJpBkM/RZ2gg4qpL3dolWs WA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF9CA10002A;
 Fri,  6 Nov 2020 19:02:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E851B24C7A5;
 Fri,  6 Nov 2020 19:02:35 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:35
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:46 +0100
Message-ID: <20201106180201.31784-19-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: [Uboot-stm32] [PATCH v2 18/33] clk: clk_stm32f: migrate trace to
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

 drivers/clk/clk_stm32f.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk_stm32f.c b/drivers/clk/clk_stm32f.c
index 93722f74ae..cd1b8fe0da 100644
--- a/drivers/clk/clk_stm32f.c
+++ b/drivers/clk/clk_stm32f.c
@@ -4,18 +4,19 @@
  * Author(s): Vikas Manocha, <vikas.manocha@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_CLK
+
 #include <common.h>
 #include <clk-uclass.h>
 #include <dm.h>
 #include <log.h>
 #include <stm32_rcc.h>
-#include <linux/bitops.h>
-
 #include <asm/io.h>
 #include <asm/arch/stm32.h>
 #include <asm/arch/stm32_pwr.h>
-
+#include <dm/device_compat.h>
 #include <dt-bindings/mfd/stm32f7-rcc.h>
+#include <linux/bitops.h>
 
 #define RCC_CR_HSION			BIT(0)
 #define RCC_CR_HSEON			BIT(16)
@@ -309,7 +310,7 @@ static unsigned long stm32_clk_get_pllsai_rate(struct stm32_clk *priv,
 				  >> RCC_PLLSAICFGR_PLLSAIR_SHIFT;
 		break;
 	default:
-		pr_err("incorrect PLLSAI output %d\n", output);
+		log_err("incorrect PLLSAI output %d\n", output);
 		return -EINVAL;
 	}
 
@@ -490,7 +491,7 @@ static ulong stm32_clk_get_rate(struct clk *clk)
 		return (sysclk >> stm32_get_apb_shift(regs, APB2));
 
 	default:
-		pr_err("clock index %ld out of range\n", clk->id);
+		dev_err(clk->dev, "clock index %ld out of range\n", clk->id);
 		return -EINVAL;
 	}
 }
@@ -509,8 +510,9 @@ static ulong stm32_set_rate(struct clk *clk, ulong rate)
 
 	/* Only set_rate for LTDC clock is implemented */
 	if (clk->id != STM32F7_APB2_CLOCK(LTDC)) {
-		pr_err("set_rate not implemented for clock index %ld\n",
-		       clk->id);
+		dev_err(clk->dev,
+			"set_rate not implemented for clock index %ld\n",
+			clk->id);
 		return 0;
 	}
 
@@ -604,8 +606,8 @@ static int stm32_clk_enable(struct clk *clk)
 	u32 offset = clk->id / 32;
 	u32 bit_index = clk->id % 32;
 
-	debug("%s: clkid = %ld, offset from AHB1ENR is %d, bit_index = %d\n",
-	      __func__, clk->id, offset, bit_index);
+	dev_dbg(clk->dev, "clkid = %ld, offset from AHB1ENR is %d, bit_index = %d\n",
+		clk->id, offset, bit_index);
 	setbits_le32(&regs->ahb1enr + offset, BIT(bit_index));
 
 	return 0;
@@ -618,7 +620,7 @@ static int stm32_clk_probe(struct udevice *dev)
 	struct clk clk;
 	int err;
 
-	debug("%s\n", __func__);
+	dev_dbg(dev, "%s\n", __func__);
 
 	struct stm32_clk *priv = dev_get_priv(dev);
 	fdt_addr_t addr;
@@ -652,14 +654,14 @@ static int stm32_clk_probe(struct udevice *dev)
 					&fixed_clock_dev);
 
 	if (err) {
-		pr_err("Can't find fixed clock (%d)", err);
+		dev_err(dev, "Can't find fixed clock (%d)", err);
 		return err;
 	}
 
 	err = clk_request(fixed_clock_dev, &clk);
 	if (err) {
-		pr_err("Can't request %s clk (%d)", fixed_clock_dev->name,
-		       err);
+		dev_err(dev, "Can't request %s clk (%d)",
+			fixed_clock_dev->name, err);
 		return err;
 	}
 
@@ -673,8 +675,8 @@ static int stm32_clk_probe(struct udevice *dev)
 	priv->hse_rate = clk_get_rate(&clk);
 
 	if (priv->hse_rate < 1000000) {
-		pr_err("%s: unexpected HSE clock rate = %ld \"n", __func__,
-		       priv->hse_rate);
+		dev_err(dev, "unexpected HSE clock rate = %ld \"n",
+			priv->hse_rate);
 		return -EINVAL;
 	}
 
@@ -684,8 +686,7 @@ static int stm32_clk_probe(struct udevice *dev)
 		err = dev_read_phandle_with_args(dev, "st,syscfg", NULL, 0, 0,
 						 &args);
 		if (err) {
-			debug("%s: can't find syscon device (%d)\n", __func__,
-			      err);
+			dev_err(dev, "can't find syscon device (%d)\n", err);
 			return err;
 		}
 
@@ -699,10 +700,10 @@ static int stm32_clk_probe(struct udevice *dev)
 
 static int stm32_clk_of_xlate(struct clk *clk, struct ofnode_phandle_args *args)
 {
-	debug("%s(clk=%p)\n", __func__, clk);
+	dev_dbg(clk->dev, "clk=%p\n", clk);
 
 	if (args->args_count != 2) {
-		debug("Invaild args_count: %d\n", args->args_count);
+		dev_dbg(clk->dev, "Invaild args_count: %d\n", args->args_count);
 		return -EINVAL;
 	}
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
