Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7463E15A950
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 13:40:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40A04C36B0C
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 12:40:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ADDEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 12:40:13 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CCCmOX032746; Wed, 12 Feb 2020 13:40:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+cFelkHfxROA+zvwBmrmrfU9swfCgb8N3gTaU9a1Oe4=;
 b=ZiXvi82WLtcircRZ2pZDaSh2IzFPeo9+CsIcs1gyEHits1wBWYpjmmwPF8tQSJRoZZ8D
 isKeG2pyt6o9Gw0/ZYeiF1Sy5jy8OyPtp2E21/r7B0NWqNhYQniZWxjVzPs20JfKaMQb
 1XCDX6lQ8rgk+A65uetqH8bN8QmqRHnJVpaXhYDTV6mNnFgRjI2RKgPvgdvqk86eXPDN
 zGKV/z5S6UNST7TNzxkiGN5h5xUTksvTxjRzGm1KArqmbcd3GZEyYQy4g4nnN8rCQWNq
 042re3JVooU5DoRqgm16cOgRBeb0dc7X02vhEOolT5peAq4gXlwVIW5vSuvd0J80iorz cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9x7tv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 13:40:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC0C6100038;
 Wed, 12 Feb 2020 13:40:05 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CE6F62B1868;
 Wed, 12 Feb 2020 13:40:05 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 13:40:05 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 13:39:56 +0100
Message-ID: <20200212133928.v3.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212124001.12788-1-patrick.delaunay@st.com>
References: <20200212124001.12788-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_06:2020-02-11,
 2020-02-12 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 3/7] cmd: env: check real location for env
	info command
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

Check the current ENV location, dynamically provided by the weak
function env_get_location to be sure that the environment can be
persistent.

The compilation flag ENV_IS_IN_DEVICE is not enough when the board
dynamically select the available storage location (according boot
device for example).

This patch solves issue for stm32mp1 platform, when the boot device
is USB.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

Changes in v3: None
Changes in v2:
- update prototype in env_internal.h  as done in
  "env: add prototypes for weak function"
- remove comment change in env.c (implementation information)
- move env_location declaration

 cmd/nvedit.c           | 15 ++++++++++++---
 include/env_internal.h | 11 +++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 3d1054e763..218fdfbc55 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1228,6 +1228,9 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 	int eval_flags = 0;
 	int eval_results = 0;
 	bool quiet = false;
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
+	enum env_location loc;
+#endif
 
 	/* display environment information */
 	if (argc <= 1)
@@ -1269,9 +1272,15 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 	/* evaluate whether environment can be persisted */
 	if (eval_flags & ENV_INFO_IS_PERSISTED) {
 #if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
-		if (!quiet)
-			printf("Environment can be persisted\n");
-		eval_results |= ENV_INFO_IS_PERSISTED;
+		loc = env_get_location(ENVOP_SAVE, gd->env_load_prio);
+		if (ENVL_NOWHERE != loc && ENVL_UNKNOWN != loc) {
+			if (!quiet)
+				printf("Environment can be persisted\n");
+			eval_results |= ENV_INFO_IS_PERSISTED;
+		} else {
+			if (!quiet)
+				printf("Environment cannot be persisted\n");
+		}
 #else
 		if (!quiet)
 			printf("Environment cannot be persisted\n");
diff --git a/include/env_internal.h b/include/env_internal.h
index 90a4df8a72..cfb60738d0 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -209,6 +209,17 @@ struct env_driver {
 
 extern struct hsearch_data env_htab;
 
+/**
+ * env_get_location()- Provide the best location for the U-Boot environment
+ *
+ * It is a weak function allowing board to overidde the environment location
+ *
+ * @op: operations performed on the environment
+ * @prio: priority between the multiple environments, 0 being the
+ *        highest priority
+ * @return  an enum env_location value on success, or -ve error code.
+ */
+enum env_location env_get_location(enum env_operation op, int prio);
 #endif /* DO_DEPS_ONLY */
 
 #endif /* _ENV_INTERNAL_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
