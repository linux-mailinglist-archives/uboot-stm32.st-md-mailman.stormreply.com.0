Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C46B1A101
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 18:11:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54D7CC9AE58
	for <lists+uboot-stm32@lfdr.de>; Fri, 10 May 2019 16:11:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40B2DC9AE54
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:11:39 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6dJU025543; Fri, 10 May 2019 18:11:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=aD9IXD2emMRPepXHcZFzEEle8/CxqiP1CgCo/dwyOx0=;
 b=FIZCiHOWPR41AaiZeo8iwfcj1nxe5++ugj69H1miroXsqOybPclcjcc5a+WP879kOxCF
 KYi0f8/Zw397u9XjHoI0G3DvrP3eSb2wGKouJhbmzKA2ob/X+/2lzGUsc1dDgqe1SuSB
 s14sSKtQyYsPsaM7iXfC+1xnMuYH/Odbr0OLWdCU2JFh7Fq2gXlqU6V01+C69tILxiOe
 fetNOzhCgkzky1bQXiJkc3PEIdBwMHdkzccl4JlZMHUrW1xnes+iXmOT1xZaeyOS2fn8
 xv1S797GhVYMVF37LMHUVIqxXspLLhBIflq1/GrwCRm2Xa4Gtsjjjcp/+8inQnhLxzMN lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4kekp-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:11:38 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 074C934;
 Fri, 10 May 2019 16:11:38 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EA3E02C1E;
 Fri, 10 May 2019 16:11:37 +0000 (GMT)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Fri, 10 May 2019 18:11:37 +0200
From: Patrice Chotard <patrice.chotard@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 10 May 2019 18:11:22 +0200
Message-ID: <1557504691-26188-6-git-send-email-patrice.chotard@st.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
References: <1557504691-26188-1-git-send-email-patrice.chotard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Christophe KERELLO <christophe.kerello@st.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 05/14] board: stm32mp1: Add
	env_ext4_get_dev_part() and env_ext4_get_intf()
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

This allows to :
- select the current device to save the environment file
- select the correct EXT4 boot device instance
  and partition to save the environment file.

For EXT4, device is mmc, device instance is 0 for sdcard or 1 for eMMC.
The partition is set to "auto" to select the first partition with
bootable flag.

Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 360b0df..316cd48 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -19,6 +19,7 @@
 #include <asm/io.h>
 #include <asm/gpio.h>
 #include <asm/arch/stm32.h>
+#include <asm/arch/sys_proto.h>
 #include <power/regulator.h>
 #include <usb/dwc2_udc.h>
 
@@ -505,6 +506,29 @@ void board_quiesce_devices(void)
 	setup_led(LEDST_OFF);
 }
 
+#if defined(CONFIG_ENV_IS_IN_EXT4)
+const char *env_ext4_get_intf(void)
+{
+	u32 bootmode = get_bootmode();
+
+	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
+	case BOOT_FLASH_SD:
+	case BOOT_FLASH_EMMC:
+		return "mmc";
+	default:
+		return "";
+	}
+}
+
+const char *env_ext4_get_dev_part(void)
+{
+	static char *const dev_part[] = {"0:auto", "1:auto", "2:auto"};
+	u32 bootmode = get_bootmode();
+
+	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
+}
+#endif
+
 #ifdef CONFIG_SYS_MTDPARTS_RUNTIME
 
 #define MTDPARTS_LEN		256
-- 
1.9.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
