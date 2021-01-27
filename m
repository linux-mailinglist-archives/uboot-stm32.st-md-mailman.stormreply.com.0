Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26947305D7C
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 14:47:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E18F5C57182;
	Wed, 27 Jan 2021 13:47:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F8C8C57183
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 13:47:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RDh36S006395; Wed, 27 Jan 2021 14:46:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=JAof3K5UlQCZOfYNS1KzVKHC6nJwMhCeGVdbBHGSL8w=;
 b=Bp/n+PW/Vwjltv+W5d9oJv/Obw3iDVnw8djHGsBBdTCl4A5pu2stpAi13WnLvkBtEDzG
 sFp96SE7CmFerxgWMpMoK9f8kWYizB4k5juk/DConStDVH9cRQthANsTGseJMQw2oJFg
 MXIHa1nX5oOZX3yS8EV9A81RC/NOyFbBVb7Z49J54erPCAOnSW/NYVINl2gAwdX1sdOb
 iDtguaraNNU5K3Eg4hRdaIAw0iUFeW0VX0OPLQgX0SfpN16ykGrP4QaeiwsyENSwFRUG
 ZR6PStkPCckp7K5sldVf0F2S6BiTH8a97xuHJJGx3sT240K6StspVx/wY/UOfIbc9qrO 7g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3689te0n9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:46:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A0E8100038;
 Wed, 27 Jan 2021 14:46:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B48E243713;
 Wed, 27 Jan 2021 14:46:55 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan 2021 14:46:55
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Jan 2021 14:46:49 +0100
Message-ID: <20210127144618.v2.4.I3e4476ed5db1d186ce48088d1d1e8140510f08ca@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
References: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
 Filip Brozovic <fbrozovic@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sam Protsenko <joe.skb7@gmail.com>,
 Roman Stratiienko <r.stratiienko@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 4/4] fastboot: add command to select the
	eMMC boot configuration
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 doc/android/fastboot.rst      |  1 +
 drivers/fastboot/Kconfig      |  7 +++++++
 drivers/fastboot/fb_command.c | 36 +++++++++++++++++++++++++++++++++++
 include/fastboot.h            |  3 +++
 4 files changed, 47 insertions(+)

diff --git a/doc/android/fastboot.rst b/doc/android/fastboot.rst
index d8cb64261c..16b11399b3 100644
--- a/doc/android/fastboot.rst
+++ b/doc/android/fastboot.rst
@@ -25,6 +25,7 @@ The following OEM commands are supported (if enabled):
 - ``oem format`` - this executes ``gpt write mmc %x $partitions``
 - ``oem partconf`` - this executes ``mmc partconf %x <arg> 0`` to configure eMMC
   with <arg> = boot_ack boot_partition
+- ``oem bootbus``  - this executes ``mmc bootbus %x %s`` to configure eMMC
 
 Support for both eMMC and NAND devices is included.
 
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index 9bd5597253..5f2e109759 100644
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
 config FASTBOOT_USE_BCB_SET_REBOOT_FLAG
 	bool "Use BCB by fastboot to set boot reason"
 	depends on CMD_BCB && !ARCH_MESON && !ARCH_ROCKCHIP && !TARGET_KC1 && \
diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
index ae4a7dc7fb..41fc8d7904 100644
--- a/drivers/fastboot/fb_command.c
+++ b/drivers/fastboot/fb_command.c
@@ -45,6 +45,9 @@ static void oem_format(char *, char *);
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
 static void oem_partconf(char *, char *);
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_BOOTBUS)
+static void oem_bootbus(char *, char *);
+#endif
 
 static const struct {
 	const char *command;
@@ -108,6 +111,12 @@ static const struct {
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
@@ -410,3 +419,30 @@ static void oem_partconf(char *cmd_parameter, char *response)
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
index 86559d1595..3df7e6b81f 100644
--- a/include/fastboot.h
+++ b/include/fastboot.h
@@ -41,6 +41,9 @@ enum {
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
