Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5C138F38
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E063BC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC5CBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASf72024496; Mon, 13 Jan 2020 11:35:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=u4EjHP4UZBW7a2s8iQCmQklD1kf5GCd+dlKV4OuINJI=;
 b=BwHqZPDeqLWfuYBde26pfRFMP9iJf84Skqos05cMDZmfxBsdl6YZBiUgF6sxLpqZEbe5
 dpKU+R3vZpYbA6tJ7qyxd4g02xKuZPaRF1aqPEtmhcOnoqNWFeaDbSd7brcEfKFcgYOU
 KZIZpHvcfaK0gPufyHsfbTTEMjz6UXoP1hCrnJ9qnNTohFJJjn3lnadf0Y46GE2uuO7T
 v1ndUxNJHmStsjXYtEXHeWuKsPHLxqlPgiy5ak+3ZIfbZ4mRqj5p9pnrez9ojIpUJRzE
 ibwMjIZDn3W+ZNvx9NUfTap22+/PtZ6RIwzesDOf2w1Q8Q5V9SrOTlMRpMfjMLk5lgns UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf7fnfpc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA588100038;
 Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D05CB2A96E8;
 Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:24 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:04 +0100
Message-ID: <20200113103515.20879-11-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 10/21] gpio: add function check_dir_flags
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

Add a dir flags validity check with a new function
check_dir_flags.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 94e90cb8ac..62462dffa5 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -510,12 +510,36 @@ int dm_gpio_set_value(const struct gpio_desc *desc, int value)
 	return 0;
 }
 
+/* check dir flags invalid configuration */
+static int check_dir_flags(ulong flags)
+{
+	if ((flags & GPIOD_IS_OUT) && (flags & GPIOD_IS_IN)) {
+		log_debug("%s: flags 0x%lx has GPIOD_IS_OUT and GPIOD_IS_IN\n",
+			  __func__, flags);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int _dm_gpio_set_dir_flags(struct gpio_desc *desc, ulong flags)
 {
 	struct udevice *dev = desc->dev;
 	struct dm_gpio_ops *ops = gpio_get_ops(dev);
+	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
 	int ret = 0;
 
+	ret = check_dir_flags(flags);
+	if (ret) {
+		dev_dbg(dev,
+			"%s error: set_dir_flags for gpio %s%d has invalid dir flags 0x%lx\n",
+			desc->dev->name,
+			uc_priv->bank_name ? uc_priv->bank_name : "",
+			desc->offset, flags);
+
+		return ret;
+	}
+
 	if (flags & GPIOD_IS_OUT) {
 		int value = flags & GPIOD_IS_OUT_ACTIVE ? 1 : 0;
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
