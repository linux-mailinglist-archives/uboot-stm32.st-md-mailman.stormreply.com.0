Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97434206ED3
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 10:18:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 426DFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 08:18:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94795C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 08:18:17 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O8DDqj030634; Wed, 24 Jun 2020 10:17:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=2TwuWYzWjMelOp5s4KmQBzsQJ4/BnXHhIrjfo1D3QnU=;
 b=i/Lg4KgPsv0l386Oa/8bDbZ1v/21rZpZsRiIISsO2osyW8+zxuXb8qOFvV5pNBGnoj+8
 E0yKyVf3b3D3/UROGSE0vXQJlHV03ZUFW8AeoBPakuRpDVwaBX8ZqZrV4xvOGPWza3D1
 5Px35/1eu0nmvDgmiKBgAD31Xbay1/Pf516+3YwqmUBP/sUYqzzUlqPpo3v9PquQmZXz
 ox+m2uRxFzetSW9U2Ry4GHya5Gygbldj95+xqrwseHRshW8yMLhZlvbE9ecVdqWTFUhr
 8TwkbDN5CymlfekGHDaOePYgKjZRXMMF9ng88qHVQlmanly/1YHvYCPs9mEhmYhEj818 zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuv9ac9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 10:17:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0E6E1100034;
 Wed, 24 Jun 2020 10:17:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF5FB2AD2B0;
 Wed, 24 Jun 2020 10:17:52 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 24 Jun 2020 10:17:52 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 24 Jun 2020 10:17:50 +0200
Message-ID: <20200624081751.2220-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] env: add failing trace in env_save
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

Add trace in env save to indicate any errors to end user and avoid
silent output when the command 'env save' is not executed.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/env.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/env/env.c b/env/env.c
index dcc25c030b..7719bc3620 100644
--- a/env/env.c
+++ b/env/env.c
@@ -240,13 +240,17 @@ int env_save(void)
 	if (drv) {
 		int ret;
 
-		if (!drv->save)
+		printf("Saving Environment to %s... ", drv->name);
+		if (!drv->save) {
+			printf("not possible\n");
 			return -ENODEV;
+		}
 
-		if (!env_has_inited(drv->location))
+		if (!env_has_inited(drv->location)) {
+			printf("not initialized\n");
 			return -ENODEV;
+		}
 
-		printf("Saving Environment to %s... ", drv->name);
 		ret = drv->save();
 		if (ret)
 			printf("Failed (%d)\n", ret);
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
