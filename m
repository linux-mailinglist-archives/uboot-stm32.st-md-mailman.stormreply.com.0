Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322A29CF4E
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 10:49:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E269C36B0B;
	Wed, 28 Oct 2020 09:49:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62417C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 09:49:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09S9krF6000472; Wed, 28 Oct 2020 10:49:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tDLjCuNQepbOdxg9q2FZ9iqdSsIG2EvhkBtv6YXPW6A=;
 b=bAa9URlD9eujgIgbjNqk9nEebyeZZoN8vyM61tkHNS68LUkvO+++fzjz32+NHqSyzQNU
 02X+4rCY0ytG5df5KI+BqAGPfuRBVPrneEw3gIFEjDFEesx7onUl6HUDFQ4wJW8k8gpn
 gbG6oi1rVRY8VDwZu7KHw22QJrDgd/jp4TFf77qh32+7mJAFBDBoCZs65OOaYBVDSgJ8
 zxrMh+NGdSOCYwBX1faclLecsbzJ5eWIjsSruJmJfZLbbE8JwqLKzFukUrOZ5ZVIzi/B
 YR8Czmu0YbpjBwTZ+tpFCJzK61gnEzxTTV7MHKne19KHJ71SjKchN6svvg1KrxZptUct GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3rd1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 10:49:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E00910002A;
 Wed, 28 Oct 2020 10:49:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 510762A4D63;
 Wed, 28 Oct 2020 10:49:12 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 10:49:11
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 10:49:08 +0100
Message-ID: <20201028094908.11031-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201028094908.11031-1-patrick.delaunay@st.com>
References: <20201028094908.11031-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] gpio: stm32: correct the bias management
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

Use the bias configuration for all the GPIO configurations and not
only for input GPIO, as indicated in Reference manual
(Table 81. Port bit configuration table).

Fixes: 43efbb6a3ebf0223f9eab8d45916f602d876319f ("gpio: stm32: add ops get_dir_flags")
Fixes: f13ff88b61c32ac8f0e9068c41328b265ef619eb ("gpio: stm32: add ops set_dir_flags")
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/gpio/stm32_gpio.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/stm32_gpio.c b/drivers/gpio/stm32_gpio.c
index b885cfb57e..51e1efd701 100644
--- a/drivers/gpio/stm32_gpio.c
+++ b/drivers/gpio/stm32_gpio.c
@@ -212,11 +212,11 @@ static int stm32_gpio_set_dir_flags(struct udevice *dev, unsigned int offset,
 
 	} else if (flags & GPIOD_IS_IN) {
 		stm32_gpio_set_moder(regs, idx, STM32_GPIO_MODE_IN);
-		if (flags & GPIOD_PULL_UP)
-			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
-		else if (flags & GPIOD_PULL_DOWN)
-			stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
 	}
+	if (flags & GPIOD_PULL_UP)
+		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_UP);
+	else if (flags & GPIOD_PULL_DOWN)
+		stm32_gpio_set_pupd(regs, idx, STM32_GPIO_PUPD_DOWN);
 
 	return 0;
 }
@@ -243,16 +243,16 @@ static int stm32_gpio_get_dir_flags(struct udevice *dev, unsigned int offset,
 		break;
 	case STM32_GPIO_MODE_IN:
 		dir_flags |= GPIOD_IS_IN;
-		switch (stm32_gpio_get_pupd(regs, idx)) {
-		case STM32_GPIO_PUPD_UP:
-			dir_flags |= GPIOD_PULL_UP;
-			break;
-		case STM32_GPIO_PUPD_DOWN:
-			dir_flags |= GPIOD_PULL_DOWN;
-			break;
-		default:
-			break;
-		}
+		break;
+	default:
+		break;
+	}
+	switch (stm32_gpio_get_pupd(regs, idx)) {
+	case STM32_GPIO_PUPD_UP:
+		dir_flags |= GPIOD_PULL_UP;
+		break;
+	case STM32_GPIO_PUPD_DOWN:
+		dir_flags |= GPIOD_PULL_DOWN;
 		break;
 	default:
 		break;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
