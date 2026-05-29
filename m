Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FBJfA3axGWrJyQgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2026 17:32:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C68604C47
	for <lists+uboot-stm32@lfdr.de>; Fri, 29 May 2026 17:32:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C6B4C8F296;
	Fri, 29 May 2026 15:32:05 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00B8DC87ED1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 15:32:03 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so4810951f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1780068723; x=1780673523;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BvPUaocj4W93q002AO9ZwxAvPoQNnuh8ucgFSanrbu8=;
 b=WMWrGN/lDJM7lZxOfy4kg9mRqZcT93J9TMP0HLuZ6h1oThAiBoBMqfmmZWeDchc9b2
 G3710lzHv81HYhMFaCgfBs4hHCjRSfTDjhgvtLIDawejoa0A/8yYr5mWakng+bQr1FX4
 HaH/Zu5d3zEMmOIUgFvuARP9lV3+Myqr6UnNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780068723; x=1780673523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvPUaocj4W93q002AO9ZwxAvPoQNnuh8ucgFSanrbu8=;
 b=c69QCfpRhQ0wbNcaSMZPX+ufgEM+B1rI3PaIMfQCz+ixGSYuLGiYyyW6kIf9JXbzUc
 dphrxfHWSVGhiVExISaMTIWLIrQKtZUJjT/CRMkulAMdkqnS4HgxcHibapWBaxXUPV1g
 DZsRGscolaWs9XgZp4F/PbcyziUcJorzW3yqi+NkdAy76Y1nflkXoK3C8GvLRU5wB6hA
 pqurN1PC2hVx9xJ4a5WCJe2BwlSyYQTj6XRd4mweddFan9BzDb0eZhk0jX2FDoVhugfY
 Mvrimmr5dSaJcWqKRM8VU/kJEe5zaxummAVev/SOaWVjItpd9M+4PsL2ucl9Bc9gKhEY
 niTA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ef9AKUVbVjjVFru3j9WyMzeRFlIMXdbyzCTFdp0m3a7Q/DHlSf8c+eNeN+7AY3l7w66avzNYX07c7zA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzfoI/kRLBunTevs4VwsYKCQUb1Jek3hX6qAs01hgKS/7AorNTf
 LhD2Q6xOLpTUmtfLhx6tMBN0o0dCxGRtFOlKDaR0BhMVHG2PPPKz3QxOtmUUpYntOoY=
X-Gm-Gg: Acq92OFr47eC+GzLHruvcYOzaQN2CahpKahGME8yaPt5UqguBIEQsRkFBKjSNDe9sbc
 kyynRa4cv0Q4IvS2OruM8jLikvlrQTUzvdEqDaVnc2wSx5CUwDMuRN+d6IhrFBwLHudweRMJUws
 z+KYpAWEOdlhCVmfcEbs//RCPX6/nsuK8COtqhS3BgeWYgFbBRaCMmW+eX3AW4/OHvSUHuUyjiY
 0JcKtmlFVL4ZunHcDEs4Y4u7IelgbZVdvh4kG3q5OcI2S1n61/oejQl5EqedZL4orVwObOGmsD2
 X4cODf4VvRhpXmfLpIpYZNdwZp4ragC+yCpLTd2ptFfAa7JJ2AwUj4WuniQaKXf+6nVL1XSLTC1
 YGuGAHd+ATyu8Yma8JWHJ65D55MS2hYKmhiuCjw08ym4z1LY1q2jYaLosSj3pRT+4o1koEyzs8h
 9Zb3i0VYIRXP3M+2wk0Bii3svg1J8M8w1ghGiuASAtPJqfNAnJn1zvWTBqa1mhWdN/OpGSjQ26m
 JN7i73dtfJ119ZVREjh8HB9QbKpGIkgu3DRDYI1UiZmfspq0+a8zvgk6FY=
X-Received: by 2002:a05:600c:4755:b0:490:4e3e:b483 with SMTP id
 5b1f17b1804b1-490a29335camr1903265e9.22.1780068723186; 
 Fri, 29 May 2026 08:32:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09ab75sm16713855e9.6.2026.05.29.08.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 08:32:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Fri, 29 May 2026 17:31:54 +0200
Message-ID: <20260529153159.3944049-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2] ARM: dts: stm32: add U-Boot specific dtsi
	for stm32mp157f-dk2
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
X-Spamd-Result: default: False [2.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:dario.binacchi@amarulasolutions.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michael@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:url,amarulasolutions.com:mid,amarulasolutions.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 92C68604C47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The STM32MP157F-DK2 board is a direct derivative of the STM32MP157C-DK2.
As explained by ST [1], the "STM32MP157F-DK2 is assembled with latest
STM32MP15 RevZ cut which is the only one available for new product now.
The major differences in this 'F' variant SoC are the increased max
frequency of the Cortex-A7 cores and the correction of some HW bugs
(Device Rev.Z, see errata ES0438)".

On the software/architecture side, this variant utilizes SCMI (System
Control and Management Interface) for secure world resource management.
As a consequence, the underlying stm32mp15-scmi.dtsi explicitly deletes
several fixed clock nodes (such as clk_hse, clk_hsi, clk_lse, clk_lsi,
and clk_csi), making it impossible to include stm32mp157c-dk2-u-boot.dtsi
without triggering compilation errors due to these missing clock labels.

So let's introduce a dedicated stm32mp157f-dk2-u-boot.dtsi that directly
defines the fwu-mdata node. This provides the necessary FWU metadata
configuration required to allow automatic A/B bank selection, supported
for STM32MP15 boards by commit 560d8f32703f ("board: st: stm32mp15:
support dynamic A/B bank bootup").

[1] https://community.st.com/t5/stm32-mpus-products-and-hardware/i-m-wondering-what-s-the-difference-point-between-stm32mp157c/td-p/213460
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop the inclusion of stm32mp157c-dk2-u-boot.dtsi to avoid compilation
  errors caused by deleted clock nodes in stm32mp15-scmi.dtsi.
- Directly define the fwu-mdata node in stm32mp157f-dk2-u-boot.dtsi to
  properly support automatic A/B bank selection.

 arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi

diff --git a/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi b/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi
new file mode 100644
index 000000000000..77805417bfa9
--- /dev/null
+++ b/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+/ {
+	fwu-mdata {
+		compatible = "u-boot,fwu-mdata-gpt";
+		fwu-mdata-store = <&sdmmc1>;
+	};
+};
-- 
2.43.0

base-commit: 987907ae4bcc5d6055bdf7d318a3edf53e14d5fa
branch: stm32mp157f-dk2-u-boot
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
