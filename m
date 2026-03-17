Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCX2GrquuGmHhgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 02:30:34 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C62A28CC
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 02:30:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E02BEC87ED8;
	Tue, 17 Mar 2026 01:24:18 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7232C87EC5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 01:24:17 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-66f747175d8so2740893eaf.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 18:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1773710657; x=1774315457;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AyHN1ay5D+oR91hE9ar+/ONUTd/JIiA3gqsLvXt/cvI=;
 b=EY2Yep31y7pO5DDOuf4VAMQrYHsW5tbqJSzX6QNZQEhE+jOJwZbdCsGmfIs4sH/j6L
 deRCZ7WSnXMcRwYZqyUuTJKtRNbDev8zU9WE0KP/ITuYmBTOUG23oKT3e6+jL9HlaYYo
 o+X5oliFnte0R35+FZMFpyLlXf4IBvaMohcLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773710657; x=1774315457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AyHN1ay5D+oR91hE9ar+/ONUTd/JIiA3gqsLvXt/cvI=;
 b=oRNBF2s4OJ0ZSyB+lMOOTSDjct4zRxUnB7skWXGOZ4O5oyN6XdZXp75VKy9pmymS4D
 NhgUUjkYiMb34tydGHmSMeHAUSM6Tnk6ev4yfYilsJcR7s7ql/FVumoNaNVReFv+r63M
 jx3CyZsuh7yhFLefThNhz5ttW916bj+65eh3xrB9MgN5vNhQx+B51KGNFoCzrQsOIXvc
 Z6yyzVQZdFezMTqecGqbgZ7tUxrZEf0mSELWp6W6ndMr8QdNp84R++5toR3W79cbZOvt
 hpx5CV9pYddcQyYk4OyuYFzU3OJQD+fxW6UbCqyOtkr3/Ban5UGx8yJkRNxXfFcWwFyq
 eljw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ZcPnikSlJEwCA9OxkC4LYe3gXrDcv0HxWtEEun6f2mNtLYrsgbg/pzposp3hvbe4z2/jydv85cKKGw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz1zWT/J7YPu3GQEJTLP4JW8TDVd7HT4Ev77DoTNmbYOeanLS42
 BEH+ps3a0wNx+RW2c/JQUKbq9WgcFO6Lqe5bJfPhdT6CkXINyPxelf2l4YPRyTLJHl0=
X-Gm-Gg: ATEYQzz7Xhhfw9aYXp0K9WkVsyUk3ZuiXDOJE9FbEBl+RIrtNUpdrguV6RADVKrBrG/
 yKIposvlAbd0y7dq2IqHBqy9I9Z2lJgdU4T61tM45nZJdPtL8PwoIqaK+fiAo4Oel7m5TBLM+tr
 cYUPy6NcMFwfHO4Yr1vn7JTcHXm/Qbb04SQna5s254TAytkmJm2pLUch3D3XAuJqyfA2JP8h9L3
 Kvj4WOy4c3Hky5VEB0lCoSzSj24qhG+ueUWUsVzdD6WSUrCTxM26dgfmtJM+NKFnLs60WXoIX+v
 D7GMTjxVYTIx8Lhp9vY/hn8q2q1K4YS3LUGHLNEcJ8seehmbXy8sUkV4vyn04R73brZX7nB6Gbs
 j5uNZDfWpN8GrumiU9q5PKHwSzc2qtLJXOQs/uUDBaCdEr+eXrH2UpWj/wSQtyRx5Xi76DBCHzo
 Hk7u9+K8EQklAd3e2kUkM4w0RS/lpX1v6s3F2QKzVr7b6Y8Hk4tm1sNvxKXZD7sN0KB/xlYLo2+
 60pwnKKVxldjP3fUKSJ6ZG3PvABmrnfaL0sni7ejuP0JMCi1Is=
X-Received: by 2002:a05:6820:179b:b0:679:e9b0:9e2f with SMTP id
 006d021491bc7-67bda9b1f5amr10043969eaf.25.1773710656541; 
 Mon, 16 Mar 2026 18:24:16 -0700 (PDT)
