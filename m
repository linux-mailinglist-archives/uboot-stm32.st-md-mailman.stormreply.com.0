Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLzmEPK4CmqY6gQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 May 2026 09:00:02 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1FF567138
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 May 2026 09:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C175C8F28C;
	Mon, 18 May 2026 06:54:51 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F860C8F266
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 06:54:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso959449f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 23:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779087288; x=1779692088;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swZTj+mBnyDem0Vmzvdz7LBEsTbhVc3zyakfr8nCa+4=;
 b=X9bCBd3xruZ/R0RzDOH4uHS29OupsHmyHgFTbMF5rCuiaifef/42Lo5RqodX+6FjE5
 a5G1Ype2nCBk4h7tQx1+gn4qvCPuEiwtDYiW6I4Iju29qYV+wHXqG4lpLuqnK3ICLHOt
 RaO3wIXHMU1mNPkTO4iIbPh9zh5KOR1oYHq40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779087288; x=1779692088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=swZTj+mBnyDem0Vmzvdz7LBEsTbhVc3zyakfr8nCa+4=;
 b=PnQiOdwwlJsF+RUL95zAW8P7JO6Mon+GYmVL4QLWaz2DqCbBGud9yLc71epA+F3PCl
 uQlygq1QDejapkRlJuiTOrwhdSYFmR5s2JuiWg8mnYERZvWToMSZZwuMLT3pfmhbXFJ9
 1UWavkMCQ1iuP9NFMTY5pjq8wTwJ5jj+r5YeBsJ4CN44/P7ZKIbUGEzEwTr8SzE7MZIi
 VNqq3XZdY7Go0uTtVYPqUkYJDc8cDeJB/R2i0GvCuGsIkrpW+s1Z9TMukcEnT5j6uVBI
 LKFZjb3seOMpAVI8FVhDFRLsCMiGr0gSFO38u7OJyQK55Zmqn2DcB65vIwiHTc9msLyl
 PuTQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Dl9pmYFO2aAEaNVBcIybDQ8N3LtJWgHbsjVEPV9RSVLkyVkIvmUHnCFBIGl7FGhg+GlcYeGCRcmNt7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTeBR+UBR7wJ2Yc4zgdm+IKVse2l0jLiUzCeWFYOWPnInxIfMj
 bzfWIdRkS9DFc6TCBFpjIXC/rnBJ0YMG8mvgK0DeH0yhz0qAxykO9lvDnJ0cKznXKrQ=
X-Gm-Gg: Acq92OG0MdueGl3mc04SM8+wEcvGQAg4qGcfHlBGUlumBmLzDfi7xmB8oNLqywJO31Z
 nrdzUzgBFd2VjBj1vxvkasxTuNaszsIGlfhSCsFz+c6jFlBg1bGUVhkpYOAFwU8x9X3o1hhfyg0
 L1jsuMu2dfhGHPxecYwxP89F3lwEUSMCpHZ29KDNCzLqw1Vrfu6vFZI8L5morkQy9j5KArZvQaC
 4sbucMtFR2Ba+25RhRbXbMcgCP6aAKI9w+FKA2ZCep3XXcMzVa8SM3iHghz4tWu9eT9JhBJLOxX
 3qm9MQjGN8og3DJ7gmkUHgdWA+A9rfcMU+QwJhPxqu5NrbHDO6vfd8gnj6ZUMCh1ondkpRiHbne
 PbQo88RJqwRfjn0XrfViAMT+B99Ew+0HCd9xIj4NtuK8DtErzXBFX37Nxgrid5ZMJB9xDZAT6o9
 0ffPEdDx9RW3y8+AepPfezmF515/206KLiJr18J4Hc74WxqIdJ9ccVAEaeAIgTvxfFBNFsB57fp
 C2679QhFLcVYEpP3BsDFnTjJ66jK+ejBMX0zjANJCv7H9GxjM/mrX9AeM+4aPwBkPDcYWp5WYMz
 b/AhwdLCHV7KJZKyTpEEmugvXHf86O3U8VQ=
X-Received: by 2002:a05:6000:2387:b0:43e:aa88:f1a8 with SMTP id
 ffacd0b85a97d-45e5b747235mr20583219f8f.6.1779087288486; 
 Sun, 17 May 2026 23:54:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm34308524f8f.30.2026.05.17.23.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 23:54:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 18 May 2026 08:54:28 +0200
Message-ID: <20260518065443.2531017-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
References: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 2/2] board: st: factorize STM32MP FWU
	multi-bank support
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
X-Rspamd-Queue-Id: DA1FF567138
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:trini@konsulko.com,m:quentin.schulz@cherry.de,m:sjg@chromium.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.727];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Factorize FWU multi-bank support code common to STM32MP1 and
STM32MP2 platforms into a dedicated shared source file.

No functional change intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 board/st/common/Makefile      |  1 +
 board/st/common/stm32mp_fwu.c | 55 +++++++++++++++++++++++++++++++++++
 board/st/stm32mp1/stm32mp1.c  | 54 ----------------------------------
 board/st/stm32mp2/stm32mp2.c  | 53 ---------------------------------
 4 files changed, 56 insertions(+), 107 deletions(-)
 create mode 100644 board/st/common/stm32mp_fwu.c

