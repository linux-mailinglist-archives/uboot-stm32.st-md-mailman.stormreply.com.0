Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5D2FF08F
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Jan 2021 17:39:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54638C56630;
	Thu, 21 Jan 2021 16:39:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E8D7C56630
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 16:39:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10LGL6pJ003060; Thu, 21 Jan 2021 17:39:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=mFAQaL4oryY6f4QUsQt6ev4udoUBYNSjett/J6nRpLI=;
 b=VxYb2PdxY33arKQCpJRpaMX67xUGvPD1VihpK79bXZP8uXAcxNtWOTF/8DyzwiwqfYZd
 oGvK+yWS2S26x++34iSyjV/WmFTnt+TDeN0OrvJOvtZmMy/uWDerjj0s1iag5H/0HeIt
 vf5U6DsIaFR6QZSvMP0HB/H0HCc6y2M2QqjuL+uINoJpnf6XVog6ker51BKvuKjZfFa+
 KhQY0ryTGtq13L11dLOJgp6fjGds/UFDWW8iGNBkm2ovyDFINkkvZyuAn1H/MDI3Tn7Q
 /aB8+sUPEfYXOhhbLJJ6B5kSUCZvM/D50lFhxMa2g8ZLH2zcc8Abr+tUbxbl0tXSaeZh ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668p54awm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 17:39:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7FD9D100040;
 Thu, 21 Jan 2021 17:39:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 775C42BA2D2;
 Thu, 21 Jan 2021 17:39:12 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan 2021 17:39:12
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 21 Jan 2021 17:39:07 +0100
Message-ID: <20210121173856.1.Icf7e03823d5975be1d5ec623652c893849882657@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_09:2021-01-21,
 2021-01-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stm32: correct management pin
	display of OTYPE
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

OTYPE can be used for output or for alternate function to select
PP = push-pull or OP = open-drain mode, according reference manual
(Table 81. Port bit configuration table).

This patch removes this indication for input pins and adds it
for AF and output pins for pinmux command output.

Fixes: b305dbc08b08 ("pinctrl: stm32: display bias information for all pins")

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index a1f53a793b..374f76d881 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -56,7 +56,7 @@ static const char * const pinmux_bias[] = {
 	[STM32_GPIO_PUPD_DOWN] = "pull-down",
 };
 
-static const char * const pinmux_input[] = {
+static const char * const pinmux_otype[] = {
 	[STM32_GPIO_OTYPE_PP] = "push-pull",
 	[STM32_GPIO_OTYPE_OD] = "open-drain",
 };
@@ -216,7 +216,7 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		selector, gpio_idx, mode);
 	priv = dev_get_priv(gpio_dev);
 	pupd = (readl(&priv->regs->pupdr) >> (gpio_idx * 2)) & PUPD_MASK;
-
+	otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
 
 	switch (mode) {
 	case GPIOF_UNKNOWN:
@@ -227,18 +227,16 @@ static int stm32_pinctrl_get_pin_muxing(struct udevice *dev,
 		break;
 	case GPIOF_FUNC:
 		af_num = stm32_pinctrl_get_af(gpio_dev, gpio_idx);
-		snprintf(buf, size, "%s %d %s", pinmux_mode[mode], af_num,
-			 pinmux_bias[pupd]);
+		snprintf(buf, size, "%s %d %s %s", pinmux_mode[mode], af_num,
+			 pinmux_otype[otype], pinmux_bias[pupd]);
 		break;
 	case GPIOF_OUTPUT:
-		snprintf(buf, size, "%s %s %s",
-			 pinmux_mode[mode], pinmux_bias[pupd],
-			 label ? label : "");
+		snprintf(buf, size, "%s %s %s %s",
+			 pinmux_mode[mode], pinmux_otype[otype],
+			 pinmux_bias[pupd], label ? label : "");
 		break;
 	case GPIOF_INPUT:
-		otype = (readl(&priv->regs->otyper) >> gpio_idx) & OTYPE_MSK;
-		snprintf(buf, size, "%s %s %s %s",
-			 pinmux_mode[mode], pinmux_input[otype],
+		snprintf(buf, size, "%s %s %s", pinmux_mode[mode],
 			 pinmux_bias[pupd], label ? label : "");
 		break;
 	}
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
