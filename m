Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A59285A36
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Oct 2020 10:14:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07E54C32EA4;
	Wed,  7 Oct 2020 08:14:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77D03C36B37
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 08:14:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09788TOG022374; Wed, 7 Oct 2020 10:10:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=6Pvr8MSpWYvsd5vu+jLpJOUCGu8P/A8ylpYJnRra/Zk=;
 b=jEPdGBn2LNLStIJshT4WZKq8d/36l5F7GwHPB2IGKHllCXo8+M7Ppvxl7qHOc3scNyKS
 tvtMQXxFxClpV+igYDBzHxIHP8/2u+PTcycIk8dzUcxw3v9cm+I68Kz1/s12kPv8q+5T
 0xME74Syt+hrQqkiI6idoFOr51lRHtkwhtYh85ZLE7Ww24PrUKjtUaETK8fMJkIJl1lq
 NXZOOqgL8IFSoUcO7jDs7BMF8gZlJVWdaGB7qnvKFMOZquwYgi2p5p2Bw2TN9sVZ0vdA
 WB+hjeP8Tr+gMdqS8O6zLhsB0viTg3lQTM4MbfFWShexgEDXjillV6YZAE/PrvRReI0+ fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tjk7qc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:10:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC234100034;
 Wed,  7 Oct 2020 10:10:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7194D211B00;
 Wed,  7 Oct 2020 10:10:22 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 10:10:22
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 7 Oct 2020 10:10:20 +0200
Message-ID: <20201007081020.30635-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_05:2020-10-06,
 2020-10-07 signatures=0
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Andre Przywara <andre.przywara@arm.com>, Lukasz Majewski <lukma@denx.de>,
 Patrick Delaunay <patrick.delaunay@st.com>, Jonas Smedegaard <dr@jones.dk>,
 Peter Robinson <pbrobinson@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp: force empty PREBOOT
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

This patch remove the default preboot command 'usb start' for
STMicroelectronics board. These command is added by the
commit 324d77998ed6 ("Define default CONFIG_PREBOOT with right config
option")' and commit 44758771eefb ("arm: move CONFIG_PREBOOT="usb start"
to KConfig").

The USB storage boot (not activated in stm32mp1.h) is correctly
managed by distro boot command 'usb_boot' (defined in
include/config_distro_bootcmd.h, it include 'usb start')
and USB keyboard is not supported in stm32mp15 defconfig.

So this patch avoids unnecessary USB initialization which slows
down the start-up:
  starting USB...
  Bus usbh-ehci@5800d000: USB EHCI 1.00
  scanning bus usbh-ehci@5800d000 for devices... 3 USB Device(s) found
         scanning usb for storage devices... 1 Storage Device(s) found

Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Jonas Smedegaard <dr@jones.dk>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index a8c4112dbe..f937a0278d 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -19,6 +19,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_PREBOOT=""
 CONFIG_BOARD_EARLY_INIT_F=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 0792884a9d..b0be064cc3 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -12,6 +12,7 @@ CONFIG_DEFAULT_DEVICE_TREE="stm32mp157c-ev1"
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
+CONFIG_PREBOOT=""
 CONFIG_SYS_PROMPT="STM32MP> "
 CONFIG_CMD_ADTIMG=y
 # CONFIG_CMD_ELF is not set
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
