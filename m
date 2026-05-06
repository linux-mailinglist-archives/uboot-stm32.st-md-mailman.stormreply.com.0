Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOL5KJJT/GlnOQAAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 07 May 2026 10:55:46 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 389764E54A7
	for <lists+uboot-stm32@lfdr.de>; Thu, 07 May 2026 10:55:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66841C8F28A;
	Thu,  7 May 2026 08:55:45 +0000 (UTC)
Received: from a4i683.smtp2go.com (a4i683.smtp2go.com [158.120.82.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BB2C35E3C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 22:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deadband.dev;
 i=@deadband.dev; q=dns/txt; s=s1005147; t=1778107103; h=from : subject
 : to : message-id : date;
 bh=8VfirD+tosGtGcCiZD2KDO8ZzC5hR4CAVNj5k9SDmL4=;
 b=kV/WKv0abiZVbjybH7b5JhWaNh3hb96wogSC65hPOLOgEPYl0zIdBf9C03gXTOUDH0RDG
 SnuI+FYNaYEcpxSHzma9H8aqTDZuUb+GZTDaGB7YYDVXuDvo/UIf8SoWIAZNm5PlW0YazAz
 qoa0J818HFSI3QpPPS30THLc/c1QPE05GepIUe4UN1DU4gt+CJkqmod4Aom2ubPTfUjXFVi
 gdFz9RNeHZGiXvggHPXTXofF0PBpNpoPuQuLMC0e/4pqXjEctYemDkx2sd3+pM9WWzTTBix
 L1hzgBeCQfgMHed04uBZSD5+W7ZSTzlXHdBqXjBdi4mErvTCdBkCxNN6rJpQ==
Received: from [10.181.246.189] (helo=synclavier) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.99.1-S2G) (envelope-from <austin@deadband.dev>)
 id 1wKksj-4o5NDgrpQRN-eEUZ; Wed, 06 May 2026 22:38:17 +0000
From: Austin Shirley <austin@deadband.dev>
To: u-boot@lists.denx.de
Date: Wed,  6 May 2026 16:37:58 -0600
Message-ID: <20260506223758.3717574-1-austin@deadband.dev>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
Feedback-ID: 1005147m:1005147a6bgr7a:1005147smN-Ax-so8
X-smtpcorp-track: EWgIR71elHyN._FQYJi2Z3zw1.e_lx2g3zuM3
X-Mailman-Approved-At: Thu, 07 May 2026 08:55:44 +0000
Cc: patrick.delaunay@foss.st.com, trini@konsulko.com,
 uboot-stm32@st-md-mailman.stormreply.com, Austin Shirley <austin@deadband.dev>
Subject: [Uboot-stm32] [PATCH] configs: stm32mp13: add SPI-NAND UBI boot
	support
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
X-Rspamd-Queue-Id: 389764E54A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	R_DKIM_REJECT(1.00)[deadband.dev:s=s1005147];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[deadband.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[austin@deadband.dev,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:austin@deadband.dev,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[austin@deadband.dev,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[deadband.dev:-];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

The STM32MP13 default environment only handles MMC and serial/USB boot.
When TF-A reports BOOT_FLASH_SPINAND the boot_device variable is set to
'spi-nand' but bootcmd_stm32mp never redirects boot_targets to ubifs0,
so distro_bootcmd falls through to MMC/USB.

This change mirrors the STM32MP15 logic:
 - Add a BOOT_TARGET_UBIFS entry to BOOT_TARGET_DEVICES so that
   bootcmd_ubifs0 is defined (ubi part UBI; ubifsmount ubi0:boot).
 - Add the 'spi-nand' / 'nand' clause to bootcmd_stm32mp so that
   boot_targets is set to 'ubifs0' when booting from NAND.

Signed-off-by: Austin Shirley <austin@deadband.dev>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp13_common.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
index 3e3f49abae0..e707b146f90 100644
--- a/include/configs/stm32mp13_common.h
+++ b/include/configs/stm32mp13_common.h
@@ -33,6 +33,12 @@
 #define BOOT_TARGET_MMC1(func)
 #endif
 
+#ifdef CONFIG_CMD_UBIFS
+#define BOOT_TARGET_UBIFS(func)	func(UBIFS, ubifs, 0, UBI, boot)
+#else
+#define BOOT_TARGET_UBIFS(func)
+#endif
+
 #ifdef CONFIG_CMD_USB
 #define BOOT_TARGET_USB(func)	func(USB, usb, 0)
 #else
@@ -41,12 +47,14 @@
 
 #define BOOT_TARGET_DEVICES(func)	\
 	BOOT_TARGET_MMC1(func)		\
+	BOOT_TARGET_UBIFS(func)		\
 	BOOT_TARGET_MMC0(func)		\
 	BOOT_TARGET_USB(func)
 
 /*
  * default bootcmd for stm32mp13:
  * for serial/usb: execute the stm32prog command
+ * for nand or spi-nand boot, distro boot with ubifs on UBI partition
  * for mmc boot (eMMC, SD card), distro boot on the same mmc device
  */
 #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
@@ -56,7 +64,10 @@
 	"else " \
 		"run env_check;" \
 		"if test ${boot_device} = mmc;" \
-		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
+		"then env set boot_targets \"mmc${boot_instance}\"; fi; " \
+		"if test ${boot_device} = nand ||" \
+		  " test ${boot_device} = spi-nand ;" \
+		"then env set boot_targets ubifs0; fi;" \
 		"run distro_bootcmd;" \
 	"fi;\0"
 
-- 
2.54.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
