Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A29D3262F1F
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 15:24:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BCB7C424B9
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Sep 2020 13:24:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 122A6C424B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 13:24:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089DNOIn000341; Wed, 9 Sep 2020 15:24:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=HXopKYd5FX6CvxH1YPya+q5RLCWRg0pR+KWZEXXNaCk=;
 b=FikdVD6su5hUNHGfeBQp6JcpqBCm6HTeFVz+hOB9+czehuXIfW/ecKMgufqMsaJG510j
 BuCvt2+37nB1J6uxwK4N5Ks5wXcVvxC8OBL/KL9JRvfkCxHpgVwA6B2FpGGp5dvYuyH3
 JajZe7CaUgV5Un4od8+OZEfsLlX8+WIIjv2dEbp7vbmCGtLIYEP0Lp5knmLxzryxcJAY
 YvCTQ26xQNLDKV2fLCAdPbPZcvqfC01ItOqNQyZgv234ZwGCtzyqMNN5QM5qexcyXTsP
 rxSCXDjunjxUv/xLCmU9QvJklTht+/E68g4TaIHvC2ksEytDGYeSZFgvFQrymYQvTa0i EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33c1jf5mcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 15:24:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F39AE100034;
 Wed,  9 Sep 2020 15:24:43 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E40E12AD9F2;
 Wed,  9 Sep 2020 15:24:43 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 9 Sep 2020 15:24:43 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 9 Sep 2020 15:24:33 +0200
Message-ID: <20200909152426.2.Ia6ff004576355889c1813b2d056d9754110d8f2e@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
References: <20200909152426.1.Ie383431427f46a688dc1f0932522d8f34f3192a5@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE3.st.com (10.75.127.24) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_07:2020-09-09,
 2020-09-09 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/4] configs: stm32mp1: enable the fastboot
	oem command format
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

From: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>

Enable the fastboot oem command format and set the variable
"partitions" with default eMMC partitions list.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Signed-off-by: Jean-Philippe ROMAIN <jean-philippe.romain@st.com>
---

 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 include/configs/stm32mp1.h          | 14 ++++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index fc3d2cc4fb..0f705eccb2 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -85,6 +85,7 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
 CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
 CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
+CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index bfe9e6b06c..3e9cca6a1e 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -65,6 +65,7 @@ CONFIG_FASTBOOT_MMC_BOOT1_NAME="mmc1boot0"
 CONFIG_FASTBOOT_MMC_BOOT2_NAME="mmc1boot1"
 CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
+CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
index b937233797..e3cbca9713 100644
--- a/include/configs/stm32mp1.h
+++ b/include/configs/stm32mp1.h
@@ -140,6 +140,19 @@
 		"run distro_bootcmd;" \
 	"fi;\0"
 
+#ifdef CONFIG_FASTBOOT_CMD_OEM_FORMAT
+/* eMMC default partitions for fastboot command: oem format */
+#define PARTS_DEFAULT \
+	"partitions=" \
+	"name=ssbl,size=2M;" \
+	"name=bootfs,size=64MB,bootable;" \
+	"name=vendorfs,size=16M;" \
+	"name=rootfs,size=746M;" \
+	"name=userfs,size=-\0"
+#else
+#define PARTS_DEFAULT
+#endif
+
 #include <config_distro_bootcmd.h>
 
 /*
@@ -158,6 +171,7 @@
 	"altbootcmd=run bootcmd\0" \
 	"env_check=if env info -p -d -q; then env save; fi\0" \
 	STM32MP_BOOTCMD \
+	PARTS_DEFAULT \
 	BOOTENV \
 	"boot_net_usb_start=true\0"
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
