Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHzyEPK4CmoB6QQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 May 2026 09:00:02 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27A567139
	for <lists+uboot-stm32@lfdr.de>; Mon, 18 May 2026 09:00:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC15C8F286;
	Mon, 18 May 2026 06:54:49 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82A4CC8F266
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 May 2026 06:54:47 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso23603615e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 May 2026 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1779087287; x=1779692087;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zUQoicOitN7Tw5WrQojtXh9PhrTku5oBZRubCr+yO7Q=;
 b=EfcgKvl1oz/W3eHMSuF97aLTg4bWTcpI2NKfU6uHoV5KZstefaWtzp7bR68DSz7DxX
 H7hKuBUebGq8ZJsuHCsPAlkdUYIptjcXE+n/YPjJ6ueVWax7ER0TUZJl8wUCvwX3U+6r
 ThdLV/BfdNm6Y3JakXOljWZNe7L0VX47zih94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779087287; x=1779692087;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUQoicOitN7Tw5WrQojtXh9PhrTku5oBZRubCr+yO7Q=;
 b=tVvW8zSiAstomZLe2PDG27lJGNOdg1pQY7GI51Ls2Ans8jfTUzIG7Kp2vA2IZvPMfy
 Tp0unwi7NMwgX7A4aVsPB4xRa5vZPrfwj5is9Tjxn0prKGNGAay++/TyAjz8c2xj1/52
 GdElMLBiXVx5wN+PyFL0AV17UKYHo/rubnxmMprzg4b8xdS2xRKm4dkDPwjR7I/vCNAG
 rRwrSdLoRgxWq9jUxM90OOq05RMjJfASA6SXurfYglu7kOT0M2Rjqi3FR7LbZ9dqmrV4
 70h+uwD64TE3GAd8Bq6Zv5kU09NHQgj9NptMR3z3Wj+pgF8C06gYZgEfuHRPDr+N+xKY
 18gg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9DMPZnw+8BOaBGq7+90CWdhvlFViXjv8bc4I7Uggj8CP9kqTkBYxYvAWkshCxcD2hgq83yPQFI9mH6lQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcJflZLjC4VpV0sR6RLZ0pq9/mmodLPix/A6/uPJcCieMBIGdm
 1OhXMlX6Op/zCBJRM5QlL73d5ucdgrnceS4XzLlZwdASIaoTvqsxz1p7RUnTdyEPj/c=
X-Gm-Gg: Acq92OHQYyhfkt38naiVcdoXuRY65bUjEY4J2XBCK2z47If/UuvfeL9vsk0SkRhoS/r
 rsnN5J31nc9GJ94uVVL8CJWoriLYWSe7QafTWHGiRoq3redj6pMpLB3zIBysxmt3ozb/fCI9jsW
 b730SspzSH75JBnofFNud0bwJm/1whFpamXeVJ4pxL5vIve+SkqI/juX6OO8S5stZuIBcjWy6nZ
 NeuThsmRPlZ2UYmWe8/qBEpA7vxUcHu9wAzTeM6UtBoxjVE23A8HL6TsirD3Cw/8qioWZW1kAib
 L8b8DGexP5CMXinSFvv9JJu5j0zV+8i4JZnvevwFx5qEee81gf0n38kdz2VsDWfNTTNgUJar7p6
 Z1u7jMj631lZsQmocg7t0laCes7i553ty+Eyy9GkRFeWHvlGIfjZnIulfrU5AkKDRWwuTwWgIj6
 D1HX6y9dPBjkCzTTogwpwXwNFHQfvaDL1w/a4lj4q0Gq4lSQecQLP1u3IDWc9HBSkIZdNUby/S+
 7Sdhe1QN8n/y4V5NuzbzGm0eq2GpOgFlBKAJQzXvn9OQjtwkeIILrqxAjc+Oce/9UcSjxd79BNo
 3sD2B4UGyeYvVY24ivThRf4Xkser0su8LSQ=
X-Received: by 2002:a05:600c:34cc:b0:48e:635a:18d7 with SMTP id
 5b1f17b1804b1-48fe59b047bmr230418275e9.0.1779087286967; 
 Sun, 17 May 2026 23:54:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe248dsm34308524f8f.30.2026.05.17.23.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 23:54:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 18 May 2026 08:54:27 +0200
Message-ID: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [Uboot-stm32] [PATCH 1/2] board: st: stm32mp15: support dynamic A/B
	bank bootup
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
X-Rspamd-Queue-Id: DA27A567139
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
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.733];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Following commit 4300f9f4c5d7 ("board: st: stm32mp25: support dynamic
A/B bank bootup"), this patch enables automatic detection of the active
A/B bank on STM32MP15 platforms by retrieving partition GUIDs from FWU
metadata.

This ensures the system correctly identifies the bootable partitions
even in multi-bank scenarios, falling back to a standard bootable flag
scan if the UUIDs are missing.

To enable A/B bank bootup on STM32MP15 boards, add the following Kconfig
options to the  stm32mp15[_basic]_defconfig:

 CONFIG_FWU_MULTI_BANK_UPDATE=y
 CONFIG_FWU_MDATA=y
 CONFIG_FWU_NUM_BANKS=2
 CONFIG_FWU_NUM_IMAGES_PER_BANK=3
 CONFIG_CMD_FWU_METADATA=y
 CONFIG_FWU_MDATA_V2=y

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 board/st/stm32mp1/stm32mp1.c          | 33 +++++++++++++++++++++++++++
 include/configs/stm32mp15_st_common.h | 15 ++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
index 88ede4e39106..8164a62e9a3a 100644
--- a/board/st/stm32mp1/stm32mp1.c
+++ b/board/st/stm32mp1/stm32mp1.c
@@ -857,4 +857,37 @@ void fwu_plat_get_bootidx(uint *boot_idx)
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
 #endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
+
diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
index 60838cb0e3f0..7727e583fc77 100644
--- a/include/configs/stm32mp15_st_common.h
+++ b/include/configs/stm32mp15_st_common.h
@@ -8,7 +8,22 @@
 #ifndef __CONFIG_STM32MP15_ST_COMMON_H__
 #define __CONFIG_STM32MP15_ST_COMMON_H__
 
+#ifdef CONFIG_FWU_MULTI_BANK_UPDATE
+#define SCAN_DEV_FOR_BOOT_PARTS \
+	"setenv devplist; " \
+	"env exists boot_partuuid && " \
+		"part number ${devtype} ${devnum} ${boot_partuuid} devplist; " \
+	"env exists devplist || " \
+		"part list ${devtype} ${devnum} -bootable devplist; "
+
+#define ST_STM32MP15_FWU_ENV \
+	"altbootcmd=${bootcmd}\0"
+#else
+#define ST_STM32MP15_FWU_ENV
+#endif
+
 #define STM32MP_BOARD_EXTRA_ENV \
+	ST_STM32MP15_FWU_ENV \
 	"usb_pgood_delay=2000\0" \
 	"console=ttySTM0\0" \
 	"splashimage=" __stringify(CONFIG_SYS_LOAD_ADDR) "\0" \
-- 
2.43.0

base-commit: 215496fec59b3fa09256b4fb62f92af46e2ec7f9
branch: fwumdata-ab-stm32mp1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
