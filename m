Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qh6gHw4w0WlyGQcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 04 Apr 2026 17:36:46 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED039BA33
	for <lists+uboot-stm32@lfdr.de>; Sat, 04 Apr 2026 17:36:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3755C87ED5;
	Sat,  4 Apr 2026 15:27:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 155C9C87EC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Apr 2026 15:27:05 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so1576546f8f.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Apr 2026 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1775316424; x=1775921224;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvGO0HArPxKblfO1hvPOj1oWNQ73LOhu35jHyXZXYrs=;
 b=OeE16iqtHJWWR/jINlR/ToXV7oZ6OuMr2j3z5dPuvQMmza+x/fs08yXj0+Z7kqeuzc
 jJAy7dRsvlxr51JlhLRci+o/MZB0u9amZsOZE19YwYgLFCOS/nVmlMQCTtltJ1XXrh/3
 AgydWplTVJGn1H5vcpisCC6+SstyH78A6vL3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775316424; x=1775921224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pvGO0HArPxKblfO1hvPOj1oWNQ73LOhu35jHyXZXYrs=;
 b=SZpWCJU2CyM5J0DTXYdvJhyBX+WanWa5K6iZ+Wskq96jCdyQ9kWZuh0ftmECjUag8W
 TERzkl+jQtHqQr19F0q3NHB+hoZ0EAK9lV/vsqbVcIfPJi4v8IiOv6bayiyZ2nQsoE5S
 m1FI+tFikQJa+P7ltp6As/rkjNHSqXN5ZkPetrtDzi18GMbJ9Z6ZaqenaC4j7/S7+tYl
 O3e93F0HryRGeZaZDro4w25Srmpj+UBj2jSWdTj53aUAH5EBB7MsJf4jtlFGTFSVDCZR
 kLvN6OvbDRr3NBWGL4gVyobUIx02Uebtoevzml0rZHTza4qGs+gJ4b7T/aTz6bJz/v1/
 ubVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSETyjmeFzDQhzqv6cijYwlmtP6Bus6WYObXEHEQv+9efjobFhU9UjkRMEvcfKkIE40vxyTVMjNU589Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwchEswj5QNyfFjWTgrLgncEPFr5y1RbQD7H+9TM3pzhqlzkQpr
 HdjFQJ0Cgss+CIYOzMDlhs1EFFWb1J2g249e7QPTCWWDYZ+uXpWFkkHS2n9w1RPqKO37AY/KF6d
 UX8Bw
X-Gm-Gg: AeBDieuU4Y1KlCRokuy9IrKCkB/04FkXOVSjgTsaQXR2MdvBmXM8CfVoztlwFC0jsRI
 Nvf07DFV8rLYZZ/YEuq3xzfFUP3UkKkN9GVUZpUal56Z9h63rhlAogbfRatKzy6NqY0Mr32qxgg
 NmddprNVmkoh8ZmadG9vFFdn4ipSKJAu83uFhkuEajK2+c0y1vk4VBhx1cN8Zb96GhYe6/no8kx
 BLOoD1JYNuUt7pn5THnehTngxzQGYSXPPiYn+gV1vaGOV8Jh+6HbB1ZEvNvxGTkocdBMVEgK1v4
 5OjHOk3OSN99fOuCusnAeVBL7deKzaa2peysQA1iO0RS8sEh4WZNWbSbxqXxOANFGF+fjEgfCKb
 Dpu9M75oAEIdg7e27jOHyW++1iDWjTD2dqsNcA0+dpqSQJmYVzy07zZd4cx6Sgty/WDbWzJdfVR
 fw7I0MNuAvBA65TT1TM7iZF+lf5D25mtxnPTCLCoSPSnB0pk3nermnDS4uO5EtNIbxwvX5DXDyI
 MyCHTOKgp257TB447cb3WHWdaa3tFdDr8JqRcc1JytVeCbu89vOj2bGp/7dzkdkdJbJGyGCAx2n
 fv76NK/OTdYk1pbobgY2qsYk
