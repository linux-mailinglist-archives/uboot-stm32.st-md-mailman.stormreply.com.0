Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF980DDD7
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:06:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B0F0C6B458;
	Mon, 11 Dec 2023 22:06:51 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1ACFC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:06:50 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-50bf69afa99so6404842e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332410; x=1702937210;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jgjor0CBTHy7XzOQ/Y6y7ZxJzmr44UtwtBmoDoQEgaY=;
 b=JUJMidF1I0COea5/WqwCYjWv4x727034OMTRei39qCAKQ6IcNfZBnh5j7b0Vtr+c44
 64r5U1tNifkG3iCvQcoU3UK5PAxQa97+mCT6J6VhkBIn3J+DBi+GQeE09yQcGpJ13MuI
 b95tkUZLxxYKxHuaSJcePS6Xi6683wpop7lCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332410; x=1702937210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgjor0CBTHy7XzOQ/Y6y7ZxJzmr44UtwtBmoDoQEgaY=;
 b=e9243Jx3rfmtOcz58aaSNI7YZXfPn4v5irzCqho1n2IXFisk4jA5hTLsO2RlZJU7bz
 tkUPBA9FWS2ANY+LTebBbuMBS4tV+cwLFPFlE0mjnVExm9wRVvy6Awxx5VeU/VfdStLs
 Af0IilXLqTsKOGS2uHTM6dS9VYkZQsRwiMo/1o5KrmS/8X7oSTBQD8BIt/3iOuTiAWvI
 LBCKf7nyWHZVlXg4jyyIrFnh73kDnBHXv9igHDIfNK1cTbKrIo5S5ebGK6hA5QZ2Wb3S
 3xjE06mFVXiyxVXEqgD7sJC6Uf9191zHagpLQf/zgA7FqrOUBaGIyK7Jp/92bjWjPtSB
 /uwg==
X-Gm-Message-State: AOJu0YwqjQGuMeYAgMFb/5I6w/C7aRn7aptEotbhbo6+gAsHntgxfen6
 vfl3MeyyOk6AyVJY0Ftz1Rw8AA==
X-Google-Smtp-Source: AGHT+IFaJh857hb/MLPxS3Jfsr6yHydSWHKdHJsxa1+MiT2ACUW0FP5UBgePlTSW4toPjZCI4H3L+A==
X-Received: by 2002:a05:6512:92a:b0:50b:e9ec:4e2c with SMTP id
 f10-20020a056512092a00b0050be9ec4e2cmr1933885lft.104.1702332409906; 
 Mon, 11 Dec 2023 14:06:49 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:06:49 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:50 +0100
Message-ID: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 0/6] Support display on stm32f469-disco
	board
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

The series adds support for the Orise Tech OTM8009A display on the
stm32f469-disco board. Substantial differences in the drivers for clock
management, LTDC and DSI compared to Linux, made it necessary to modify
the device tree. These changes were made in stm32f469-disco-uboot.dtsi to
avoid altering the Linux device tree. It is therefore desirable, as soon
as possible, to add these drivers the functionalities so that they do not
require device tree properties that deviate from those present in the Linux
version.

Changes in v3:
- Add Patrice Chotard's Reviewed-by tag.
- Remove RFC tag
- Split "[4/5] ARM: dts: stm32: support display on stm32f469-disco board"
  patch in 2 parts:
  - DTS ([4/6] ARM: dts: stm32: support MIPI DSI on stm32f469-disco board)
  - config and LTDC driver update ([5/6] board: stm32f469-disco: add support to display)

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag to patches 1, 2 and 3 of the series.
- Fix frame buffer allocation for stm32f469 discovery board.

Dario Binacchi (6):
  ARM: dts: stm32f469-disco: sync with Linux 6.5
  ARM: dts: stm32: make the LTDC clock usable by the clock driver
  ARM: dts: stm32: make the DSI clock usable by the clock driver
  ARM: dts: stm32: support MIPI DSI on stm32f469-disco board
  board: stm32f469-disco: add support to display
  board: stm32f469-disco: add splash screen with stmicroelectronics logo

 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  13 ++++++++++
 arch/arm/dts/stm32f469-disco.dts         |   4 +--
 configs/stm32f469-discovery_defconfig    |  16 ++++++++++++
 drivers/video/stm32/stm32_ltdc.c         |  31 +++++++++++++++++++++++
 include/configs/stm32f469-discovery.h    |   2 ++
 tools/logos/stm32f469-discovery.bmp      | Bin 0 -> 18532 bytes
 6 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 tools/logos/stm32f469-discovery.bmp

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