diff --git a/board/st/common/Makefile b/board/st/common/Makefile
index 122b13c3aa8d..36dfaddfa0eb 100644
--- a/board/st/common/Makefile
+++ b/board/st/common/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PMIC_STPMIC1) += stpmic1.o
 ifeq ($(CONFIG_ARCH_STM32MP),y)
 obj-$(CONFIG_SET_DFU_ALT_INFO) += stm32mp_dfu.o
 obj-$(CONFIG_$(PHASE_)DFU_VIRT) += stm32mp_dfu_virt.o
+obj-$(CONFIG_FWU_MULTI_BANK_UPDATE) += stm32mp_fwu.o
 endif
 
 obj-$(CONFIG_TYPEC_STUSB160X) += stusb160x.o
diff --git a/board/st/common/stm32mp_fwu.c b/board/st/common/stm32mp_fwu.c
new file mode 100644
index 000000000000..ac7ca6bdca2a
--- /dev/null
+++ b/board/st/common/stm32mp_fwu.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <fwu.h>
+#include <part_efi.h>
+#include <asm/io.h>
+/**
+ * fwu_plat_get_bootidx() - Get the value of the boot index
+ * @boot_idx: Boot index value
+ *
+ * Get the value of the bank(partition) from which the platform
+ * has booted. This value is passed to U-Boot from the earlier
+ * stage bootloader which loads and boots all the relevant
+ * firmware images
+ *
+ */
+void fwu_plat_get_bootidx(uint *boot_idx)
+{
+	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
+		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
+}
+
+int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
+{
+	uint boot_idx;
+	efi_guid_t boot_uuid, root_uuid;
+	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
+	const efi_guid_t root_type_guid =
+		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
+	char uuidbuf[UUID_STR_LEN + 1];
+	int retb, retr;
+
+	fwu_plat_get_bootidx(&boot_idx);
+
+	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
+	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
+
+	if (!retb && !retr) {
+		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
+		env_set("boot_partuuid", uuidbuf);
+
+		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
+		env_set("root_partuuid", uuidbuf);
+	} else if (!retb && retr) {
+		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
+			    __func__, retr);
+	} else if (!retr && retb) {
+		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
+			    __func__, retb);
+	}
+
+	return 0;
+}
diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 8164a62e9a3a..9b933a2ba0b6 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -837,57 +837,3 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
 }
 
 U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
-
-#if defined(CONFIG_FWU_MULTI_BANK_UPDATE)
-
-#include <fwu.h>
-
-/**
- * fwu_plat_get_bootidx() - Get the value of the boot index
- * @boot_idx: Boot index value
- *
- * Get the value of the bank(partition) from which the platform
- * has booted. This value is passed to U-Boot from the earlier
- * stage bootloader which loads and boots all the relevant
- * firmware images
- *
- */
-void fwu_plat_get_bootidx(uint *boot_idx)
-{
-	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
-		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
-}
-
-int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
-{
-	uint boot_idx;
-	efi_guid_t boot_uuid, root_uuid;
-	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
-	const efi_guid_t root_type_guid =
-		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
-	char uuidbuf[UUID_STR_LEN + 1];
-	int retb, retr;
-
-	fwu_plat_get_bootidx(&boot_idx);
-
-	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
-	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
-
-	if (!retb && !retr) {
-		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
-		env_set("boot_partuuid", uuidbuf);
-
-		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
-		env_set("root_partuuid", uuidbuf);
-	} else if (!retb && retr) {
-		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
-			    __func__, retr);
-	} else if (!retr && retb) {
-		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
-			    __func__, retb);
-	}
-
-	return 0;
-}
-#endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
-
diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 5cbbbc322a3a..7bc7d2a608fd 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -188,56 +188,3 @@ void board_quiesce_devices(void)
 {
 	led_boot_off();
 }
-
-#if defined(CONFIG_FWU_MULTI_BANK_UPDATE)
-
-#include <fwu.h>
-
-/**
- * fwu_plat_get_bootidx() - Get the value of the boot index
- * @boot_idx: Boot index value
- *
- * Get the value of the bank(partition) from which the platform
- * has booted. This value is passed to U-Boot from the earlier
- * stage bootloader which loads and boots all the relevant
- * firmware images
- *
- */
-void fwu_plat_get_bootidx(uint *boot_idx)
-{
-	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
-		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
-}
-
-int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
-{
-	uint boot_idx;
-	efi_guid_t boot_uuid, root_uuid;
-	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
-	const efi_guid_t root_type_guid =
-		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
-	char uuidbuf[UUID_STR_LEN + 1];
-	int retb, retr;
-
-	fwu_plat_get_bootidx(&boot_idx);
-
-	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
-	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
-
-	if (!retb && !retr) {
-		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
-		env_set("boot_partuuid", uuidbuf);
-
-		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
-		env_set("root_partuuid", uuidbuf);
-	} else if (!retb && retr) {
-		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
-			    __func__, retr);
-	} else if (!retr && retb) {
-		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
-			    __func__, retb);
-	}
-
-	return 0;
-}
-#endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
-- 
2.43.0

base-commit: 215496fec59b3fa09256b4fb62f92af46e2ec7f9
branch: fwumdata-ab-stm32mp1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
