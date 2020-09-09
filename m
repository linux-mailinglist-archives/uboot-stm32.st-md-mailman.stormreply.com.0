Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B082631D8
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 18:28:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FED0C3FAE2
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 16:28:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 859B2C3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 16:28:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089GMmR6006023; Wed, 9 Sep 2020 18:28:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fBLmetcYVrVqc0Xo3G+tyHSHiM09aHoZ+3pSslnsMbo=;
 b=HhBZptOnF5NhxJvAu1yKUaVy4jMEFPneAK/SGy6czr5FrUbpQTTwHBQeE4zXyeRt79H3
 8lFC5wBVSqNVLUDBjRVnSruYRvHQ9/xZXoTyP0M8D3AdDTSyiIscDrQOs3xFeGtoek96
 /TEvc1PjtQQeJI9t143jF5aeoaPopKlWSWoCjV88XlO7eTLxboNpaMt27jz+xB02NmfE
 ZSxybTs90EBzrRvumyHHbG/g9UkLFfflmihAeQ3T3YKnhtCNFA93Eqkcxs4Yk9hOryAj
 ouf6hcquwpp/nl7NRTGrC7QHAMyhqkSWgmr5l7caDABscALX2NfqJGiR9+8SPWBdr47M aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051e7ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 18:28:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EEA9710002A;
 Wed,  9 Sep 2020 18:28:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5DA72C38A9;
 Wed,  9 Sep 2020 18:28:37 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 18:28:37 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 18:28:33 +0200
Message-ID: <20200909162834.31860-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_12:2020-09-09,
 2020-09-09 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] gpio: stm32: cosmetic: cleanup
	gpio_stm32_probe
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

Move the variables definition at the beggining of the function
gpio_stm32_probe().

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/stm32_gpio.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index 5bff27f75b..aa70b1d2a9 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -273,9 +273,12 @@ static const struct dm_gpio_ops gpio_stm32_ops = {
 static int gpio_stm32_probe(struct udevice *dev)
 {
 	struct stm32_gpio_priv *priv = dev_get_priv(dev);
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
+	struct ofnode_phandle_args args;
+	const char *name;
 	struct clk clk;
 	fdt_addr_t addr;
-	int ret;
+	int ret, i;
 
 	addr = dev_read_addr(dev);
 	if (addr == FDT_ADDR_T_NONE)
@@ -283,11 +286,6 @@ static int gpio_stm32_probe(struct udevice *dev)
 
 	priv->regs = (struct stm32_gpio_regs *)addr;
 
-	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
-	struct ofnode_phandle_args args;
-	const char *name;
-	int i;
-
 	name = dev_read_string(dev, "st,bank-name");
 	if (!name)
 		return -EINVAL;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
