Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8C1F931E
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 11:18:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0860C36B14
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 09:18:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2532C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 09:18:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05F9Cn9s008509; Mon, 15 Jun 2020 11:18:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=rxc8vq0BfvxZRyq853wwbBoHFQmUUwxCQbqTFjwhHrI=;
 b=xMcSbCnWEzGQmHq6Ehd6h9ajHPO7eUBBctgSIrlBxtB/svWhiiQJaL4+HXidqtPGQWyj
 0dVCRSMYwYmelipvxjssWGq4QJcEAgFRbZNGdDCB4nqRAmsWscW/IaIAFsdyTUYfzDQL
 Pb7JeudP8uz9T1wjPaBjGQFbLvxr5c1370ORRWdTbQVnYX/waQkGVR1Up2U8sxwyEzgn
 IxMTWl5MeG25WRVn2fDMSlf2fSFuO/lCVPmTbvFHJi3umvZD8Xn4/zVvRG7F2107PUJy
 sfuabMRYpOe6xsABPEZVyN9tR4LfgiPpsQ6q/A/SpFdesI8NwFxZOFt4eJSWNxvPQx3z EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvrrrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 11:18:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B725100034;
 Mon, 15 Jun 2020 11:18:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F8EE2C1E88;
 Mon, 15 Jun 2020 11:18:35 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 15 Jun 2020 11:18:35 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 15 Jun 2020 11:18:22 +0200
Message-ID: <20200615091824.3022-2-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200615091824.3022-1-patrick.delaunay@st.com>
References: <20200615091824.3022-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_01:2020-06-15,
 2020-06-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] stm32mp1: board: add support of
	CONFIG_ENV_IS_IN_MMC
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

Add support of CONFIG_ENV_IS_IN_MMC in env_get_location, used for
all mmc device (SD card and eMMC).
The 2 configs CONFIG_ENV_IS_IN_MMC and CONFIG_ENV_IS_IN_EXT4 are
incompatible.

Add the weak function mmc_get_env_dev to select the mmc boot instance.

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

(no changes since v1)

 board/st/stm32mp1/stm32mp1.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 4553329b25..b695e8bc6b 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -833,6 +833,11 @@ enum env_location env_get_location(enum env_operation op, int prio)
 		return ENVL_UNKNOWN;
 
 	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
+#ifdef CONFIG_ENV_IS_IN_MMC
+	case BOOT_FLASH_SD:
+	case BOOT_FLASH_EMMC:
+		return ENVL_MMC;
+#endif
 #ifdef CONFIG_ENV_IS_IN_EXT4
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
@@ -875,6 +880,15 @@ const char *env_ext4_get_dev_part(void)
 }
 #endif
 
+#if defined(CONFIG_ENV_IS_IN_MMC)
+int mmc_get_env_dev(void)
+{
+	u32 bootmode = get_bootmode();
+
+	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
+}
+#endif
+
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, bd_t *bd)
 {
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
