Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B540760925
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 17:20:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 810B0C36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri,  5 Jul 2019 15:20:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50128C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2019 15:20:42 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65FGEKE002477; Fri, 5 Jul 2019 17:20:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=iykqLVIf9aGwXT6X2Ezl4qGxKLSRSL1/CVwg0Uz6s7Y=;
 b=UC1MdwNdshKK0r1iDT8lhmjNIqZKfIh8eNk5XzRp3EAxiC/IbNY3/ZrAR/1jhGT6z+L8
 ahcpAl5Vna2O3d69n7VuAZZp1GwaAlSIH6xN033VH9LGo8+U3gFBxXrkgp0Jhr7m2Li/
 ie4mV3csCxk8Dv5RW65WsQPku0WwNzRg4HMrl8zr17mMYFXlNO1/BPsNu/cWUE6SfsNy
 1ckvqnInSNT3Ejy9ob5Br26qb0HehNQlX9LMpVmaanCZbB0jQ5P0Fzn81FWyhLoQTLHm
 GtGdS+XEQOmG3fFtKUCbnkiPXfr9lE3AWtvex8NZ2Yok+gwn1BogvQPE2eOtiG6zl3QG vA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tdxvjkgcx-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 05 Jul 2019 17:20:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5255731;
 Fri,  5 Jul 2019 15:20:39 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E0804FB8;
 Fri,  5 Jul 2019 15:20:39 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019
 17:20:39 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 5 Jul 2019 17:20:38
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 5 Jul 2019 17:20:17 +0200
Message-ID: <1562340023-8516-11-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
References: <1562340023-8516-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 10/16] stm32mp1: key: add stm32key command
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

Add dedicated command to register in fuse a public hash
key provided by keygen tool.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2: None

 arch/arm/mach-stm32mp/Kconfig        |   8 +++
 arch/arm/mach-stm32mp/Makefile       |   1 +
 arch/arm/mach-stm32mp/cmd_stm32key.c | 101 +++++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 arch/arm/mach-stm32mp/cmd_stm32key.c

diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
index 9c5c93c..d13d76e 100644
--- a/arch/arm/mach-stm32mp/Kconfig
+++ b/arch/arm/mach-stm32mp/Kconfig
@@ -90,6 +90,14 @@ config STM32_ETZPC
 	help
 	  Say y to enable STM32 Extended TrustZone Protection
 
+config CMD_STM32KEY
+	bool "command stm32key to fuse public key hash"
+	default y
+	depends on CMD_FUSE
+	help
+		fuse public key hash in corresponding fuse used to authenticate
+		binary.
+
 config BOOTSTAGE_STASH_ADDR
 	default 0xC3000000
 
diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index e59bd81..7745060 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -11,6 +11,7 @@ ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
 obj-y += bsec.o
+obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
 ifndef CONFIG_STM32MP1_TRUSTED
 obj-$(CONFIG_SYSRESET) += cmd_poweroff.o
 endif
diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
new file mode 100644
index 0000000..f1f26e7
--- /dev/null
+++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
+ */
+
+#include <common.h>
+#include <command.h>
+#include <console.h>
+#include <misc.h>
+#include <dm/device.h>
+#include <dm/uclass.h>
+
+#define STM32_OTP_HASH_KEY_START 24
+#define STM32_OTP_HASH_KEY_SIZE 8
+
+static void read_hash_value(u32 addr)
+{
+	int i;
+
+	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
+		printf("OTP value %i: %x\n", STM32_OTP_HASH_KEY_START + i,
+		       __be32_to_cpu(*(u32 *)addr));
+		addr += 4;
+	}
+}
+
+static void fuse_hash_value(u32 addr, bool print)
+{
+	struct udevice *dev;
+	u32 word, val;
+	int i, ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec),
+					  &dev);
+	if (ret) {
+		pr_err("Can't find stm32mp_bsec driver\n");
+		return;
+	}
+
+	for (i = 0; i < STM32_OTP_HASH_KEY_SIZE; i++) {
+		if (print)
+			printf("Fuse OTP %i : %x\n",
+			       STM32_OTP_HASH_KEY_START + i,
+			       __be32_to_cpu(*(u32 *)addr));
+
+		word = STM32_OTP_HASH_KEY_START + i;
+		val = __be32_to_cpu(*(u32 *)addr);
+		misc_write(dev, STM32_BSEC_OTP(word), &val, 4);
+
+		addr += 4;
+	}
+}
+
+static int confirm_prog(void)
+{
+	puts("Warning: Programming fuses is an irreversible operation!\n"
+			"         This may brick your system.\n"
+			"         Use this command only if you are sure of what you are doing!\n"
+			"\nReally perform this fuse programming? <y/N>\n");
+
+	if (confirm_yesno())
+		return 1;
+
+	puts("Fuse programming aborted\n");
+	return 0;
+}
+
+static int do_stm32key(cmd_tbl_t *cmdtp, int flag, int argc,
+		       char * const argv[])
+{
+	u32 addr;
+	const char *op = argc >= 2 ? argv[1] : NULL;
+	int confirmed = argc > 3 && !strcmp(argv[2], "-y");
+
+	argc -= 2 + confirmed;
+	argv += 2 + confirmed;
+
+	if (argc < 1)
+		return CMD_RET_USAGE;
+
+	addr = simple_strtoul(argv[0], NULL, 16);
+	if (!addr)
+		return CMD_RET_USAGE;
+
+	if (!strcmp(op, "read"))
+		read_hash_value(addr);
+
+	if (!strcmp(op, "fuse")) {
+		if (!confirmed && !confirm_prog())
+			return CMD_RET_FAILURE;
+		fuse_hash_value(addr, !confirmed);
+	}
+
+	return CMD_RET_SUCCESS;
+}
+
+U_BOOT_CMD(stm32key, 4, 1, do_stm32key,
+	   "Fuse ST Hash key",
+	   "read <addr>: Read the hash store at addr in memory\n"
+	   "stm32key fuse [-y] <addr> : Fuse hash store at addr in otp\n");
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
