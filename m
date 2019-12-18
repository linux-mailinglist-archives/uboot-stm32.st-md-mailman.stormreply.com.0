Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8467812427F
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 10:13:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F78FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Dec 2019 09:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F869C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 09:13:05 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBI98MZv025358; Wed, 18 Dec 2019 10:13:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=eZ+P5IzX104MvCzCFmHkNvaXd1QuAT+UaGANSd3qzoo=;
 b=jGYrdg5Xg91oEHMzjSlx/GIYwPkdzKOejo3qlxrtwIOY+iSUEF+FxiUHVt4GzsuBzzc8
 nA2zoqVO26WiuWZDmZF7Z5SaflQ8F4Reus/qbuC4VAirzPh/Jx6bWgFHWv7VhVCXjiMj
 hEQgO8dQRQc2/zuTtObyg5/5mnj0g2mdFKi4vsjPy5CZjlMD67Qk3BHvPtj3cz28I/7h
 JwmK8FPm7YElaEOSyDlyCyzVllYLJLk8AkMLNsXbRPtLPTvOGyscJa71Mn5Bv8Wxkjpf
 WwvDplI9s9fyxDiXUsxK9d1xcuVpoja2EalKCT1P5XGw0/rJ8RLXswOu4xtfu5nN8qVQ Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2wvpd1kd8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 10:13:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BDB8100038;
 Wed, 18 Dec 2019 10:13:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 750C6220830;
 Wed, 18 Dec 2019 10:13:02 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Dec 2019 10:13:01 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Dec 2019 10:12:59 +0100
Message-ID: <20191218091259.6748-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218091259.6748-1-patrick.delaunay@st.com>
References: <20191218091259.6748-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] stm32mp1: configs: Resync with
	savedefconfig
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

Rsync all defconfig files using moveconfig.py

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 configs/stm32mp15_basic_defconfig   | 2 +-
 configs/stm32mp15_optee_defconfig   | 2 +-
 configs/stm32mp15_trusted_defconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 358c2cd079..713a7e6c57 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -132,10 +132,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_BPP8=y
 CONFIG_VIDEO_BPP16=y
 CONFIG_VIDEO_BPP32=y
-CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
 CONFIG_VIDEO_STM32=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index a065d3e088..f9161fd7d1 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -116,10 +116,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_BPP8=y
 CONFIG_VIDEO_BPP16=y
 CONFIG_VIDEO_BPP32=y
-CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
 CONFIG_VIDEO_STM32=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 632f11f59b..a5ea528ae3 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -115,10 +115,10 @@ CONFIG_USB_GADGET_VENDOR_NUM=0x0483
 CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
 CONFIG_USB_GADGET_DWC2_OTG=y
 CONFIG_DM_VIDEO=y
+CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_BPP8=y
 CONFIG_VIDEO_BPP16=y
 CONFIG_VIDEO_BPP32=y
-CONFIG_BACKLIGHT_GPIO=y
 CONFIG_VIDEO_LCD_ORISETECH_OTM8009A=y
 CONFIG_VIDEO_LCD_RAYDIUM_RM68200=y
 CONFIG_VIDEO_STM32=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
