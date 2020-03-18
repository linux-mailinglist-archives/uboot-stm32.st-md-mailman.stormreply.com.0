Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5626189DFE
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 15:36:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F578C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 14:36:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6828AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 14:36:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IERbBH025003; Wed, 18 Mar 2020 15:36:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=7DATlXLfbbizy672FAmSWSxU0zp2aj3/8YXb43hucVg=;
 b=Z45t7lVa+I3l+b+CPBOBwuabZWoqwdROvsUnRFMRkThZE8MwUtRbnGAyUk9lJ7MYT/jQ
 o0Imxd1fDJuXRZzpFQ2/ym1fRQIVskYnomU5RoD5giXWrOzipt35+DP6W/29xwCHULiM
 wtqnUeet8wDCH6zpMD8Nz1J/1ccUOhSU3EUhxky0VgneWcgXwNDOZwZnUKOiybTJQQp1
 Pan4WDresIj6fjQeX5ibaNlFLuU+wfLmYhgqj77sXcJbAHnKUxURPQRAnpb+f3UelzY6
 hWy0BNIYnVsVCE/mPUVs9qiwiFrlTn8zpRJIRCls78t3+dn9janvgFbtQvj+0TIhYt8w dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8etc774-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 15:36:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 36A86100034;
 Wed, 18 Mar 2020 15:36:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 087C82AC800;
 Wed, 18 Mar 2020 15:36:11 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 15:36:10 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 15:36:02 +0100
Message-ID: <20200318143602.23253-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>, Wolfgang Denk <wd@denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Bin Meng <bmeng.cn@gmail.com>, Fabio Estevam <festevam@gmail.com>
Subject: [Uboot-stm32] [RFC RFT PATCH] env: spl: filter the variables in
	default environment of SPL or TPL
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

Use a new option CONFIG_SPL_ENV_VARS to filter the variables included
in the default environment used in SPL (and TPL).

That allows to reduce the size of default_environment[].

If the new configuration flags CONFIG_SPL_ENV_VARS is
- "" the default environment is empty (default)
- list of variables (comma separated) to keept in SPL/TPL
  (it searches ^<var>= in u-boot-initial-env)
- "*" the variables are not filtered

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---
Hi,

I propose this patch to reduce the SPL/TPL size when they support the
U-Boot environment.

But I need feedback, review and test (mainly for first boot when
environment in storage device is empty) to:
- confirm this patch can be acceptable
- confirm my assumptions on the list of variable used in SPL:
  empty by default in this first version.

This patch adds a filter on the environment variables present
in default environment of U-Boot, so SPL/TPL only include the required
variables.

I assumed the SPL/TPL environment can be empty by default (I filter all
the variables) because I think the environment is only needed when it is
loaded from external storage device; on cold boot and before to save env,
the content of default environment it is not necessary (To be confirmed).

For example, with falcon mode SPL need the environment to have the bootcmd
(load address , the file name to load and the the bootargs) only after
a first boot and after a correct 'env save' in U-Boot.

But I can update the default value for CONFIG_SPL_ENV_VARS to add
some generic variable to solve any raised issues:
        .flags
        .callback
        cpu
        arch
        vendor
        soc

PS: the current behavior (no filter) is kept when
    CONFIG_SPL_ENV_VARS = "*"

I propose this patch after remarks on previous patch v4
env: Add CONFIG_ENV_FULL_SUPPORT

http://patchwork.ozlabs.org/patch/1171180/

It is a preliminary step for v5 of this serie.

Patrick


 Makefile              | 32 ++++++++++++++++++++++++++++++--
 env/Kconfig           | 11 +++++++++++
 include/env_default.h |  4 ++++
 3 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index fa687f13a5..425709ed02 100644
--- a/Makefile
+++ b/Makefile
@@ -1843,6 +1843,34 @@ $(timestamp_h): $(srctree)/Makefile FORCE
 $(defaultenv_h): $(CONFIG_DEFAULT_ENV_FILE:"%"=%) FORCE
 	$(call filechk,defaultenv.h)
 
