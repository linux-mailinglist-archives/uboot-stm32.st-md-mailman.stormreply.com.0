Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0381F6A4C
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 16:51:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE8F9C36B0D
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jun 2020 14:51:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1F90C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jun 2020 14:51:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05BEjNBp005896; Thu, 11 Jun 2020 16:51:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=fxoG1aref8BSdmeDE7G962G0FHbn76n0TE0Yydc22NA=;
 b=DfeXDD/K8YOBzLbhEZCBjpqn+/GszvKOotHpnSU1ZCiQXDhlKmfyuSnbUAZbiThh7mZX
 +jFYooXZKnEYgkxZqs+lPIvQ+FyG4OGPVUv9UZWv/15SZPPt0+27M0BXj7Bxdkku6iVe
 NU0+6uroSzwYYrL+WNDiAdJvZTaVyf1ugHh81Ec0dZupF0KG3ZSacruQ2ZoPexnKKaWn
 otVY+rnCfxi8D4owXuotC36RJmEt508L5mFDLBXDF7yat3QAjOEltDNNC0F5lvWamKs0
 H8EP7Rvrgc6w7iSl90w8xrHnWoOBmEVEyjCjttadzPhdhXsrHCi3FRPTbASPhnA9a0Vz Kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31jppp0rc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jun 2020 16:51:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 44F7310002A;
 Thu, 11 Jun 2020 16:51:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 294002B8A1B;
 Thu, 11 Jun 2020 16:51:20 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 11 Jun 2020 16:51:19 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 11 Jun 2020 16:51:17 +0200
Message-ID: <20200611145117.2936-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_15:2020-06-11,
 2020-06-11 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp1: activate WATCHDOG
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

As kernel v5.6 have a solution since so we will be able to enable
the watchdog at boot time. It is reloaded by the watchdog
framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set) and
until the userspace watchdog daemon takes over control.

Need presence of kernel patch 85fdc63fe256 ("drivers: watchdog:
stm32_iwdg: set WDOG_HW_RUNNING at probe") integrated in v5.6-rc1.

This patch revert the previous commit ca351e705a5c ("stm32mp1:
deactivate WATCHDOG in defconfig").

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 2 ++
 configs/stm32mp15_trusted_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index c7dd2926c9..a3b6c381d2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -140,5 +140,7 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index ca4a10813b..cf5ad916e7 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -127,5 +127,7 @@ CONFIG_VIDEO_STM32=y
 CONFIG_VIDEO_STM32_DSI=y
 CONFIG_VIDEO_STM32_MAX_XRES=1280
 CONFIG_VIDEO_STM32_MAX_YRES=800
+CONFIG_WDT=y
+CONFIG_WDT_STM32MP=y
 CONFIG_ERRNO_STR=y
 CONFIG_FDT_FIXUP_PARTITIONS=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
