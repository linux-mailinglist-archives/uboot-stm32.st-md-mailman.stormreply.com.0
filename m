Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97023C2245
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 15:39:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65591C36B0C
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2019 13:39:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19FD9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2019 13:39:01 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8UDbAA9032017; Mon, 30 Sep 2019 15:39:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=BJohVVBBnR9Mni3+tkpbDzRPQKy7g5ZkqN5/vRZkeZ4=;
 b=fQziWomb0nwf2LALux3M+fQ+Tpf1Fdo8Ljo67JO/xpPpWTe1zN8ekxBHrpGXKXBNzYn0
 4UVPjvvV5DHboDEnvWj9PUkMoPmCDCesOMp5CRnsCEK4baDA4S2vz8wUNLaqX+ncyXjH
 34yCKjJhMXztQZnzDvJFm/VUOGreF3YEZNkPmfgBpD20ag35CwSSbz+hP48HjDePJm3b
 K9cxyn8TSmk0wGDn746HERk54eVOrw4nJj3P/PZG/Fmy9cVfk7ByASImkXCA9qliJjbD
 hqisMX4hL/eplGogx8SuZhKNx1vuecSxrKofjXWC0uqpXmOiJRd9VWH1x5jVPDkHDct3 fg== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2v9w9vkcy1-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 30 Sep 2019 15:39:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0D5CA4D;
 Mon, 30 Sep 2019 13:38:57 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BFD8B2FF5F8;
 Mon, 30 Sep 2019 15:38:56 +0200 (CEST)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep
 2019 15:38:56 +0200
Received: from localhost (10.201.21.107) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 15:38:56
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 30 Sep 2019 15:38:31 +0200
Message-ID: <20190930133832.11992-16-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930133832.11992-1-patrick.delaunay@st.com>
References: <20190930133832.11992-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_09:2019-09-25,2019-09-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 15/16] stm32mp1: add support for virtual
	partition read
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

Add read for OTP and PMIC NVM with alternates
on virtual DFU device.

Serie-cc: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- Update after Lukasz Majewski comments

 board/st/stm32mp1/stm32mp1.c        | 83 +++++++++++++++++++++++++++++
 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_optee_defconfig   |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 4 files changed, 86 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index e4bdf05cd7..6045850c05 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -975,9 +975,92 @@ void set_dfu_alt_info(char *interface, char *devstr)
 	if (!IS_ERR_OR_NULL(mtd))
 		board_get_alt_info("spi-nand0", buf);
 
+#ifdef CONFIG_DFU_VIRT
+	strncat(buf, "&virt 0=OTP", DFU_ALT_BUF_LEN);
+
+	if (IS_ENABLED(CONFIG_PMIC_STPMIC1))
+		strncat(buf, "&virt 1=PMIC", DFU_ALT_BUF_LEN);
+#endif
+
 	env_set("dfu_alt_info", buf);
 	puts("DFU alt info setting: done\n");
 }
+
+#if CONFIG_IS_ENABLED(DFU_VIRT)
+#include <dfu.h>
+#include <power/stpmic1.h>
+
+int dfu_otp_read(u64 offset, u8 *buffer, long *size)
+{
+	struct udevice *dev;
+	int ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stm32mp_bsec),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, offset + STM32_BSEC_OTP_OFFSET, buffer, *size);
+	if (ret >= 0) {
+		*size = ret;
+		ret = 0;
+	}
+
+	return 0;
+}
+
+int dfu_pmic_read(u64 offset, u8 *buffer, long *size)
+{
+	int ret;
+#ifdef CONFIG_PMIC_STPMIC1
+	struct udevice *dev;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stpmic1_nvm),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, 0xF8 + offset, buffer, *size);
+	if (ret >= 0) {
+		*size = ret;
+		ret = 0;
+	}
+	if (ret == -EACCES) {
+		*size = 0;
+		ret = 0;
+	}
+#else
+	pr_err("PMIC update not supported");
+	ret = -EOPNOTSUPP;
+#endif
+
+	return ret;
+}
+
+int dfu_read_medium_virt(struct dfu_entity *dfu, u64 offset,
+			 void *buf, long *len)
+{
+	switch (dfu->data.virt.dev_num) {
+	case 0x0:
+		return dfu_otp_read(offset, buf, len);
+	case 0x1:
+		return dfu_pmic_read(offset, buf, len);
+	}
+	*len = 0;
+	return 0;
+}
+
+int __weak dfu_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
+{
+	*size = SZ_1K;
+
+	return 0;
+}
+
+#endif
+
 #endif
 
 static void board_copro_image_process(ulong fw_image, size_t fw_size)
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 699e687891..29e697ee67 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -66,6 +66,7 @@ CONFIG_STM32_ADC=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
+CONFIG_DFU_VIRT=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 387de0ad35..3b8a90de2d 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -53,6 +53,7 @@ CONFIG_STM32_ADC=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
+CONFIG_DFU_VIRT=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 29c23c634d..bcbd8a5c4e 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -52,6 +52,7 @@ CONFIG_STM32_ADC=y
 CONFIG_DFU_MMC=y
 CONFIG_DFU_RAM=y
 CONFIG_DFU_MTD=y
+CONFIG_DFU_VIRT=y
 CONFIG_USB_FUNCTION_FASTBOOT=y
 CONFIG_FASTBOOT_BUF_ADDR=0xC0000000
 CONFIG_FASTBOOT_BUF_SIZE=0x02000000
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
