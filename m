Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6915805E
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 18:01:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79DBBC36B09
	for <lists+uboot-stm32@lfdr.de>; Mon, 10 Feb 2020 17:01:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 841F7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Feb 2020 17:01:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01AGwTuc026647; Mon, 10 Feb 2020 18:01:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=++kW+ZiQ9oLk0X50SYnjs8rMvHOxLZuyBZHj3+2dpZ4=;
 b=ybOgSPy0GZPE/KuAKnyQsebN6B4OP0I57wXwQ/ifr2OWABm7HkOscDNxEbiWABRKic7+
 9l20fSvRDdoqJMQgWp7p9mG0IIZnvb8WpEwsMeqC2u36lYc/NULsw5wDVvbXJCXyd/lT
 9LyBmctER6ZQvvmafkNKCMSuzYCsXKX2WCzQXyZSrwdL8qwNahLEm23OPtgBwgqsZzVP
 XyGXTPstDWViAHAJh86i7HhsZ7WdwBgBsql9AUTHH+j8G0kNyLFjeaXDRKsa2c96/eY1
 OqeTOmhJmIgek7OkGA7GAf1gCOdKcW12uaaxo/5yBkjhmeXlW7uiNaqJuezZeIcpjcq7 hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1urguw8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Feb 2020 18:01:36 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A0A1100039;
 Mon, 10 Feb 2020 18:01:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DCBC2AC86A;
 Mon, 10 Feb 2020 18:01:34 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 10 Feb 2020 18:01:33 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 10 Feb 2020 18:01:25 +0100
Message-ID: <20200210180110.v2.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210170129.8405-1-patrick.delaunay@st.com>
References: <20200210170129.8405-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-10_06:2020-02-10,
 2020-02-10 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v2 3/7] cmd: env: check real location for env
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
---

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
