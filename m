Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8128DC9B
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:17:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D30EC424BF;
	Wed, 14 Oct 2020 09:17:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40F4BC424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:17:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9CpjQ010617; Wed, 14 Oct 2020 11:17:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lrlAGEI+fXavLct5fL4bIsBW1EAwVfd8zeXPoLdtKvw=;
 b=mxUpRJriIj6eGOpOP7ETDDRSdpoXP9TWHdoqD56H+K7IgoKXW1fXa8fkmsGQ3JyzPf5H
 5qXVVMvERRds/ky0zkvEVEWQGzFnOcSe/RQSpzO57N0RoaSBw+YKFV7w8kn6fU09qRdd
 k2Seyj7T4zWQes4AT751VAtEVxGzAF/SlaEVCSKQvZ+H+5lYjuzBE63KBRbdflDhFicj
 wc7i5Fy4/Xg0IHJiFYj9YTRePWgcCmyxG/h/q8MP0XpxAjKqO3bStzQh/1sdgPeaQdNZ
 xH00/1wi4hYgYcRqopM1VDKRDeM87siH8wyPxdILja/J4Nbbjudxm5o62zXM6hZgV5Je qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8gc9w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:17:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C63AF10002A;
 Wed, 14 Oct 2020 11:17:08 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCA8E2ABA3E;
 Wed, 14 Oct 2020 11:17:08 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:17:08
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:33 +0200
Message-ID: <20201014091646.4233-21-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 20/33] reset: stm32-reset: migrate trace to
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
---

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
