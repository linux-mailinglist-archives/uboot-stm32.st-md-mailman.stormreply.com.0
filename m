Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C49E999B041
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2024 04:55:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7342FC712A1;
	Sat, 12 Oct 2024 02:55:17 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78AE3C71290
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Oct 2024 02:55:10 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B6D0388997;
 Sat, 12 Oct 2024 04:55:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1728701710;
 bh=VEBYmf0jrobNaNEPlq3kWfvWL2/J1xudQXzoH/Wcb5c=;
 h=From:To:Cc:Subject:Date:From;
 b=VLKfnduQn2XqkzNCeRY/DIJ3tesneeILh6+jg0WdR6NeRFARewkdrramGm/mXJuPy
 Pz3LWSGuv+cZr6pRf61jGAlyDWh1Ii+waVo9hcY3EBDOL6GA9/g69yQdbmEk3HRQQB
 Bsx2xR/O8l7EttOvjxrGIKKRTItM4+5jWerIp4Aa9awkrZbGHb/g3dOQwiPl6Zr7tO
 IEGJkii9JprzLJiiGTitEeMLidDPk2KFNwI9gE+CFpRoHWcXJ0B3gyckcNGo5wjQl9
 5hpKjuLmX1SkBUHWmkin3p1xX6qNAttRsYYj5AsOACs2+9XOsFKLGJohGqeXxf7b7O
 PT1nzMC+1l6/A==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat, 12 Oct 2024 04:54:17 +0200
Message-ID: <20241012025451.224551-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot@dh-electronics.com, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v2] ARM: stm32: Add script to install U-Boot
	from SD/eMMC to SPI NOR on DH STM32MP15xx DHSOM
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

Make the dh_update_sd_to_sf script generic, rename it to dh_update_block_to_sf
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
V2: Rename dh_update_sdmmc_to_sf to dh_update_block_to_sf
---
 include/configs/stm32mp15_dh_dhsom.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index 0f466711cae..2797fc61d17 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -37,16 +37,26 @@
 		"setenv loadaddr1 && "					\
 		"setenv sblkcnt && "					\
 		"setenv ublkcnt\0"					\
-	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
+	"dh_update_block_to_sf=" /* Erase SPI NOR and install U-Boot from block device */ \
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
+		"run dh_update_block_to_sf\0"				\
+	"dh_update_emmc_to_sf=" /* Erase SPI NOR and install U-Boot from eMMC */ \
+		"setenv dh_update_iface mmc && "			\
+		"setenv dh_update_dev 1:4 && "				\
+		"run dh_update_block_to_sf\0"				\
 	"stdin=serial\0"						\
 	"stdout=serial\0"						\
 	"stderr=serial\0"						\
-- 
2.45.2

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
