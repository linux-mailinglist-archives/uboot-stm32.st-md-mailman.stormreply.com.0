Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A3998ACC3
	for <lists+uboot-stm32@lfdr.de>; Mon, 30 Sep 2024 21:24:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F109C78002;
	Mon, 30 Sep 2024 19:24:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 040B3C7129D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 19:23:57 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 536A388E3A;
 Mon, 30 Sep 2024 21:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1727724237;
 bh=ZogeETTs2W0bfsxYlMFYFk7Wqi2FswpNZewmcK8z3dU=;
 h=From:To:Cc:Subject:Date:From;
 b=PB1VZbkfwrcvBbxhreW0PPViJI+ojBgvWPu69dg75r4kKWGwd2g020BLawnVtv/n/
 blr+sRGhzMVuf6hIU3nqycCnR20dUKr/9t8PYU2Aa+q6746j/5bI4sJT4Y0UNWao/Q
 YNLqkSAXXNzy4K3h90a009xc6zlg2HLOQdVzd6BjwS3B+XH7WY2mKFZzds6nuYN067
 IdwnacF/zYsP4hyWmad+e0h8AhO9TPkJrWKJ3kTN/JP75R2fwOvNm0XXAKkEBklFI9
 P0cCHNqYRnnC7jqg3jJ7qBMZCN0A8c/CseMFgnQO1fngMzb3PSKOGwEtzzImYe7Iew
 IJksrRI+g5tsg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon, 30 Sep 2024 21:23:40 +0200
Message-ID: <20240930192343.59359-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Add script to install U-Boot from
	SD/eMMC to SPI NOR on DH STM32MP15xx DHSOM
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

Make the dh_update_sd_to_sf script generic, rename it to dh_update_sdmmc_to_sf
and implement two specific dh_update_sd_to_sf and dh_update_emmc_to_sf scripts
which load U-Boot from either SD or eMMC and install it into SPI NOR.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp15_dh_dhsom.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index de39b19219d..fa759c938b3 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -38,16 +38,26 @@
 		"setenv loadaddr1 && "					\
 		"setenv sblkcnt && "					\
 		"setenv ublkcnt\0"					\
-	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
+	"dh_update_sdmmc_to_sf=" /* Erase SPI NOR and install U-Boot from SD/eMMC */ \
 		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
-		"load mmc 0:4 ${loadaddr1} /boot/u-boot-spl.stm32 && "	\
+		"load ${dh_update_iface} ${dh_update_dev} "		\
+			"${loadaddr1} /boot/u-boot-spl.stm32 && "	\
 		"env set filesize1 ${filesize} && "			\
-		"load mmc 0:4 ${loadaddr} /boot/u-boot.itb && "		\
+		"load ${dh_update_iface} ${dh_update_dev} "		\
+			"${loadaddr} /boot/u-boot.itb && "		\
 		"sf probe && sf erase 0 0x200000 && "			\
 		"sf update ${loadaddr1} 0 ${filesize1} && "		\
 		"sf update ${loadaddr1} 0x40000 ${filesize1} && "	\
 		"sf update ${loadaddr} 0x80000 ${filesize} && "		\
 		"env set filesize1 && env set loadaddr1\0"		\
+	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
+		"setenv dh_update_iface mmc && "			\
+		"setenv dh_update_dev 0:4 && "				\
+		"run dh_update_sdmmc_to_sf\0"				\
+	"dh_update_emmc_to_sf=" /* Erase SPI NOR and install U-Boot from eMMC */ \
+		"setenv dh_update_iface mmc && "			\
+		"setenv dh_update_dev 1:4 && "				\
+		"run dh_update_sdmmc_to_sf\0"				\
 	"stdin=serial\0"						\
 	"stdout=serial\0"						\
 	"stderr=serial\0"						\
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
