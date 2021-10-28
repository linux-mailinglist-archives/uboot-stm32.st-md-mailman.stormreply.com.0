Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46A43E6F1
	for <lists+uboot-stm32@lfdr.de>; Thu, 28 Oct 2021 19:13:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E145C5E2C6;
	Thu, 28 Oct 2021 17:13:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F80BC5E2C6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Oct 2021 17:13:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SCR1rh004720; 
 Thu, 28 Oct 2021 19:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=8NbHf54gBYUbl9zCQKQx3PrJRGexuGFK1RgibhVDIq4=;
 b=Lpz0oDKQzK+9mO11b1ytdHKGo1L2UwIqODbwmtjNNeSZ1lP21ndtYq4dL9EpHilAumYN
 mggHwT7TpItB49UiJb1SyQqK5xHieGbNQYHGhRzI587dGK9BAELAjznUzfcPJNDR5meD
 h/n8Ke1MMH0R34KAbJ4EjTWPRI8arXpxwC9OsFiE9KbNq3ivRYCMEGDoE6KvcJ8x6qKj
 sUgWyXI9quSPFWz9UpTHZL1Iqav8mAInl+IhxicDj9MHaJY91152DmbS/tyuyWLoNe2b
 4yYoKBrQaEvOZ7B68d0IMyff/2HWEeIiOAIxQhtowgydfvb5j8tGPYczPmXMWdO8H+T6 qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3byr6dasn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 19:13:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 21CE410002A;
 Thu, 28 Oct 2021 19:13:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 184B7226FD0;
 Thu, 28 Oct 2021 19:13:29 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 28 Oct 2021 19:13:28
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 28 Oct 2021 19:13:14 +0200
Message-ID: <20211028191222.v3.3.I8edf9d3b9867194e233bba15ce32a1477ce4bbef@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
References: <20211028191222.v3.1.I8edf9d3b9867194e233bba15ce32a1477ce4@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: [Uboot-stm32] [PATCH v3 3/5] power: regulator: scmi: define
	LOG_CATEGORY
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
Acked-by: Etienne Carriere <etienne.carriere@linaro.org>
---

(no changes since v1)

 drivers/power/regulator/scmi_regulator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/power/regulator/scmi_regulator.c b/drivers/power/regulator/scmi_regulator.c
index b3142bf4e1..3ddeaf4adc 100644
--- a/drivers/power/regulator/scmi_regulator.c
+++ b/drivers/power/regulator/scmi_regulator.c
@@ -2,6 +2,9 @@
 /*
  * Copyright (C) 2020-2021 Linaro Limited
  */
+
+#define LOG_CATEGORY UCLASS_REGULATOR
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
