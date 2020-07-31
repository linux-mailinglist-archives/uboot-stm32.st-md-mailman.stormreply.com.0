Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D522347D7
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 16:32:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F71C36B38
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 14:32:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72ACEC36B33
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:32:04 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06VES3og027658; Fri, 31 Jul 2020 16:32:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=4UtaRWUw6GVVbBma+rM0AtZYsGjuNHFNnUv6tWSRdQo=;
 b=LHzbITutfy4taIuy/bJO5Y4NqpUfHHlLj/lUetig/l8Mv5l4Ipr0CF5KOTNfu42lkGX2
 rSST4YNwzOhu76Fsz9V2mXmH7h2DTVlgGdrBVX9rYL/+S5QCpqM39xg5mCDBrufdtdon
 ZzF+Z/vL4id5Tt4MzmiX1FJUuppcU0FZQPVoGTqwJfQN4pdLJwnt73f3EvcOqJFZMDtl
 TuI1stx9hy6WBZQIoyNpeW/cShBn9tVUuEx7fs5QWnR7fg2Bx5MIAqBO9exyC6waoteb
 BMStARsUEnYf5luhGcrJCL6OPfQjSgvvFcpTjGLIP6vtnh5vRNMAu6hs9wsZHY8ArTud Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagvnwtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 16:32:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C8DFF100034;
 Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C115E2B1899;
 Fri, 31 Jul 2020 16:32:02 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 31 Jul 2020 16:32:02 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Fri, 31 Jul 2020 16:31:49 +0200
Message-ID: <20200731143152.8812-8-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731143152.8812-1-patrick.delaunay@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_05:2020-07-31,
 2020-07-31 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 08/11] board: stm32mp1: use IS_ENABLED to
	prevent ifdef in env functions
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

Use IS_ENABLED to prevent ifdef in env functions:
- env_get_location
- env_ext4_get_intf
- mmc_get_env_dev

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 board/st/stm32mp1/stm32mp1.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index a9705baa24..08d18b6da8 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -785,31 +785,33 @@ enum env_location env_get_location(enum env_operation op, int prio)
 		return ENVL_UNKNOWN;
 
 	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
-#if CONFIG_IS_ENABLED(ENV_IS_IN_MMC)
 	case BOOT_FLASH_SD:
 	case BOOT_FLASH_EMMC:
-		return ENVL_MMC;
-#endif
-#if CONFIG_IS_ENABLED(ENV_IS_IN_EXT4)
-	case BOOT_FLASH_SD:
-	case BOOT_FLASH_EMMC:
-		return ENVL_EXT4;
-#endif
-#if CONFIG_IS_ENABLED(ENV_IS_IN_UBI)
+		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
+			return ENVL_MMC;
+		else if (CONFIG_IS_ENABLED(ENV_IS_IN_EXT4))
+			return ENVL_EXT4;
+		else
+			return ENVL_NOWHERE;
+
 	case BOOT_FLASH_NAND:
 	case BOOT_FLASH_SPINAND:
-		return ENVL_UBI;
-#endif
-#if CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH)
+		if (CONFIG_IS_ENABLED(ENV_IS_IN_UBI))
+			return ENVL_UBI;
+		else
+			return ENVL_NOWHERE;
+
 	case BOOT_FLASH_NOR:
-		return ENVL_SPI_FLASH;
-#endif
+		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
+			return ENVL_SPI_FLASH;
+		else
+			return ENVL_NOWHERE;
+
 	default:
 		return ENVL_NOWHERE;
 	}
 }
 
-#if defined(CONFIG_ENV_IS_IN_EXT4)
 const char *env_ext4_get_intf(void)
 {
 	u32 bootmode = get_bootmode();
@@ -830,16 +832,12 @@ const char *env_ext4_get_dev_part(void)
 
 	return dev_part[(bootmode & TAMP_BOOT_INSTANCE_MASK) - 1];
 }
-#endif
-
-#if defined(CONFIG_ENV_IS_IN_MMC)
 int mmc_get_env_dev(void)
 {
 	u32 bootmode = get_bootmode();
 
 	return (bootmode & TAMP_BOOT_INSTANCE_MASK) - 1;
 }
-#endif
 
 #if defined(CONFIG_OF_BOARD_SETUP)
 int ft_board_setup(void *blob, struct bd_info *bd)
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
