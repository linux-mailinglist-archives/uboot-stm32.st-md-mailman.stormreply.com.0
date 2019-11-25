Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 403351089B6
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 09:07:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A6E7C36B0B
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Nov 2019 08:07:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2328EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2019 08:07:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAP81v0I002917; Mon, 25 Nov 2019 09:07:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=tb1PKLGmlfr3qOyueVFxIFMZJ1WDiBpUNA/lxXv3UgE=;
 b=T/TYzQu/XixaPFJdJn1d50BTumtB3wJxgqYq26V+PAFXv/gtsT3d+MhT5sgzwO2evl+t
 dr7Jj9ub1VatU2vLxwwSZKRlSZggusZsG4WlEd99Mkf7+IgJEyzufw+DUUUfh/D2Uhvy
 vDnjTngOEOj0NvMGLrbVxHnhxs3+CtujhU6q4iTug8Qgft7F+zwE8aO4K8ZmSZeal5QU
 l7wzck630fPX2tYoplNzVmBak3NhRsoP1VskR92tvx+X8yK9pvnmsXol1TmEGpMWhW7l
 46hqMOIKJ0PNreA9z2/BgvW/4/Shb9szhHt9RBW9DeuS7iiecKQQ13VAJlzvhXlVpTaQ bQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2weudvyus3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 09:07:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81AC110002A;
 Mon, 25 Nov 2019 09:07:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72A2A2AC063;
 Mon, 25 Nov 2019 09:07:46 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 25 Nov 2019 09:07:45 +0100
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 25 Nov 2019 09:07:36 +0100
Message-ID: <20191125080741.2215-2-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125080741.2215-1-patrice.chotard@st.com>
References: <20191125080741.2215-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_01:2019-11-21,2019-11-25 signatures=0
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: [Uboot-stm32] [PATCH v3 1/6] cmd: Migrate from_env() from pxe.c to
	nvedit.c
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

Migrate from_env() from pxe.c to nvedit.c as it's not pxe specific.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 cmd/nvedit.c  | 17 +++++++++++++++++
 cmd/pxe.c     | 17 -----------------
 include/env.h | 10 ++++++++++
 3 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/cmd/nvedit.c b/cmd/nvedit.c
index 99a3bc57b1..979def9c9c 100644
--- a/cmd/nvedit.c
+++ b/cmd/nvedit.c
@@ -680,6 +680,23 @@ char *env_get(const char *name)
 	return NULL;
 }
 
+/*
+ * Like env_get, but prints an error if envvar isn't defined in the
+ * environment.  It always returns what env_get does, so it can be used in
+ * place of env_get without changing error handling otherwise.
+ */
+char *from_env(const char *envvar)
+{
+	char *ret;
+
+	ret = env_get(envvar);
+
+	if (!ret)
+		printf("missing environment variable: %s\n", envvar);
+
+	return ret;
+}
+
 /*
  * Look up variable from environment for restricted C runtime env.
  */
diff --git a/cmd/pxe.c b/cmd/pxe.c
index 2059975446..2665c4f88d 100644
--- a/cmd/pxe.c
+++ b/cmd/pxe.c
@@ -37,23 +37,6 @@ const char *pxe_default_paths[] = {
 
 static bool is_pxe;
 
-/*
- * Like env_get, but prints an error if envvar isn't defined in the
- * environment.  It always returns what env_get does, so it can be used in
- * place of env_get without changing error handling otherwise.
- */
-static char *from_env(const char *envvar)
-{
-	char *ret;
-
-	ret = env_get(envvar);
-
-	if (!ret)
-		printf("missing environment variable: %s\n", envvar);
-
-	return ret;
-}
-
 #ifdef CONFIG_CMD_NET
 /*
  * Convert an ethaddr from the environment to the format used by pxelinux
diff --git a/include/env.h b/include/env.h
index b72239f6a5..d6c2d751d6 100644
--- a/include/env.h
+++ b/include/env.h
@@ -113,6 +113,16 @@ int env_match(unsigned char *name, int index);
  */
 char *env_get(const char *varname);
 
+/*
+ * Like env_get, but prints an error if envvar isn't defined in the
+ * environment.  It always returns what env_get does, so it can be used in
+ * place of env_get without changing error handling otherwise.
+ *
+ * @varname:	Variable to look up
+ * @return value of variable, or NULL if not found
+ */
+char *from_env(const char *envvar);
+
 /**
  * env_get_f() - Look up the value of an environment variable (early)
  *
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