X-Received: by 2002:adf:ec4c:0:b0:43d:30d1:857c with SMTP id
 ffacd0b85a97d-43d30d1859bmr4013249f8f.7.1775316424542; 
 Sat, 04 Apr 2026 08:27:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f1a99sm28059462f8f.32.2026.04.04.08.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 08:27:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  4 Apr 2026 17:23:34 +0200
Message-ID: <20260404152640.3297713-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404152640.3297713-1-dario.binacchi@amarulasolutions.com>
References: <20260404152640.3297713-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 7/7] board: st: stm32mp25: support dynamic
	A/B bank bootup
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,amarulasolutions.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 13ED039BA33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable automatic detection of the active A/B bank by retrieving
partition GUIDs from FWU metadata.

This ensures the system correctly identifies the bootable partitions
even in multi-bank scenarios, falling back to a standard bootable flag
scan if the UUIDs are missing.

To enable A/B bank bootup on stm32mp25 boards, add the following Kconfig
options to the stm32mp25_defconfig:

 CONFIG_FWU_MULTI_BANK_UPDATE=y
 CONFIG_FWU_MDATA=y
 CONFIG_FWU_NUM_BANKS=2
 CONFIG_FWU_NUM_IMAGES_PER_BANK=3
 CONFIG_CMD_FWU_METADATA=y
 CONFIG_FWU_MDATA_V2=y

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Pass efi_guid_t by pointer in fwu_mdata_get_image_guid() calls.

 board/st/stm32mp2/stm32mp2.c          | 25 +++++++++++++++++++++++++
 include/configs/stm32mp25_st_common.h | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 43bc583378e6..cb9a33252212 100644
--- a/board/st/stm32mp2/stm32mp2.c
+++ b/board/st/stm32mp2/stm32mp2.c
@@ -208,4 +208,29 @@ void fwu_plat_get_bootidx(uint *boot_idx)
 	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
 		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
 }
+
+int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
+{
+	uint boot_idx;
+	efi_guid_t boot_uuid, root_uuid;
+	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
+	const efi_guid_t root_type_guid =
+		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
+	char uuidbuf[UUID_STR_LEN + 1];
+
+	fwu_plat_get_bootidx(&boot_idx);
+
+	if (!fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid,
+				      boot_idx) &&
+	    !fwu_mdata_get_image_guid(&root_uuid, &root_type_guid,
+				      boot_idx)) {
+		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
+		env_set("boot_partuuid", uuidbuf);
+
+		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
+		env_set("root_partuuid", uuidbuf);
+	}
+
+	return 0;
+}
 #endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
diff --git a/include/configs/stm32mp25_st_common.h b/include/configs/stm32mp25_st_common.h
index cb679eb1be22..0b0267ae99b0 100644
--- a/include/configs/stm32mp25_st_common.h
+++ b/include/configs/stm32mp25_st_common.h
@@ -8,7 +8,22 @@
 #ifndef __CONFIG_STM32MP25_ST_COMMON_H__
 #define __CONFIG_STM32MP25_ST_COMMON_H__
 
+#ifdef CONFIG_FWU_MULTI_BANK_UPDATE
+#define SCAN_DEV_FOR_BOOT_PARTS \
+	"setenv devplist; " \
+	"env exists boot_partuuid && " \
+		"part number ${devtype} ${devnum} ${boot_partuuid} devplist; " \
+	"env exists devplist || " \
+		"part list ${devtype} ${devnum} -bootable devplist; "
+
+#define ST_STM32MP25_FWU_ENV \
+	"altbootcmd=${bootcmd}\0"
+#else
+#define ST_STM32MP25_FWU_ENV
+#endif
+
 #define STM32MP_BOARD_EXTRA_ENV \
+	ST_STM32MP25_FWU_ENV \
 	"usb_pgood_delay=2000\0" \
 	"console=ttySTM0\0"
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
