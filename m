Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C52D315B012
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 19:45:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89FC5C36B09
	for <lists+uboot-stm32@lfdr.de>; Wed, 12 Feb 2020 18:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E1BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 18:45:15 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CIg6Yw021881; Wed, 12 Feb 2020 19:45:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=mOa3ahmlChe1QUYJY9Arw5xK8S6n8XkryXANfGc9gME=;
 b=n93YE0io000BnAKpGCX8p6OsQZcR4Lbl4TBh6L6vq3F4KajTxtwDBXSHsgKvDKhltnkm
 +seCYQb+ew8aGFkkEstfBk31egNfRL1txWu1VYr0XUcF7wbPO8HbuNaDGBH4/7Gbz/ZP
 dN03DWQkp+PdpAzyBhNll679oWhF1yhxk/dwI0vrc4zDjPGMZQsbWcxdEmCPvK+xUOuK
 fohV2I+2LeMPU6Z/88kVfwXXN9ipi7DOhXt5iHvAaMT4iZHarRHL59sk4oOZAbYL2q1j
 x5IhzxZbykHQhJ4Ipdzk1B1va4wqu7g6CG0uFcbGt4vJtOXzTCayYElhS7wVlrxRPuix RA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1uvdqv1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 19:45:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 56E46100042;
 Wed, 12 Feb 2020 19:45:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DBF52C60B1;
 Wed, 12 Feb 2020 19:45:07 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 12 Feb 2020 19:45:06 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 12 Feb 2020 19:44:55 +0100
Message-ID: <20200212184501.5911-5-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212184501.5911-1-patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-12,
 2020-02-12 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [RESEND PATCH 04/10] sandbox: activate env in ext4
	support
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
---

 board/sandbox/sandbox.c            | 12 ++++++++++++
 configs/sandbox64_defconfig        |  4 ++++
 configs/sandbox_defconfig          |  4 ++++
 configs/sandbox_flattree_defconfig |  4 ++++
 configs/sandbox_spl_defconfig      |  4 ++++
 5 files changed, 28 insertions(+)

diff --git a/board/sandbox/sandbox.c b/board/sandbox/sandbox.c
index 0c3d245dff..01f356be31 100644
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
index cdcb0acbdc..6172259924 100644
--- a/configs/sandbox64_defconfig
+++ b/configs/sandbox64_defconfig
@@ -75,6 +75,10 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox64"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 33a103edab..28a6211189 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -84,6 +84,10 @@ CONFIG_OF_CONTROL=y
 CONFIG_OF_LIVE=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
diff --git a/configs/sandbox_flattree_defconfig b/configs/sandbox_flattree_defconfig
index 2bfbb66453..1324aaca37 100644
--- a/configs/sandbox_flattree_defconfig
+++ b/configs/sandbox_flattree_defconfig
@@ -59,6 +59,10 @@ CONFIG_AMIGA_PARTITION=y
 CONFIG_OF_CONTROL=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
diff --git a/configs/sandbox_spl_defconfig b/configs/sandbox_spl_defconfig
index 3bf27c974a..eadcdb9f43 100644
--- a/configs/sandbox_spl_defconfig
+++ b/configs/sandbox_spl_defconfig
@@ -76,6 +76,10 @@ CONFIG_SPL_OF_CONTROL=y
 CONFIG_OF_HOSTFILE=y
 CONFIG_DEFAULT_DEVICE_TREE="sandbox"
 CONFIG_SPL_OF_PLATDATA=y
+CONFIG_ENV_IS_NOWHERE=y
+CONFIG_ENV_IS_IN_EXT4=y
+CONFIG_ENV_EXT4_INTERFACE="host"
+CONFIG_ENV_EXT4_DEVICE_AND_PART="0:0"
 CONFIG_SYS_RELOC_GD_ENV_ADDR=y
 CONFIG_NETCONSOLE=y
 CONFIG_IP_DEFRAG=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
