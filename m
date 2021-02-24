Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E3323A65
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Feb 2021 11:20:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BBF5C57B64;
	Wed, 24 Feb 2021 10:20:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72642C57B55
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Feb 2021 10:20:19 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OAHK8N030128; Wed, 24 Feb 2021 11:20:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=T2rpxlg/RW+ADdc1MoxunMqcxEmDR6A888JIeOaKw8c=;
 b=xbVrb/qZ7ljPgF7qZsPHOX3s35eiAuzq/xvH7zwxqX5DGYuPvzGLYSNFFGBaQbp4qNiH
 WtMMPbo9ZbYf+NcsfQ2zVGYpP+Uxtcu77+ahMpbvZv6zF2h9dqCIDjT9s5lRxri4FtYX
 oe9NySZ/KtDhSOc3GvnR674YVTTADx6CUDZNkmq28BC8roGFswmUK9Ro4NhOZyb8QnHQ
 Yt6XimT1NF5BCHpqfDZAfVUqY5WufJ6c+dvkF2YE63rh6JetgxeCM7Euh46x3A31uTeh
 Xp3QAtztBpuaahgQ367LGMyr9GETecTlVBf61Ucu52gMratgIP0+2ztrXy5VMet46BlQ ZA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66xw7a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 11:20:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 52273100034;
 Wed, 24 Feb 2021 11:20:14 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41324225296;
 Wed, 24 Feb 2021 11:20:14 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Feb 2021 11:20:13
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Feb 2021 11:19:44 +0100
Message-ID: <20210224111907.4.I390560c87a294deb05e06e1ad92e02fb736ba9a0@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
References: <20210224101946.32003-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-24_03:2021-02-24,
 2021-02-24 signatures=0
Cc: Marek Vasut <marex@denx.de>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 4/6] scmi: define LOG_CATEGORY
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

Define LOG_CATEGORY to allow filtering with log command.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/firmware/scmi/mailbox_agent.c        | 2 ++
 drivers/firmware/scmi/sandbox-scmi_agent.c   | 2 ++
 drivers/firmware/scmi/sandbox-scmi_devices.c | 2 ++
 drivers/firmware/scmi/scmi_agent-uclass.c    | 2 ++
 drivers/firmware/scmi/smccc_agent.c          | 2 ++
 drivers/firmware/scmi/smt.c                  | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/drivers/firmware/scmi/mailbox_agent.c b/drivers/firmware/scmi/mailbox_agent.c
index 3f4b04a4ae..8043e2c2de 100644
--- a/drivers/firmware/scmi/mailbox_agent.c
+++ b/drivers/firmware/scmi/mailbox_agent.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020 Linaro Limited.
  */
 
+#define LOG_CATEGORY UCLASS_SCMI_AGENT
+
 #include <common.h>
 #include <dm.h>
 #include <dm/device_compat.h>
diff --git a/drivers/firmware/scmi/sandbox-scmi_agent.c b/drivers/firmware/scmi/sandbox-scmi_agent.c
index 35de68c75d..97a5dace15 100644
--- a/drivers/firmware/scmi/sandbox-scmi_agent.c
+++ b/drivers/firmware/scmi/sandbox-scmi_agent.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020, Linaro Limited
  */
 
+#define LOG_CATEGORY UCLASS_SCMI_AGENT
+
 #include <common.h>
 #include <dm.h>
 #include <malloc.h>
diff --git a/drivers/firmware/scmi/sandbox-scmi_devices.c b/drivers/firmware/scmi/sandbox-scmi_devices.c
index 1a6fafbf53..69239a198f 100644
--- a/drivers/firmware/scmi/sandbox-scmi_devices.c
+++ b/drivers/firmware/scmi/sandbox-scmi_devices.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020, Linaro Limited
  */
 
+#define LOG_CATEGORY UCLASS_MISC
+
 #include <common.h>
 #include <clk.h>
 #include <dm.h>
diff --git a/drivers/firmware/scmi/scmi_agent-uclass.c b/drivers/firmware/scmi/scmi_agent-uclass.c
index 516e690ac2..2491e0a747 100644
--- a/drivers/firmware/scmi/scmi_agent-uclass.c
+++ b/drivers/firmware/scmi/scmi_agent-uclass.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020 Linaro Limited.
  */
 
+#define LOG_CATEGORY UCLASS_SCMI_AGENT
+
 #include <common.h>
 #include <dm.h>
 #include <dm/device_compat.h>
diff --git a/drivers/firmware/scmi/smccc_agent.c b/drivers/firmware/scmi/smccc_agent.c
index 81c2884bb7..f185891e8f 100644
--- a/drivers/firmware/scmi/smccc_agent.c
+++ b/drivers/firmware/scmi/smccc_agent.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2020 Linaro Limited.
  */
 
+#define LOG_CATEGORY UCLASS_SCMI_AGENT
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
diff --git a/drivers/firmware/scmi/smt.c b/drivers/firmware/scmi/smt.c
index d25478796a..60b9d499b7 100644
--- a/drivers/firmware/scmi/smt.c
+++ b/drivers/firmware/scmi/smt.c
@@ -4,6 +4,8 @@
  * Copyright (C) 2019-2020 Linaro Limited.
  */
 
+#define LOG_CATEGORY UCLASS_SCMI_AGENT
+
 #include <common.h>
 #include <cpu_func.h>
 #include <dm.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
