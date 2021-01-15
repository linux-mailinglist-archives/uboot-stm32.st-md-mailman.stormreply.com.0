Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6002F7D9F
	for <lists+uboot-stm32@lfdr.de>; Fri, 15 Jan 2021 15:05:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CBF2C424BE;
	Fri, 15 Jan 2021 14:05:08 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B599AC32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 14:05:06 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id n4so18203383iow.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 06:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOz75kC1pmLBovza3/e0GIYP1qBAkSCggkCT0UJeGwY=;
 b=jURkPS+16pS82dcIRX3dKb3Qs5VW42jgL3OmUgGwMpXTheghDptct9qzcwEL2DsUct
 xxNFfnTUu7TcVOzvsF8Xh4yK0TZ8r7c2FuacloxCcGFzAxfQTwmr4C5ZFGlX2netDGf5
 kf3039juL6dqzkeKwsaKnJNUtDTmhCJqgiSUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dOz75kC1pmLBovza3/e0GIYP1qBAkSCggkCT0UJeGwY=;
 b=HJQEBSQfmL8npoGEFEJPj2uNfOm4xaxkKjBwPe7UQ5849D/kppyxCSUwbssfkT2Ig4
 q5sDRmjJqvkQm98hgnSzDt8siNO4AqSmgQWPiTXfvdSCkOSVpXciNZxCbhRxY9iz+AB3
 GGfyQJjx8Xq5hfcKqmJSgFfEsYj9k/fi7Pil4ICjnSp08DXSbH3FCchYQzuzwqyOAvJi
 7jQmLRrnb6HwfmDF8w1+FW4sXxvIAKDhm4Zhag/tb4DkIkkEsMEQnbW9G5LpHp/bLMwj
 SdZxqNfcjSW43hQqbmxnKIZ1+2E1uBcfGacL8Q0u6LiahchaEiCSx75yLouBCmIOzcDg
 uAyA==
X-Gm-Message-State: AOAM530ySwcCFbYdi615Z7EnhHVJSaEeXbepmWwr+sdRHdNsAii+C43U
 Cq3GJ8hWhLRxwrMap8qntANnLw==
X-Google-Smtp-Source: ABdhPJzFo66y05DP45sdXPUflJsykVimVDwM6iXQ8OZmnL4UDpd61urnipx081TEBWzv/Gj2/pm/Zg==
X-Received: by 2002:a05:6638:d8a:: with SMTP id
 l10mr4834602jaj.2.1610719505704; 
 Fri, 15 Jan 2021 06:05:05 -0800 (PST)
Received: from localhost.localdomain (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id 1sm5664843ilv.37.2021.01.15.06.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:05:04 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Fri, 15 Jan 2021 07:04:45 -0700
Message-Id: <20210115140500.846307-1-sjg@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bin Meng <bmeng.cn@gmail.com>, Walter Lozano <walter.lozano@collabora.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Pratyush Yadav <p.yadav@ti.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Wolfgang Wallner <wolfgang.wallner@br-automation.com>,
 Heiko Schocher <hs@denx.de>, Pavel Herrmann <morpheus.ibis@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dario Binacchi <dariobin@libero.it>
Subject: [Uboot-stm32] [PATCH 00/15] gpio: Update and simplify the uclass API
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

At present the GPIO uclass mirrors what was in U-Boot before driver model.
It works well in most cases but is becoming cumbersome with things like
pull-up/down and drive strength. In those cases it is easier for the
driver to deal with all the flags at one, rather than piece by piece.

In fact the current API does not officially have a method for adjusting
anything other than the direction flags. While set_dir_flags() and
get_dir_flags() do in fact support changing other flags, this is not
documented.

Secondly, set_dir_flags actually ORs the current flags with the new ones
so it is not possible to clear flags. It seems better to use a clr/set
interface (bit clear followed by OR) to provide more flexibility.

Finally, direction_input() and direction_output() are really just the same
thing as set_dir_flags(), with a different name. We currently use the
latter if available, failing back to the former. But it makes sense to
deprecate the old methods.

This series makes the above changes. Existing drivers are mostly left
alone, since they should continue to operate as is. The sandbox driver is
updated to add the required new tests and the x86 driver is switched over
to the new API.

The STM32 driver should be checked to make sure the open source/open drain
features still work as intended.


Simon Glass (15):
  gpio: Disable functions not used with of-platdata
  dm: gpio: Rename set_dir_flags() method to update_flags()
  dm: gpio: Rename get_dir_flags() method to get_flags()
  gpio: Rename dm_gpio_get_dir_flags() to dm_gpio_get_flags()
  gpio: Drop dm_gpio_set_dir()
  gpio: sandbox: Rename GPIO dir_flags to flags
  gpio: sandbox: Use a separate flag for the value
  gpio: sandbox: Fully separate pin value from output value
  gpio: sandbox: Make sandbox_gpio_set_flags() set all flags
  dm: gpio: Add a way to update flags
  gpio: Replace direction_input() and direction_output()
  gpio: Use an 'ops' variable everywhere
  gpio: x86: Drop the deprecated methods in intel_gpio
  gpio: sandbox: Track whether a GPIO is driven
  gpio: Add a way to read 3-way strapping pins

 arch/sandbox/include/asm/gpio.h           |  17 +-
 arch/x86/include/asm/intel_pinctrl_defs.h |   5 +
 drivers/gpio/gpio-uclass.c                | 228 ++++++++++++++-----
 drivers/gpio/intel_gpio.c                 |  72 +++---
 drivers/gpio/sandbox.c                    | 137 ++++++++----
 drivers/gpio/stm32_gpio.c                 |  14 +-
 drivers/pinctrl/pinctrl-stmfx.c           |  14 +-
 include/asm-generic/gpio.h                | 130 +++++++++--
 test/dm/gpio.c                            | 261 +++++++++++++++++++---
 9 files changed, 663 insertions(+), 215 deletions(-)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
