Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DAA774E4
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3D27C78F9A;
	Tue,  1 Apr 2025 07:01:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50E30CFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39c0dfba946so2025750f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490895; x=1744095695;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MhbjrMtU46LbUzCOqT3OHGhciFay44vkvwWGQgfiFJo=;
 b=MObRkEGlvfFFm1gHBc0fszoBL3G7dNmrDZuv0KTxDoiJgAiN132s5JwHDJzjJwMIbw
 0YWwmZXZTjEUMVNhd/8shK7zZRN5d1vaADDlY0NoSBI8qUu1oGbZmAs8DK0VWkdf1D/Q
 oymhyS+DfuDJutTIC2xGi4aL5/WxtVWkzSbeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490895; x=1744095695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MhbjrMtU46LbUzCOqT3OHGhciFay44vkvwWGQgfiFJo=;
 b=frUtvyNt8zfkjAIcdsDqmnXcVzfrkdUn+7/saU1+y3R/Z3D1ATpFKUQMh6DWBNM4Pw
 heLOK8tFcZRv5HQGy7qJ7shq87vsgPrVfzl4Px2AjzJ6QXshH55QeTlpWkbqZHdM3GeY
 W78Qf9CUwTyG7wLVnX/OfO0NWwFXrRJ+XdnxwxeE6kBsM2Z8qYoUif9NRatwwCx2PT0y
 eImG/3/rl7k2F2NvmviEBqq+LJQKFeUOSlhmMBdT6seqmGKj7hAZms7XZMsiNFMgBbOY
 2vcSU9kqFmGv8vSCrqF2oTDUb/NKC6JtKaGt+wzeI5e5QqZ7ob8/q9xL2GFRTl2NhM1f
 t+Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr9m+LKYmpW84CdIlF9M+MeOcAz2DTTms9CpOOo2Cdkb0lBosmn+EuvZBNcanTX44M8y+mict3KGrpnA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJzLDMWVNipFu5FgPZEbvHGlVvwVSL+ENVwZlXy6L2klg3NH0Z
 Ql4W8rYINhZt7y6DZUrBsiGBfYQFqvJekjZseP5BlSPDS+k9igp0XWoT8YtMvUo=
X-Gm-Gg: ASbGncsyEd6rPPSQEvbi478YMhcBMe+3UxwjPmTccTlLXu4BRu0qtnwDBlXG1h6Pc14
 F+bmWM0JIjtKI1OOUH1QWM+q4fNfvydjZiYCtJANFk+O6Jii6SRbnFamneQUy9NQuSbynBQPnbg
 3lSfjMVi/J+8q/lkTPncVRsYi4xvGwkn9bG97/NqzUwiuKwrPWjDSI1mHhRnuaGmZ06M9OK7L4G
 T/69NhVj6mBc5swQcsUVK6Vlke+rSYM67RbCIrCiKZnguSoJGS3ZtTyT0W2w0aqpKgQxZSX58PO
 WvjXlbIEUoihEN3vgIMCSaSLYGQsomriiyAQ2MbTGv3J7KbslgGuzSHvkI3myCSSw2LUsXPVVkb
 dRqx8L09ugg==
X-Google-Smtp-Source: AGHT+IFETkr1GFBzVdS4a1t66eOFePgTZI/+zqsgH3LGBbJTNBavPRLaZd9DIMFYyarrQ2iWrhMmQA==
X-Received: by 2002:a05:6000:420a:b0:391:3998:2660 with SMTP id
 ffacd0b85a97d-39c120cb8aemr8465713f8f.7.1743490894837; 
 Tue, 01 Apr 2025 00:01:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:55 +0200
Message-ID: <20250401070125.3705126-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
References: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tony Dinh <mibodhi@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 linux-amarula@amarulasolutions.com, Kever Yang <kever.yang@rock-chips.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Prasad Kummari <prasad.kummari@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 4/6] ARM: dts: add
	stm32f769-disco-mb1166-reva09
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

[backport from Linux commit db4fc2c79c533986795a7750e9a12caf9d620b48]

As reported in the section 8.3 (i. e. Board revision history) of document
UM2033 (i. e. Discovery kit with STM32F769NI MCU) these are the changes
related to the board revision addressed by the patch:
- Board MB1166 revision A-09:
  - LCD FRIDA FRD397B25009-D-CTK replaced by FRIDA FRD400B25025-A-CTK

The patch adds the DTS support for the new display which belongs to the
the Novatek NT35510-based panel family.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Reviewed-by tag of Patrice Chotard

 arch/arm/dts/Makefile                               |  1 +
 .../dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi   |  6 ++++++
 arch/arm/dts/stm32f769-disco-mb1166-reva09.dts      | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09.dts

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 267b0179a5f2..8719b58152fd 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -523,6 +523,7 @@ dtb-$(CONFIG_STM32F4) += stm32f429-disco.dtb \
 
 dtb-$(CONFIG_STM32F7) += stm32f746-disco.dtb \
 	stm32f769-disco.dtb \
+	stm32f769-disco-mb1166-reva09.dtb \
 	stm32746g-eval.dtb
 dtb-$(CONFIG_STM32H7) += stm32h743i-disco.dtb \
 	stm32h743i-eval.dtb \
diff --git a/arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi
new file mode 100644
index 000000000000..43dd3b993d5e
--- /dev/null
+++ b/arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+//
+
+#include <stm32f769-disco-u-boot.dtsi>
diff --git a/arch/arm/dts/stm32f769-disco-mb1166-reva09.dts b/arch/arm/dts/stm32f769-disco-mb1166-reva09.dts
new file mode 100644
index 000000000000..ff7ff32371d0
--- /dev/null
+++ b/arch/arm/dts/stm32f769-disco-mb1166-reva09.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32f769-disco.dts"
+
+&panel0 {
+	compatible = "frida,frd400b25025", "novatek,nt35510";
+	vddi-supply = <&vcc_3v3>;
+	vdd-supply = <&vcc_3v3>;
+	/delete-property/power-supply;
+};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
