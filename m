Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2564A9A0E7
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Apr 2025 08:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 519C8C78F72;
	Thu, 24 Apr 2025 06:08:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91FCFC6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 06:08:40 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NGu1OF002185;
 Thu, 24 Apr 2025 08:08:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 YSUc7UCFnp2IF1j0Kr8f7aEn+AeKMtaAZQfQXbB1bIs=; b=KYNNqOm0v6rc2d+F
 IdfMk12D4a3ELVS9AzMpxZ8I0ZhEim1qiC6cLJX5hYKIjd8lfdMI5HvjXRLS7hXW
 +bvViAyX1h5pLkquJBwOCa8gZqH98sVp4WGi9v8XkYBaBsQAQEvdNr1h4/0RlsWy
 /GrFjn/2c6MqLB3qQTdERSVveXafftbvL4/9LzMNcLTOoRdQzqGaau1jfVFUsIqB
 hf4fhz0cXLCkQ+UUlOaLkMQ+K5BIem8TfiGjIP0PlP3DWF06RCRnSuIzIvGSXRgU
 SRvJgpZd+rByt3AjryCiRS+Wrons5kZXcfetnfvLrDWx3ecAT3c7k/3uwUlWwn4z
 w9Sqcw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 466jjye1pa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Apr 2025 08:08:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EEE6140046;
 Thu, 24 Apr 2025 08:07:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62C7BA46C85;
 Thu, 24 Apr 2025 08:07:40 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 08:07:40 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 24 Apr 2025 08:07:04 +0200
Message-ID: <20250424060723.2695014-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
References: <20250424060723.2695014-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: [Uboot-stm32] [PATCH 02/21] configs: stm32mp25: add bootcmd for
	stm32mp25 platform
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

Handle boot for the 3 instance of MMC and call the command stm32prog
for serial boot on USB or on UART as it is done for other STM32MP platform.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

 include/configs/stm32mp25_common.h | 77 ++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/include/configs/stm32mp25_common.h b/include/configs/stm32mp25_common.h
index ec980eea856..542de8f068d 100644
--- a/include/configs/stm32mp25_common.h
+++ b/include/configs/stm32mp25_common.h
@@ -21,4 +21,81 @@
  */
 #define CFG_SYS_BOOTMAPSZ	SZ_256M
 
+/*****************************************************************************/
+#ifdef CONFIG_DISTRO_DEFAULTS
+/*****************************************************************************/
+
+#ifdef CONFIG_CMD_MMC
+#define BOOT_TARGET_MMC0(func)	func(MMC, mmc, 0)
+#define BOOT_TARGET_MMC1(func)	func(MMC, mmc, 1)
+#define BOOT_TARGET_MMC2(func)	func(MMC, mmc, 2)
+#else
+#define BOOT_TARGET_MMC0(func)
+#define BOOT_TARGET_MMC1(func)
+#define BOOT_TARGET_MMC2(func)
+#endif
+
+#define BOOT_TARGET_DEVICES(func)	\
+	BOOT_TARGET_MMC1(func)		\
+	BOOT_TARGET_MMC0(func)		\
+	BOOT_TARGET_MMC2(func)
+
+/*
+ * default bootcmd for stm32mp25:
+ * for serial/usb: execute the stm32prog command
+ * for mmc boot (eMMC, SD card), distro boot on the same mmc device
+ * for other boot, use the default distro order in ${boot_targets}
+ */
+#define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
+	"echo \"Boot over ${boot_device}${boot_instance}!\";" \
+	"if test ${boot_device} = serial || test ${boot_device} = usb;" \
+	"then stm32prog ${boot_device} ${boot_instance}; " \
+	"else " \
+		"run env_check;" \
+		"if test ${boot_device} = mmc;" \
+		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+		"run distro_bootcmd;" \
+	"fi;\0"
+
+#ifndef STM32MP_BOARD_EXTRA_ENV
+#define STM32MP_BOARD_EXTRA_ENV
+#endif
+
+#define STM32MP_EXTRA \
+	"env_check=if env info -p -d -q; then env save; fi\0" \
+	"boot_net_usb_start=true\0"
+/*
+ * memory layout for 96MB uncompressed/compressed kernel,
+ * 1M fdt, 1M script, 1M pxe and 1M for overlay
+ * and the ramdisk at the end.
+ */
+#define __KERNEL_COMP_ADDR_R	__stringify(0x84000000)
+#define __KERNEL_COMP_SIZE_R	__stringify(0x04000000)
+#define __KERNEL_ADDR_R		__stringify(0x8a000000)
+#define __FDT_ADDR_R		__stringify(0x90000000)
+#define __SCRIPT_ADDR_R		__stringify(0x90100000)
+#define __PXEFILE_ADDR_R	__stringify(0x90200000)
+#define __FDTOVERLAY_ADDR_R	__stringify(0x90300000)
+#define __RAMDISK_ADDR_R	__stringify(0x90400000)
+
+#define STM32MP_MEM_LAYOUT \
+	"kernel_addr_r=" __KERNEL_ADDR_R "\0" \
+	"fdt_addr_r=" __FDT_ADDR_R "\0" \
+	"scriptaddr=" __SCRIPT_ADDR_R "\0" \
+	"pxefile_addr_r=" __PXEFILE_ADDR_R "\0" \
+	"fdtoverlay_addr_r=" __FDTOVERLAY_ADDR_R "\0" \
+	"ramdisk_addr_r=" __RAMDISK_ADDR_R "\0" \
+	"kernel_comp_addr_r=" __KERNEL_COMP_ADDR_R "\0"	\
+	"kernel_comp_size=" __KERNEL_COMP_SIZE_R "\0"
+
+#include <config_distro_bootcmd.h>
+#define CFG_EXTRA_ENV_SETTINGS \
+	STM32MP_MEM_LAYOUT \
+	STM32MP_BOOTCMD \
+	BOOTENV \
+	STM32MP_EXTRA \
+	STM32MP_BOARD_EXTRA_ENV
+
+#endif
+
 #endif /* __CONFIG_STM32MP25_COMMMON_H */
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
