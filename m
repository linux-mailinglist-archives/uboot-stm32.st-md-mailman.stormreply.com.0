Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C215B01B
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D67DCC36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EC12C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:32 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIgmr6006915; Wed, 12 Feb 2020 19:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=cim5RCor7m9WLRk7j2NFtE/aFBSp+BFFNE7/+z/yRa0=;
 b=dQZ0rOwfFKUiBWTe0GV12q/IWnjAlWEoRSGHFDpoVRPwIElDnXDWfcbNazDeA5tERTJe
 KyjjNbLnGB/h3Rbr0Ta9Ka6GCeKeh6a452g9yTNX3dV6eu08GNEVAzk2HEgWgNiLG/Sz
 A0OgeioPm9K6cIEC6SlD0ws53q0wquuXV+De7j+6K5qlRAtrLEReZQexUsQ+kdpaPaCW
 PymAP4gPdvu2s1b4EETW2DhzSgjU2kIJm1q02G/fpyRFt493ujwLnb9YPdgfFcEnH32L
 YInWFtvZ6alY2+Uj5s2DgRB6skHIgCMc2ywBtFwT2n6D7Yd+7Sa2RCd2+vykEUQbDuQu Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urhg7ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 458C0100040;
 Wed, 12 Feb 2020 19:45:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D3962C60B1;
 Wed, 12 Feb 2020 19:45:06 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:05 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:44:54 +0100
Message-ID: <20200212184501.5911-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Wolfgang Denk <wd@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 03/10] env: correctly handle result in
	env_init
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
