Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CF15AFD8
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:31:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38596C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:31:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55614C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:31:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIEGbp031243; Wed, 12 Feb 2020 19:30:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cim5RCor7m9WLRk7j2NFtE/aFBSp+BFFNE7/+z/yRa0=;
 b=ZMH0ylfQ/asPbn6GCnuuwpdIhCBe/wdXlrcWDgYSZ4N1xoupzWKrVeNFBL9H6NWMGTcM
 hEQ94WXaM6u6OfTrRYgMcL08UT5FtK1B+Xj1PmD7HD5yxtuUaHjw428mRMa+mM7RrEHu
 sJRGhVrPyqv+EhH7iUtjQzsjDlRL9088YL4Mb+Ixouosh3APOAXlB7G7DfOOUuU0LTGv
 Xi1uFVpIIS+zpyWunN4Q5I1S5H8nYqLV1gkvX6D105GvwRrz54zKCsNB0FX5SCdAj5Mo
 5gtdp0NX/OGmeP0MKIslyjgzPmInjxTyC0ZOjI9tHZr+zyDwpOqCEOb9MVcCk5DDVIeC 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqst7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:30:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CCE910003A;
 Wed, 12 Feb 2020 19:30:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 54C412C38D6;
 Wed, 12 Feb 2020 19:30:27 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:30:26 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:30:14 +0100
Message-ID: <20200212183021.4844-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212183021.4844-1-patrick.delaunay@st.com>
References: <20200212183021.4844-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 03/10] env: correctly handle result in env_init
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

Don't return error with ret=-ENOENT when the optional ops drv->init
is absent but only if env_driver_lookup don't found driver.

This patch correct an issue for the code
  if (!env_init())
     env_load()
When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4),
as the backend env/ext4.c doesn't define an ops .init

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 env/env.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/env/env.c b/env/env.c
index 9237bb9c74..e4df1715e4 100644
--- a/env/env.c
+++ b/env/env.c
@@ -292,7 +292,10 @@ int env_init(void)
 	int prio;
 
 	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio)); prio++) {
-		if (!drv->init || !(ret = drv->init()))
+		ret = 0;
+		if (drv->init)
+			ret = drv->init();
+		if (!ret)
 			env_set_inited(drv->location);
 
 		debug("%s: Environment %s init done (ret=%d)\n", __func__,
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
