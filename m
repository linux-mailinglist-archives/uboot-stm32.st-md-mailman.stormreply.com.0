Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896514EEA2
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 15:40:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62499C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jan 2020 14:40:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16884C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 14:40:10 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00VENPOD001705
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=qsUwdeQd7m8kz9tTGJahEiUJaFJ7uVWie5I+Nm49pOg=;
 b=IpDmnY/u5z+zHtoteShItDQiXs45JvXk8qhp+laWdMcY5tIMvBw38T7W/RlQkl7VFjGX
 maYsxfjqDf7GkWc+jITpwt6y4c4V7FqaSUbwaUb+dVtN7ZkbScrr7JVUvWOJ8QxRyS93
 YhmseE6qlI4Gfu/YpHVvdhinKsyEHLkHhJzbWgv7m79oZDoC9hIUFRRWu27sneHNT/pi
 xVu1wSdusKsqrH562aa4JSJugv9Nh3UlV6b3yeQ7t7oN8BMEGfhQ6kggA/506R5+QAzs
 iOnp2UrgRj/7CB0LEw+YXwI/PTsYsG2olvPxBCysddh2Z6gyztAVYxLJjaLm+aIt7Y4S Dw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrcayecey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Fri, 31 Jan 2020 15:40:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D7F6100034
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 266662BF9CB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jan 2020 15:40:09 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jan 2020 15:40:08 +0100
From: <patrice.chotard@st.com>
To: <patrice.chotard@st.com>, <alexandre.torgue@st.com>,
 <loic.pallardy@st.com>, <benjamin.gaignard@st.com>,
 <gerald.baeza@st.com>, <kamel.kholti@st.com>
Date: Fri, 31 Jan 2020 15:40:03 +0100
Message-ID: <20200131144004.3396-3-patrice.chotard@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200131144004.3396-1-patrice.chotard@st.com>
References: <20200131144004.3396-1-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-31_03:2020-01-31,
 2020-01-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [U-BOOT INTERNAL REVIEW][PATCH 2/3] board: stm32: fix
	extra env setings addresses
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

From: Patrice Chotard <patrice.chotard@st.com>

For stm32f4, f7 and h7 boards, reserve:
 - 4MB for kernel
 - 64KB for fdt, boot script, pxefile
 - the remaining memory for ramdisk

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 include/configs/stm32f429-evaluation.h | 8 ++++----
 include/configs/stm32f469-discovery.h  | 8 ++++----
 include/configs/stm32f746-disco.h      | 8 ++++----
 include/configs/stm32h743-disco.h      | 8 ++++----
 include/configs/stm32h743-eval.h       | 8 ++++----
 5 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
index 7a17222d7b..f74d027e5d 100644
--- a/include/configs/stm32f429-evaluation.h
+++ b/include/configs/stm32f429-evaluation.h
@@ -40,12 +40,12 @@
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0x00008000\0"		\
 			"fdtfile=stm32429i-eval.dtb\0"	\
-			"fdt_addr_r=0x00700000\0"		\
-			"scriptaddr=0x00800000\0"		\
-			"pxefile_addr_r=0x00800000\0" \
+			"fdt_addr_r=0x00408000\0"		\
+			"scriptaddr=0x00418000\0"		\
+			"pxefile_addr_r=0x00428000\0" \
+			"ramdisk_addr_r=0x00438000\0"		\
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0x00900000\0"		\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
index 463f1c4396..23ed02ab52 100644
--- a/include/configs/stm32f469-discovery.h
+++ b/include/configs/stm32f469-discovery.h
@@ -40,12 +40,12 @@
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0x00008000\0"		\
 			"fdtfile=stm32f469-disco.dtb\0"	\
-			"fdt_addr_r=0x00700000\0"		\
-			"scriptaddr=0x00800000\0"		\
-			"pxefile_addr_r=0x00800000\0" \
+			"fdt_addr_r=0x00408000\0"		\
+			"scriptaddr=0x00418000\0"		\
+			"pxefile_addr_r=0x00428000\0" \
+			"ramdisk_addr_r=0x00438000\0"		\
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0x00900000\0"		\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
index 337b99977b..6d82a9cdd1 100644
--- a/include/configs/stm32f746-disco.h
+++ b/include/configs/stm32f746-disco.h
@@ -48,12 +48,12 @@
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xC0008000\0"		\
 			"fdtfile=stm32f746-disco.dtb\0"	\
-			"fdt_addr_r=0xC0500000\0"		\
-			"scriptaddr=0xC0008000\0"		\
-			"pxefile_addr_r=0xC0008000\0" \
+			"fdt_addr_r=0xC0408000\0"		\
+			"scriptaddr=0xC0418000\0"		\
+			"pxefile_addr_r=0xC0428000\0" \
+			"ramdisk_addr_r=0xC0438000\0"		\
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0xC0600000\0"		\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
index 74c69eba39..312f2916d1 100644
--- a/include/configs/stm32h743-disco.h
+++ b/include/configs/stm32h743-disco.h
@@ -35,12 +35,12 @@
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xD0008000\0"		\
 			"fdtfile=stm32h743i-disco.dtb\0"	\
-			"fdt_addr_r=0xD0700000\0"		\
-			"scriptaddr=0xD0800000\0"		\
-			"pxefile_addr_r=0xD0800000\0" \
+			"fdt_addr_r=0xD0408000\0"		\
+			"scriptaddr=0xD0418000\0"		\
+			"pxefile_addr_r=0xD0428000\0" \
+			"ramdisk_addr_r=0xD0438000\0"		\
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0xD0900000\0"		\
 			BOOTENV
 
 /*
diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
index b7c84922ab..9f7194ab0b 100644
--- a/include/configs/stm32h743-eval.h
+++ b/include/configs/stm32h743-eval.h
@@ -35,12 +35,12 @@
 #define CONFIG_EXTRA_ENV_SETTINGS				\
 			"kernel_addr_r=0xD0008000\0"		\
 			"fdtfile=stm32h743i-eval.dtb\0"	\
-			"fdt_addr_r=0xD0700000\0"		\
-			"scriptaddr=0xD0800000\0"		\
-			"pxefile_addr_r=0xD0800000\0" \
+			"fdt_addr_r=0xD0408000\0"		\
+			"scriptaddr=0xD0418000\0"		\
+			"pxefile_addr_r=0xD0428000\0" \
+			"ramdisk_addr_r=0xD0438000\0"		\
 			"fdt_high=0xffffffffffffffff\0"		\
 			"initrd_high=0xffffffffffffffff\0"	\
-			"ramdisk_addr_r=0xD0900000\0"		\
 			BOOTENV
 
 /*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
