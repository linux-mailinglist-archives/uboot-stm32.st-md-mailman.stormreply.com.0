Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92E5F05C9
	for <lists+uboot-stm32@lfdr.de>; Fri, 30 Sep 2022 09:36:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4FFCC64100;
	Fri, 30 Sep 2022 07:36:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E1AEC63325
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Sep 2022 07:36:54 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28U7LAJU014021;
 Fri, 30 Sep 2022 09:36:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=uiWYtVOGZL1cvim1/8dHaE4wwBJnEOVDmC/3eFxal5g=;
 b=EXe91SbIljxrV+ZDZYHHtDr3jq5Nk8ar5lXzMvepnGg9ql22qjOXxRqZ1WAu+wwOTtIK
 z9vkYnVINJSS2e0U08ycIwphYj6MbD74nCFEkQVVGgCIIxQUEYkThVjiEY1JH/ZtG9bT
 Ir2tsSLdzd4+c1W6wDldmn6JbVxSi0LJy3KWFvPWwhrougoI4bQyrX4IIl1V4Byhll5w
 hCpUElAYg/jTIoqEHPfEWodXa85szoFw1gJ8meZwply3vCSvDrQBkY3lDzn+hwPxm84Z
 gPBoizAOyKTiRViFg06Hp7G5A1rptFgdZ9ziPht8kM28fR5LCKCqMDn3YY/SoUCDS4MC KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsqamvgnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 09:36:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7A5D110002A;
 Fri, 30 Sep 2022 09:36:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64D9F2160F6;
 Fri, 30 Sep 2022 09:36:52 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 30 Sep
 2022 09:36:51 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 30 Sep 2022 09:36:38 +0200
Message-ID: <20220930093635.1.I38e66d79350b381b6059a6a80ce60c62f01f3894@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne CARRIERE <etienne.carriere@linaro.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [Uboot-stm32] [PATCH] firmware: scmi: fix the multi channel support
	with CCF
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

When the CCF is activated, the dev->parent is not necessary
the reference to SCMI transport and the function devm_scmi_of_get_channel
failed for the registered SCMI clock, child for protocol@14,
the channel is null and the SCMI clock driver crash for any operations.

This patch changes the first parameter of the ops of_get_channel(),
aligned with other process_msg() to pass directly the good reference,
i.e. parent result of find_scmi_transport_device(dev)
which return the reference of the scmi transport device.

Fixes: 8e96801aa6a ("firmware: scmi: add multi-channel support")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/mailbox_agent.c     | 2 +-
 drivers/firmware/scmi/optee_agent.c       | 2 +-
 drivers/firmware/scmi/scmi_agent-uclass.c | 2 +-
 drivers/firmware/scmi/smccc_agent.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
index 3efdab9e723..8277c186060 100644
--- a/drivers/firmware/scmi/mailbox_agent.c
+++ b/drivers/firmware/scmi/mailbox_agent.c
@@ -96,7 +96,7 @@ static int setup_channel(struct udevice *dev, struct scmi_mbox_channel *chan)
 static int scmi_mbox_get_channel(struct udevice *dev,
 				 struct scmi_channel **channel)
 {
-	struct scmi_mbox_channel *base_chan = dev_get_plat(dev->parent);
+	struct scmi_mbox_channel *base_chan = dev_get_plat(dev);
 	struct scmi_mbox_channel *chan;
 	int ret;
 
diff --git a/drivers/firmware/scmi/optee_agent.c b/drivers/firmware/scmi/optee_agent.c
index 2b2b8c1670a..db927fb2140 100644
--- a/drivers/firmware/scmi/optee_agent.c
+++ b/drivers/firmware/scmi/optee_agent.c
@@ -326,7 +326,7 @@ static int setup_channel(struct udevice *dev, struct scmi_optee_channel *chan)
 static int scmi_optee_get_channel(struct udevice *dev,
 				  struct scmi_channel **channel)
 {
-	struct scmi_optee_channel *base_chan = dev_get_plat(dev->parent);
+	struct scmi_optee_channel *base_chan = dev_get_plat(dev);
 	struct scmi_optee_channel *chan;
 	u32 channel_id;
 	int ret;
diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
index 2b6211c4e6a..5c98a304a22 100644
--- a/drivers/firmware/scmi/scmi_agent-uclass.c
+++ b/drivers/firmware/scmi/scmi_agent-uclass.c
@@ -137,7 +137,7 @@ int devm_scmi_of_get_channel(struct udevice *dev, struct scmi_channel **channel)
 		return -ENODEV;
 
 	if (transport_dev_ops(parent)->of_get_channel)
-		return transport_dev_ops(parent)->of_get_channel(dev, channel);
+		return transport_dev_ops(parent)->of_get_channel(parent, channel);
 
 	/* Drivers without a get_channel operator don't need a channel ref */
 	*channel = NULL;
diff --git a/drivers/firmware/scmi/smccc_agent.c b/drivers/firmware/scmi/smccc_agent.c
index bc2eb67335b..6a52cd75d67 100644
--- a/drivers/firmware/scmi/smccc_agent.c
+++ b/drivers/firmware/scmi/smccc_agent.c
@@ -83,7 +83,7 @@ static int setup_channel(struct udevice *dev, struct scmi_smccc_channel *chan)
 static int scmi_smccc_get_channel(struct udevice *dev,
 				  struct scmi_channel **channel)
 {
-	struct scmi_smccc_channel *base_chan = dev_get_plat(dev->parent);
+	struct scmi_smccc_channel *base_chan = dev_get_plat(dev);
 	struct scmi_smccc_channel *chan;
 	u32 func_id;
 	int ret;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
