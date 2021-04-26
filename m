Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5A436B5B9
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Apr 2021 17:25:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4752CC57182;
	Mon, 26 Apr 2021 15:25:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF841C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Apr 2021 15:25:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QFDNT1017132; Mon, 26 Apr 2021 17:25:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=zNDwUMmJG34ys+6XrXxp65Ko29bGMNERpqpUQ7Nqhnk=;
 b=gCbTGOjJQbweL/5O6Z8wn03ttPOPYrVVtlV8hTyOgmUypbhqQ+u8Y6s/a02bk8J+MoSH
 TyDIi9D6iugrL226dLBzg+MZCZ+HXiIyS4xh3/jlVGxNRzGW9VBpRYTsw0PH5xjBUplA
 COnE7z0jiHPUE5/uHH5ndAf+3LcIHPB/nQcEBFp2Hu4HCgnse6fVtkGg3Y+4doxf7YXS
 VliQbI1daPU2GlPH5fslVOR6Cc+J1v+5Y0zhoyeQJS8+w0TNSxL9rYpmhbGu/g4LvNUS
 BzaTWtvCEOx/gwlt/mzvUG95qBDETmIVGAm25Uiu0xBlORrErBjBdrQeV6KffWu3c59O 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 385xu88fe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 17:25:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF12110002A;
 Mon, 26 Apr 2021 17:25:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E62C222B9A2;
 Mon, 26 Apr 2021 17:25:10 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 26 Apr 2021 17:25:10
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Apr 2021 17:25:06 +0200
Message-ID: <20210426172459.3.I13f978db3e44ff22e6974a026a3021cd401a9dbb@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
References: <20210426172459.1.I3fde47925951f917dbd08b6e826d91669f62b221@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_07:2021-04-26,
 2021-04-26 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>
Subject: [Uboot-stm32] [PATCH 3/3] net: define LOG_CATEGORY
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

 net/eth-uclass.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/eth-uclass.c b/net/eth-uclass.c
index 34ca731d1e..63ad0908d9 100644
--- a/net/eth-uclass.c
+++ b/net/eth-uclass.c
@@ -5,6 +5,8 @@
  * Joe Hershberger, National Instruments
  */
 
+#define LOG_CATEGORY UCLASS_ETH
+
 #include <common.h>
 #include <bootstage.h>
 #include <dm.h>
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
