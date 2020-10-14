Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDF28DC88
	for <lists+uboot-stm32@lfdr.de>; Wed, 14 Oct 2020 11:16:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DCA7C424BB;
	Wed, 14 Oct 2020 09:16:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D847C424AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Oct 2020 09:16:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E9DCHs008317; Wed, 14 Oct 2020 11:16:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=71Lgwaeo25Gkhab69UHjMh7AlwMgQ2MFFwYxdoY7ZyI=;
 b=Y+leVE1NIDq6eqoytsRjIzDh5juLEnhFEx6mhjdg/VFOetxM2Fo0z3J+g8payGmr7IS6
 jcq5hwyxhSvouQXehrcx3ZS0MqNhMqd9kIckcRr99Jo+4ul/igZDyR41Vw7LcbDnTVJV
 HNhlKVNUBTOrRdUA5C496ElzdPfAObh4s0C77w4uldZhuT8cK1WEOKz/AjqYe132eqVE
 O1WabWRxhrjNrYcp8Z3JLzbj2bsbldXWXZLBlvowna4TE0NEBKglhy9YPWWeXH718+fL
 kXR+Vu/0L4yyZ8kTSlyyv0R4WvfDUCPhSynUdK1ONt6ZFRLbCsliE40PPwGPqyLKibnW cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34356ecffy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 11:16:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC9D110002A;
 Wed, 14 Oct 2020 11:16:54 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A35592ABA3E;
 Wed, 14 Oct 2020 11:16:54 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 11:16:54
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 14 Oct 2020 11:16:19 +0200
Message-ID: <20201014091646.4233-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014091646.4233-1-patrick.delaunay@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_06:2020-10-14,
 2020-10-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 06/33] remoproc: stm32: migrate trace to log
	macro
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

Define LOG_CATEGORY and remove unneeded pr_fmt macro with the dev
macro as dev->name is displayed and CONFIG_LOGF_FUNC can be
activated for log macro.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/remoteproc/stm32_copro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
index 33b574b1bd..1e09bb6387 100644
--- a/drivers/remoteproc/stm32_copro.c
+++ b/drivers/remoteproc/stm32_copro.c
@@ -2,7 +2,8 @@
 /*
  * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
  */
-#define pr_fmt(fmt) "%s: " fmt, __func__
+#define LOG_CATEGORY UCLASS_REMOTEPROC
+
 #include <common.h>
 #include <dm.h>
 #include <errno.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
