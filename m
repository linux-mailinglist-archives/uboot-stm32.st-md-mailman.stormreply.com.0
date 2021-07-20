Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368423D0164
	for <lists+uboot-stm32@lfdr.de>; Tue, 20 Jul 2021 20:15:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED909C597BD;
	Tue, 20 Jul 2021 18:15:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79B0FC597BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jul 2021 18:15:38 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16KID3ff029741; Tue, 20 Jul 2021 20:15:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=wTXoFKEwbcVUo2Jnu9UVsJpUDNO3MbqXIfEcSDqlQuY=;
 b=bcGRe42iJszmAUMGbmGkIu6mhywg5nWDlBWghQaZH0Qt9/Nb6fyKxrmwMFI/zKRGoSzy
 BHIwm0J+20BZ2/kdxVZWUpwvoSpOXbH7NkVLOGnP2P34Hh/hMU87m5lbJXLV4t92ci8g
 Qsa7EBlBuG3avHYaPvyHpG2XntEIAnfy2lxiNDpdS9qW+5O+tRppG4ND4vCZsL600vmZ
 aD7YHvLJdoRTZvu14zYKj/MaDpfzrth7UNm04t5xXM1l7ZAiAkPj2w4sdtyaTeCZnr31
 MjX2C1QnfKi4i+xy0qeLb1KSzExtaRgTwRoZcmCAPiE/lyHOC+ivMcVb433OistcliWl Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39wtu2k5uu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Jul 2021 20:15:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5610810002A;
 Tue, 20 Jul 2021 20:15:34 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A9A820944A;
 Tue, 20 Jul 2021 20:15:34 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 20 Jul 2021 20:15:33
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 20 Jul 2021 20:15:30 +0200
Message-ID: <20210720201526.RESEND.3.I51d64e06abf3ec51ff46a149a6aede4a79dbc79a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
References: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-20_12:2021-07-19,
 2021-07-20 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>
Subject: [Uboot-stm32] [RESEND PATCH 3/3] net: define LOG_CATEGORY
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
Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
---

 net/eth-uclass.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/eth-uclass.c b/net/eth-uclass.c
index 5146bd6666..c2a97d723a 100644
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
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
