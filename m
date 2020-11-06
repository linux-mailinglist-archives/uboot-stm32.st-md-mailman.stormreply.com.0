Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0B2A9B78
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Nov 2020 19:02:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E547C36B0B;
	Fri,  6 Nov 2020 18:02:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 013B8C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 18:02:48 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6Hw6I9013609; Fri, 6 Nov 2020 19:02:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=ikQA2yFOBoo7BDKaI/vsd/6wNfz0vOHm37MCVhrkWUM=;
 b=JiRqZ/VRCPN1pqdi1k0RZ0jB/YIQ0g+zgGBoBFbbFBhDYWcSU6IPgCIJ6FwZg/R2Sxek
 FZIUWNXoE6FotHD+b6vK6G0YH4Jy6LP9vl2uuc7hdjwvqJYYIuKkQ4a+ItKOixrRCIJg
 pdJwKRvDcO+IhZFZX0mKSIlSIPVXKVKLh0gjaeNOgTJb6bIbki7iC5dbsi5Gj5rvYHC8
 GtU/Jwkqt7rTCeLe9ThiAROCXhrG06dkqAsxBYkyt25sJ75U4WE3ATZOE93h+MLX+N3V
 wI+rx1o6i/WzR7dLUCJJJ+/pjxZaLe+cdfNI+hRmFTNCIdoyQKOx9/X4dv2mwbxxQ7v+ Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1xgd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 19:02:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1E9610002A;
 Fri,  6 Nov 2020 19:02:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CC07F24C7A5;
 Fri,  6 Nov 2020 19:02:40 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 19:02:40
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 6 Nov 2020 19:01:49 +0100
Message-ID: <20201106180201.31784-22-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106180201.31784-1-patrick.delaunay@st.com>
References: <20201106180201.31784-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 21/33] mailbox: stm32-ipcc: migrate trace
	to dev and log macro
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
(dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---

(no changes since v1)

 drivers/mailbox/stm32-ipcc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index 81a4115986..990b853d34 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -3,6 +3,8 @@
  * Copyright (C) STMicroelectronics 2019 - All Rights Reserved
  */
 
+#define LOG_CATEGORY UCLASS_MAILBOX
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
@@ -44,11 +46,11 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
 {
 	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
 
-	debug("%s(chan=%p)\n", __func__, chan);
+	dev_dbg(chan->dev, "chan=%p\n", chan);
 
 	if (chan->id >= ipcc->n_chans) {
-		debug("%s failed to request channel: %ld\n",
-		      __func__, chan->id);
+		dev_dbg(chan->dev, "failed to request channel: %ld\n",
+			chan->id);
 		return -EINVAL;
 	}
 
@@ -57,7 +59,7 @@ static int stm32_ipcc_request(struct mbox_chan *chan)
 
 static int stm32_ipcc_free(struct mbox_chan *chan)
 {
-	debug("%s(chan=%p)\n", __func__, chan);
+	dev_dbg(chan->dev, "chan=%p\n", chan);
 
 	return 0;
 }
@@ -66,7 +68,7 @@ static int stm32_ipcc_send(struct mbox_chan *chan, const void *data)
 {
 	struct stm32_ipcc *ipcc = dev_get_priv(chan->dev);
 
-	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
+	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
 
 	if (readl(ipcc->reg_proc + IPCC_XTOYSR) & BIT(chan->id))
 		return -EBUSY;
@@ -83,7 +85,7 @@ static int stm32_ipcc_recv(struct mbox_chan *chan, void *data)
 	u32 val;
 	int proc_offset;
 
-	debug("%s(chan=%p, data=%p)\n", __func__, chan, data);
+	dev_dbg(chan->dev, "chan=%p, data=%p\n", chan, data);
 
 	/* read 'channel occupied' status from other proc */
 	proc_offset = ipcc->proc_id ? -IPCC_PROC_OFFST : IPCC_PROC_OFFST;
@@ -104,7 +106,7 @@ static int stm32_ipcc_probe(struct udevice *dev)
 	struct clk clk;
 	int ret;
 
-	debug("%s(dev=%p)\n", __func__, dev);
+	dev_dbg(dev, "\n");
 
 	addr = dev_read_addr(dev);
 	if (addr == FDT_ADDR_T_NONE)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
