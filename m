Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64293790DEF
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01AB7C6B44E;
	Sun,  3 Sep 2023 20:48:55 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8D62C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:48:53 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-99c93638322so173683666b.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774133; x=1694378933;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4QKPM1XwohIlginldl+jOoz/CGz32GSR1vatPUJR834=;
 b=Y9S4oKuATlALRQczR1uEGl67S/oeprUxGuClKBZBNP4n79K0WsQ2hqig07/XYC7+lC
 ZxTGQzG/mhTlKJOQuuu35wyZ/9tjMAM2UhQMxIlV63f0bawiQhvI4RStrtZwHltPRNTi
 DrC8r0bAvNqDpWOrRcNfIpaH6SrvzHviAEroo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774133; x=1694378933;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4QKPM1XwohIlginldl+jOoz/CGz32GSR1vatPUJR834=;
 b=VTZHEjW8vkA/PJfouUSrCIP452ZntGfqr6PZM/0d/iWFqguS3TBcyJgfdC8Otjbb/r
 RN89RffHNvi7/DL7l7KvmQumzTfGZN+QtCLPRmG5k9vkMhnXaJl/TkK6aZ0useOaen57
 qV4NimkgBgk6246PHVOrFsT3gVbPwGSe1JToP7EzwHut02lWbZAB3Bj2iKfUwKI3Opfm
 2FDknuvwR9/UOXUy7Nf3zSEM1eMw4A5pOOyUL4XBuqv3MY+XO/RdOTx7BMVt+J+xlyL2
 U2q7TTR564CM/GsOGMABYMHc2pnU5GHg+FXTwpf5fzWeR6DXnE1mNpJYtmHhvNMPqjxb
 ZYnw==
X-Gm-Message-State: AOJu0Ywe9SpGfOokoLhI5Ur80t1D9ZyV4f12EE6jN5dkL/lv8KvFNNrR
 Ox3Rq4088WQt64r6snTMNZLq3g==
X-Google-Smtp-Source: AGHT+IGbphW7BS9Ha2hfF7l97wgo8w4OxoK5DhOqWofNQP06zuTgZWlfzbNhZuxVLXNx5unZ0DSK+w==
X-Received: by 2002:a17:907:7b9e:b0:9a1:d29c:fb6b with SMTP id
 ne30-20020a1709077b9e00b009a1d29cfb6bmr12483582ejc.25.1693774132761; 
 Sun, 03 Sep 2023 13:48:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a170906131600b0099d9b50d786sm5182466ejb.199.2023.09.03.13.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:48:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:48:39 +0200
Message-Id: <20230903204849.660722-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Lee Jones <lee@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 00/10] ARM: dts: stm32f746 sync with Linux
	kernel 6.5
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

This series contains my patches on the device tree for stm32f746-disco board
that have already been merged into the Linux mainline. Since most of them
applied perfectly, and for the remaining ones, only minimal changes were made,
I preferred not to merge them into a single patch, which would have been less
readable.


Dario Binacchi (10):
  dt-bindings: mfd: stm32f7: Add binding definition for CAN3
  ARM: dts: stm32: add pin map for CAN controller on stm32f7
  ARM: dts: stm32: add CAN support on stm32f746
  ARM: dts: stm32: use RCC macro for CRC node on stm32f746
  ARM: dts: stm32: add pin map for i2c3 controller on stm32f7
  ARM: dts: stm32: add touchscreen on stm32f746-disco board
  ARM: dts: stm32: add ltdc support on stm32f746 MCU
  ARM: dts: stm32: add pin map for LTDC on stm32f7
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f746-disco
  ARM: dts: stm32: support display on stm32f746-disco board

 arch/arm/dts/stm32f7-pinctrl.dtsi        | 126 +++++++++++++++++++++++
 arch/arm/dts/stm32f746-disco-u-boot.dtsi | 103 +++++-------------
 arch/arm/dts/stm32f746-disco.dts         |  69 ++++++++++++-
 arch/arm/dts/stm32f746.dtsi              |  59 ++++++++++-
 include/dt-bindings/mfd/stm32f7-rcc.h    |   1 +
 5 files changed, 276 insertions(+), 82 deletions(-)

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