Received: from bill-the-cat.. (fixed-189-203-97-235.totalplay.net.
 [189.203.97.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-67bc9118c87sm11065009eaf.5.2026.03.16.18.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2026 18:24:15 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Date: Mon, 16 Mar 2026 19:24:14 -0600
Message-ID: <20260317012414.4162304-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Simon Glass <sjg@chromium.org>,
 Peng Fan <peng.fan@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: [Uboot-stm32] [PATCH] scmi: Rework SCMI_FIRMWARE implementation
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:marek.vasut+renesas@mailbox.org,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:peng.fan@nxp.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.578];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,mailbox.org:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 056C62A28CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As exposed by "make randconfig", how we have SCMI_FIRMWARE today is
incomplete, and in one case, used incorrectly. First, SCMI_FIRMWARE has
a build-time dependency on OF_CONTROL being enabled, so add that.
Second, RESET_SCMI depends on SCMI_FIRMWARE being enabled, it should not
select that symbol. In turn, a number of platforms need to now enable
SCMI_FIRMWARE explicitly and not rely on RESET_SCMI to enable it for
them.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Simon Glass <sjg@chromium.org>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 configs/amd_versal2_virt_defconfig  | 1 +
 configs/r8a78000_ironhide_defconfig | 1 +
 configs/sandbox_defconfig           | 1 +
 configs/stm32mp13_defconfig         | 1 +
 configs/stm32mp15-odyssey_defconfig | 1 +
 configs/stm32mp15_defconfig         | 1 +
 configs/stm32mp15_trusted_defconfig | 1 +
 configs/stm32mp21_defconfig         | 1 +
 configs/stm32mp23_defconfig         | 1 +
 configs/stm32mp25_defconfig         | 1 +
 drivers/firmware/scmi/Kconfig       | 1 +
 drivers/reset/Kconfig               | 2 +-
 12 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/configs/amd_versal2_virt_defconfig b/configs/amd_versal2_virt_defconfig
index 94dce5c191c4..8cc210946539 100644
--- a/configs/amd_versal2_virt_defconfig
+++ b/configs/amd_versal2_virt_defconfig
@@ -80,6 +80,7 @@ CONFIG_CLK_SCMI=y
 CONFIG_CLK_VERSAL=y
 CONFIG_DFU_RAM=y
 CONFIG_ARM_FFA_TRANSPORT=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_FPGA_XILINX=y
 CONFIG_FPGA_VERSALPL=y
 CONFIG_DM_I2C=y
diff --git a/configs/r8a78000_ironhide_defconfig b/configs/r8a78000_ironhide_defconfig
index 180704e75af8..64e2c278a7e0 100644
--- a/configs/r8a78000_ironhide_defconfig
+++ b/configs/r8a78000_ironhide_defconfig
@@ -29,6 +29,7 @@ CONFIG_FIRMWARE=y
 CONFIG_NR_DRAM_BANKS=16
 CONFIG_POWER_DOMAIN=y
 CONFIG_RCAR_MFIS_MBOX=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_RESET_SCMI=y
 CONFIG_SCMI_AGENT_MAILBOX=y
 CONFIG_SCMI_FIRMWARE=y
diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
index 36bf37827e91..b681b91c3f99 100644
--- a/configs/sandbox_defconfig
+++ b/configs/sandbox_defconfig
@@ -209,6 +209,7 @@ CONFIG_SANDBOX_DMA=y
 CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
 CONFIG_ARM_FFA_TRANSPORT=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_FPGA_ALTERA=y
 CONFIG_FPGA_STRATIX_II=y
 CONFIG_FPGA_STRATIX_V=y
diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
index 6bd139441122..620a6da2efe3 100644
--- a/configs/stm32mp13_defconfig
+++ b/configs/stm32mp13_defconfig
@@ -70,6 +70,7 @@ CONFIG_FASTBOOT_FLASH=y
 CONFIG_FASTBOOT_FLASH_MMC_DEV=0
 CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
diff --git a/configs/stm32mp15-odyssey_defconfig b/configs/stm32mp15-odyssey_defconfig
index 868ba1915f71..5d1c01c99fb3 100644
--- a/configs/stm32mp15-odyssey_defconfig
+++ b/configs/stm32mp15-odyssey_defconfig
@@ -86,6 +86,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
index af2efc7bceb0..c26602b63b6f 100644
--- a/configs/stm32mp15_defconfig
+++ b/configs/stm32mp15_defconfig
@@ -88,6 +88,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
index 226d83357843..d7501612a797 100644
--- a/configs/stm32mp15_trusted_defconfig
+++ b/configs/stm32mp15_trusted_defconfig
@@ -89,6 +89,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
 CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
 CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
 CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_STM32=y
diff --git a/configs/stm32mp21_defconfig b/configs/stm32mp21_defconfig
index 8ad31292579c..6a74a435f8d5 100644
--- a/configs/stm32mp21_defconfig
+++ b/configs/stm32mp21_defconfig
@@ -51,6 +51,7 @@ CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
index 49f47becba64..ed6fdd9662ef 100644
--- a/configs/stm32mp23_defconfig
+++ b/configs/stm32mp23_defconfig
@@ -51,6 +51,7 @@ CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
index 99b22a68fda6..42335aafeaf3 100644
--- a/configs/stm32mp25_defconfig
+++ b/configs/stm32mp25_defconfig
@@ -58,6 +58,7 @@ CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_BUTTON=y
 CONFIG_BUTTON_GPIO=y
+CONFIG_SCMI_FIRMWARE=y
 CONFIG_GPIO_HOG=y
 CONFIG_DM_I2C=y
 CONFIG_SYS_I2C_STM32F7=y
diff --git a/drivers/firmware/scmi/Kconfig b/drivers/firmware/scmi/Kconfig
index 33e089c460ba..cd912ebe4096 100644
--- a/drivers/firmware/scmi/Kconfig
+++ b/drivers/firmware/scmi/Kconfig
@@ -3,6 +3,7 @@ config SCMI_FIRMWARE
 	select FIRMWARE
 	select OF_TRANSLATE
 	depends on SANDBOX || DM_MAILBOX || ARM_SMCCC || OPTEE
+	depends on OF_CONTROL
 	help
 	  System Control and Management Interface (SCMI) is a communication
 	  protocol that defines standard interfaces for power, performance
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2fd91d6299cc..66911199c8ba 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -208,7 +208,7 @@ config RESET_RASPBERRYPI
 
 config RESET_SCMI
 	bool "Enable SCMI reset domain driver"
-	select SCMI_FIRMWARE
+	depends on SCMI_FIRMWARE
 	help
 	  Enable this option if you want to support reset controller
 	  devices exposed by a SCMI agent based on SCMI reset domain
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
