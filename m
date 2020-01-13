Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47E138F37
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD1DEC36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A263C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DASZJH005619; Mon, 13 Jan 2020 11:35:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=YAyQMoD53A6ap4r4OXorrPiIn3FOr85f1qAPqBnKSyM=;
 b=jUvraaxJBg52olGTeHZjOT1XXpT/utO/O7wNpW3aplDD7YPSoHZY9s3UX51VxzZufo7l
 BqpNY7N7VWSWAk6JVj6tFvvFCQZFzxW1AObH8dYj0W8fwadoH0vPqIh9sXaAic+fGmoN
 D+PrWN9u65gCdFgGu2Q0BUdsplUjXdvrUcVY/dzkkLY7z5vvHkw+5ulPhFZS6QrU5PEr
 ma1aMK5EUxg9sflMqCdBsIIn3Jqr6Cno9s8C6kBltZmuuoqazWQJ9gh91kCPIdPpLmUf
 o5b6hSRfMsvAPbrDzukXyIbUIgStOn3FugqQAaxSjUQFlM629aapNcFgNoAM02NeeH1N bA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf77aqqj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 645E210002A;
 Mon, 13 Jan 2020 11:35:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A0C32A96E8;
 Mon, 13 Jan 2020 11:35:23 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:22 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:35:02 +0100
Message-ID: <20200113103515.20879-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113103515.20879-1-patrick.delaunay@st.com>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_02:2020-01-13,
 2020-01-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Heiko Schocher <hs@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 08/21] gpio: add function _gpio_get_value
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

Introduce the function _gpio_get_value to get the GPIO value
without check if it is reserved.
This patch prepare new ops introduction.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

This patch was part of v2 08/14
= gpio: add ops for configuration with dir flags


Changes in v3:
- Split the previous patch [PATCH v2 08/14] to help review

Changes in v2: None

 drivers/gpio/gpio-uclass.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-uclass.c b/drivers/gpio/gpio-uclass.c
index 0870458e96..bdf7f5bb4e 100644
--- a/drivers/gpio/gpio-uclass.c
+++ b/drivers/gpio/gpio-uclass.c
@@ -476,18 +476,24 @@ int gpio_direction_output(unsigned gpio, int value)
 							desc.offset, value);
 }
 
-int dm_gpio_get_value(const struct gpio_desc *desc)
+static int _gpio_get_value(const struct gpio_desc *desc)
 {
 	int value;
+
+	value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
+
+	return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
+}
+
+int dm_gpio_get_value(const struct gpio_desc *desc)
+{
 	int ret;
 
 	ret = check_reserved(desc, "get_value");
 	if (ret)
 		return ret;
 
-	value = gpio_get_ops(desc->dev)->get_value(desc->dev, desc->offset);
-
-	return desc->flags & GPIOD_ACTIVE_LOW ? !value : value;
+	return _gpio_get_value(desc);
 }
 
 int dm_gpio_set_value(const struct gpio_desc *desc, int value)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
