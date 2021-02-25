Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5DC324FE4
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Feb 2021 13:37:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20FC9C57B62;
	Thu, 25 Feb 2021 12:37:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E2D2C3FADC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 12:37:09 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PCb5Cd013982; Thu, 25 Feb 2021 13:37:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=ugXIaFyGW1VQhZqGNEnAu9CyC07ZhTPhnxMQ+sG4nLc=;
 b=PhEYANhScmUrkXbszNktdJu9ZyPg7S8bMv5mfaIZqTEr6jixAdF5v6zJN6FTLCMpUGlb
 HhRuFsL6zVTxDYnwVM0xWhEiCE6qwAqxEltFkhCyW82jUOU5ivuw/HAgwhZit1cEA+wK
 7uiYEgo0GYRut9ltG/rZFR8wtrbSpG75xm/l4hVX42EPCTqNLWA1N/iBbWW10BalBn8c
 04EaYvajp4FJ7WfsvLQ3hIMDSTLAjRRsmqLmB4HAHDD9rkIHnUV8N9zwHLrO9jV091tP
 KE9FYDmM+tw+2rTVA4YTaHYJEYkLja4ovhzbB5rWWvGMPG0VIHl8p+A7TnihJVSyyvEx 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66u5q0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 13:37:07 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9DE93100034;
 Thu, 25 Feb 2021 13:37:06 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 908AC22D616;
 Thu, 25 Feb 2021 13:37:06 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb 2021 13:37:06
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 25 Feb 2021 13:37:01 +0100
Message-ID: <20210225133652.2.I60352ed0b0f59ee019230f63aaa3c45fd4438531@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
References: <20210225133652.1.I2edaac51f69d6eb9e62ab7aeb01a3f352a364af5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_07:2021-02-24,
 2021-02-25 signatures=0
Cc: Simon Glass <sjg@chromium.org>, Patrick
 Delaunay <patrick.delaunay@st.com>, U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [Uboot-stm32] [PATCH 2/4] stm32mp: stm32prog: Add
	CONFIG_CMD_STM32PROG_SERIAL and _USB
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

Add CONFIG_CMD_STM32PROG_SERIAL and CONFIG_CMD_STM32PROG_USB to
independently select the support of UART or USB communication for
STM32CubeProgrammer.

For serial boot over UART, user can deactivate CONFIG_CMD_STM32PROG_SERIAL
to use U-Boot console of binary loaded by UART (for board bring-up for
example).

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/Makefile                |  2 +-
 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   | 20 ++++++++++++++--
 arch/arm/mach-stm32mp/cmd_stm32prog/Makefile  |  8 +++----
 .../cmd_stm32prog/cmd_stm32prog.c             |  4 ++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    | 23 ++++++++++++++++++-
 arch/arm/mach-stm32mp/cpu.c                   |  5 ++--
 board/st/common/stm32mp_dfu.c                 |  9 ++++----
 7 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
index c8aa24d489..aa39867080 100644
--- a/arch/arm/mach-stm32mp/Makefile
+++ b/arch/arm/mach-stm32mp/Makefile
@@ -11,7 +11,7 @@ obj-y += bsec.o
 ifdef CONFIG_SPL_BUILD
 obj-y += spl.o
 else
-obj-$(CONFIG_CMD_STM32PROG) += cmd_stm32prog/
+obj-y += cmd_stm32prog/
 obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
 obj-$(CONFIG_ARMV7_PSCI) += psci.o
 obj-$(CONFIG_TFABOOT) += boot_params.o
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
index 609a678793..f4c0d18d4d 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
@@ -11,8 +11,24 @@ config CMD_STM32PROG
 	imply DFU_MTD if MTD
 	help
 		activate a specific command stm32prog for STM32MP soc family
-		witch update the device with the tools STM32CubeProgrammer,
-		using UART with STM32 protocol or USB with DFU protocol
+		witch update the device with the tools STM32CubeProgrammer
 		NB: access to not volatile memory (NOR/NAND/SD/eMMC) is based
 		    on U-Boot DFU framework
 
+config CMD_STM32PROG_USB
+	bool "support stm32prog over USB"
+	depends on CMD_STM32PROG
+	default y
+	help
+		activate the command "stm32prog usb" for STM32MP soc family
+		witch update the device with the tools STM32CubeProgrammer,
+		using USB with DFU protocol
+
+config CMD_STM32PROG_SERIAL
+	bool "support stm32prog over UART"
+	depends on CMD_STM32PROG
+	default y
+	help
+		activate the command "stm32prog serial" for STM32MP soc family
+		with the tools STM32CubeProgrammer using U-Boot serial device
+		and UART protocol.
\ No newline at end of file
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
index 548a378921..b57e1bf870 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Makefile
@@ -3,7 +3,7 @@
 # Copyright (C) 2020, STMicroelectronics - All Rights Reserved
 #
 
