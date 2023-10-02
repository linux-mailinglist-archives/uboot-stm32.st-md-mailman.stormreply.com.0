Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 024297B56E8
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Oct 2023 17:52:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A989EC6C821;
	Mon,  2 Oct 2023 15:52:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CADCC6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:52:57 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EE83986C59;
 Mon,  2 Oct 2023 17:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696261977;
 bh=e1gPxWYij3h8mGbOu964Lm1W3e5zEjfbXbRVIKNALdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cF08puVorpyD14x1KwnBH0h+/JcokM1HGM7u2wW9nz4G7Yt531MMQQgIisVZsFNZb
 VH+vhWM5OlhWxLbrl8y2Dtx0u0DYisc/5Yctv2gm+olAXQ5KLxMrc5WWhUHyrhKZ5u
 U6PSA7xvR6Zr8xNJLtI/9NfqnqRciR6F07rDiJgcBROk4niPHY1Vf32Up/AfWwicGk
 0nFsbAzHh7QhJmVglKv4kBThkUeVkxI+0QAkzRvWml9BVI23OQio4nV+OHj6YLfoE4
 vVXNGVGJmWCqW3BVcZM6GM2u7bOVXExYfh3EmleiLO9oyRGkGdEktptASlG4bMFTyw
 jvTfK99aXzYHA==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon,  2 Oct 2023 17:52:34 +0200
Message-Id: <20231002155234.138630-2-marex@denx.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002155234.138630-1-marex@denx.de>
References: <20231002155234.138630-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 2/2] ARM: stm32: Add dh_update_sd_to_emmc to
	STM32MP15xx DHCOR
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

Add script which installs U-Boot binaries from SD card to eMMC
and makes the eMMC bootable.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp15_dh_dhsom.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index c7ebf5cd180..8ff882264f4 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -20,6 +20,25 @@
 
 #define STM32MP_BOARD_EXTRA_ENV \
 	"usb_pgood_delay=1000\0" \
+	"dh_update_sd_to_emmc=" /* Install U-Boot from SD to eMMC */	\
+		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
+		"load mmc 0:4 ${loadaddr1} boot/u-boot-spl.stm32 && "	\
+		"setexpr sblkcnt ${filesize} + 0x1ff && "		\
+		"setexpr sblkcnt ${sblkcnt} / 0x200 && "		\
+		"load mmc 0:4 ${loadaddr} boot/u-boot.itb && "		\
+		"setexpr ublkcnt ${filesize} + 0x1ff && "		\
+		"setexpr ublkcnt ${ublkcnt} / 0x200 && "		\
+		"mmc partconf 1 1 1 1 && mmc dev 1 1 && "		\
+		"mmc write ${loadaddr1} 0 ${sblkcnt} && "		\
+		"mmc dev 1 2 && "					\
+		"mmc write ${loadaddr1} 0 ${sblkcnt} && "		\
+		"mmc dev 1 && "						\
+		"gpt write mmc 1 'name=ssbl,size=2MiB' && "		\
+		"mmc write ${loadaddr} 0x22 ${ublkcnt} && "		\
+		"mmc partconf 1 1 1 0 && "				\
+		"setenv loadaddr1 && "					\
+		"setenv sblkcnt && "					\
+		"setenv ublkcnt\0"					\
 	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
 		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
 		"load mmc 0:4 ${loadaddr1} /boot/u-boot-spl.stm32 && "	\
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
