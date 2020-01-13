Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD1138F32
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 11:35:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE35DC36B13
	for <lists+uboot-stm32@lfdr.de>; Mon, 13 Jan 2020 10:35:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0945C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 10:35:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00DAScYh021512; Mon, 13 Jan 2020 11:35:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=AfZIelyOqPbsj6NNjlUYi3npjw67BJYEdkkK7CwD1RY=;
 b=Dk4nmqCWZF+CnewvgZBf6OMr41+7aKPC+rK9US2juwIeb8n7xcZHenetUZ8+WAa1cn6Z
 eEAjUBwWqZ8821Lgr51reHJRtqB1g435de/9kX7CvmEAyII4koxALtcLXKlvFwObazTM
 /KGZzExHWj1GOpcpDEmO9v0AScE9QA4SXt4J2bhxOAnRH/YyJc5CyGnIfnEOeyxvMKjx
 tppfZJPUCqZULGqBzobIoFh3sBbk/SOGQA3kU1gsM8ZH50Yt9fy0MITTc8cz2N/PV9Uq
 lZW9OJlyv9wDuZBLTmVidOPwLK0cU+DR6AqUaAwEtC4Jd6JvL/XsjIUH9iylDC2Y1IZ9 DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xf78ryk80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2020 11:35:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32C9A100034;
 Mon, 13 Jan 2020 11:35:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 28DA12A96E8;
 Mon, 13 Jan 2020 11:35:21 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 13 Jan 2020 11:35:20 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 13 Jan 2020 11:34:59 +0100
Message-ID: <20200113103515.20879-6-patrick.delaunay@st.com>
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
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 05/21] gpio: remove GPIOD_REQUESTED
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

Remove the define GPIOD_REQUESTED as it is never used
and use BIT() macro for other defines.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3: None
Changes in v2:
- remove the unused GPIOD_REQUESTED

 include/asm-generic/gpio.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/gpio.h b/include/asm-generic/gpio.h
index d6cf18744f..7da2015805 100644
--- a/include/asm-generic/gpio.h
+++ b/include/asm-generic/gpio.h
@@ -117,11 +117,10 @@ struct udevice;
 struct gpio_desc {
 	struct udevice *dev;	/* Device, NULL for invalid GPIO */
 	unsigned long flags;
-#define GPIOD_REQUESTED		(1 << 0)	/* Requested/claimed */
-#define GPIOD_IS_OUT		(1 << 1)	/* GPIO is an output */
-#define GPIOD_IS_IN		(1 << 2)	/* GPIO is an input */
-#define GPIOD_ACTIVE_LOW	(1 << 3)	/* value has active low */
-#define GPIOD_IS_OUT_ACTIVE	(1 << 4)	/* set output active */
+#define GPIOD_IS_OUT		BIT(1)	/* GPIO is an output */
+#define GPIOD_IS_IN		BIT(2)	/* GPIO is an input */
+#define GPIOD_ACTIVE_LOW	BIT(3)	/* value has active low */
+#define GPIOD_IS_OUT_ACTIVE	BIT(4)	/* set output active */
 
 	uint offset;		/* GPIO offset within the device */
 	/*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
