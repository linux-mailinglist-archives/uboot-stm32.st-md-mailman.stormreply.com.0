Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FF200834
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 13:56:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 517DBC36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 11:56:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02526C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:56:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JBdIWt022929; Fri, 19 Jun 2020 13:56:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MksaQQxtFMTnHf21P7ZDtkidQUpdO5IUkCAP9b13fOc=;
 b=fk3+LFOAbKy7UDDMnSAsL4zr8O9bM/544GxSh5uoM/rU/ULOCHgKhmH4VQ44H8UQxxWX
 TvOHwPfW1l/MBtERajLLb3hEQtkJKuayXGAbDuFq6Xebr4Bj5bqBOpIKMG2aq6g5RNkE
 O0b3ElfROaPVGZrh7abEAr1/x8RHO2c5jVBpsZlpvj66xCYCUvOy+pUNrrX7TiUKXa4m
 qKgWVJveqCe0NOqAemySXzkzDVynNX3sxbcj4Fi7kRVKNKmCGP3QU1ZA73oVNEMRmStC
 hiUaTm5dXTJCT7CxeqiH48LPMunwRqkbvuEruIVo7rVzsn6donI3AKZ0Z5yLLhMk0KRi cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q6jmrhnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 13:56:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BB07100038;
 Fri, 19 Jun 2020 13:56:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 493392BF9CC;
 Fri, 19 Jun 2020 13:56:22 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 19 Jun 2020 13:56:21 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 19 Jun 2020 13:56:09 +0200
Message-ID: <20200619115611.16375-4-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619115611.16375-1-patrick.delaunay@st.com>
References: <20200619115611.16375-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v5 3/5] cmd: env: check real location for env
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
