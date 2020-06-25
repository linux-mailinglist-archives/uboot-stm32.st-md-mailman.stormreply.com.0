Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2F9209AF1
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 10:00:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17135C36B14
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2020 08:00:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD540C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 08:00:55 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7w28C027778; Thu, 25 Jun 2020 10:00:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SonaumrNoXksEY3zjrd7KInMvc1DKcVONf/IyT2LOB0=;
 b=iZ96xQ5KX5d/aOKezwCizaQV2NByNsOk+uJEBRkUfjEUwdDuAHdORze0Jn2b8Mz2KRSQ
 4JLDTD56TdQTcQsL9vJfeLRd1CPjAO+EEjV2XRIHFL2+A2wOUk7MZVV0Bd+ou1LDTTax
 9OrdtXEiCHO8TE7SIY78JWlH96Y/XZFOrgWHPGkSGoEtWMf2Q3lgax7G2c4euDpzDTpT
 WipmypZNfmfsUx7oW+RHMcqiMn9Lg15jSUkhFSkQnE8kiNeS1S2w5hGwgDNoGZE3zeok
 dE94Z/zf86LZWkko34bEAmOJFQrXfpr38ZSDXqr6rL/ecx8jxg8CCiclwn/BGW8dSoMn Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuus0pst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 10:00:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17E15100038;
 Thu, 25 Jun 2020 10:00:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 034852A991A;
 Thu, 25 Jun 2020 10:00:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 25 Jun 2020 10:00:27 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Jun 2020 09:59:52 +0200
Message-ID: <20200625075958.9868-9-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625075958.9868-1-patrick.delaunay@st.com>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: Joel Johnson <mrjoel@lixil.net>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 08/14] cmd: env: add env select command
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

Add the new command 'env select' to force the persistent storage
of environment, saved in gd->env_load_prio.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v3:
- new: add 'env select' command

 cmd/Kconfig   |  5 +++++
 cmd/nvedit.c  | 15 +++++++++++++++
 env/env.c     | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/env.h |  8 +++++++-
 4 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 679b1c32b4..5673b56343 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -616,6 +616,11 @@ config CMD_NVEDIT_LOAD
 	  Load all environment variables from the compiled-in persistent
 	  storage.
 
+config CMD_NVEDIT_SELECT
+	bool "env select"
+	help
+	  Select the compiled-in persistent storage of environment variables.
+
 endmenu
 
 menu "Memory commands"
diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 7a39d9cd66..9fc33d7db1 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -802,6 +802,15 @@ static int do_env_load(struct cmd_tbl *cmdtp, int flag, int argc,
 	return env_reload() ? 1 : 0;
 }
 #endif
+
+#if defined(CONFIG_CMD_NVEDIT_SELECT)
+static int do_env_select(struct cmd_tbl *cmdtp, int flag, int argc,
+			 char *const argv[])
+{
+	return env_select(argv[1]) ? 1 : 0;
+}
+#endif
+
 #endif /* CONFIG_SPL_BUILD */
 
 int env_match(uchar *s1, int i2)
@@ -1367,6 +1376,9 @@ static struct cmd_tbl cmd_env_sub[] = {
 #if defined(CONFIG_CMD_ERASEENV)
 	U_BOOT_CMD_MKENT(erase, 1, 0, do_env_erase, "", ""),
 #endif
+#endif
+#if defined(CONFIG_CMD_NVEDIT_SELECT)
+	U_BOOT_CMD_MKENT(select, 2, 0, do_env_select, "", ""),
 #endif
 	U_BOOT_CMD_MKENT(set, CONFIG_SYS_MAXARGS, 0, do_env_set, "", ""),
 #if defined(CONFIG_CMD_ENV_EXISTS)
@@ -1456,6 +1468,9 @@ static char env_help_text[] =
 #if defined(CONFIG_CMD_NVEDIT_LOAD)
 	"env load - load environment\n"
 #endif
+#if defined(CONFIG_CMD_NVEDIT_SELECT)
+	"env select [target] - select environment target\n"
+#endif
 #if defined(CONFIG_CMD_NVEDIT_EFI)
 	"env set -e [-nv][-bs][-rt][-at][-a][-i addr,size][-v] name [arg ...]\n"
 	"    - set UEFI variable; unset if '-i' or 'arg' not specified\n"
diff --git a/env/env.c b/env/env.c
index 7ad9623ef2..91c76133b0 100644
--- a/env/env.c
+++ b/env/env.c
@@ -340,3 +340,45 @@ int env_init(void)
 
 	return ret;
 }
+
+int env_select(const char *name)
+{
+	struct env_driver *drv;
+	const int n_ents = ll_entry_count(struct env_driver, env_driver);
+	struct env_driver *entry;
+	int prio;
+	bool found = false;
+
+	printf("Select Environment on %s: ", name);
+
+	/* search ENV driver by name */
+	drv = ll_entry_start(struct env_driver, env_driver);
+	for (entry = drv; entry != drv + n_ents; entry++) {
+		if (!strcmp(entry->name, name)) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		printf("driver not found\n");
+		return -ENODEV;
+	}
+
+	/* search priority by driver */
+	for (prio = 0; (drv = env_driver_lookup(ENVOP_INIT, prio)); prio++) {
+		if (entry->location == env_get_location(ENVOP_LOAD, prio)) {
+			/* when priority change, reset the ENV flags */
+			if (gd->env_load_prio != prio) {
+				gd->env_load_prio = prio;
+				gd->env_valid = ENV_INVALID;
+				gd->flags &= ~GD_FLG_ENV_DEFAULT;
+			}
+			printf("OK\n");
+			return 0;
+		}
+	}
+	printf("priority not found\n");
+
+	return -ENODEV;
+}
diff --git a/include/env.h b/include/env.h
index 68e0f4fa56..665857f032 100644
--- a/include/env.h
+++ b/include/env.h
@@ -286,6 +286,13 @@ int env_save(void);
  */
 int env_erase(void);
 
+/**
+ * env_select() - Select the environment storage
+ *
+ * @return 0 if OK, -ve on error
+ */
+int env_select(const char *name);
+
 /**
  * env_import() - Import from a binary representation into hash table
  *
@@ -349,5 +356,4 @@ int env_get_char(int index);
  * This is used for those unfortunate archs with crappy toolchains
  */
 void env_reloc(void);
-
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