+# ---------------------------------------------------------------------------
+# the SPL default environment is filtered by CONFIG_SPL_ENV_VARS
+spl_defaultenv_h := include/generated/spl_defaultenv_autogenerated.h
+
+quiet_cmd_gensplenv = GENENV $@
+
+ifeq ($(CONFIG_SPL_ENV_VARS),"*")
+cmd_gensplenv = cp $< $@
+else
+ifeq ($(CONFIG_SPL_ENV_VARS),"")
+cmd_gensplenv = echo '\0'  > $@
+else
+# use grep to filter SPL env with patern "^\(var1\|var2\)=",
+# with $CONFIG_SPL_ENV_VARS = "var1,var2"
+cmd_gensplenv = grep "^\($(subst $(comma),\|,$(CONFIG_SPL_ENV_VARS:"%"=%))\)=" $< > $@
+endif
+endif
+
+u-boot-spl-initial-env: u-boot-initial-env FORCE
+	$(call cmd,gensplenv)
+
+$(spl_defaultenv_h): u-boot-spl-initial-env
+	$(call filechk,defaultenv.h)
+
+spl_prepare: prepare $(spl_defaultenv_h)
+
+PHONY += spl_prepare
+
 # ---------------------------------------------------------------------------
 quiet_cmd_cpp_lds = LDS     $@
 cmd_cpp_lds = $(CPP) -Wp,-MD,$(depfile) $(cpp_flags) $(LDPPFLAGS) \
@@ -1855,7 +1883,7 @@ spl/u-boot-spl.bin: spl/u-boot-spl
 	@:
 	$(SPL_SIZE_CHECK)
 
-spl/u-boot-spl: tools prepare \
+spl/u-boot-spl: tools prepare spl_prepare \
 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SPL_OF_PLATDATA),dts/dt.dtb) \
 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_TPL_OF_PLATDATA),dts/dt.dtb)
 	$(Q)$(MAKE) obj=spl -f $(srctree)/scripts/Makefile.spl all
@@ -1872,7 +1900,7 @@ spl/u-boot-spl.sfp: spl/u-boot-spl
 spl/boot.bin: spl/u-boot-spl
 	@:
 
-tpl/u-boot-tpl.bin: tools prepare \
+tpl/u-boot-tpl.bin: tools prepare spl_prepare \
 		$(if $(CONFIG_OF_SEPARATE)$(CONFIG_OF_EMBED)$(CONFIG_SPL_OF_PLATDATA),dts/dt.dtb)
 	$(Q)$(MAKE) obj=tpl -f $(srctree)/scripts/Makefile.spl all
 	$(TPL_SIZE_CHECK)
diff --git a/env/Kconfig b/env/Kconfig
index 0d6f559b39..ff7a8c1d6c 100644
--- a/env/Kconfig
+++ b/env/Kconfig
@@ -588,7 +588,18 @@ config ENV_VARS_UBOOT_RUNTIME_CONFIG
 	  run-time determined information about the hardware to the
 	  environment.  These will be named board_name, board_rev.
 
+config SPL_ENV_VARS
+	string "list of variables keept in SPL/TPL default environment"
+	default ""
+	help
+		List of variables, coma separated, included in the default
+		environment in SPL and TPL.
+		It is used to reduce the size impact of environment in SPL/TPL
+		None variable are included when the option is empty "".
+		The filtre is deactivated when option is "*".
+
 if SPL_ENV_SUPPORT
+
 config SPL_ENV_IS_NOWHERE
 	bool "SPL Environment is not stored"
 	default y if ENV_IS_NOWHERE
diff --git a/include/env_default.h b/include/env_default.h
index 56a8bae39a..9ea6136803 100644
--- a/include/env_default.h
+++ b/include/env_default.h
@@ -21,6 +21,9 @@ static char default_environment[] = {
 #else
 const uchar default_environment[] = {
 #endif
+#ifdef CONFIG_SPL_BUILD
+#include "generated/spl_defaultenv_autogenerated.h"
+#else
 #ifndef CONFIG_USE_DEFAULT_ENV_FILE
 #ifdef	CONFIG_ENV_CALLBACK_LIST_DEFAULT
 	ENV_CALLBACK_VAR "=" CONFIG_ENV_CALLBACK_LIST_DEFAULT "\0"
@@ -114,6 +117,7 @@ const uchar default_environment[] = {
 #else /* CONFIG_USE_DEFAULT_ENV_FILE */
 #include "generated/defaultenv_autogenerated.h"
 #endif
+#endif
 #ifdef DEFAULT_ENV_INSTANCE_EMBEDDED
 	}
 #endif
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
