Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B662306F9
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 11:51:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 768B2C36B2D
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jul 2020 09:51:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6D10C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 09:51:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S9m55m020744; Tue, 28 Jul 2020 11:51:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=Ls19rC8OrzMfMp0B5YA04zfToQCHS5TJ2xN3LNksvvc=;
 b=lWZdC9+gC3QdLUA8F655fY5Bf06FOpR70UFzs1CUYMa0ECGsxok2P3GF0JNMNCwu+vgZ
 sFDghKQRSb5jYJNqpRbPkwq3E9hCR9AkuRPjGpItOuCt+IqxfI6qjLqZ134qIlZCbu49
 bq/ppiSJnPhsQ837fuKNDiUPYwp6tuQtuw5XI7C82BrAY+jGPSFDaVNk1Uk6yzQFlVjf
 SMALt3xmSYVkt1x5oxtpOT1QTsMvm/0xSUhjc6TnIL8S3KW2iazMKDqzSt7E+mDVGwtj
 At6zAqWm/yr59B4fRgwvs3g0lDiWgRErueaPGngxzPDd9mkBguQ828C/dPoY37M+g2nF Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gbmg5dxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 11:51:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4479910002A;
 Tue, 28 Jul 2020 11:51:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A61D2A70DA;
 Tue, 28 Jul 2020 11:51:42 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 11:51:41 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jul 2020 11:51:22 +0200
Message-ID: <20200728095128.2363-10-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728095128.2363-1-patrick.delaunay@st.com>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v4 09/14] configs: sandbox: activate env in
	ext4 support
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

Activate ENV in EXT4 support in sandbox.

The sandbox behavior don't change; the default environment with
the nowhere backend (CONFIG_ENV_IS_NOWHERE)is still used:
the weak function env_get_location() return ENVL_NOWHERE for priority 0.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v3)

Changes in v3:
- change env_get_location to avoid gd->env_load_prio modification

 board/sandbox/sandbox.c            | 15 +++++++++++++++
 configs/sandbox64_defconfig        |  4 ++++
 configs/sandbox_defconfig          |  4 ++++
 configs/sandbox_flattree_defconfig |  4 ++++
 configs/sandbox_spl_defconfig      |  4 ++++
 5 files changed, 31 insertions(+)

diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index c1317a8ca3..937ce28411 100644
--- a/board/sandbox/sandbox.c
+++ b/board/sandbox/sandbox.c
@@ -7,6 +7,7 @@
 #include <cpu_func.h>
 #include <cros_ec.h>
 #include <dm.h>
+#include <env_internal.h>
 #include <init.h>
 #include <led.h>
 #include <os.h>
@@ -44,6 +45,20 @@ unsigned long timer_read_counter(void)
 }
 #endif
 
+/* specific order for sandbox: nowhere is the first value, used by default */
+static enum env_location env_locations[] = {
+	ENVL_NOWHERE,
+	ENVL_EXT4,
+};
+
+enum env_location env_get_location(enum env_operation op, int prio)
+{
+	if (prio >= ARRAY_SIZE(env_locations))
+		return ENVL_UNKNOWN;
+
+	return env_locations[prio];
+}
+
 int dram_init(void)
 {
 	gd->ram_size = CONFIG_SYS_SDRAM_SIZE;
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index 5794d1d159..66bf794f7f 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -83,6 +83,10 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox64"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_REGMAP=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 4110497841..a01711cbaf 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -93,6 +93,10 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_REGMAP=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index bea27f68bb..eef7e182f1 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -66,6 +66,10 @@ CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_REGMAP=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index ffb6a6f710..1c3d9a1eae 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -81,6 +81,10 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
 CONFIG_SPL_OF_PLATDATA=y
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
 CONFIG_SPL_DM=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
