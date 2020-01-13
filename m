Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2FD138F3A
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F12A2C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D66FC36B0F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:33 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASQwJ006869; Mon, 13 Jan 2020 11:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WKkl570VmqJ2IDAnKT3XVrYoCiJ4KHJAka0jjnjHHTQ=;
 b=jIHhwWhXiWDKJBjSClSem1Ad43MlP8lbZas4A3+80ePSabm5KwZhbVu48g7VAIfGip2J
 bCsup+iU2Jn3UfX0kxA4JHrNK6cCdCPnT4mQ6Gy6VUb2ZEwinfPXDs7/zWIiJrKv4X0C
 zx6Qa7O/3r0styU0iDHcCqUMiYjc+dXNi4vVMI3ByqK6laMJEAFDdVNOhjWojQ6Yf3TQ
 7/eL9NeZcXQI0kcdJT+9gQCEhJxMUd9AQI4BFlMuhrV3+jn6dEpdwmAl2ZQHABR8WyY+
 YKE3Vhi2okb4btqa/pewoYUmXJdjMpNVmspxuQq/apUEYNKTcspurMeIRYaGs01uL9P1 Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7jp7hvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B594410003A;
 Mon, 13 Jan 2020 11:35:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9C552A96E8;
 Mon, 13 Jan 2020 11:35:27 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:27 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:08 +0100
Message-ID: <20200113103515.20879-15-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 14/21] gpio: add ops to get dir flags
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

Add the ops for GPIO driver get_dir_flags(), allows to get dynamically
the current gpio configuration; it is used by the API function
dm_gpio_get_dir_flags().

When these optional ops are absent, the gpio uclass continues to use
the mandatory ops (direction_output, direction_input, get_value) and
value of desc->flags to manage only the main dir flags:
- GPIOD_IS_IN
- GPIOD_IS_OUT
- GPIOD_IS_OUT_ACTIVE
- GPIOD_ACTIVE_LOW

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2:
- change the proposed ops for pin config to set_dir_flags/get_dir_flags
- reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
- add a new API dm_gpio_get_dir_flags

 drivers/gpio/gpio-uclass.c | 31 +++++++++++++++++++++++++------
 include/asm-generic/gpio.h | 15 +++++++++++++++
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index e02ef29fed..89af37a4ea 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -613,19 +613,36 @@ int dm_gpio_set_dir(struct gpio_desc *desc)
 
 int dm_gpio_get_dir_flags(struct gpio_desc *desc, ulong *flags)
 {
-	int ret;
+	struct udevice *dev = desc->dev;
+	int ret, value;
+	struct dm_gpio_ops *ops = gpio_get_ops(dev);
 	ulong dir_flags;
 
 	ret = check_reserved(desc, "get_dir_flags");
 	if (ret)
 		return ret;
 
-	dir_flags = desc->flags;
-	/* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
-	dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
-	if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
-		dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	/* GPIOD_ are directly provided by driver except GPIOD_ACTIVE_LOW */
+	if (ops->get_dir_flags) {
+		ret = ops->get_dir_flags(dev, desc->offset, &dir_flags);
+		if (ret)
+			return ret;
 
+		/* GPIOD_ACTIVE_LOW is saved in desc->flags */
+		value = dir_flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
+		if (desc->flags & GPIOD_ACTIVE_LOW)
+			value = !value;
+		dir_flags &= ~(GPIOD_ACTIVE_LOW | GPIOD_IS_OUT_ACTIVE);
+		dir_flags |= (desc->flags & GPIOD_ACTIVE_LOW);
+		if (value)
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	} else {
+		dir_flags = desc->flags;
+		/* only GPIOD_IS_OUT_ACTIVE is provided by uclass */
+		dir_flags &= ~GPIOD_IS_OUT_ACTIVE;
+		if ((desc->flags & GPIOD_IS_OUT) && _gpio_get_value(desc))
+			dir_flags |= GPIOD_IS_OUT_ACTIVE;
+	}
 	*flags = dir_flags;
 
 	return 0;
@@ -1128,6 +1145,8 @@ static int gpio_post_bind(struct udevice *dev)
 			ops->get_function += gd->reloc_off;
 		if (ops->xlate)
 			ops->xlate += gd->reloc_off;
+		if (ops->get_dir_flags)
+			ops->get_dir_flags += gd->reloc_off;
 
 		reloc_done++;
 	}
diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index 4f7b43f163..ac30c3ee4e 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -297,6 +297,21 @@ struct dm_gpio_ops {
 	 */
 	int (*xlate)(struct udevice *dev, struct gpio_desc *desc,
 		     struct ofnode_phandle_args *args);
+
+	/**
+	 * get_dir_flags() - Get GPIO dir flags
+	 *
+	 * This function return the GPIO direction flags used.
+	 *
+	 * This method is optional.
+	 *
+	 * @dev:	GPIO device
+	 * @offset:	GPIO offset within that device
+	 * @flags:	place to put the used direction flags by GPIO
+	 * @return 0 if OK, -ve on error
+	 */
+	int (*get_dir_flags)(struct udevice *dev, unsigned int offset,
+			     ulong *flags);
 };
 
 /**
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
