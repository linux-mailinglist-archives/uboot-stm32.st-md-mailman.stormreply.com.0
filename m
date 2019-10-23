Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47529E203C
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 18:12:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B3CC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Oct 2019 16:12:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B840C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2019 16:12:12 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9NG6dHx028664; Wed, 23 Oct 2019 18:12:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=MvmILtF1bP51fCUD5Uf54B+zhZYIMPtuCqfJ5D5lkxk=;
 b=LWfIVbJ2QgjPN0buAGfU6/ah3lGgZucRr5z+nWRKSPmT5wPZt09Z7x7IKs7VdNeN9tBr
 pEhpxqQstkjpzF6kzwrVCdJuVPOx3lXCOm5n1oEbpyBnuJckZGmEwXGlH9M4VcyC3MSn
 Gwu1YgeAr36Z9NrljReiZQ6d7UH8eNm7f4N3MjJUJHcVyM69d9LQVJeEBcxmajjeaQur
 iVW/BajScER5y4M3k1ewh8u6vH388gqquEV+qROMfZ2cnWHb93eiqniGUuDhCF47OIT2
 pvqvEz9LfYqGBB49yxfQptcawy37Wfao6Ng6ZmxccA+GVcCNLTXaRk1sb9gz6yp6HfVl Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vt9s74ng9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Oct 2019 18:12:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7591410002A;
 Wed, 23 Oct 2019 18:12:11 +0200 (CEST)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DCE72C2E62;
 Wed, 23 Oct 2019 18:12:11 +0200 (CEST)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct
 2019 18:12:11 +0200
Received: from localhost (10.201.21.107) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 23 Oct 2019 18:12:11
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Oct 2019 18:12:01 +0200
Message-ID: <20191023181153.3.I92b15db791882c676870dfd8eb2439a1d7f2accc@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023161203.23616-1-patrick.delaunay@st.com>
References: <20191023161203.23616-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.107]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-23_04:2019-10-23,2019-10-23 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 3/5] stm32mp1: activate CONFIG_GPIO_HOG and
	update the gpio hog support
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

This patch migrates the current gpio hog implementation with
the new configuration CONFIG_GPIO_HOG.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c        | 10 ++--------
 configs/stm32mp15_basic_defconfig   |  1 +
 configs/stm32mp15_optee_defconfig   |  1 +
 configs/stm32mp15_trusted_defconfig |  1 +
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 18f9b84876..2b96b1ae23 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -599,17 +599,11 @@ static bool board_is_dk2(void)
 /* board dependent setup after realloc */
 int board_init(void)
 {
-	struct udevice *dev;
-
 	/* address of boot parameters */
 	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
 
-	/* probe all PINCTRL for hog */
-	for (uclass_first_device(UCLASS_PINCTRL, &dev);
-	     dev;
-	     uclass_next_device(&dev)) {
-		pr_debug("probe pincontrol = %s\n", dev->name);
-	}
+	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
+		gpio_hog_probe_all();
 
 	board_key_check();
 
diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index c54feb03e6..7daa059865 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -68,6 +68,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x02000000
 CONFIG_FASTBOOT_USB_DEV=1
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_optee_defconfig b/configs/stm32mp15_optee_defconfig
index 491174fc15..925e31b5ca 100644
--- a/configs/stm32mp15_optee_defconfig
+++ b/configs/stm32mp15_optee_defconfig
@@ -55,6 +55,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x02000000
 CONFIG_FASTBOOT_USB_DEV=1
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index a8a7eec357..eb6eea6dc9 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -54,6 +54,7 @@ CONFIG_FASTBOOT_BUF_SIZE=0x02000000
 CONFIG_FASTBOOT_USB_DEV=1
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=1
+CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
 CONFIG_DM_I2C=y
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
