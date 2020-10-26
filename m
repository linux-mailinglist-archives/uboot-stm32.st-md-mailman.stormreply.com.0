Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B16298853
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Oct 2020 09:32:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99672C36B0B;
	Mon, 26 Oct 2020 08:32:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C122C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 08:32:00 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09Q8QiZN028226; Mon, 26 Oct 2020 09:31:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=ufw2BATuxcxEsDiSyUicftfqCUApTMHFnOr5OuGLumo=;
 b=wzRNppXq6sp+x8j04dZTRaBGwvsqWGWO553mubJDfzut6/iK/3rsYWS82bAIqzn7QoRl
 59L0nEKH4mC0KKJ2kQcUex8+AcaHyukhm3HdlxwQjK0FrnbuleMhlNcRST/sWpmwFv6J
 KGW+8AYo6MYYRKtIcxz0bWdDKHwjXE7gof08Udp93h5wlBeXvkH2k2n8tJzqyoRRaZfB
 VhblSRO64PejbMd7R59MG0KqOHngPdiQLDRnjUoexTf5THHpmU3xI/BMxo8kyMzZQlqe
 NzFGuc1ltsfBYu5g3siGbRi8Yo1t55EhbazDO9NNOUuRzjAMhq3qx0KSMcfAgjsfj3IO Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj1jfub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Oct 2020 09:31:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BD0210002A;
 Mon, 26 Oct 2020 09:31:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5ACEC2B0B99;
 Mon, 26 Oct 2020 09:31:46 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Oct 2020 09:31:45
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 26 Oct 2020 09:31:41 +0100
Message-ID: <20201026083142.6395-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-26_04:2020-10-26,
 2020-10-26 signatures=0
Cc: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Igor Opaniuk <igor.opaniuk@toradex.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Adam Ford <aford173@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Patrick Delaunay <patrick.delaunay@st.com>,
 Stefan Bosch <stefan_b@posteo.net>, Marco Franchi <marcofrk@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabio Estevam <festevam@gmail.com>, Alifer Moraes <alifer.wsdm@gmail.com>
Subject: [Uboot-stm32] [PATCH 1/2] hush: Remove default
	CONFIG_SYS_PROMPT_HUSH_PS2 setting from board files
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

There is no reason to define default option for this macro which is
already done in common/cli_hush.c.

  87 #ifndef CONFIG_SYS_PROMPT_HUSH_PS2
  88 #define CONFIG_SYS_PROMPT_HUSH_PS2      "> "
  89 #endif

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

see previous patches:

http://patchwork.ozlabs.org/project/uboot/patch/11b23b65581253f10905bcefc923aacb3c2ce85a.1529647987.git.michal.simek@xilinx.com/
https://lists.denx.de/pipermail/u-boot/2012-June/126510.html


 include/configs/apalis-imx8.h     | 1 -
 include/configs/colibri-imx8x.h   | 1 -
 include/configs/imx8mm_beacon.h   | 1 -
 include/configs/imx8mm_evk.h      | 1 -
 include/configs/imx8mn_evk.h      | 1 -
 include/configs/imx8mp_evk.h      | 1 -
 include/configs/imx8mq_evk.h      | 1 -
 include/configs/imx8mq_phanbell.h | 1 -
 include/configs/s5p4418_nanopi2.h | 4 ----
 include/configs/verdin-imx8mm.h   | 1 -
 include/configs/xenguest_arm64.h  | 1 -
 11 files changed, 14 deletions(-)

