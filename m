Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4BD1F9981
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 16:02:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 030BEC36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 14:02:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8F5FC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 14:01:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FDu4gX031917; Mon, 15 Jun 2020 16:01:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MksaQQxtFMTnHf21P7ZDtkidQUpdO5IUkCAP9b13fOc=;
 b=LTj/8g0vs1HH1Mc7iSiM4Mm8jsoWEZfxhEqmyi1cQFilHn98UAu0wd90k7QbxuQdBW6d
 SejOQl9ZVs4TVDZ6QshbNWHRkekJJKWqt3bPn+Ca6gRXOIJyt9rwiltHB4uyaCwGX5G2
 bFS6Vzz79x9ZwLWnF3T5DfYi2Kep11wE2xcIb3yiWiYLJgR5sxZxX9rM+Ej+p+n9vT8Q
 D3oZjsk/rsTa5WqvoaEjL3bb63X8QAxQEeF4r63cnvm0r5t3ztQAP/8njnCoJfJiW7m0
 HIC1glf5lXlZhaLiSBZTbF/Eq5g0oJGxHYAXwA4ktCMu6fLs9yb3rH2I495wi8SzdpsE uQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mnph1snq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 16:01:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9BB5F10003A;
 Mon, 15 Jun 2020 16:01:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89E822B4279;
 Mon, 15 Jun 2020 16:01:41 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 16:01:41 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 16:01:35 +0200
Message-ID: <20200615140137.21186-3-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615140137.21186-1-patrick.delaunay@st.com>
References: <20200615140137.21186-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_03:2020-06-15,
 2020-06-15 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v4 2/4] cmd: env: check real location for env
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

(no changes since v2)

Changes in v2:
- update prototype in env_internal.h  as done in
  "env: add prototypes for weak function"
- remove comment change in env.c (implementation information)
- move env_location declaration

 cmd/nvedit.c           | 15 ++++++++++++---
 include/env_internal.h | 11 +++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 68cb1a4a8f..0f9cea96f3 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1233,6 +1233,9 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
 	int eval_flags = 0;
 	int eval_results = 0;
 	bool quiet = false;
+#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
+	enum env_location loc;
+#endif
 
 	/* display environment information */
 	if (argc <= 1)
@@ -1274,9 +1277,15 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
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
index e89fbdb1b7..66550434c3 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -211,6 +211,17 @@ struct env_driver {
 
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
