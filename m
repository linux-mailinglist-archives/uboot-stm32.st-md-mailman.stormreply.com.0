Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A6C7B56E7
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Oct 2023 17:52:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DD60C6B474;
	Mon,  2 Oct 2023 15:52:58 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59963C6B456
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:52:57 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 94A4186459;
 Mon,  2 Oct 2023 17:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1696261976;
 bh=SLXmvksH1Na1s2XQNb3A3scqduaxIH3hK8lzOSFh+gM=;
 h=From:To:Cc:Subject:Date:From;
 b=rgJ0pKOyWJXFJFXwyxaGLHzjozoHyu7GIVAW+DKcpCzrJRHLywPGfccDZqjff13Nv
 N5A8FfPnkTGwZA33UFxbX2KT85V69oCjOG4TPPwF531HdO811u5Vp1JvBvlKgimtkk
 0IyUC1ihurlfwhbcwjNvM5J3+omyIInV956r8T3/jy9RBtktvsK4z2CTQ0A+eXURGs
 Owl1uHWiKvtu6dqYBqqq0CZqeDu8EfzZ5UwF4vVYOLdVNrfC0Sd7oo+KoHrYJDx/MH
 lRq4k+ZjPtbHSd4ykVVCOklhPlMOZJYp7Rg19NPAr162AI43jZzRewzI84CVQjvLF6
 AD7ulvk1ZJSbg==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Mon,  2 Oct 2023 17:52:33 +0200
Message-Id: <20231002155234.138630-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH 1/2] ARM: stm32: Rename update_sf to
	dh_update_sd_to_sf on STM32MP15xx DHCOR
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

Align the script name with DH i.MX8MP DHCOM script name. Add
backward compatibility script to avoid breaking user scripts.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp15_dh_dhsom.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index 91921690624..c7ebf5cd180 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -20,7 +20,7 @@
 
 #define STM32MP_BOARD_EXTRA_ENV \
 	"usb_pgood_delay=1000\0" \
-	"update_sf=" /* Erase SPI NOR and install U-Boot from SD */	\
+	"dh_update_sd_to_sf=" /* Erase SPI NOR and install U-Boot from SD */ \
 		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
 		"load mmc 0:4 ${loadaddr1} /boot/u-boot-spl.stm32 && "	\
 		"env set filesize1 ${filesize} && "			\
@@ -29,7 +29,9 @@
 		"sf update ${loadaddr1} 0 ${filesize1} && "		\
 		"sf update ${loadaddr1} 0x40000 ${filesize1} && "	\
 		"sf update ${loadaddr} 0x80000 ${filesize} && "		\
-		"env set filesize1 && env set loadaddr1\0"
+		"env set filesize1 && env set loadaddr1\0"		\
+	"update_sf=run dh_update_sd_to_sf\0"
+
 
 #include <configs/stm32mp15_common.h>
 
-- 
2.40.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
