Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFmmHMjSAmpJxwEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 May 2026 09:12:08 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E18851B893
	for <lists+uboot-stm32@lfdr.de>; Tue, 12 May 2026 09:12:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D96C87EC1;
	Tue, 12 May 2026 07:12:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D80D3C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 07:12:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so29388895e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 00:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1778569925; x=1779174725;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WzmnV3kggwSU5sM2eqbuwF2Q9DjxSpkrCPTMYcDnehY=;
 b=BiR/gBxGpUcT1/hBc0NJ1u4Uebt0Gd+uxceqCl7xpWRLld2NHnzKPmfplc3Bm7/2HC
 cr3BqcLKWThnQJwZXMFIdkVFdlzib+1w/jZ6LZa9LSnr9tIQbuiV4XlrDB6owfF3X2HZ
 RsI8D5rA/D5eQdl3fBGd3lOTGdAgmB59PvsUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778569925; x=1779174725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WzmnV3kggwSU5sM2eqbuwF2Q9DjxSpkrCPTMYcDnehY=;
 b=rTCAfz924sZcIZLem7WAs2ajNJ1z1eZHAjxKe/oP3F6xQy91RmdFcJ5w3+qATOO7jp
 BpIaCr3Szb0kytETkPnSKl2dvC250lG2mgXnDVOY11tODYwzy67XoEUNcIfWx9ptxq7y
 63dkJ4jFu9MAAYCXXcSlZUlpVAIX6JSDhflp5eYIUw2PVQCR1HFoVTD8A6nrZNMLBsnO
 ZgPGwe4uvpG+qg75qjZh16raJ3pIcW3tyV8gwc4cd1JXyfOhX62x0TGFPemv2BWuSwcH
 onKaR1kM29R/iPLTd/FxfXdLYbhmPwT/RWnZO/6K0Jy3WMRPTac7UTiQvbU0dcS+Rqqe
 bl+w==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zs07Vxn7eBcA2/RZFmii6tP2xBH3auq8mWzpFdENegzLid1DEfDF/tvmkHlgPzL9w1+MphpuIYxd4CA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywkkmo9F+NCb3kgrm0Z3yaogDqWzPZmM7cE9uGU+ML+o5JvvA/W
 92gBUslrrws2MWLtk6z6tTgknjtTO2iELZX0HuSh52XtGA91K5Ez18XeJVss/EGYGPo=
X-Gm-Gg: Acq92OEy7cBBnsvD/Tv6kOBViweq8N42zEdGHt+iMzIV/yFDDgUkMCwzSi98GVPXeVb
 d6PuKV50dxB8oIda9EeXynN+ajjibbLsrCIaWUFCbCUa5Cw6x9zJzv9QWXwwEzsSfKn33IuR6cz
 n/eKZXkvzAR9dcVzHoP4hereF2fUClqgVQ8CS/HSVg80ftPvnmTrz0HszDqSiH3nruvp0h/zz9D
 Hj7MY8gicgFBvfcS3Osd8MBr1rf04AklYE8lsL0rE/uSluE0N9tfE/GrncRUGkgwtJC9CPskcee
 CgoWMrccIao5OPWadNj2v6SxSY6j+vC+8doTrshedLqMrAmO7upxPOaIv2AZcQ0Tt7Sq5TeWNsJ
 BDqD+D0St+U2G5BryTsS3yJxK5E/ODXwKkv6xisA+u/wJzBzMVAAnjkjc51+9UoMzXgXoN3TcSo
 XnQLSpMLZGGokwT3yyHMBUnPabeN9+R9b39Yb9E4DAXcGH/Lg4vbWtWgEQiMnNM0WlTxsP7o/+6
 6O0jqa3f1m7UIq/Ybsqi4dUeQNdmRh+
X-Received: by 2002:a05:600c:528e:b0:48e:7f1c:8778 with SMTP id
 5b1f17b1804b1-48e8fe721bcmr27120735e9.17.1778569925057; 
 Tue, 12 May 2026 00:12:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.40.90])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e908d890fsm24601385e9.15.2026.05.12.00.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 00:12:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue, 12 May 2026 09:11:24 +0200
Message-ID: <20260512071157.564081-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32: add U-Boot specific dtsi for
	stm32mp157f-dk2
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
X-Rspamd-Queue-Id: 0E18851B893
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.935];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,amarulasolutions.com:mid,st.com:url,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

The STM32MP157F-DK2 board is a direct derivative of the STM32MP157C-DK2.
As explained by ST [1], the "STM32MP157F-DK2 is assembled with latest
STM32MP15 RevZ cut which is the only one available for new product now.
The major differences in this 'F' variant SoC are the increased max
frequency of the Cortex-A7 cores and the correction of some HW bugs
(Device Rev.Z, see errata ES0438)".

Introducing arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi by including
stm32mp157c-dk2-u-boot.dtsi allows inheriting U-Boot specific properties
(e.g., bootph, fwumdata), avoiding code duplication and ensuring
feature parity.

[1] https://community.st.com/t5/stm32-mpus-products-and-hardware/i-m-wondering-what-s-the-difference-point-between-stm32mp157c/td-p/213460

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi

diff --git a/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi b/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi
new file mode 100644
index 000000000000..456ba70ba9ca
--- /dev/null
+++ b/arch/arm/dts/stm32mp157f-dk2-u-boot.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32mp157c-dk2-u-boot.dtsi"
-- 
2.43.0

base-commit: 5732bd0f457b4c671e46574d64d4acb099c0f0a5
branch: stm32mp157f-dk2-u-boot
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
