Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD865148537
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 13:34:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F831C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Jan 2020 12:34:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4799C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 12:34:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00OCXxoE000468; Fri, 24 Jan 2020 13:33:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=G6eINdVe0YRtpRquueUdd/9inBP9GQeRWNRZ16NuIto=;
 b=qSR/rCuI+5Ypw8nfRyzhDVj+VhqIZPBI11ZT7GW/06W3RDBRFd1+7W10EMAP/lyyfxNA
 j9OSm4SQb4boIDXLV+LgwbvVxTOF5xLvUfHGfONmgJjLLoVPf9QFbsPAB55oDV1+G7iY
 B2EToKNHH3vsqT95Cn9GQffqD44CPgWaXIDHUhiEGcyGRk+ZjfiUaM9ieXLEgvq+UFtP
 1sZJse3HI3hcmpLee5iRMum5J0WyHu3sLqSknM8lLEJCp17UsPlj6oZqjci2FP26J7Ev
 0tC0tQipCxkGyvMkg2wM0tTzVSRT4Ulq7nzYaEsJvhEesCWYq1LO6gw37PoOK/mw3EEG Xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xksspfmhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jan 2020 13:33:59 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CC69810003D;
 Fri, 24 Jan 2020 13:33:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BDA2F2A76F8;
 Fri, 24 Jan 2020 13:33:51 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 24 Jan 2020 13:33:51 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 24 Jan 2020 13:33:44 +0100
Message-ID: <20200124133332.3.I42c79507524e5ad68e85fd60bbd686c4c59523ae@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124123346.32210-1-patrick.delaunay@st.com>
References: <20200124123346.32210-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-24_03:2020-01-24,
 2020-01-24 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH 3/5] cmd: env: check real location for env
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

 cmd/nvedit.c           | 13 ++++++++++---
 env/env.c              | 18 ------------------
 include/env_internal.h | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 3d1054e763..a37b7c094a 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -1269,9 +1269,16 @@ static int do_env_info(cmd_tbl_t *cmdtp, int flag,
 	/* evaluate whether environment can be persisted */
 	if (eval_flags & ENV_INFO_IS_PERSISTED) {
 #if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
-		if (!quiet)
-			printf("Environment can be persisted\n");
-		eval_results |= ENV_INFO_IS_PERSISTED;
+		enum env_location loc = env_get_location(ENVOP_SAVE,
+							 gd->env_load_prio);
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
diff --git a/env/env.c b/env/env.c
index 9237bb9c74..4e7a3c0c48 100644
--- a/env/env.c
+++ b/env/env.c
@@ -105,24 +105,6 @@ static void env_set_inited(enum env_location location)
 	gd->env_has_init |= BIT(location);
 }
 
-/**
- * env_get_location() - Returns the best env location for a board
- * @op: operations performed on the environment
- * @prio: priority between the multiple environments, 0 being the
- *        highest priority
- *
- * This will return the preferred environment for the given priority.
- * This is overridable by boards if they need to.
- *
- * All implementations are free to use the operation, the priority and
- * any other data relevant to their choice, but must take into account
- * the fact that the lowest prority (0) is the most important location
- * in the system. The following locations should be returned by order
- * of descending priorities, from the highest to the lowest priority.
- *
- * Returns:
- * an enum env_location value on success, a negative error code otherwise
- */
 __weak enum env_location env_get_location(enum env_operation op, int prio)
 {
 	if (prio >= ARRAY_SIZE(env_locations))
diff --git a/include/env_internal.h b/include/env_internal.h
index 90a4df8a72..af29ff0cd6 100644
--- a/include/env_internal.h
+++ b/include/env_internal.h
@@ -209,6 +209,26 @@ struct env_driver {
 
 extern struct hsearch_data env_htab;
 
+/**
+ * env_get_location() - Returns the best env location for a board
+ * @op: operations performed on the environment
+ * @prio: priority between the multiple environments, 0 being the
+ *        highest priority
+ *
+ * This will return the preferred environment for the given priority.
+ * This is overridable by boards if they need to.
+ *
+ * All implementations are free to use the operation, the priority and
+ * any other data relevant to their choice, but must take into account
+ * the fact that the lowest prority (0) is the most important location
+ * in the system. The following locations should be returned by order
+ * of descending priorities, from the highest to the lowest priority.
+ *
+ * Returns:
+ * an enum env_location value on success, a negative error code otherwise
+ */
+enum env_location env_get_location(enum env_operation op, int prio);
+
 #endif /* DO_DEPS_ONLY */
 
 #endif /* _ENV_INTERNAL_H_ */
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
