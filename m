Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E8A6E1EF
	for <lists+uboot-stm32@lfdr.de>; Mon, 24 Mar 2025 19:00:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E09E2C7802F;
	Mon, 24 Mar 2025 18:00:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2425C78037
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 18:00:56 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso43959155e9.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 11:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1742839256; x=1743444056;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=634baF+8vyDp0dvmy7CnoRrw+gWbjJIGLJPMeou/TbE=;
 b=CqueRAROrFL2HuDwEHqCE5Gvek0Boc+2Q1MSh9ujgoe98x+WLsDy3nEt06X4u45SCG
 aijUpzAjoXUPz0/XL6mlL3AmgX0/UdLgtYzL32CRalPFdJIEMUmo8xDVbn623JSJQsid
 VEWWQfZDiwFqJEJTUXPVS0RTz+pA/j5obK0QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742839256; x=1743444056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=634baF+8vyDp0dvmy7CnoRrw+gWbjJIGLJPMeou/TbE=;
 b=SXhx6k+Opwy0RNHUX8W7lrmNiXhSUxaqqqBS/9rHDVOeBoTpBCyt2cx0yC7U/dYmDg
 H0/b0BOdeByTwZwmJBzNWCNFwYJsrImO+QVoNbtOWv5RpfmTa5lAJJh58dU6ocS4AnL3
 szsGoNBzaN8bCVSHcz+raV8sH+TVVIdnkWKn1jorA0p/nb9eBxvNrI6exGtVBmkffezw
 m3kOyGa25p0K2RvD3mPkoZL0zzGsdVupGrWWyRqIRLqg79Qs7VLW5YMR6R2HpiZkijV7
 4C7LXkspKFTptJEVXFXtYc58Y8WislWA/C78TDJQXIfaiJkZey2TK91UCoD0nMCx8k9K
 nKWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/RNdqEBywgrSrNMKe2mgP0IeXOhrrMVtCP4zrzojNZNUY7FbmptgqrLTw+EKr3aso+kgXne0n8XrlBA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzCmBViOACK6CNoZwXnMjyD+I+IgaV+EXmil8wwUVykJMzF9B8
 c0OW6hFA/0EUQ4IqUIDKT7D85DglqV0BtVkR0mSl+YXUsoBe+ZvwbVwYP8oOJ+g=
X-Gm-Gg: ASbGnctToya9ICF0qlCs+fRK57CH1yyfaIh93qNujS+kv4599nc5FaOcz5RuTZRbAKC
 bB1kj76mPayXZpvQWumnS77brS/hWI2KVnfwnDcaeQpSYWNoyzGwn2ywgIsbAH8ztqviU1TIhn5
 hNmAloNzpYWuhE2X+9MhsENOeQa0yY1XCIQonqZuUmEnQSvPK5ztUxAjOlZgxWsX3Bxwk3VV0mA
 VZMNZhVkkt/e0FCHSl2fc4r9lkm+EDhhK4hw5oG3C8E4xA3v3BR8GKh8yzD1ADvP0XBB0FTx+c1
 iBnwnfBPlrVIiRyZTDo8hZwxz6G8vVzb7iH/JXmKirxdC+JfdIPA8qhMVSAgDBTkS6xPVj+LMY3
 U0uIZ9BTef1Tt140XSn4y9dmclbYZgvJ2BgM=
X-Google-Smtp-Source: AGHT+IFwaItYxj5X1obGtAdJ6BEXdKr4zJY0U4rjFSiu/qn+30IVF6Nj5IXRj8fg1tnWC6Lxqkt5zA==
X-Received: by 2002:a05:600c:c07:b0:43d:45a:8fc1 with SMTP id
 5b1f17b1804b1-43d509e4640mr136027735e9.4.1742839256235; 
 Mon, 24 Mar 2025 11:00:56 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.220])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556a4sm178289285e9.22.2025.03.24.11.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 11:00:55 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 24 Mar 2025 19:00:28 +0100
Message-ID: <20250324180047.1571378-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
References: <20250324180047.1571378-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Fabio Estevam <festevam@denx.de>, Tony Dinh <mibodhi@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 linux-amarula@amarulasolutions.com, Kever Yang <kever.yang@rock-chips.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Sumit Garg <sumit.garg@kernel.org>,
 Tom Rini <trini@konsulko.com>, Andre Przywara <andre.przywara@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Prasad Kummari <prasad.kummari@amd.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>
Subject: [Uboot-stm32] [PATCH 4/6] ARM: dts: add
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
---

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
