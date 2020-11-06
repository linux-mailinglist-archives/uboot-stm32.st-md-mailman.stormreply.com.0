Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F62A9B77
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAE7C36B36;
	Fri,  6 Nov 2020 18:02:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD8FEC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HwEnc022600; Fri, 6 Nov 2020 19:02:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=KSJADO0NrvxpOlq6y4wInFQ0+CLCrey+K1T9sv5ambs=;
 b=X8qi9iRjY1520h3lQcUg3XixNVFNHYrMU9gxNLiItmjW64g4vpGc6bG46k4d0WnBaqy8
 2InfvI5UB8hesIhQuR+ypcHpR7yxeOdmVXHUPO7Si14Baj0c/JV24Fct3gxESqfwV0BV
 ygJYRbRwtzM7jcC2E8NVfcF9KQE54a9WgmmHDrP5em8GtGV5nE08jBm+HTE28k7I6uJX
 mxRzOsre2JCmgrYN0oUAw3/LoCVUcL69dQ4HD6QE//6aRJFZAI6I0qLRHvaEW0ShDzhx
 0XzhJCStoJrCQFMc4pMFq3Ivqo+WbEyyaPjuKspmOPT8sYXvzKShYRGW5n/XEIbkwx6i lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrfv2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 522DA10002A;
 Fri,  6 Nov 2020 19:02:39 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4BBBF24C7A5;
 Fri,  6 Nov 2020 19:02:39 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:38
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:48 +0100
Message-ID: <20201106180201.31784-21-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 20/33] reset: stm32-reset: migrate trace to
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

Change debug to dev_dbg macro and define LOG_CATEGORY.

Remove the "%s:" __func__  header as it is managed by dev macro
(dev->name is displayed).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/reset/stm32-reset.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/stm32-reset.c b/drivers/reset/stm32-reset.c
index 64a11cfcfc..c3af06c6f5 100644
--- a/drivers/reset/stm32-reset.c
+++ b/drivers/reset/stm32-reset.c
@@ -4,6 +4,8 @@
  * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
  */
 
+#define LOG_CATEGORY UCLASS_RESET
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
@@ -12,6 +14,7 @@
 #include <reset-uclass.h>
 #include <stm32_rcc.h>
 #include <asm/io.h>
+#include <dm/device_compat.h>
 #include <linux/bitops.h>
 
 /* reset clear offset for STM32MP RCC */
@@ -36,8 +39,9 @@ static int stm32_reset_assert(struct reset_ctl *reset_ctl)
 	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
 	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
 	int offset = reset_ctl->id % BITS_PER_LONG;
-	debug("%s: reset id = %ld bank = %d offset = %d)\n", __func__,
-	      reset_ctl->id, bank, offset);
+
+	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
+		reset_ctl->id, bank, offset);
 
 	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
 		/* reset assert is done in rcc set register */
@@ -53,8 +57,9 @@ static int stm32_reset_deassert(struct reset_ctl *reset_ctl)
 	struct stm32_reset_priv *priv = dev_get_priv(reset_ctl->dev);
 	int bank = (reset_ctl->id / BITS_PER_LONG) * 4;
 	int offset = reset_ctl->id % BITS_PER_LONG;
-	debug("%s: reset id = %ld bank = %d offset = %d)\n", __func__,
-	      reset_ctl->id, bank, offset);
+
+	dev_dbg(reset_ctl->dev, "reset id = %ld bank = %d offset = %d)\n",
+		reset_ctl->id, bank, offset);
 
 	if (dev_get_driver_data(reset_ctl->dev) == STM32MP1)
 		/* reset deassert is done in rcc clr register */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