diff --git a/include/configs/apalis-imx8.h b/include/configs/apalis-imx8.h
index db4e9011c0..b474b2f522 100644
--- a/include/configs/apalis-imx8.h
+++ b/include/configs/apalis-imx8.h
@@ -98,7 +98,6 @@
 #define PHYS_SDRAM_2_SIZE		SZ_2G		/* 2 GB */
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		SZ_2K
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/colibri-imx8x.h b/include/configs/colibri-imx8x.h
index 29a37ed44f..fc2c191594 100644
--- a/include/configs/colibri-imx8x.h
+++ b/include/configs/colibri-imx8x.h
@@ -132,7 +132,6 @@
 #define PHYS_SDRAM_2_SIZE		0x00000000	/* 0 GB */
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		SZ_2K
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mm_beacon.h b/include/configs/imx8mm_beacon.h
index 3c9541187f..9a93dba1c5 100644
--- a/include/configs/imx8mm_beacon.h
+++ b/include/configs/imx8mm_beacon.h
@@ -119,7 +119,6 @@
 #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		2048
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mm_evk.h b/include/configs/imx8mm_evk.h
index 83521ad401..92eb85553e 100644
--- a/include/configs/imx8mm_evk.h
+++ b/include/configs/imx8mm_evk.h
@@ -120,7 +120,6 @@
 #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		2048
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mn_evk.h b/include/configs/imx8mn_evk.h
index a6333085fe..cda8fc2ef7 100644
--- a/include/configs/imx8mn_evk.h
+++ b/include/configs/imx8mn_evk.h
@@ -124,7 +124,6 @@
 #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		2048
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mp_evk.h b/include/configs/imx8mp_evk.h
index 8253c6aa2f..92091dfd6b 100644
--- a/include/configs/imx8mp_evk.h
+++ b/include/configs/imx8mp_evk.h
@@ -135,7 +135,6 @@
 #define CONFIG_MXC_UART_BASE		UART2_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		2048
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mq_evk.h b/include/configs/imx8mq_evk.h
index 3f9a3bc100..96bfff749c 100644
--- a/include/configs/imx8mq_evk.h
+++ b/include/configs/imx8mq_evk.h
@@ -175,7 +175,6 @@
 /* Monitor Command Prompt */
 #undef CONFIG_SYS_PROMPT
 #define CONFIG_SYS_PROMPT		"u-boot=> "
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		1024
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/imx8mq_phanbell.h b/include/configs/imx8mq_phanbell.h
index e8b65a4ba5..66c2c3a8d8 100644
--- a/include/configs/imx8mq_phanbell.h
+++ b/include/configs/imx8mq_phanbell.h
@@ -169,7 +169,6 @@
 #define CONFIG_MXC_UART_BASE		UART1_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		1024
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/s5p4418_nanopi2.h b/include/configs/s5p4418_nanopi2.h
index 6dd1f3bc04..1e2180b970 100644
--- a/include/configs/s5p4418_nanopi2.h
+++ b/include/configs/s5p4418_nanopi2.h
@@ -102,10 +102,6 @@
 /* Boot Argument Buffer Size */
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
 
-#ifdef CONFIG_HUSH_PARSER
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
-#endif
-
 /*-----------------------------------------------------------------------
  * Etc Command definition
  */
diff --git a/include/configs/verdin-imx8mm.h b/include/configs/verdin-imx8mm.h
index fd8405433d..4751bf5a5a 100644
--- a/include/configs/verdin-imx8mm.h
+++ b/include/configs/verdin-imx8mm.h
@@ -98,7 +98,6 @@
 #define CONFIG_MXC_UART_BASE		UART1_BASE_ADDR
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
 #define CONFIG_SYS_CBSIZE		SZ_2K
 #define CONFIG_SYS_MAXARGS		64
 #define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE
diff --git a/include/configs/xenguest_arm64.h b/include/configs/xenguest_arm64.h
index c44381e966..d76ce13d14 100644
--- a/include/configs/xenguest_arm64.h
+++ b/include/configs/xenguest_arm64.h
@@ -27,7 +27,6 @@
 #define CONFIG_SYS_MALLOC_LEN         (32 * 1024 * 1024)
 
 /* Monitor Command Prompt */
-#define CONFIG_SYS_PROMPT_HUSH_PS2    "> "
 #define CONFIG_SYS_CBSIZE             1024
 #define CONFIG_SYS_MAXARGS            64
 #define CONFIG_SYS_BARGSIZE           CONFIG_SYS_CBSIZE
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
