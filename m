Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8C9A774DD
	for <lists+uboot-stm32@lfdr.de>; Tue,  1 Apr 2025 09:01:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8763C78034;
	Tue,  1 Apr 2025 07:01:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB0EBCFAC50
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Apr 2025 07:01:29 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43948021a45so52478345e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 01 Apr 2025 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1743490889; x=1744095689;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H3eWv9TxtT4dAVKPSAGwi+x6nlozcvmF0C9mEuJ0A6o=;
 b=ps1L7IfWgPaeLMGesITaewdscnuwEiieiAhBrFZaiLBImrkpiOMhs8ikquPx/KpyVJ
 7lCuB/lWgNGJRFJUOaC0/yYxNzoMFxJQwyiYTTsb/E3V4tBfneSFhbTqOv5sgNOu2zuq
 wqssWJCNT543jcU+bQt88K3PKeBH9wijROuok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743490889; x=1744095689;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H3eWv9TxtT4dAVKPSAGwi+x6nlozcvmF0C9mEuJ0A6o=;
 b=F+6N5SwI0/dO1gNfu4mmGS2gr0i8wAvtxL077bcgiY3RtCe+146S3xxgTfTggkIBNo
 V/LUGflPsiwyg9YiACYxSeJvKkY530dUxFWFtJ0QD13gcAN4RZRf1yGCrjY5hj/5IExD
 LMcXAbXsIg4lxUW70nnhEBiGsw8buTdhbuaAuwxBbfx3stnZiabZ3JVAWas2CSWPtkVd
 n7Xt+DctxNyiaHsbBWss11JgSWLg+7H05/Jlfnw6lfvEMtS9f6BxvoNyZua7fuHelV/O
 LREQRPZ4lnMQ0sxTaCwNzMDyDj6C/0Yn5RZFJq5xBQjlLGKwnm0kXWhcMESEB4owtpPb
 B58w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBHyhH1rKllxmHoB+FFp0gCGSrPrpZ6PdzyxQiXZ6Bw3mYfPM8XnelqnbE0vXdGiByxmiNx2uRGXZHlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzWHa4BCcX7kfVTaWMnQIMJV5IGdTjIM2pqMjgRMrJIEBMkpTwY
 p5p3OtwB+7pB/H3I9qsr2/CrtcL3FF93ZEUYjGdsrCRjYeoKa1KA9POi3EH6WKM=
X-Gm-Gg: ASbGncsC73FhvpfeQ0HjwNTNDmuggPZ+ycosQamG41wtFgAzQdp0d/np7QT0J+jrk3g
 4xevRF821Gox/ei1YlNCAn5JERlzs33wBXTYV5Kwz5OAMeJO8QizuzVZlANCFlpr+PKH0+JC27j
 yDN3Yr5vtc4BKrusUZZQ44C43DgjGdxsL4WkGGI43B0d8blY3qQET3M24AQOcVpOQ6t0Tq3UCPE
 uAaSD6dTCJIbORa8UdqN0DlAlCT81aeOvpEur45/i8VNVakdxW06InxDUzcYPn6srgnLQmYPB0B
 0dI4fBFvALZnTIfwKDjYGrJV5l799FbFuKHkZwRaX7gSitSTpOQAsfUhpi3qg/05vRcfBW11fvi
 dR/UnNQWvZQtJXZl4v7Jg
X-Google-Smtp-Source: AGHT+IHdZNgJW2L1yrBrvxg+AHOdLrqZccxn6TP9kt7tvpJHQTxU1OKwPpi10MvKB7CE1rNNzVZROw==
X-Received: by 2002:a05:600c:314b:b0:43c:fe15:41cb with SMTP id
 5b1f17b1804b1-43db6249672mr112519885e9.15.1743490889176; 
 Tue, 01 Apr 2025 00:01:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66b015sm13701760f8f.54.2025.04.01.00.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 00:01:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Tue,  1 Apr 2025 09:00:51 +0200
Message-ID: <20250401070125.3705126-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Kever Yang <kever.yang@rock-chips.com>,
 Anton Bambura <jenneron@protonmail.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Tom Rini <trini@konsulko.com>, Tony Dinh <mibodhi@gmail.com>,
 Anatolij Gustschin <agust@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Jonas Karlman <jonas@kwiboo.se>,
 Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>, Sumit Garg <sumit.garg@kernel.org>,
 Prasad Kummari <prasad.kummari@amd.com>, Adam Ford <aford173@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v2 0/6] Support NT35510 panel controller on
	stm32f769i-disco board
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

The series, inspired by some of my patches already merged into Linux,
adds support for the Novatek NT35510 panel on the stm32f769i-disco
board. Indeed, the MB1166 board comes in different hardware revisions.
The MB1166-A09 is utilizing a NT35510 panel controller while prior
versions are utilizing an OTM8009a controller.

Changes in v2:
- Add Reviewed-by tag of Patrice Chotard
- Add Reviewed-by tag of Patrice Chotard
- Add Reviewed-by tag of Patrice Chotard
- Add Reviewed-by tag of Patrice Chotard
- Replace board with configs in the commit title
- Add Reviewed-by tag of Patrice Chotard

Dario Binacchi (6):
  ARM: dts: stm32: add DSI support on stm32f769
  ARM: dts: stm32: rename mmc_vcard to vcc-3v3 on stm32f769-disco
  ARM: dts: stm32: add display support on stm32f769-disco
  ARM: dts: add stm32f769-disco-mb1166-reva09
  video: support FRIDA FRD400B25025-A-CTK
  configs: stm32f769-disco: support FRD400B25025-A-CTK display

 arch/arm/dts/Makefile                         |    1 +
 .../stm32f769-disco-mb1166-reva09-u-boot.dtsi |    6 +
 .../arm/dts/stm32f769-disco-mb1166-reva09.dts |   13 +
 arch/arm/dts/stm32f769-disco-u-boot.dtsi      |   53 +-
 arch/arm/dts/stm32f769-disco.dts              |   66 +-
 arch/arm/dts/stm32f769.dtsi                   |   20 +
 configs/stm32f769-disco_defconfig             |    2 +
 configs/stm32f769-disco_spl_defconfig         |    2 +
 drivers/video/Kconfig                         |    7 +
 drivers/video/Makefile                        |    1 +
 drivers/video/novatek-nt35510.c               | 1253 +++++++++++++++++
 11 files changed, 1374 insertions(+), 50 deletions(-)
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32f769-disco-mb1166-reva09.dts
 create mode 100644 arch/arm/dts/stm32f769.dtsi
 create mode 100644 drivers/video/novatek-nt35510.c

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
