Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AA7B2892
	for <lists+uboot-stm32@lfdr.de>; Sat, 14 Sep 2019 00:43:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE2DC36B3F
	for <lists+uboot-stm32@lfdr.de>; Fri, 13 Sep 2019 22:43:46 +0000 (UTC)
Received: from skedge03.snt-world.com (skedge03.snt-world.com [91.208.41.68])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C70FCC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Sep 2019 22:43:44 +0000 (UTC)
Received: from sntmail11s.snt-is.com (unknown [10.203.32.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id D54FE67A887;
 Sat, 14 Sep 2019 00:43:43 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail11s.snt-is.com
 (10.203.32.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 14 Sep
 2019 00:43:43 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Sat, 14 Sep 2019 00:43:43 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: "lukma@denx.de" <lukma@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>
Thread-Topic: [PATCH 2/3] stm32mp1: configs: Add CONFIG_SPL_SPI_FLASH_MTD
Thread-Index: AQHVaoSy12LfEaTQNUKdlZQmpgzfaA==
Date: Fri, 13 Sep 2019 22:43:43 +0000
Message-ID: <20190913224242.21054-2-frieder.schrempf@kontron.de>
References: <20190913224242.21054-1-frieder.schrempf@kontron.de>
In-Reply-To: <20190913224242.21054-1-frieder.schrempf@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: D54FE67A887.AE62B
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: lukma@denx.de, patrick.delaunay@st.com,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com
X-Spam-Status: No
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: [Uboot-stm32] [PATCH 2/3] stm32mp1: configs: Add
	CONFIG_SPL_SPI_FLASH_MTD
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

As SPI_FLASH_MTD is used in SPL and U-Boot proper, we enable both,
now that a separate option for SPL was introduced.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 configs/stm32mp15_basic_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
index 09785b5dc1..390319657f 100644
--- a/configs/stm32mp15_basic_defconfig
+++ b/configs/stm32mp15_basic_defconfig
@@ -7,10 +7,10 @@ CONFIG_TARGET_STM32MP1=y
 CONFIG_SPL_SPI_FLASH_SUPPORT=y
 CONFIG_SPL_SPI_SUPPORT=y
 # CONFIG_ARMV7_VIRT is not set
+CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_DISTRO_DEFAULTS=y
 CONFIG_FIT=y
 CONFIG_BOOTCOMMAND="run bootcmd_stm32mp"
-CONFIG_SPL_TEXT_BASE=0x2FFC2500
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION=y
 CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION=3
 CONFIG_SPL_I2C_SUPPORT=y
@@ -90,6 +90,7 @@ CONFIG_SPI_FLASH_STMICRO=y
 CONFIG_SPI_FLASH_WINBOND=y
 # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
 CONFIG_SPI_FLASH_MTD=y
+CONFIG_SPL_SPI_FLASH_MTD=y
 CONFIG_DM_ETH=y
 CONFIG_DWC_ETH_QOS=y
 CONFIG_PHY=y
-- 
2.17.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
