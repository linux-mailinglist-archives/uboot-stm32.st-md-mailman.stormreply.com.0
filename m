Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF41B4527
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 14:29:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C03A2C36B12
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Apr 2020 12:29:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F29DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Apr 2020 12:29:30 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03MCCE3K031096; Wed, 22 Apr 2020 14:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=XB2GEVKU/qoT7N5YpBxRe9L2fZygDSTLBBEm9zihygk=;
 b=FXehOwn4k0YQ6xV9f9dagmYmd8D4DWI/oyWr5h3SzysWh7u6IRRWyJMYoDDp++/JsGGN
 +AVRoisEoZmHLGGEy9rCnvVTg9xkJCdFuNX4fPkve2ebvanqInioGfJh/nP/zI+rafxg
 RCpDt6cc6MaqBrNq3MqlHeYXfVnFZvNZizOjRdM9ofoXP7fdCNQVBO+tb8yAx37KVwzY
 4Dn4OmlSa2gkQJhG4ZRHkLtR2FtXMtQ72AXUpxDEBJq8UxwyO/Xk3aYW9Yfj0zZZOmlI
 HBSdrODL6yuoW+ueiYUAhgziA+NDtraD/doNasV86M3XApPCO3AbpA1RIXphQ2hAhfPm GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30fpp8xpxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 14:29:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B7E9710002A;
 Wed, 22 Apr 2020 14:29:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AED642AE6C5;
 Wed, 22 Apr 2020 14:29:28 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 22 Apr 2020 14:29:28 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 22 Apr 2020 14:29:17 +0200
Message-ID: <20200422142834.v2.9.I355ddbc804eba6047ea147d830be57a5b9c4a87e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422122920.19340-1-patrick.delaunay@st.com>
References: <20200422122920.19340-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-22_03:2020-04-22,
 2020-04-22 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 09/12] gpio: stm32: support gpio ops in SPL
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

The GPIO support is needed in SPL to managed the SD cart detect
used on stm32mp157c-ev1 and dk2 board.
So this patch activates the associated code in stm32_gpio.c.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

Changes in v2: None

 drivers/gpio/stm32_gpio.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index f55f834e7d..37a8cfa47a 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -20,7 +20,6 @@
 #define MODE_BITS_MASK			3
 #define BSRR_BIT(gpio_pin, value)	BIT(gpio_pin + (value ? 0 : 16))
 
-#ifndef CONFIG_SPL_BUILD
 /*
  * convert gpio offset to gpio index taking into account gpio holes
  * into gpio bank
@@ -147,7 +146,6 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
 	.set_value		= stm32_gpio_set_value,
 	.get_function		= stm32_gpio_get_function,
 };
-#endif
 
 static int gpio_stm32_probe(struct udevice *dev)
 {
@@ -162,7 +160,6 @@ static int gpio_stm32_probe(struct udevice *dev)
 
 	priv->regs = (struct stm32_gpio_regs *)addr;
 
-#ifndef CONFIG_SPL_BUILD
 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	struct ofnode_phandle_args args;
 	const char *name;
@@ -195,7 +192,7 @@ static int gpio_stm32_probe(struct udevice *dev)
 	dev_dbg(dev, "addr = 0x%p bank_name = %s gpio_count = %d gpio_range = 0x%x\n",
 		(u32 *)priv->regs, uc_priv->bank_name, uc_priv->gpio_count,
 		priv->gpio_range);
-#endif
+
 	ret = clk_get_by_index(dev, 0, &clk);
 	if (ret < 0)
 		return ret;
@@ -215,9 +212,7 @@ U_BOOT_DRIVER(gpio_stm32) = {
 	.name	= "gpio_stm32",
 	.id	= UCLASS_GPIO,
 	.probe	= gpio_stm32_probe,
-#ifndef CONFIG_SPL_BUILD
 	.ops	= &gpio_stm32_ops,
-#endif
 	.flags	= DM_UC_FLAG_SEQ_ALIAS,
 	.priv_auto_alloc_size	= sizeof(struct stm32_gpio_priv),
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
