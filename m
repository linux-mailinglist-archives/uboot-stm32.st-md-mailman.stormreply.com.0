Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF439230702
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2AA4C36B25
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DC17C36B29
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:51 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9oIXS005719; Tue, 28 Jul 2020 11:51:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lC7E40jvhWrNL35QN4nr58/vdpMOdT/T5qDUdW69tME=;
 b=WM7TAHVDPOZnXfUQ60cEa9zCmif4AOC+2Wf/W7v7HvjZAbRXfnemX2D6kL/D6CkvnQLx
 WqpV1JCb/zxqQykibi7Cuc2W9wXePy9LpaBFCr97wFLU+ZWCVJEHa5ImUnwXMP9YsGkT
 61DbE5j0Tr7vTMkTbpcvNs6pBXV+JbtF/4KZZm1PJPQIROh+Ylbn17oBXipy0hGNLgCQ
 4r757JlVCQCx18dFGZrYEc/lGKkW8hOxfUozv2XzUr4W58bZPHw+46t45soCWsKVqflE
 XtojFpxcn8m/kX4usc8G+HdgisVU4pkT81g9fHgH1ICQsY0NAt+MIBIMwWJEcOA+fQbL jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32ga71wkgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F113100034;
 Tue, 28 Jul 2020 11:51:40 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FF722A70DA;
 Tue, 28 Jul 2020 11:51:40 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:39 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:20 +0200
Message-ID: <20200728095128.2363-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728095128.2363-1-patrick.delaunay@st.com>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: Joel Johnson <mrjoel@lixil.net>, Wolfgang Denk <wd@denx.de>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 07/14] cmd: env: add env load command
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

Add the new command env load to load the environment from
the current location gd->env_load_prio.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v3)

Changes in v3:
- new: add 'env load' command

 cmd/Kconfig   |  6 ++++++
 cmd/nvedit.c  | 14 ++++++++++++++
 env/env.c     | 28 ++++++++++++++++++++++++++++
 include/env.h |  7 +++++++
 4 files changed, 55 insertions(+)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index e2b0a4fbc0..4aec6fe844 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -604,6 +604,12 @@ config CMD_NVEDIT_INFO
 	  [-q] : quiet output
 	  The result of multiple evaluations will be combined with AND.
 
+config CMD_NVEDIT_LOAD
+	bool "env load"
+	help
+	  Load all environment variables from the compiled-in persistent
+	  storage.
+
 endmenu
 
 menu "Memory commands"
diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index acd9f82667..f730e2e754 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -794,6 +794,14 @@ U_BOOT_CMD(
 );
 #endif
 #endif
+
+#if defined(CONFIG_CMD_NVEDIT_LOAD)
+static int do_env_load(struct cmd_tbl *cmdtp, int flag, int argc,
+		       char *const argv[])
+{
+	return env_reload() ? 1 : 0;
+}
+#endif
 #endif /* CONFIG_SPL_BUILD */
 
 int env_match(uchar *s1, int i2)
@@ -1346,6 +1354,9 @@ static struct cmd_tbl cmd_env_sub[] = {
 #endif
 #if defined(CONFIG_CMD_NVEDIT_INFO)
 	U_BOOT_CMD_MKENT(info, 3, 0, do_env_info, "", ""),
+#endif
+#if defined(CONFIG_CMD_NVEDIT_LOAD)
+	U_BOOT_CMD_MKENT(load, 1, 0, do_env_load, "", ""),
 #endif
 	U_BOOT_CMD_MKENT(print, CONFIG_SYS_MAXARGS, 1, do_env_print, "", ""),
 #if defined(CONFIG_CMD_RUN)
@@ -1442,6 +1453,9 @@ static char env_help_text[] =
 	"env erase - erase environment\n"
 #endif
 #endif
+#if defined(CONFIG_CMD_NVEDIT_LOAD)
+	"env load - load environment\n"
+#endif
 #if defined(CONFIG_CMD_NVEDIT_EFI)
 	"env set -e [-nv][-bs][-rt][-at][-a][-i addr,size][-v] name [arg ...]\n"
 	"    - set UEFI variable; unset if '-i' or 'arg' not specified\n"
diff --git a/env/env.c b/env/env.c
index 5cf5bd238f..785a2b8552 100644
--- a/env/env.c
+++ b/env/env.c
@@ -230,6 +230,34 @@ int env_load(void)
 	return -ENODEV;
 }
 
+int env_reload(void)
+{
+	struct env_driver *drv;
+
+	drv = env_driver_lookup(ENVOP_LOAD, gd->env_load_prio);
+	if (drv) {
+		int ret;
+
+		printf("Loading Environment from %s... ", drv->name);
+
+		if (!env_has_inited(drv->location)) {
+			printf("not initialized\n");
+			return -ENODEV;
+		}
+
+		ret = drv->load();
+		if (ret)
+			printf("Failed (%d)\n", ret);
+		else
+			printf("OK\n");
+
+		if (!ret)
+			return 0;
+	}
+
+	return -ENODEV;
+}
+
 int env_save(void)
 {
 	struct env_driver *drv;
diff --git a/include/env.h b/include/env.h
index d6c2d751d6..68e0f4fa56 100644
--- a/include/env.h
+++ b/include/env.h
@@ -265,6 +265,13 @@ int env_set_default_vars(int nvars, char *const vars[], int flags);
  */
 int env_load(void);
 
+/**
+ * env_reload() - Re-Load the environment from current storage
+ *
+ * @return 0 if OK, -ve on error
+ */
+int env_reload(void);
+
 /**
  * env_save() - Save the environment to storage
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
