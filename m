Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C746209AE8
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3B17C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8664BC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:35 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7w0Bi027761; Thu, 25 Jun 2020 10:00:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8++idUnB1CklP0vWbtkIUnJ5rHolSyeDo99NkfScHaU=;
 b=UFvZI+rsR1jijWjNxPDBz9d8CYb14TXhqcZE0Fs6h41l4+E3yZGwJoFfUtTlti1SbYi/
 gyLtlTVAwbVAiFyladK6IeMlGGmL0Tklyj6xfUK4tXWcEtnhKM9s5b8kNAvygVmOZxZe
 yNPkkw0+sOBOi6lI4YiZyjLBw3rlvu/BpCEJajXmuDWA4JT82C8lwU5sQRCjX7lwLK2S
 Oen9UWAVYRD8ba3ZNodBPuoTjV6bXtTqA9FPYgOmts3xSDYwixuyZsJRWzl8ASXhANaU
 +Js1msjDppASlejCK01tAlxnDtlRwLa2Ib5ja/qGkcxlqaPjZv9osbwmNGvYzUeG9xHf ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuus0psn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09BA5100039;
 Thu, 25 Jun 2020 10:00:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0052F2A991C;
 Thu, 25 Jun 2020 10:00:25 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:24 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:48 +0200
Message-ID: <20200625075958.9868-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v3 04/14] env: correctly handle env_load_prio
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

Only update gd->env_load_prio in generic function env_load()
and no more in the weak function env_get_location() which is
called in many place (for example in env_driver_lookup, even
for ENVOP_SAVE operation).

This patch is a preliminary step to use env_driver_lookup()/
env_get_location() in new function env_select() without
updating gd->env_load_prio.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- new

 env/env.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/env/env.c b/env/env.c
index dcc25c030b..181aaa222c 100644
--- a/env/env.c
+++ b/env/env.c
@@ -131,8 +131,6 @@ __weak enum env_location env_get_location(enum env_operation op, int prio)
 	if (prio >= ARRAY_SIZE(env_locations))
 		return ENVL_UNKNOWN;
 
-	gd->env_load_prio = prio;
-
 	return env_locations[prio];
 }
 
@@ -204,6 +202,8 @@ int env_load(void)
 		ret = drv->load();
 		if (!ret) {
 			printf("OK\n");
+			gd->env_load_prio = prio;
+
 			return 0;
 		} else if (ret == -ENOMSG) {
 			/* Handle "bad CRC" case */
@@ -227,7 +227,8 @@ int env_load(void)
 		debug("Selecting environment with bad CRC\n");
 	else
 		best_prio = 0;
-	env_get_location(ENVOP_LOAD, best_prio);
+
+	gd->env_load_prio = best_prio;
 
 	return -ENODEV;
 }
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
