Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D2A424112
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 17:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACA31C5719E;
	Wed,  6 Oct 2021 15:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAD0DC5719C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Oct 2021 15:16:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1969wF2H030073; 
 Wed, 6 Oct 2021 17:16:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=AaB8uLDKEP0gg6YDo5eAg/+QKCgumEw8/38ig7RfQk8=;
 b=EtdE0hZVgAj01SKLhJBXKYjesu0OkhnoRZi2/1lci4zOvbjS8yyFiD2Wj1DowqEqgV0F
 kDIP2N5uTqW3oSJ7BE9si8eSxhg7dd45Bhcb0N0aMjKqgBJFpk2l/qHEVIRzFQYIxF2p
 Xl281uB2mSCJ7My4X8UgB6wg9+LUFXxtmAoYppXUTKHXRzVKal40BojOl9wSnAjdm/CD
 YN07BBXdJIv22HNuNB1Br2bysAFgsYKNrWwbRO7j3gyWYfajkP9iUuHGWT0EsiFYUqaD
 uswE6JbG/ws54o/TyOjR1KFBdGlSn8NPsZ0iKcrisvGE2el54UKuCQgjqKcwR2Z1jr+w kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bh9mv1xd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 17:16:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08C7010002A;
 Wed,  6 Oct 2021 17:16:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9AB6722D61A;
 Wed,  6 Oct 2021 17:16:28 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 6 Oct 2021 17:16:28
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 6 Oct 2021 17:16:23 +0200
Message-ID: <20211006171607.1.Ifd4a8d41835a2a90cc00f00a5862d97f60e23c6f@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_04,2021-10-06_01,2020-04-07_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sean Anderson <seanga2@gmail.com>,
 Rick Chen <rick@andestech.com>
Subject: [Uboot-stm32] [PATCH] stm32f429: move CONFIG_BOOTCOMMAND in
	defconfig
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

Move CONFIG_BOOTCOMMAND defined in Kconfig in the board defconfig.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 configs/stm32f429-discovery_defconfig | 1 +
 include/configs/stm32f429-discovery.h | 3 ---
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
index b6388cf00a..2b0f93fd65 100644
--- a/configs/stm32f429-discovery_defconfig
+++ b/configs/stm32f429-discovery_defconfig
@@ -12,6 +12,7 @@ CONFIG_TARGET_STM32F429_DISCOVERY=y
 CONFIG_ENV_VARS_UBOOT_CONFIG=y
 CONFIG_SYS_LOAD_ADDR=0x90400000
 CONFIG_BOOTDELAY=3
+CONFIG_BOOTCOMMAND="run bootcmd_romfs"
 CONFIG_USE_BOOTARGS=y
 CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
 # CONFIG_DISPLAY_CPUINFO is not set
diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
index 525a5277d8..162001d457 100644
--- a/include/configs/stm32f429-discovery.h
+++ b/include/configs/stm32f429-discovery.h
@@ -27,9 +27,6 @@
 
 #define CONFIG_SYS_CBSIZE		1024
 
-#define CONFIG_BOOTCOMMAND						\
-	"run bootcmd_romfs"
-
 #define CONFIG_EXTRA_ENV_SETTINGS \
 	"bootargs_romfs=uclinux.physaddr=0x08180000 root=/dev/mtdblock0\0" \
 	"bootcmd_romfs=setenv bootargs ${bootargs} ${bootargs_romfs};" \
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
