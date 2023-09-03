Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 601A9790E00
	for <lists+uboot-stm32@lfdr.de>; Sun,  3 Sep 2023 22:57:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBB4BC6B44E;
	Sun,  3 Sep 2023 20:57:07 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A70AC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 20:57:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-52e297c7c39so418569a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 03 Sep 2023 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693774626; x=1694379426;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Pu874AXqAnFuFEoWLwUCi0oaN1bQ6BNWKx9R8q+zZXk=;
 b=CCCu/8B/AXIrRjdtkZn0UqLre6nUIPl7ZlYwSs57g6yuFzCEd2Kw9sNafdTv6EwP40
 Z6YZisYg4+EEpdWYQCo8vJWawN6Sx2Ukzi0p2cxvTLyRdsG9zEj1lCUKMhXAIAQ0I/KN
 hYxCg4ARQT8LwvOrAZNAaB9gOAgd2meQGRA3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693774626; x=1694379426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Pu874AXqAnFuFEoWLwUCi0oaN1bQ6BNWKx9R8q+zZXk=;
 b=ZMOewzE6uU0/rEOIktZOF71rsDqrrpXE5LJfzgpdauo1I2ZxTi2Jrl07BbO0WGzph/
 xBBXJeKXPA2lhBrdnChNpj5ixrQtpi98wFbfif2tPoKzkVz1lLcoVdOUcKR+i/8FGauK
 x6S8BXNbdV45QuNckh7o4StBJy1voK/yYm6LVsDwEgNen+nxc0sEOnva5IH23AlFueyB
 OV/dv11r7rCUhj2113kjTCpRplobnCbjRW69Zyl4o1u7+UWSjXcPq+vkp6bIR/7s4CcF
 YHmfKIWgSy1pvv9KRpoJu7ne8Ne98Fl9b8aiE661vHw120zlD2FmD3lc2zcyc2CerwMv
 JLzA==
X-Gm-Message-State: AOJu0YxtLT2m5yyJ7D83rL7a5i4bEjJ47eJpmP44MriJzMagYzhYD1YF
 W+e8UKoDl2km84EYjB7T5pKOrA==
X-Google-Smtp-Source: AGHT+IGu3c6CExox+4C9h8/JyNKpmciYT1Mbp/YEH5ZidJjjz2xdvPeECf08e0v/Nix3rxEo7KNHrQ==
X-Received: by 2002:aa7:cfc5:0:b0:525:d95b:cd4c with SMTP id
 r5-20020aa7cfc5000000b00525d95bcd4cmr5892731edy.20.1693774626130; 
 Sun, 03 Sep 2023 13:57:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 v22-20020aa7d9d6000000b0052568bf9411sm4850232eds.68.2023.09.03.13.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 13:57:05 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  3 Sep 2023 22:56:58 +0200
Message-Id: <20230903205703.662080-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH 0/5] Support display on stm32f469-disco
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


Dario Binacchi (5):
  ARM: dts: stm32f469-disco: sync with Linux 6.5
  ARM: dts: stm32: make the LTDC clock usable by the clock driver
  ARM: dts: stm32: make the DSI clock usable by the clock driver
  ARM: dts: stm32: support display on stm32f469-disco board
  board: stm32f469-disco: add splash screen with stmicroelectronics logo

 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  13 ++++++++
 arch/arm/dts/stm32f469-disco.dts         |   4 +--
 configs/stm32f469-discovery_defconfig    |  16 ++++++++++
 drivers/video/stm32/stm32_ltdc.c         |  37 ++++++++++++++++++++++-
 include/configs/stm32f469-discovery.h    |   2 ++
 tools/logos/stm32f469-discovery.bmp      | Bin 0 -> 18532 bytes
 6 files changed, 69 insertions(+), 3 deletions(-)
 create mode 100644 tools/logos/stm32f469-discovery.bmp

-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
