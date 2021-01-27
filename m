Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25601305D7B
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Jan 2021 14:47:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35B77C57182;
	Wed, 27 Jan 2021 13:47:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D6E3C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Jan 2021 13:46:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10RDg5xM010574; Wed, 27 Jan 2021 14:46:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=DF7GYR00J7bPWvEtPYaqOoQHRa0nk0GiMtpGiIKhNFY=;
 b=UItLNPFYY30TED8je9zZV4xW+4mDJzcLLNDMNXNZPOr6JaB9Eb18ChW7tEj/Z95y+VhR
 i72gB/hEmdykdWBZSfhihxf0XIPO/SajCFgQB+IvZCbxA0O0Y92NcGkxxH1Kxr6tROY/
 iEvcw9DXZQiDkInjFy+daCjVe0OKF3icXAcArXKMgDS3CIp2380nnrIVNvyxUnlHfhgg
 cjb/pZQcLPo68wR57CujlbbDSRpDCzDwR8vkkju1wPUpbjVNskcenvzP1yGKLSJOa9Tb
 9bJSsGcvLCGrHJhFh7fniSpkiWfkzo2zplatqxz06fv2vAcDnyMSzLLhXZ5rT+vBwvbi JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 368bjngbcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 14:46:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 855BD100038;
 Wed, 27 Jan 2021 14:46:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75F58243713;
 Wed, 27 Jan 2021 14:46:54 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan 2021 14:46:54
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 27 Jan 2021 14:46:48 +0100
Message-ID: <20210127144618.v2.3.I54be34962a84794d7c1af363107e5194e81f21bf@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
References: <20210127134649.27380-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
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
Subject: [Uboot-stm32] [PATCH v2 3/4] fastboot: add command to select the
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

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 doc/android/fastboot.rst      |  2 ++
 drivers/fastboot/Kconfig      |  7 +++++++
 drivers/fastboot/fb_command.c | 36 +++++++++++++++++++++++++++++++++++
 include/fastboot.h            |  3 +++
 4 files changed, 48 insertions(+)

diff --git a/doc/android/fastboot.rst b/doc/android/fastboot.rst
index 2877c3cbaa..d8cb64261c 100644
--- a/doc/android/fastboot.rst
+++ b/doc/android/fastboot.rst
@@ -23,6 +23,8 @@ The current implementation supports the following standard commands:
 The following OEM commands are supported (if enabled):
 
 - ``oem format`` - this executes ``gpt write mmc %x $partitions``
+- ``oem partconf`` - this executes ``mmc partconf %x <arg> 0`` to configure eMMC
+  with <arg> = boot_ack boot_partition
 
 Support for both eMMC and NAND devices is included.
 
diff --git a/drivers/fastboot/Kconfig b/drivers/fastboot/Kconfig
index ef57290876..9bd5597253 100644
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
 config FASTBOOT_USE_BCB_SET_REBOOT_FLAG
 	bool "Use BCB by fastboot to set boot reason"
 	depends on CMD_BCB && !ARCH_MESON && !ARCH_ROCKCHIP && !TARGET_KC1 && \
diff --git a/drivers/fastboot/fb_command.c b/drivers/fastboot/fb_command.c
index d3c578672d..ae4a7dc7fb 100644
--- a/drivers/fastboot/fb_command.c
+++ b/drivers/fastboot/fb_command.c
@@ -42,6 +42,9 @@ static void reboot_recovery(char *, char *);
 #if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_FORMAT)
 static void oem_format(char *, char *);
 #endif
+#if CONFIG_IS_ENABLED(FASTBOOT_CMD_OEM_PARTCONF)
+static void oem_partconf(char *, char *);
+#endif
 
 static const struct {
 	const char *command;
@@ -99,6 +102,12 @@ static const struct {
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
@@ -374,3 +383,30 @@ static void oem_format(char *cmd_parameter, char *response)
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
index 8e9ee80907..86559d1595 100644
--- a/include/fastboot.h
+++ b/include/fastboot.h
@@ -38,6 +38,9 @@ enum {
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
