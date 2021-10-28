Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451143E176
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 15:01:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C2DC5E2B4;
	Thu, 28 Oct 2021 13:01:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD319C5E2B0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 13:01:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR2sx022840; 
 Thu, 28 Oct 2021 15:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=022QAxqSWDhg+vmXgQ2FhC0A4CxtL6crnzlBhuwMORU=;
 b=xVeAJw4wRNUdTJcX2VQraLXHVN5/WIStKuU31FIgPfjlCtSpsfAxBXdVAP1bg9CWV5sE
 c/KsdJmnV3SOITc2+ROiDGvFgTnAImR3SX1e7XT13OE6i0A0ceDNCHJuQI/un0hi/+W/
 8ubBCL+5mwl2qQfmtIliw8ObVIThUeQ4NZXEkB1SC1QSYngvdDZkwlrpgfXbpUlxxS+9
 QpD370SIahILsv2Sn/mnqDac2shUtl/e0y4auqmrsHkfZ6v4qg9AFtro8670c65vyFOA
 Pled1XV68UC+fKmybmW7ZiBDWjXEVI7USdRmq4ZAiBMSPLWnU+AuxlouhGzV4I8mPKSu /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bymfvb2cu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 15:01:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5965510002A;
 Thu, 28 Oct 2021 15:01:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 40CAC22F7D5;
 Thu, 28 Oct 2021 15:01:24 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 15:01:23
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 15:01:09 +0200
Message-ID: <20211028150102.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/5] reset: scmi: define LOG_CATEGORY
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

 drivers/reset/reset-scmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/reset/reset-scmi.c b/drivers/reset/reset-scmi.c
index 1bff8075ee..ca0135a420 100644
--- a/drivers/reset/reset-scmi.c
+++ b/drivers/reset/reset-scmi.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2019-2020 Linaro Limited
  */
+
+#define LOG_CATEGORY UCLASS_RESET
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
