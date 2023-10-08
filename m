Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1B7BCF21
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Oct 2023 17:45:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C619C6B442;
	Sun,  8 Oct 2023 15:45:59 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B18A3C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 15:45:57 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-533e7d127d4so6414208a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696779957; x=1697384757;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FGKAgaWaq8j4SufF5PEWZku7JsXLcsXNqOhBcLo5wW0=;
 b=TjOIdPOi2xJecaOkTVghlDwfPtOnnMMHCxGDUZ5NLYMAhwci7DZvBN91dz5f4RTtCb
 R+92qIiMCB/kyiOSqSCZaEAaySLLlr2GXr6OXTooq5fFxmwDHD1Hzy+SEANnzneLwCQp
 Xu330BqvLj/wmzRfJqppEjhu2vpGBpGaOaFz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696779957; x=1697384757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FGKAgaWaq8j4SufF5PEWZku7JsXLcsXNqOhBcLo5wW0=;
 b=xUuPjOf8RiluwR1c1pyc3NVSBHT7z2IOhkPrHZMfKLOUqgGZAvH/p4/VhhSe/46C7q
 ZQlODGVzhAYxMzNdaSF/EaU69WHCTq5RVp5LunEsXE6qG+yOak5H86xQvNa+lawZ5NEa
 iKlzvk7Q4wG0Q+7K6uKIS5cvv0xejHzTqzKafTlnO3UqjtV9l8I4pbrMyuV5he8oei8O
 d7o5Sipxe93/LhGpMcaM/ATg4KuKxA62kQPdam/wEiLdVKb9SWWR4BUnIK7f0r1LUX3I
 1SThlgCwOo+sCgKMo/UbqodKZEkDKexoIzEZqf2+tMSZfWlLw0tRDrjAiFxGjVAI/WPr
 GXqg==
X-Gm-Message-State: AOJu0Yx8aH7X7bkV9Dqs75HVGmFf4s3U5+h6v4uwI6vC46APP6HekXEP
 CCemr8/KzIX/EeLYeuk+4Hk7qA==
X-Google-Smtp-Source: AGHT+IHVQsHY5UZ+YToecke/lMgaJB2OLbZsFe4sWhakDfKiPfxqVniWLEBX0FPw3riUAHkn3UDKvw==
X-Received: by 2002:a17:907:b1c:b0:9b2:787d:b326 with SMTP id
 h28-20020a1709070b1c00b009b2787db326mr11910573ejl.16.1696779957041; 
 Sun, 08 Oct 2023 08:45:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-50-102-159.retail.telecomitalia.it. [79.50.102.159])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm5623981ejb.131.2023.10.08.08.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 08:45:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Oct 2023 17:44:52 +0200
Message-ID: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH v2 0/5] Support display on stm32f469-disco
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

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag to patches 1, 2 and 3 of the series.
- Fix frame buffer allocation for stm32f469 discovery board.

Dario Binacchi (5):
  ARM: dts: stm32f469-disco: sync with Linux 6.5
  ARM: dts: stm32: make the LTDC clock usable by the clock driver
  ARM: dts: stm32: make the DSI clock usable by the clock driver
  ARM: dts: stm32: support display on stm32f469-disco board
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
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
