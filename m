Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED955138F36
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B85C8C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 250ECC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DAScHK021535; Mon, 13 Jan 2020 11:35:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FbsduBUcIfWxi4dQ+qz47cSsoPnuds7zfy8j9iGhjHs=;
 b=ne/e0KwgBnTlKpuTQRYbSmHj8mQHNEO/8RxRffCGb9YVp0wAD0cJbUls9TT+D1lAtgAZ
 0OHUSjf/FP5+6IeD6UhTjdtElvIyuf+ypRRFMUCDczK5+RlAHHrkoHV5ILyClzm0dSm8
 TndLmNS82exq0USklp/WUhqTMb6gHfh1AU6G3QEEWYhVFxw4koVdPpI0LjF+Fd/lGVKD
 lSoUNjkpWbvKJBToDJv3M3aNCgPP+y7UmxabR3YhTd35hH24RmzoaG227wRJbuJ+67ly
 vVNlGuDpwugtTLwAooYUXsglwVvpOd+72AhK93/xlbda2qNwtBlnnqm+W6l4ANwwdyQW 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78ryk8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20C4110002A;
 Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 16ABB2A96E8;
 Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:23 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:03 +0100
Message-ID: <20200113103515.20879-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 09/21] gpio: add function
	_dm_gpio_set_dir_flags
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

Introduce the function _dm_gpio_set_dir_flags to set dir flags
without check if the GPIO is reserved.

Separate the reserved check for "set_dir" and "set_dir_flags".

This patch is a preliminary step to add new ops.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index bdf7f5bb4e..94e90cb8ac 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -510,15 +510,11 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value)
 	return 0;
 }
 
-int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
+static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
 	struct dm_gpio_ops *ops = gpio_get_ops(dev);
-	int ret;
-
-	ret = check_reserved(desc, "set_dir");
-	if (ret)
-		return ret;
+	int ret = 0;
 
 	if (flags & GPIOD_IS_OUT) {
 		int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
@@ -529,20 +525,36 @@ int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 	} else  if (flags & GPIOD_IS_IN) {
 		ret = ops->direction_input(dev, desc->offset);
 	}
+
+	return ret;
+}
+
+int dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
+{
+	int ret;
+
+	ret = check_reserved(desc, "set_dir_flags");
 	if (ret)
 		return ret;
-	/*
-	 * Update desc->flags here, so that GPIO_ACTIVE_LOW is honoured in
-	 * futures
-	 */
-	desc->flags = flags;
 
-	return 0;
+	ret = _dm_gpio_set_dir_flags(desc, flags);
+
+	/* update the descriptor flags */
+	if (ret)
+		desc->flags = flags;
+
+	return ret;
 }
 
 int dm_gpio_set_dir(struct gpio_desc *desc)
 {
-	return dm_gpio_set_dir_flags(desc, desc->flags);
+	int ret;
+
+	ret = check_reserved(desc, "set_dir");
+	if (ret)
+		return ret;
+
+	return _dm_gpio_set_dir_flags(desc, desc->flags);
 }
 
 /**
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
