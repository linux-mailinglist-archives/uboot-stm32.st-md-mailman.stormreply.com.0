Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F415262F17
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:23:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37F76C3FAE4
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:23:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9A74C3FAE2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:22:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DMkmS030160; Wed, 9 Sep 2020 15:22:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=8eOxfyGghGynX2p3XiqLVRbUe2MNsVQY5tNBDm4MKT0=;
 b=tGvuxhCMODqe6zhGTQwJSU0Eb3WcHPzdkOf+CnUkw22mt6wK0AQnU5Ufr+VUJV81CjoL
 mrDTdRrqg7/XlRGP+psdC5IZcR0P4Be3IJaiKStF1d9BbvIVsYPloebKxQ581q16SLUa
 NB35dCUXpqFu/NHm4t5pPGXr39jL0XgJYneOM7grqI4dbvs1y74Tmz+qaz0amFYj8h/I
 WFNvhpyvxJMrrnj+G4vhoZnshWWvfGRTULuS/1iisIo7huQmEK1wsLBP+D5N5jOQovrP
 7tfZZr4wiucON5vRtzBhPbt/BjxLEQrQBG/Be1JU8MG5tqLewzAUFJkTuxPz2qNfSy7N 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051dc3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:22:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D009B100034;
 Wed,  9 Sep 2020 15:22:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C409B2AD9E9;
 Wed,  9 Sep 2020 15:22:45 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:22:45 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:22:39 +0200
Message-ID: <20200909152228.4.I3e4476ed5db1d186ce48088d1d1e8140510f08ca@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
References: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: Boris Brezillon <bbrezillon@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
 Simon Glass <sjg@chromium.org>, Kever Yang <kever.yang@rock-chips.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 mingming lee <mingming.lee@mediatek.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/4] fastboot: add command to select the eMMC
	boot configuration
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

Add command oem bootbus which executes the command
``mmc bootbus <id> <arg>`` on the current fastboot mmc device
(<i> = CONFIG_FASTBOOT_FLASH_MMC_DEV) to set the eMMC boot
configuration on first update, with
<arg> =  boot_bus_width reset_boot_bus_width boot_mode

$> fastboot oem bootbus:<boot_bus_width> <reset_boot_bus_width> <boot_mode>

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/android/fastboot.rst      |  1 +
 drivers/fastboot/Kconfig      |  7 +++++++
 drivers/fastboot/fb_command.c | 36 +++++++++++++++++++++++++++++++++++
 include/fastboot.h            |  3 +++
 4 files changed, 47 insertions(+)

diff --git a/doc/android/fastboot.rst b/doc/android/fastboot.rst
index 7d69372753..6aa725fcd8 100644
--- a/doc/android/fastboot.rst
+++ b/doc/android/fastboot.rst
@@ -25,6 +25,7 @@ The following OEM commands are supported (if enabled):
 - ``oem format`` - this executes ``gpt write mmc %x $partitions``
 - ``oem partconf`` - this executes ``mmc partconf %x <arg> 0`` to configure eMMC
   with <arg> = boot_ack boot_partition
+- ``oem bootbus``  - this executes ``mmc bootbus %x %s`` to configure eMMC
 
 Support for both eMMC and NAND devices is included.
 
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 1bcc8d4ab9..a17e488714 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -196,6 +196,13 @@ config FASTBOOT_CMD_OEM_PARTCONF
 	  Add support for the "oem partconf" command from a client. This set
 	  the mmc boot-partition for the selecting eMMC device.
 
+config FASTBOOT_CMD_OEM_BOOTBUS
+	bool "Enable the 'oem bootbus' command"
+	depends on FASTBOOT_FLASH_MMC && SUPPORT_EMMC_BOOT
+	help
+	  Add support for the "oem bootbus" command from a client. This set
+	  the mmc boot configuration for the selecting eMMC device.
+
 endif # FASTBOOT
 
 endmenu
diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
index e42c018348..00efd477db 100644
--- a/drivers/fastboot/fb_command.c
+++ b/drivers/fastboot/fb_command.c
@@ -43,6 +43,9 @@ static void oem_format(char *, char *);
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
 static void oem_partconf(char *, char *);
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
+static void oem_bootbus(char *, char *);
+#endif
 
 static const struct {
 	const char *command;
@@ -98,6 +101,12 @@ static const struct {
 		.dispatch = oem_partconf,
 	},
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
+	[FASTBOOT_COMMAND_OEM_BOOTBUS] = {
+		.command = "oem bootbus",
+		.dispatch = oem_bootbus,
+	},
+#endif
 };
 
 /**
@@ -372,3 +381,30 @@ static void oem_partconf(char *cmd_parameter, char *response)
 		fastboot_okay(NULL, response);
 }
 #endif
+
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
+/**
+ * oem_bootbus() - Execute the OEM bootbus command
+ *
+ * @cmd_parameter: Pointer to command parameter
+ * @response: Pointer to fastboot response buffer
+ */
+static void oem_bootbus(char *cmd_parameter, char *response)
+{
+	char cmdbuf[32];
+
+	if (!cmd_parameter) {
+		fastboot_fail("Expected command parameter", response);
+		return;
+	}
+
+	/* execute 'mmc bootbus' command with cmd_parameter arguments*/
+	snprintf(cmdbuf, sizeof(cmdbuf), "mmc bootbus %x %s",
+		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
+	printf("Execute: %s\n", cmdbuf);
+	if (run_command(cmdbuf, 0))
+		fastboot_fail("Cannot set oem bootbus", response);
+	else
+		fastboot_okay(NULL, response);
+}
+#endif
diff --git a/include/fastboot.h b/include/fastboot.h
index 3e68852e9a..966ffc6d94 100644
--- a/include/fastboot.h
+++ b/include/fastboot.h
@@ -39,6 +39,9 @@ enum {
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
 	FASTBOOT_COMMAND_OEM_PARTCONF,
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
+	FASTBOOT_COMMAND_OEM_BOOTBUS,
+#endif
 
 	FASTBOOT_COMMAND_COUNT
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
