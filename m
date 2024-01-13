Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8982CE0C
	for <lists+uboot-stm32@lfdr.de>; Sat, 13 Jan 2024 18:58:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E11BAC6B460;
	Sat, 13 Jan 2024 17:58:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF720C6B457
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jan 2024 17:58:26 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EF42C87134;
 Sat, 13 Jan 2024 18:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1705168706;
 bh=OzQD8RTLlgGkKaYlxGEhy6j8cS4l6OmbZOuN4wdlSe0=;
 h=From:To:Cc:Subject:Date:From;
 b=I0/c6qMI5H4ALupYQukQokWHR6h0LgevL5SlzcqDY4kZHVHdfRRY4Yo4T74+pOYRk
 4GZewKiXp9Jkr1+jbYTtCwLB/XFr9m7YU1XuuL3SvdusuOeSC8sQHUVC7J17RvtR6O
 YIq47nPkAkodctG41xlUOE68JcrlY9EWijnJ8K8nHEVyrPgYz0xb92eM412bnpb/e5
 q1HCb02QYa7j99hb340XM16YZWxJzvDC2CXjyjBd2FUKpoQVq0Zpq3hbTqVSF4ADD+
 E0G+auHJwBGgxH3HulY2pOoLUMhVGANLO8bDvCFe8Am5C5bbLgkeEOChHBB/HkO3WU
 KsE0PIKlsulRw==
From: Marek Vasut <marex@denx.de>
To: u-boot@lists.denx.de
Date: Sat, 13 Jan 2024 18:57:27 +0100
Message-ID: <20240113175811.157221-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH] ARM: stm32: Set stdio to serial on DH
	STM32MP15xx DHSOM
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

In case CONSOLE_MUX and SYS_CONSOLE_IS_IN_ENV are enabled, the console
stdin, stdout, stderr must be defined in environment. Define the default
settings to fix the following warning on boot:

"
In:    No input devices available!
Out:   No output devices available!
Err:   No error devices available!
"

Sort the default environment as well.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: u-boot@dh-electronics.com
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp15_dh_dhsom.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/configs/stm32mp15_dh_dhsom.h b/include/configs/stm32mp15_dh_dhsom.h
index 8ff882264f4..de39b19219d 100644
--- a/include/configs/stm32mp15_dh_dhsom.h
+++ b/include/configs/stm32mp15_dh_dhsom.h
@@ -12,14 +12,13 @@
 #define PHY_ANEG_TIMEOUT		20000
 
 #ifdef CONFIG_SPL_BUILD
-#define CFG_EXTRA_ENV_SETTINGS					\
+#define CFG_EXTRA_ENV_SETTINGS						\
 	"dfu_alt_info_ram=u-boot.itb ram "				\
 			__stringify(CONFIG_SPL_LOAD_FIT_ADDRESS)	\
 			" 0x800000\0"
 #endif
 
-#define STM32MP_BOARD_EXTRA_ENV \
-	"usb_pgood_delay=1000\0" \
+#define STM32MP_BOARD_EXTRA_ENV						\
 	"dh_update_sd_to_emmc=" /* Install U-Boot from SD to eMMC */	\
 		"setexpr loadaddr1 ${loadaddr} + 0x1000000 && "		\
 		"load mmc 0:4 ${loadaddr1} boot/u-boot-spl.stm32 && "	\
@@ -49,7 +48,11 @@
 		"sf update ${loadaddr1} 0x40000 ${filesize1} && "	\
 		"sf update ${loadaddr} 0x80000 ${filesize} && "		\
 		"env set filesize1 && env set loadaddr1\0"		\
-	"update_sf=run dh_update_sd_to_sf\0"
+	"stdin=serial\0"						\
+	"stdout=serial\0"						\
+	"stderr=serial\0"						\
+	"update_sf=run dh_update_sd_to_sf\0"				\
+	"usb_pgood_delay=1000\0"
 
 
 #include <configs/stm32mp15_common.h>
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
