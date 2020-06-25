Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E31C209AE7
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC978C36B22
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E94F2C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7vh88016203; Thu, 25 Jun 2020 10:00:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4089hW1W2HhYQ9aFqiVpf3lrdDR5b9dIgEqwfD8JGn8=;
 b=ss95EhWrqyrSHDs40AYUMtQ6ruYZYHRtcKRMDHt+3idRRXdVbXHyftx0GmSXuN20nqeN
 dnyAHMJ0sD0hS29OsKvZEnJMNQaVe5k/Wn4CF9B0zp11+ZfqLTebC/Ng2pnnX7XSiRWe
 as7uFmX6FnaVten2fd3itAk8O3JO/iiN2AgEZu9p0setwInTbYmv1Wtl1UiPVNbAuFUB
 Q7lTiJqsE2sbB3kR3uh+lqt3hvQJYgq5IZD8jStj1ffqO7FyWPjuF+YL6+m7RpW6SKc0
 imZuG2v4Ii0I96sP4O8wZM50PFFqAlNkQLggQtsw0cQNSgWOaAvRa/zd57dC7YdmiEwW gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumgmxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 786E8100034;
 Thu, 25 Jun 2020 10:00:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E83B2A991A;
 Thu, 25 Jun 2020 10:00:26 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:25 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:50 +0200
Message-ID: <20200625075958.9868-7-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 06/14] env: the ops driver load becomes
	mandatory in struct env_driver
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

The ops driver load becomes mandatory in struct env_drive,
change the comment for this ops and remove unnecessary test.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- new: load operation becomes mandatory

 env/env.c              | 3 ---
 include/env_internal.h | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/env/env.c b/env/env.c
index 181aaa222c..a1696cd77e 100644
--- a/env/env.c
+++ b/env/env.c
@@ -187,9 +187,6 @@ int env_load(void)
 	for (prio = 0; (drv = env_driver_lookup(ENVOP_LOAD, prio)); prio++) {
 		int ret;
 
-		if (!drv->load)
-			continue;
-
 		if (!env_has_inited(drv->location))
 			continue;
 
diff --git a/include/env_internal.h b/include/env_internal.h
index 66550434c3..795941daee 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -154,8 +154,7 @@ struct env_driver {
 	/**
 	 * load() - Load the environment from storage
 	 *
-	 * This method is optional. If not provided, no environment will be
-	 * loaded.
+	 * This method is required for loading environment
 	 *
 	 * @return 0 if OK, -ve on error
 	 */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
