Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF3A7167
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Sep 2019 19:09:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94364C36B3F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Sep 2019 17:09:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E8DBC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Sep 2019 17:09:28 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83H1cZL014681; Tue, 3 Sep 2019 19:09:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=W4dkzKoNli17c7NzIp5F5uEhmh9H1z2lMXOuzSnEtHo=;
 b=JcvbxasLfXjt8Rw7knkUFKwTcmRTex6jrCWFeNJg6jcN+Bhr3rKeUdmpuggLP6jKGrnO
 s19jPDg7Ji13QkNsb11TWb1/PAqndAbtxkfyVmHuJxwaoZezNAMCOBwZ4ccSMG5o1vp0
 kp9LKOn34/Lr2cdJqOxQmXtCbAIzi5/NfvLWSw2dJOO4zIEZUK1Hinh0y2VwBHLtt7Kq
 IQxCjgLcn4dJI9reO554/mvJtg2CIeqPQuFJxeuC3hhAlw6d1ABQKGjci8co/KQY55VD
 Jn1vA31a4GN1pPAbjbQ10g1TNzN7y90UGdYhHfLc3aTh0nGXP+696rc/4qZfIrzAEzog ug== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2uqe19mcap-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 03 Sep 2019 19:09:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DD4722;
 Tue,  3 Sep 2019 17:09:13 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 624132CE1C7;
 Tue,  3 Sep 2019 19:09:12 +0200 (CEST)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.46) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Sep 2019
 19:09:12 +0200
Received: from localhost (10.48.1.189) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Tue, 3 Sep 2019 19:09:11 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 3 Sep 2019 19:09:06 +0200
Message-ID: <1567530547-14331-1-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.48.1.189]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-03_03:2019-09-03,2019-09-03 signatures=0
Cc: Hamish Guthrie <hamish.guthrie@kistler.com>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Markus Klotzbuecher <markus.klotzbuecher@kistler.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Anup Patel <Anup.Patel@wdc.com>,
 Lukasz Majewski <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Michal Simek <michal.simek@xilinx.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Ruslan Trofymenko <ruslan.trofymenko@linaro.org>, Heiko Schocher <hs@denx.de>,
 Adam Ford <aford173@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: [Uboot-stm32] [PATCH] env: Add CONFIG_ENV_SUPPORT
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

Add a new flag CONFIG_ENV_SUPPORT to compile all
the environment features in U-Boot (attributes, callbacks
and flags). It is the equivalent of the 2 existing flags
- CONFIG_SPL_ENV_SUPPORT for SPL
- CONFIG_TPL_ENV_SUPPORT for TPL

This new configuration allows to use the macro
CONFIG_IS_ENABLED(ENV_SUPPORT) in the code without
issue and solves the regression introduced by
commit 7d4776545b0f ("env: solve compilation error
in SPL"); change_ok was always NULL in U-Boot.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 cmd/Kconfig            |  2 ++
 env/Kconfig            |  7 +++++++
 env/Makefile           | 11 ++++-------
 include/env_callback.h |  4 ++++
 include/env_flags.h    |  4 ++++
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/cmd/Kconfig b/cmd/Kconfig
index 05872fa..f7a1b1f 100644
--- a/cmd/Kconfig
+++ b/cmd/Kconfig
@@ -465,6 +465,7 @@ config CMD_ENV_EXISTS
 
 config CMD_ENV_CALLBACK
 	bool "env callbacks - print callbacks and their associated variables"
+	depends on ENV_SUPPORT
 	help
 	  Some environment variable have callbacks defined by
 	  U_BOOT_ENV_CALLBACK. These are called when the variable changes.
@@ -473,6 +474,7 @@ config CMD_ENV_CALLBACK
 
 config CMD_ENV_FLAGS
 	bool "env flags -print variables that have non-default flags"
+	depends on ENV_SUPPORT
 	help
 	  Some environment variables have special flags that control their
 	  behaviour. For example, serial# can only be written once and cannot
diff --git a/env/Kconfig b/env/Kconfig
index 74db2f3..f0c5a7a 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -1,5 +1,12 @@
 menu "Environment"
 
+config ENV_SUPPORT
+	bool "Support all environment features"
+	default y
+	help
+	  Enable full environment support in U-Boot,
+	  including attributes, callbacks and flags.
+
 config ENV_IS_NOWHERE
 	bool "Environment is not stored"
 	default y if !ENV_IS_IN_EEPROM && !ENV_IS_IN_EXT4 && \
diff --git a/env/Makefile b/env/Makefile
index 90144d6..2a468ac 100644
--- a/env/Makefile
+++ b/env/Makefile
@@ -5,10 +5,11 @@
 
 obj-y += common.o env.o
 
+obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += attr.o
+obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += flags.o
+obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += callback.o
+
 ifndef CONFIG_SPL_BUILD
-obj-y += attr.o
-obj-y += callback.o
-obj-y += flags.o
 obj-$(CONFIG_ENV_IS_IN_EEPROM) += eeprom.o
 extra-$(CONFIG_ENV_IS_EMBEDDED) += embedded.o
 obj-$(CONFIG_ENV_IS_IN_EEPROM) += embedded.o
@@ -19,10 +20,6 @@ obj-$(CONFIG_ENV_IS_IN_ONENAND) += onenand.o
 obj-$(CONFIG_ENV_IS_IN_SATA) += sata.o
 obj-$(CONFIG_ENV_IS_IN_REMOTE) += remote.o
 obj-$(CONFIG_ENV_IS_IN_UBI) += ubi.o
-else
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += attr.o
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += flags.o
-obj-$(CONFIG_$(SPL_TPL_)ENV_SUPPORT) += callback.o
 endif
 
 obj-$(CONFIG_$(SPL_TPL_)ENV_IS_NOWHERE) += nowhere.o
diff --git a/include/env_callback.h b/include/env_callback.h
index 982c078..a757fe6 100644
--- a/include/env_callback.h
+++ b/include/env_callback.h
@@ -72,6 +72,10 @@
 	"serial#:serialno," \
 	CONFIG_ENV_CALLBACK_LIST_STATIC
 
+#if CONFIG_IS_ENABLED(ENV_SUPPORT)
 void env_callback_init(struct env_entry *var_entry);
+#else
+static inline void env_callback_init(struct env_entry *var_entry) { }
+#endif
 
 #endif /* __ENV_CALLBACK_H__ */
diff --git a/include/env_flags.h b/include/env_flags.h
index e5380f2..ec480e3 100644
--- a/include/env_flags.h
+++ b/include/env_flags.h
@@ -153,7 +153,11 @@ int env_flags_validate_env_set_params(char *name, char *const val[], int count);
  * When adding a variable to the environment, initialize the flags for that
  * variable.
  */
+#if CONFIG_IS_ENABLED(ENV_SUPPORT)
 void env_flags_init(struct env_entry *var_entry);
+#else
+static inline void env_flags_init(struct env_entry *var_entry) { }
+#endif
 
 /*
  * Validate the newval for to conform with the requirements defined by its flags
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
