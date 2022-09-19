Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263E5BCF21
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Sep 2022 16:38:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47EFBC5EC56;
	Mon, 19 Sep 2022 14:38:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63F41C01577
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Sep 2022 14:38:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28JEHc8B023907;
 Mon, 19 Sep 2022 16:38:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=noQ18DJuaV7Qls0kFKeDRn5JOyfHyOZBWtCj3DR35GI=;
 b=JmgFkEHrz6Hd+08dHYxyBG0juyjrNtyQDdA0SIy0K1ltANQDYDrT7uKlZFRbU6116+Dl
 iXJyRPpzUaeMFkCLUoG0L5rxJ68bE7FuInlBRvCq4al5zUz4IfFbjlls6Brsc5ATkuLA
 9H6DkKmoExthUbbF0vxWA28PHo+WVMuzZC0btbSAt1I9KfA8BUIixEZON9X8PYbCdfUY
 QbfTsYK8ubNBUz9hcVG96K2jf2krRM/pQNvS4Cws93qO/WZloORHgE2x10kmepLokGwC
 R4k6Q/l/JyJAffOsLZrByAXPVeGbNNaMBXGSDzTBBpxMe5zvfBf9kYr5NR/1wUfwcoSe NQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jn6ckcmnp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Sep 2022 16:38:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6511B10002A;
 Mon, 19 Sep 2022 16:38:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 604A2236932;
 Mon, 19 Sep 2022 16:38:35 +0200 (CEST)
Received: from localhost (10.75.127.47) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 19 Sep
 2022 16:38:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 Sep 2022 16:38:26 +0200
Message-ID: <20220919143830.1165894-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
References: <20220919143830.1165894-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: [Uboot-stm32] [PATCH v1 2/6] configs: stm32f769-disco: Fix SPL boot
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

Commit 'b4b9a00ed593 ("Convert CONFIG_SYS_SPL_ARGS_ADDR to Kconfig")'
replaces CONFIG_SYS_FDT_BASE by CONFIG_SYS_SPL_ARGS_ADDR.
As CONFIG_SYS_SPL_ARGS_ADDR enables additional code when enable, it
increases SPL size over the initial 0x8000 limit.
Increase the SPL size to 0x9000 to fix SPL boot.
Set SPL_SIZE_LIMIT to 0x9000 to avoid similar issue in the future.

Fixes 'b4b9a00ed593 ("Convert CONFIG_SYS_SPL_ARGS_ADDR to Kconfig")'

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 configs/stm32f769-disco_spl_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
index 80d411a769..22fca53821 100644
--- a/configs/stm32f769-disco_spl_defconfig
+++ b/configs/stm32f769-disco_spl_defconfig
@@ -1,6 +1,6 @@
 CONFIG_ARM=y
 CONFIG_ARCH_STM32=y
-CONFIG_SYS_TEXT_BASE=0x08008000
+CONFIG_SYS_TEXT_BASE=0x08009000
 CONFIG_SYS_MALLOC_LEN=0x100000
 CONFIG_SYS_MALLOC_F_LEN=0xE00
 CONFIG_SPL_GPIO=y
@@ -13,10 +13,11 @@ CONFIG_SPL_TEXT_BASE=0x8000000
 CONFIG_SYS_PROMPT="U-Boot > "
 CONFIG_SPL_SERIAL=y
 CONFIG_SPL_DRIVERS_MISC=y
+CONFIG_SPL_SIZE_LIMIT=0x9000
 CONFIG_STM32F7=y
 CONFIG_TARGET_STM32F746_DISCO=y
 CONFIG_SPL=y
-CONFIG_SYS_LOAD_ADDR=0x8008000
+CONFIG_SYS_LOAD_ADDR=0x8009000
 CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
@@ -28,7 +29,7 @@ CONFIG_AUTOBOOT_STOP_STR=" "
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_SPL_PAD_TO=0x8000
+CONFIG_SPL_PAD_TO=0x9000
 CONFIG_SPL_NO_BSS_LIMIT=y
 CONFIG_SPL_BOARD_INIT=y
 CONFIG_SPL_SYS_MALLOC_SIMPLE=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
