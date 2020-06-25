Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC8209AEE
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 045FDC36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDF3DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:43 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7vlPT016218; Thu, 25 Jun 2020 10:00:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=2Hp++4Cc1txUUoI/yU2a/DWZm8W9VWCt4TbIiYnEtTM=;
 b=bvl/qE6tCYuNJYmr7SqgRPOoVpYtRxz3O1p48aPSI7d8IUP50FuYVoaDaRdp6QebiWMd
 ZTH/gg7to33nfhgTVeJvEqGqhxe5EujmsXS/KcBp+djISu9nhRfSADhTTil4lwZV7oHY
 NxX1vCw676EglmRnwiYaaZvQH2FYnYmruuL8Qv8zv8QA9sN2VaAVqb7IoQtuiHsl+vTL
 reApJYvDSo/9vOf5n+ZjHEdphtMFXCeKSJnoyvbDLQZldXzSh6JDyGZfpUFLGK+5WVGD
 4vnEWdlfIOPpz19WM0osokid86R/DCWFvkmVzcNep9UfFMFpolMJetoDCi+5GEjn9KeS zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuumgmxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 53278100039;
 Thu, 25 Jun 2020 10:00:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 388E82A991A;
 Thu, 25 Jun 2020 10:00:27 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:26 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:51 +0200
Message-ID: <20200625075958.9868-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 07/14] cmd: env: add env load command
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

Changes in v3:
- new: add 'env load' command

 cmd/Kconfig   |  6 ++++++
 cmd/nvedit.c  | 14 ++++++++++++++
 env/env.c     | 28 ++++++++++++++++++++++++++++
 include/env.h |  7 +++++++
 4 files changed, 55 insertions(+)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 1de57988ae..679b1c32b4 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -610,6 +610,12 @@ config CMD_NVEDIT_INFO
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
index 0f9cea96f3..7a39d9cd66 100644
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
index a1696cd77e..7ad9623ef2 100644
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
