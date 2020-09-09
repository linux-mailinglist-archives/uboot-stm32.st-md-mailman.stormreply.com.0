Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A18262F16
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:23:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31463C3FAE1
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:23:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A944CC3FAE1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:22:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DMjjp030108; Wed, 9 Sep 2020 15:22:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oeONV4cfnVWI0wn+5imCJ+OyHVlAMpZ7GldyZifMR+4=;
 b=vxvMdiOVv2ClyGTkpQZapnvq7YPiUpWWqQMC2ZljGmzByMnelKAI4ft2TwauesriTGiP
 unQmbXpyCd90uFhZjgh4prxkCgqK5lzKA6kFjIO+IZ06ag7qKQKhBnqSS37waHURUMLM
 uqleYckX+YsdmVeqFNuxHt1GOe94vfOJ/e26cd4F9uh3e8kbrErsAevzGkezGGgcAWFu
 mWdzOCr9jqyYlBTIv7baeY6sj2DZrlyDXRJYkzE3pt4cvkfHIOSyYH7UGVXR+6CVJJMT
 Gh2HoH7Lp2pmm6TfMq2zAAxan9BN68TLTUWgQd+Qf5DQtz3iTYA6OnH0Mhxp/PdN5XBe pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c051dc3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:22:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E291010002A;
 Wed,  9 Sep 2020 15:22:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D453B2AD9E9;
 Wed,  9 Sep 2020 15:22:44 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:22:44 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:22:38 +0200
Message-ID: <20200909152228.3.I54be34962a84794d7c1af363107e5194e81f21bf@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
References: <20200909152228.1.I4ae7c1ab59fed4861cde9322a8d12167c9d0187a@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
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
Subject: [Uboot-stm32] [PATCH 3/4] fastboot: add command to select the
	default emmc hwpart for boot
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

Add fastboot command oem partconf which executes the command
``mmc partconf <id> <arg> 0`` on the current <id> mmc device
to configure the eMMC boot partition with
<arg>: boot_ack boot_partition, so the command is:

$> fastboot oem partconf:<boot_ack> <boot_partition>

The partition_access argument is forced to 0 (userdata)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/android/fastboot.rst      |  2 ++
 drivers/fastboot/Kconfig      |  7 +++++++
 drivers/fastboot/fb_command.c | 36 +++++++++++++++++++++++++++++++++++
 include/fastboot.h            |  3 +++
 4 files changed, 48 insertions(+)

diff --git a/doc/android/fastboot.rst b/doc/android/fastboot.rst
index de3f6c37d7..7d69372753 100644
--- a/doc/android/fastboot.rst
+++ b/doc/android/fastboot.rst
@@ -23,6 +23,8 @@ The current implementation supports the following standard commands:
 The following OEM commands are supported (if enabled):
 
 - ``oem format`` - this executes ``gpt write mmc %x $partitions``
+- ``oem partconf`` - this executes ``mmc partconf %x <arg> 0`` to configure eMMC
+  with <arg> = boot_ack boot_partition
 
 Support for both eMMC and NAND devices is included.
 
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 8a92e75007..1bcc8d4ab9 100644
--- a/drivers/fastboot/Kconfig
+++ b/drivers/fastboot/Kconfig
@@ -189,6 +189,13 @@ config FASTBOOT_CMD_OEM_FORMAT
 	  relies on the env variable partitions to contain the list of
 	  partitions as required by the gpt command.
 
+config FASTBOOT_CMD_OEM_PARTCONF
+	bool "Enable the 'oem partconf' command"
+	depends on FASTBOOT_FLASH_MMC && SUPPORT_EMMC_BOOT
+	help
+	  Add support for the "oem partconf" command from a client. This set
+	  the mmc boot-partition for the selecting eMMC device.
+
 endif # FASTBOOT
 
 endmenu
diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
index 49f6a61c37..e42c018348 100644
--- a/drivers/fastboot/fb_command.c
+++ b/drivers/fastboot/fb_command.c
@@ -40,6 +40,9 @@ static void reboot_bootloader(char *, char *);
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
 static void oem_format(char *, char *);
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
+static void oem_partconf(char *, char *);
+#endif
 
 static const struct {
 	const char *command;
@@ -89,6 +92,12 @@ static const struct {
 		.dispatch = oem_format,
 	},
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
+	[FASTBOOT_COMMAND_OEM_PARTCONF] = {
+		.command = "oem partconf",
+		.dispatch = oem_partconf,
+	},
+#endif
 };
 
 /**
@@ -336,3 +345,30 @@ static void oem_format(char *cmd_parameter, char *response)
 	}
 }
 #endif
+
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
+/**
+ * oem_partconf() - Execute the OEM partconf command
+ *
+ * @cmd_parameter: Pointer to command parameter
+ * @response: Pointer to fastboot response buffer
+ */
+static void oem_partconf(char *cmd_parameter, char *response)
+{
+	char cmdbuf[32];
+
+	if (!cmd_parameter) {
+		fastboot_fail("Expected command parameter", response);
+		return;
+	}
+
+	/* execute 'mmc partconfg' command with cmd_parameter arguments*/
+	snprintf(cmdbuf, sizeof(cmdbuf), "mmc partconf %x %s 0",
+		 CONFIG_FASTBOOT_FLASH_MMC_DEV, cmd_parameter);
+	printf("Execute: %s\n", cmdbuf);
+	if (run_command(cmdbuf, 0))
+		fastboot_fail("Cannot set oem partconf", response);
+	else
+		fastboot_okay(NULL, response);
+}
+#endif
diff --git a/include/fastboot.h b/include/fastboot.h
index 1933b1d98e..3e68852e9a 100644
--- a/include/fastboot.h
+++ b/include/fastboot.h
@@ -36,6 +36,9 @@ enum {
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
 	FASTBOOT_COMMAND_OEM_FORMAT,
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
+	FASTBOOT_COMMAND_OEM_PARTCONF,
+#endif
 
 	FASTBOOT_COMMAND_COUNT
 };
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
