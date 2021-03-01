Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CEE328BAB
	for <lists+uboot-stm32@lfdr.de>; Mon,  1 Mar 2021 19:41:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B34FC56634;
	Mon,  1 Mar 2021 18:41:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 093FEC36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Mar 2021 18:41:04 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 121IRm8R001461; Mon, 1 Mar 2021 19:41:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=butxMXmq6KvCc+6T6/hDrV91Dh4KvefAvbAmFqdRa30=;
 b=lPAB+WOFdwatSncIDpcmsk2Kkpvm9lEncWbU3QSJSFcoyfU3YzwotDkCPOYe9wWEEz/V
 40jRzuZky/mtS9Tpz91C/tzCoajA7Kq6HATnDWDRBTKrbTCNdIOab5ZLTPxxY4ejXNWA
 c+gpS9+a3QdnZ8vyBHUWeh5gbQA2z/8YB4HlskCY266ijwRkcvwMCyh10OvsFgg7Bchz
 J0ukQnchVGaIS2B5ffCw7GOGpwIPrd73pJHTO+du04+vuA9garUGJkQwJCR4CGIsqL1k
 oeNM5bwGgKvjkG8CFH6FndACB/7Xo4TRVEy1/UyFHjsco9glm6h/EcsK3cRDnt2J7swy aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yfc3ngn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Mar 2021 19:41:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 699D210002A;
 Mon,  1 Mar 2021 19:41:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5656F241635;
 Mon,  1 Mar 2021 19:41:00 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Mar 2021 19:40:59
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 1 Mar 2021 19:40:56 +0100
Message-ID: <20210301194052.1.Ic785baaeea3c0a6c77088a100ea10fbbda0b5bdf@changeid>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-01_12:2021-03-01,
 2021-03-01 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH] configs: stm32mp15: move bootdelay
	configuration in defconfig
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

The STM32MP15 boards have no reason to configure bootdelay in stm32mp1.h
as it is already done with CONFIG_BOOTDELAY (default = 2) and in
include/env_default.h.

This patch allows configuration for customers which reuse stm32mp1.h
and reduce the size of the default environment.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32mp15_basic_defconfig       | 1 +
 configs/stm32mp15_dhcom_basic_defconfig | 1 +
 configs/stm32mp15_dhcor_basic_defconfig | 1 +
 configs/stm32mp15_trusted_defconfig     | 1 +
 include/configs/stm32mp1.h              | 1 -
 5 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 1c680984b8..0864d4f252 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -20,6 +20,7 @@ CONFIG_SPL_SPI_SUPPORT=y
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SPL_LOG=y
 CONFIG_BOARD_EARLY_INIT_F=y
diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
index ed285e9161..e36d34d001 100644
--- a/configs/stm32mp15_dhcom_basic_defconfig
+++ b/configs/stm32mp15_dhcom_basic_defconfig
@@ -19,6 +19,7 @@ CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcom.its"
 # CONFIG_USE_SPL_FIT_GENERATOR is not set
+CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
index a6620561ac..4794b1a14d 100644
--- a/configs/stm32mp15_dhcor_basic_defconfig
+++ b/configs/stm32mp15_dhcor_basic_defconfig
@@ -17,6 +17,7 @@ CONFIG_FIT=y
 CONFIG_SPL_LOAD_FIT=y
 CONFIG_SPL_FIT_SOURCE="board/dhelectronics/dh_stm32mp1/u-boot-dhcor.its"
 # CONFIG_USE_SPL_FIT_GENERATOR is not set
+CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 107041119f..4becdbb238 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -13,6 +13,7 @@ CONFIG_ENV_OFFSET_REDUND=0x2C0000
 CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
+CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index 36e400453e..db2117a3d7 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -160,7 +160,6 @@
  * and the ramdisk at the end.
  */
 #define CONFIG_EXTRA_ENV_SETTINGS \
-	"bootdelay=1\0" \
 	"kernel_addr_r=0xc2000000\0" \
 	"fdt_addr_r=0xc4000000\0" \
 	"scriptaddr=0xc4100000\0" \
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
