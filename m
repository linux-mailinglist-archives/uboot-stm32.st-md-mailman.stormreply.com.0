Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AED4B5B344D
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Sep 2022 11:46:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 406ADC64112;
	Fri,  9 Sep 2022 09:46:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDD65C64111
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Sep 2022 09:46:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2897B502029790;
 Fri, 9 Sep 2022 11:46:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=kS7UGFFRA5KKILz1W+eK8Z+AailzTV/+/Ytphi0PL5Y=;
 b=D4+ZKdsuXnyoaFYkn44YGCrr57d6xd7cEjyR9n/u2rKdZyfLMMrbKBedKESXSJYn9Pb+
 RxD1HyCAfIN1IG3obyujT7r2XUDrRPuRj08178kNWw82Tzopz/973pTSnNNyoZvdhCbj
 tBLmXpeYDIBzEFlcKJbqY7HsePEEZa6EQ82Owh9GywUn75RxRstIR1AJyavHqEqNCOOp
 tAZk/6Y0AaqCYe6ZbCt5vdLQlw1jJWcuBy4xiy6vafDG3m4BoQ2z8lJ8EzTy+D7CL4T6
 kecIXFGD2abdfWJGzFJ2EyO2l9VrOJSJJwq6AIFjY9a0nD13P0xvHYLUiJpIaqVaWHWS MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jfd5j01kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Sep 2022 11:46:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5285610002A;
 Fri,  9 Sep 2022 11:46:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B1BE21F0A4;
 Fri,  9 Sep 2022 11:46:00 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 9 Sep
 2022 11:45:59 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 9 Sep 2022 11:45:24 +0200
Message-ID: <20220909114513.v2.2.I70caefeb79d8d2f6c1682d6ecedc48a4ea9ef3e4@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_04,2022-09-09_01,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: [Uboot-stm32] [PATCH v2 2/2] configs: stm32mp15: set
	CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s
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

With some USB devices connected on USB HUB for the STMicroelectronics
boards, set the usb_pgood_delay=2 is not enough to ensure a correct
detection for all cases; but it is solved with USB_HUB_DEBOUNCE_TIMEOUT=2s.

For example, issue encountered with the USB flash disk:
    ID 058f:6387 Alcor Micro Corp. Flash Drive

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

Changes in v2:
- force CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2s for stm32mp15 defconfig

 configs/stm32mp15_basic_defconfig   | 1 +
 configs/stm32mp15_defconfig         | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 33680dc25e9..efb506c1172 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -46,6 +46,7 @@ CONFIG_SPL_POWER=y
 CONFIG_SPL_SPI_FLASH_MTD=y
 CONFIG_SYS_SPI_U_BOOT_OFFS=0x80000
 CONFIG_FDT_SIMPLEFB=y
+CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
 CONFIG_SYS_PBSIZE=1050
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_ADTIMG=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index fd2a5de8d13..ba87b511974 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -22,6 +22,7 @@ CONFIG_FIT=y
 CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_FDT_SIMPLEFB=y
+CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
 CONFIG_SYS_PBSIZE=1050
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_ADTIMG=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 1154eec210c..6644ea4c81f 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -23,6 +23,7 @@ CONFIG_FIT=y
 CONFIG_BOOTDELAY=1
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
 CONFIG_FDT_SIMPLEFB=y
+CONFIG_USB_HUB_DEBOUNCE_TIMEOUT=2000
 CONFIG_SYS_PBSIZE=1050
 CONFIG_SYS_BOOTM_LEN=0x2000000
 CONFIG_CMD_ADTIMG=y
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
