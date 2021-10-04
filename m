Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E474208E8
	for <lists+uboot-stm32@lfdr.de>; Mon,  4 Oct 2021 12:00:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD1DC5AB77;
	Mon,  4 Oct 2021 10:00:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0494C5AB73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Oct 2021 10:00:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1945fwoO009081; 
 Mon, 4 Oct 2021 12:00:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=5cjqn/nKwgCHkvLnRSK+6rc6nHVoGJcdEjVWQgA/isA=;
 b=7JtiMnW0JOTpWoRfB5TTdBop2erB7SRFR/xq8mXvxEjSe0xWZrk/QdL6CzFJH9kQR6BG
 0AJA/Amq6l7/RUjCIXdLYG4ybFbqqTpyym8dms13mYwlz2hEaWbnJYec9b13BYfQ6CIL
 FejQnfFrr0r/uHo2awmts7fPTYD4A3S+WoRdW8YED3BoV/sH3MBp4TkmpmunlH5O+mF5
 pA7P66ohhAtJlLMvzzgPgemN5Y2CPzLOdmFfhmMjwLb5X/NgajmBejQVkDx0ZgeCeRCO
 w3zATQl2RlCgQt+8aN+KSUAVrEbyV80ubhV6sKq+G8KfaI/Z4g8PKHryH3yzbJJtpTgm Cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bfupph9u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Oct 2021 12:00:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0989B10003A;
 Mon,  4 Oct 2021 12:00:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0313A233C77;
 Mon,  4 Oct 2021 12:00:11 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 4 Oct 2021 12:00:09
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 4 Oct 2021 11:59:53 +0200
Message-ID: <20211004115942.4.Icb58232aa80ebd59b9530f565f0189067d43568a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
References: <20211004115942.1.Ic01b4a3063c0b09cac503a4dc8356f5ff64b5c6e@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-04_02,2021-10-01_02,2020-04-07_01
Cc: Stefan Roese <sr@denx.de>, Wolfgang Denk <wd@denx.de>,
 Igor Opaniuk <igor.opaniuk@foundries.io>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Rick Chen <rick@andestech.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Matt Merhar <mattmerhar@protonmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH 4/6] Remove unused
	CONFIG_SYS_FLASH_AMD_CHECK_DQ7
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

Remove the latest reference of CONFIG_SYS_FLASH_AMD_CHECK_DQ7 in code

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 include/configs/P2041RDB.h   | 1 -
 include/configs/corenet_ds.h | 1 -
 scripts/config_whitelist.txt | 1 -
 3 files changed, 3 deletions(-)

diff --git a/include/configs/P2041RDB.h b/include/configs/P2041RDB.h
index 1e75066eb1..d17cdaadee 100644
--- a/include/configs/P2041RDB.h
+++ b/include/configs/P2041RDB.h
@@ -205,7 +205,6 @@ unsigned long get_board_sys_clk(unsigned long dummy);
 #endif /* CONFIG_NAND_FSL_ELBC */
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_FLASH_AMD_CHECK_DQ7
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE_PHYS + 0x8000000}
 
 #define CONFIG_HWCONFIG
diff --git a/include/configs/corenet_ds.h b/include/configs/corenet_ds.h
index 79fca968dc..b79991f8c9 100644
--- a/include/configs/corenet_ds.h
+++ b/include/configs/corenet_ds.h
@@ -206,7 +206,6 @@
 #endif /* CONFIG_NAND_FSL_ELBC */
 
 #define CONFIG_SYS_FLASH_EMPTY_INFO
-#define CONFIG_SYS_FLASH_AMD_CHECK_DQ7
 #define CONFIG_SYS_FLASH_BANKS_LIST	{CONFIG_SYS_FLASH_BASE_PHYS + 0x8000000, CONFIG_SYS_FLASH_BASE_PHYS}
 
 #define CONFIG_HWCONFIG
diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
index 6479b49291..fe618ff39a 100644
--- a/scripts/config_whitelist.txt
+++ b/scripts/config_whitelist.txt
@@ -1713,7 +1713,6 @@ CONFIG_SYS_FLASH1_BASE_PHYS
 CONFIG_SYS_FLASH1_BASE_PHYS_EARLY
 CONFIG_SYS_FLASHBOOT
 CONFIG_SYS_FLASH_ADDR_BASE
-CONFIG_SYS_FLASH_AMD_CHECK_DQ7
 CONFIG_SYS_FLASH_AUTOPROTECT_LIST
 CONFIG_SYS_FLASH_BANKS_LIST
 CONFIG_SYS_FLASH_BANKS_SIZES
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
