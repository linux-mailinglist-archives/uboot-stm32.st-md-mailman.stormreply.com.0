Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHQVCUQPyGmNggUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Sat, 28 Mar 2026 18:26:28 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2034F561
	for <lists+uboot-stm32@lfdr.de>; Sat, 28 Mar 2026 18:26:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10CDCC8F289;
	Sat, 28 Mar 2026 17:17:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4315C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 17:17:10 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-486507134e4so35759535e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1774718230; x=1775323030;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhbnKG6I3uBd8YPHLeHNZI+uBaM8ZyYIr9wbspDdQNI=;
 b=H1iZbBu30g/G1KAf8kGAhRJRjt4XLz2vX85JfheXX/CKiVCyR6y0ohr+fBHUrwXnAn
 ohBPvUOivHncTi0UxTrUVGrzEIsBFAHUZbnSGtRgl0KRieQk6AspWzAJOx0NliCcu4X4
 RtLtjW8TzvfZJRQYw5BHRIChsGY/RW28zP7RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774718230; x=1775323030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uhbnKG6I3uBd8YPHLeHNZI+uBaM8ZyYIr9wbspDdQNI=;
 b=cDKcgJrd48TqV5jhaqfK7b8T4MWqTPy/8kUsrv2p/9NxVvqapc9GL05sx6a/S53i/H
 2mzjS3MLZdUaCXdbO7XPBn16x2dBmogjjobvM7uC/jq3Q3/8DvXVrqdSGWqByYx+2IlG
 PYQun6d85DUcLS8nY3bbNWudIBor2nICgBW8/lIRQthbtnUl3ED+RAfRY2A4mF64D5zF
 BxPglrPDk0PWtLtkz7rNGPhLxasML6V6ije3x3GpooHXPYlN1l1fnocQJYFwiqbIn94t
 cjUvIjP7MTbXeJPfkAS6M/j3RjGT3XbUArLeMsQWlg9tH7/1hPE+1psZv+H8ANwqGNi2
 Ep5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU33sKrw3O9xaLFwsP/RZz2eACC262071cB//gZzsIz8413sXkcSDxvvKVJ0N09GTmdY3XzPDGc8OHgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyL4Z0/uaSsBenEUuxTXsnJuvgYXW8HavS0XLHL7TLH7iUIKGLY
 oyHH9JQiAcOtR+y18GIAJKSLnRapSS9xss3OQjRbMMxxN5lPDliJfZ8hJarL5O3KCeI=
X-Gm-Gg: ATEYQzwnpuD8VskVY2AjVgLmTNmjxall7nEHzsvD0f6+cD90nD5by//8z2/ca6Oj3wa
 DllA5UtAu97MZhV9QejIKvXC6nSNZtXIsiMjSKmpUWosa73PSCHN/ueigUEcNrdV4j3EDc1cjH/
 BvOxEYawIS9uC8lug0AwgUMcGOQf8SUdlJt+7uatO77xx2RVZ+RWchKFNuUbA6kkbnczp+uYmco
 5g9q9xqInHU8A6E+89QlvYsshgoiy+RoB+YABEgspc2sU6lXJn4xO2MNunRng4CUTCdr4KTVISo
 9gJgoFJs4MDh0mLJ1aHFFBSBcn4EfGpVkoKVMTyccDc9aUVJLKvYvTZKpIdXO5qWcrxDeh9TPNa
 XfSuv+jW8DORvp1xNTmBkaP+O0MPF7gcn9ykeqvD7yLpYGDjJfafFv1HxHbjxvd6/9867k4U7mX
 O0T6Fwus5EmE25kdCpg9mb8QAEAY6tNd+UyzTaY8APf14jF53u+DR0+qJMPJ1kRMhoTkN2GD5JT
 sXe/WTEZdFk+EtbdYpfEWxNyD6HHvy56if/2Y5hXjxh4cnNMZg4iCaUOSYgrH6lEMP0CtNRWlEQ
 zCXKrMbB4ORmuWsuyzYuwr90
X-Received: by 2002:a05:600c:800f:b0:487:1520:d107 with SMTP id
 5b1f17b1804b1-48727f4e9d3mr108463165e9.31.1774718230218; 
 Sat, 28 Mar 2026 10:17:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-9-100-184.retail.telecomitalia.it. [87.9.100.184])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c6b105sm332432465e9.1.2026.03.28.10.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 10:17:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 28 Mar 2026 18:15:17 +0100
Message-ID: <20260328171624.2377527-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260328171624.2377527-1-dario.binacchi@amarulasolutions.com>
References: <20260328171624.2377527-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 4/4] board: st: stm32mp25: support dynamic A/B
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	NEURAL_SPAM(0.00)[0.737];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,amarulasolutions.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C2B2034F561
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

 board/st/stm32mp2/stm32mp2.c          | 25 +++++++++++++++++++++++++
 include/configs/stm32mp25_st_common.h | 15 +++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
index 43bc583378e6..42df750eae9b 100644
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
+	if (!fwu_mdata_get_image_guid(&boot_uuid, boot_type_guid,
+				      boot_idx) &&
+	    !fwu_mdata_get_image_guid(&root_uuid, root_type_guid,
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
