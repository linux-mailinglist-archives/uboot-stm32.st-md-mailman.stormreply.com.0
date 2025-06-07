Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8D1AD0C37
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Jun 2025 11:37:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80F40C36B29;
	Sat,  7 Jun 2025 09:37:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48DC9C36B1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 09:37:34 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-adb2bd27c7bso454693366b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Jun 2025 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1749289053; x=1749893853;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q7iZhfZu/6LdWUyPZRXqfVRj8cwkrg8FELa16XUwObA=;
 b=K/Mbbg9wa5BlBOz7Lvv/Y96rx/HYX/1qiRxiNOJGN9BFHiOfDvmCib+wfkqk+eMc1n
 WMchiR7Pf3tYuHrGx6RMNK7GTGx6E9+HsvC0Od77RtSOZp906JyQrFind6yG6LpF4XxJ
 WXiCQ0kExqc7JOx/Kcya7MtMVsO8z8SJNuJmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749289053; x=1749893853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q7iZhfZu/6LdWUyPZRXqfVRj8cwkrg8FELa16XUwObA=;
 b=UJeyBswD0Z/kMoGSbN6y7uFpsi8pXItwpHGSI5I8c8rJFR/Tm7lY5oLdKGvfmDBl3d
 dyC0+fieWMzSxFouQFHBMW26kUMFM9sK8w6AX9Hx4qaZ3DeY7AGbgLG6CCRQqZ88OBAC
 90qdLMGiotYEik1f8fRxNJ5s8S3VkwdjtJmB8vnpGoDuG6ptfiKOFEWRSzkDDcBAmpQo
 gxZWgtaEfrxLkymRXbTN/+mCdjdeYAhWG+v8Qyf1gTxI9VpU/kJcQST4TmyhNyufM2Aq
 cA1Wleth1ZHaUpnrfVDN3SDHeQz4YRJQIYuRiZXGLTqEJd/o47pMGW4LADirPOMxvS5l
 fHYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP9DgFoda9Q5ko9hn3icyGR32psVD9mRVkrvPw+GakdaLumYUYBuPhRZhZKqkJybdX2W3Trv6p5Y04iQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywrN3F0DbyZojELYHBdt0nz1xP0/pKu1uDn/JGklyTQEzILGZq
 Yu/SqrC91zMNgGOS5pnfQ/62OUoFUFOZlSf5oQYmDBUHNiOxZW5TN67P/e6B+UASHfU=
X-Gm-Gg: ASbGncuvb1VVsmetoA9f3watN2wNamkJeiTzFT3TUUhcC9KoG1oomPxyM/99JFEJD9w
 w7YGE66NmVtCIpAeB8pfYXcbapvJN38hC+4wbFUi+6ihFUkySjf4eVTGsGi0gwN+4vksQ/15NWk
 Pwu+ypGWuUg1Agc/p44nj1J45SlyuWXHMAjfI4r5CTPmBRB9NbjBnFG222QwzrDOcBm8nC6OSf/
 2rd8PP/Z8USHmZOol5kFtI4K+ZLL38rXO4p8L0iOiVLtDHqFy9dj3i15iOPwy3YSjcdKbYZSSRH
 RW4AvRZptLVW2un2tL85Pk7ZLnToe5cU24e23fe1hwCG71aYpb/GLMt7tDi6TBk5cSFAdISfIrT
 77SoDL961B2kHUCcLir7+P0Y8Gxit6smFQVpmgnYGBRARtCD5fpeiWiT9dPcKgKrdfsJj+Ox9KB
 v0rlW9zk1lxEGM
X-Google-Smtp-Source: AGHT+IHCHmiyr8xJvNhCJDBYz1sYrsppokqIspjZobF4ber5shjX4BVLyyksEbfA+shSeeaBnhkgpw==
X-Received: by 2002:a17:907:8687:b0:ad8:9257:573f with SMTP id
 a640c23a62f3a-ade1a916fd8mr516661766b.7.1749289053553; 
 Sat, 07 Jun 2025 02:37:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38cffsm246524966b.124.2025.06.07.02.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 02:37:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat,  7 Jun 2025 11:37:08 +0200
Message-ID: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-amarula@amarulasolutions.com,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, uboot-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sumit Garg <sumit.garg@kernel.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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

The series adds support for stm32h747-discovery board.

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html


Dario Binacchi (9):
  ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
  dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
  dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
  ARM: dts: stm32: add uart8 node for stm32h743 MCU
  ARM: dts: stm32: add pin map for UART8 controller on stm32h743
  ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
  ARM: dts: stm32: support STM32h747i-disco board
  ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
  board: stm32: add stm32h747-discovery board support

 arch/arm/dts/stm32h747i-disco-u-boot.dtsi     | 104 ++++++++++++++
 arch/arm/mach-stm32/stm32h7/Kconfig           |   4 +
 board/st/stm32h747-disco/Kconfig              |  15 ++
 board/st/stm32h747-disco/MAINTAINERS          |   7 +
 board/st/stm32h747-disco/Makefile             |   6 +
 board/st/stm32h747-disco/stm32h747-disco.c    |  42 ++++++
 configs/stm32h747-disco_defconfig             |  35 +++++
 drivers/clk/stm32/clk-stm32h7.c               |   5 +
 dts/upstream/Bindings/arm/stm32/stm32.yaml    |   4 +
 .../include/dt-bindings/clock/stm32h7-clks.h  |   4 +-
 dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi  |  34 ++++-
 dts/upstream/src/arm/st/stm32h743.dtsi        |   8 ++
 dts/upstream/src/arm/st/stm32h743i-disco.dts  |   2 +-
 dts/upstream/src/arm/st/stm32h743i-eval.dts   |   2 +-
 dts/upstream/src/arm/st/stm32h747i-disco.dts  | 136 ++++++++++++++++++
 dts/upstream/src/arm/st/stm32h750i-art-pi.dts |   6 +-
 include/configs/stm32h747-disco.h             |  32 +++++
 17 files changed, 435 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/dts/stm32h747i-disco-u-boot.dtsi
 create mode 100644 board/st/stm32h747-disco/Kconfig
 create mode 100644 board/st/stm32h747-disco/MAINTAINERS
 create mode 100644 board/st/stm32h747-disco/Makefile
 create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
 create mode 100644 configs/stm32h747-disco_defconfig
 create mode 100644 dts/upstream/src/arm/st/stm32h747i-disco.dts
 create mode 100644 include/configs/stm32h747-disco.h

-- 
2.43.0

base-commit: b3f69c14187d413610abbc2b82d1a3752cb342c1
branch: stm32h747i-disco
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