-obj-y += cmd_stm32prog.o
-obj-y += stm32prog.o
-obj-y += stm32prog_serial.o
-obj-y += stm32prog_usb.o
+obj-$(CONFIG_CMD_STM32PROG) += cmd_stm32prog.o
+obj-$(CONFIG_CMD_STM32PROG) += stm32prog.o
+obj-$(CONFIG_CMD_STM32PROG_SERIAL) += stm32prog_serial.o
+obj-$(CONFIG_CMD_STM32PROG_USB) += stm32prog_usb.o
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
index 34a6be66c3..a7e2861764 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/cmd_stm32prog.c
@@ -50,9 +50,9 @@ static int do_stm32prog(struct cmd_tbl *cmdtp, int flag, int argc,
 	if (argc < 3 ||  argc > 5)
 		return CMD_RET_USAGE;
 
-	if (!strcmp(argv[1], "usb"))
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_USB) && !strcmp(argv[1], "usb"))
 		link = LINK_USB;
-	else if (!strcmp(argv[1], "serial"))
+	else if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) && !strcmp(argv[1], "serial"))
 		link = LINK_SERIAL;
 
 	if (link == LINK_UNDEFINED) {
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index be482c3402..18af99c78b 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -177,9 +177,30 @@ char *stm32prog_get_error(struct stm32prog_data *data);
 
 /* Main function */
 int stm32prog_init(struct stm32prog_data *data, ulong addr, ulong size);
+void stm32prog_clean(struct stm32prog_data *data);
+
+#ifdef CONFIG_CMD_STM32PROG_SERIAL
 int stm32prog_serial_init(struct stm32prog_data *data, int link_dev);
 bool stm32prog_serial_loop(struct stm32prog_data *data);
+#else
+static inline int stm32prog_serial_init(struct stm32prog_data *data, int link_dev)
+{
+	return -ENOSYS;
+}
+
+static inline bool stm32prog_serial_loop(struct stm32prog_data *data)
+{
+	return false;
+}
+#endif
+
+#ifdef CONFIG_CMD_STM32PROG_USB
 bool stm32prog_usb_loop(struct stm32prog_data *data, int dev);
-void stm32prog_clean(struct stm32prog_data *data);
+#else
+static inline bool stm32prog_usb_loop(struct stm32prog_data *data, int dev)
+{
+	return false;
+}
+#endif
 
 #endif
diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 3faa4ec18a..a453f89d02 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -265,7 +265,8 @@ int arch_cpu_init(void)
 
 	boot_mode = get_bootmode();
 
-	if ((boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) &&
+	    (boot_mode & TAMP_BOOT_DEVICE_MASK) == BOOT_SERIAL_UART)
 		gd->flags |= GD_FLG_SILENT | GD_FLG_DISABLE_CONSOLE;
 #if defined(CONFIG_DEBUG_UART) && \
 	!defined(CONFIG_TFABOOT) && \
@@ -485,7 +486,7 @@ static void setup_boot_mode(void)
 		env_set("boot_instance", cmd);
 
 		/* restore console on uart when not used */
-		if (gd->cur_serial_dev != dev) {
+		if (IS_ENABLED(CONFIG_CMD_STM32PROG_SERIAL) && gd->cur_serial_dev != dev) {
 			gd->flags &= ~(GD_FLG_SILENT |
 				       GD_FLG_DISABLE_CONSOLE);
 			printf("serial boot with console enabled!\n");
diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index 5633a6cb95..00d1fb8f59 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -143,7 +143,8 @@ void set_dfu_alt_info(char *interface, char *devstr)
 			board_get_alt_info_mtd(mtd, buf);
 	}
 
-	if (IS_ENABLED(CONFIG_DFU_VIRT)) {
+	if (IS_ENABLED(CONFIG_DFU_VIRT) &&
+	    IS_ENABLED(CMD_STM32PROG_USB)) {
 		strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
 
 		if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
@@ -217,7 +218,7 @@ int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 		return dfu_pmic_read(offset, buf, len);
 	}
 
-	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_USB) &&
 	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
 		return stm32prog_read_medium_virt(dfu, offset, buf, len);
 
@@ -228,7 +229,7 @@ int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
 			  void *buf, long *len)
 {
-	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_USB) &&
 	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
 		return stm32prog_write_medium_virt(dfu, offset, buf, len);
 
@@ -237,7 +238,7 @@ int dfu_write_medium_virt(struct dfu_entity *dfu, u64 offset,
 
 int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
 {
-	if (CONFIG_IS_ENABLED(CMD_STM32PROG) &&
+	if (IS_ENABLED(CONFIG_CMD_STM32PROG_USB) &&
 	    dfu->data.virt.dev_num >= STM32PROG_VIRT_FIRST_DEV_NUM)
 		return stm32prog_get_medium_size_virt(dfu, size);
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
