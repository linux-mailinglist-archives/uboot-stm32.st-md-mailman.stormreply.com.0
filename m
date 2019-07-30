Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588767AF9A
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 19:17:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B87C35E05
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Jul 2019 17:17:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8C1AC35E04
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:17:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6UHGRnK031346; Tue, 30 Jul 2019 19:17:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=F7zsEsG/WsIUega5dZGQ2mUOXTVju4k+9CAMOuo06/U=;
 b=VhCou8r5EXL9zs2v7QV+N8863PH3pcpl/ngBAnTAqkdQnNCt1f7ffIEcMmvkyQLve6xn
 kMnMuCEs6CEQJdqiilSCMq9mbJ62jjnT85zFLovO0m2vjvXoSW0bIddekbFBDV2oaZ0O
 ncT5VP7PPvgyP5mDJxaa+NWeQAchn34+CDyOy6kJBwcuelzRrXpTAQ55lvKZOQqmQJlh
 1Dl+VPFabiU9wWoSvjZkmuEEAp1JPInRu+FPZXC3KBxo5bC4wRD02DDlgj7E6chk+DTK
 wiwx6A5SB1FTkm7YMgnehoTjKaeA2fW4H9tOBcFCBkNQbev2tHL9+rnQwDtN47ymYuCm pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u0br9yp7n-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 30 Jul 2019 19:17:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A3AD31;
 Tue, 30 Jul 2019 17:17:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 525D0CEA01;
 Tue, 30 Jul 2019 19:17:45 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul
 2019 19:17:45 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 30 Jul 2019 19:17:44
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 30 Jul 2019 19:16:47 +0200
Message-ID: <1564507016-16570-40-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
References: <1564507016-16570-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_08:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 39/48] serial: stm32: remove unused include
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

The "serial_stm32.h" is only used by drivers/serial/serial_stm32.c
and it is the file ./drivers/serial/serial_stm32.h

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 include/dm/platform_data/serial_stm32.h | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 include/dm/platform_data/serial_stm32.h

diff --git a/include/dm/platform_data/serial_stm32.h b/include/dm/platform_data/serial_stm32.h
deleted file mode 100644
index 85153df..0000000
--- a/include/dm/platform_data/serial_stm32.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * (C) Copyright 2015
- * Kamil Lulko, <kamil.lulko@gmail.com>
- */
-
-#ifndef __SERIAL_STM32_H
-#define __SERIAL_STM32_H
-
-/* Information about a serial port */
-struct stm32_serial_platdata {
-	struct stm32_usart *base;  /* address of registers in physical memory */
-};
-
-#endif /* __SERIAL_STM32_H */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
