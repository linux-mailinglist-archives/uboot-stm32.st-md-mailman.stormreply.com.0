Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC921FAA1D
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 09:41:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F488C36B22
	for <lists+uboot-stm32@lfdr.de>; Tue, 16 Jun 2020 07:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7BC8C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 07:41:02 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05G7e3al007401; Tue, 16 Jun 2020 09:40:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=xCtxeV7yJX84+MQRSAaT37WzdKA6bGfD0uPJNGNi2bg=;
 b=d70iPudoBUIcSi7Zr0RNfJzE1AO6A/k0Jhhhe6ff/x28I/aQuJ4LgCYyE4B5ljYgfrLT
 4YT+YpgUYW/zN5IrjO3f0CDPU0HjfePEtklxp59g3I/nVsUEOLKEAlXqmvh75tPpR8LT
 5YqqsV27t6+cpo89xhDgNMw2Nm+oL3e1L4foz9Irk50aLYuV+x1XYuLwhFB5jzxYZgXI
 HCv5jYeyxFBj9kVSp7hMOFq+ckc3yuOR3Sz7RW4uF7ZKGa73YCVO/O4X7aHFDfdb9Axe
 tfBfeac19jUHhNUwo6yhZVpwCtlkFLh4/RWqRZ3rk9lB9SQu3hlSuNkNRvD79ag4w8tl Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mkx95x26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jun 2020 09:40:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B289E10002A;
 Tue, 16 Jun 2020 09:40:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A867C2AEF93;
 Tue, 16 Jun 2020 09:40:53 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 16 Jun 2020 09:40:53 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 16 Jun 2020 09:40:43 +0200
Message-ID: <20200616074048.7898-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616074048.7898-1-patrick.delaunay@st.com>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-16_02:2020-06-15,
 2020-06-16 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 4/9] sandbox: activate env in ext4 support
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

The default environment is still used with "ENVL_NOWHERE"
indicated by the weak function env_get_location() and
activated by CONFIG_ENV_IS_NOWHERE.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 board/sandbox/sandbox.c            | 12 ++++++++++++
 configs/sandbox64_defconfig        |  4 ++++
 configs/sandbox_defconfig          |  4 ++++
 configs/sandbox_flattree_defconfig |  4 ++++
 configs/sandbox_spl_defconfig      |  4 ++++
 5 files changed, 28 insertions(+)

diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 1372003018..9cb5fe5c75 100644
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
@@ -44,6 +45,17 @@ unsigned long timer_read_counter(void)
 }
 #endif
 
+enum env_location env_get_location(enum env_operation op, int prio)
+{
+	/* only one location supported */
+	if (prio != 0)
+		return ENVL_UNKNOWN;
+
+	gd->env_load_prio = 0;
+
+	return ENVL_NOWHERE;
+}
+
 int dram_init(void)
 {
 	gd->ram_size = CONFIG_SYS_SDRAM_SIZE;
diff --git a/configs/sandbox64_defconfig b/configs/sandbox64_defconfig
index a2410b3368..b70272c0b0 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -81,6 +81,10 @@ CONFIG_OF_CONTROL=y
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
index 0c9e0b9f1f..715f5dc39d 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -90,6 +90,10 @@ CONFIG_OF_CONTROL=y
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
index bc4819f998..ce806270bd 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -64,6 +64,10 @@ CONFIG_AMIGA_PARTITION=y
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
index 64f2ed5102..ea11c9bded 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -80,6 +80,10 @@ CONFIG_SPL_OF_CONTROL=y
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
