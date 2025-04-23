Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6CA98E31
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Apr 2025 16:53:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18750C71287;
	Wed, 23 Apr 2025 14:53:37 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6068DC71287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 06:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E8A09A4C17A;
 Wed, 23 Apr 2025 06:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE0BC4CEEC;
 Wed, 23 Apr 2025 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745391036;
 bh=2zAYnR0xUM0yP0KJdRCoxm0NV7BITpFndz+9/JH/2I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MRIWuaaKQv7ohnI7QEstIsX5Mx49ppraG6qsGKUPzUvy9kx0q0xjCdUGW2XE1oXbe
 vmtUW+GIKV6g0yiZUujGk6gRaFPs80le/ADlbDIG43e3jVDJrievsNp23nN4VGY9ko
 lG2TnLac5AAg7APYXJDyhs9f+/+jbjqgreDV7JLlJT3J4oJ5pRMsswFYZNs5e6Srgw
 KiWbqB7FkuZ7Kpk9y0LYKeU20nwpGl51S3n74L06BeYOy/83l84RXV6u59/SDGTWzf
 0dnWTWhq63bP+7rmehBZE0+QGFUw8Fq5YFy3xY0x45uV8Ua5zj6aoXH/AWj5JaIXMy
 zVlUPbiGeKBgA==
Date: Wed, 23 Apr 2025 12:20:22 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <aAiNruK3MBVV7ZN_@sumit-X1>
References: <20250422131229.415020-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250422131229.415020-1-patrice.chotard@foss.st.com>
X-Mailman-Approved-At: Wed, 23 Apr 2025 14:53:36 +0000
Cc: Fabio Estevam <festevam@denx.de>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Sean Anderson <seanga2@gmail.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Bernhard Messerklinger <bernhard.messerklinger@br-automation.com>,
 Michal Simek <michal.simek@amd.com>, Lukasz Majewski <lukma@denx.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Oliver Gaskell <Oliver.Gaskell@analog.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Simon Glass <sjg@chromium.org>,
 Prasad Kummari <prasad.kummari@amd.com>, Dillon Min <dillon.minfei@gmail.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Christophe Roullier <christophe.roullier@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/13] Enable OF_UPSTREAM for STM32 and
	STi platforms
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

On Tue, Apr 22, 2025 at 03:12:16PM +0200, Patrice Chotard wrote:
> This series is enabling OF_UPSTREAM flag for STM32 MCU's, MPU's and
> STi platforms.
> For some boards, some defconfig and DT update are needed to keep the
> same functional level.
> 
> The major impact concerns MPU's platform with introduction of STM32
> System Bus.
> 
> Changes in v2:
>   - Replace LOG_CATEGORY UCLASS_SIMPLE_BUS by UCLASS_NOP in both
>     /arch/arm/mach-stm32mp/stm32mp2/rifsc.c and
>     /arch/arm/mach-stm32mp/stm32mp1/etzpc.c.
>   - Update board/st/stm32mp1/MAINTAINERS.
>   - Fix DSI clock ssetting.
> 
> Lionel Debieve (3):
>   ARM: stm32mp: add ETZPC system bus driver for STM32MP1
>   ARM: dts: stm32: add ETZPC as a system bus for STM32MP1x boards
>   stm32mp: fdt: remove ETZPC peripheral cleanup
> 

> Patrice Chotard (9):
>   ARM: dts: sti: convert stih410-b2260 board to OF_UPSTREAM
>   ARM: dts: stm32: convert stm23h7 boards to OF_UPSTREAM
>   ARM: dts: stm32: convert stm23f7 boards to OF_UPSTREAM
>   ARM: dts: stm32: convert stm23f4 boards to OF_UPSTREAM
>   ARM: dts: stm32: convert stm32mp13 board to OF_UPSTREAM
>   ARM: dts: stm32: convert stm32mp15 board to OF_UPSTREAM
>   configs: stm32: introduce stm32mp15-odyssey_defconfig
>   clk: stm32mp1: fix DSI clock setting
>   ARM: dts: stm32: convert stm32mp2 board to OF_UPSTREAM

Glad to see the diff with OF_UPSTREAM adoption, feel free to add
following to the OF_UPSTREAM adoption patches:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> Patrick Delaunay (1):
>   ARM: stm32mp: add RIFSC system bus driver for STM32MP25
> 
>  arch/arm/dts/Makefile                         |   31 -
>  arch/arm/dts/st-pincfg.h                      |   72 -
>  arch/arm/dts/stih407-clock.dtsi               |  323 --
>  arch/arm/dts/stih407-family.dtsi              | 1000 ------
>  arch/arm/dts/stih407-pinctrl.dtsi             | 1262 --------
>  arch/arm/dts/stih410-b2260-u-boot.dtsi        |   46 +-
>  arch/arm/dts/stih410-b2260.dts                |  214 --
>  arch/arm/dts/stih410-clock.dtsi               |  333 --
>  arch/arm/dts/stih410-pinctrl.dtsi             |   31 -
>  arch/arm/dts/stih410.dtsi                     |  300 --
>  arch/arm/dts/stm32429i-eval.dts               |  284 --
>  arch/arm/dts/stm32746g-eval.dts               |  186 --
>  arch/arm/dts/stm32f4-pinctrl.dtsi             |  447 ---
>  arch/arm/dts/stm32f429-disco.dts              |  190 --
>  arch/arm/dts/stm32f429-pinctrl.dtsi           |   55 -
>  arch/arm/dts/stm32f429.dtsi                   |  758 -----
>  arch/arm/dts/stm32f469-disco.dts              |  213 --
>  arch/arm/dts/stm32f469-pinctrl.dtsi           |   55 -
>  arch/arm/dts/stm32f469.dtsi                   |   18 -
>  arch/arm/dts/stm32f7-pinctrl.dtsi             |  415 ---
>  arch/arm/dts/stm32f746-disco-u-boot.dtsi      |   13 +-
>  arch/arm/dts/stm32f746-disco.dts              |  169 -
>  arch/arm/dts/stm32f746-pinctrl.dtsi           |   11 -
>  arch/arm/dts/stm32f746.dtsi                   |  613 ----
>  arch/arm/dts/stm32f769-disco-u-boot.dtsi      |   60 +-
>  arch/arm/dts/stm32f769-disco.dts              |  133 -
>  arch/arm/dts/stm32f769-pinctrl.dtsi           |   11 -
>  arch/arm/dts/stm32h7-pinctrl.dtsi             |  274 --
>  arch/arm/dts/stm32h7-u-boot.dtsi              |    1 -
>  arch/arm/dts/stm32h743.dtsi                   |  695 ----
>  arch/arm/dts/stm32h743i-disco.dts             |   75 -
>  arch/arm/dts/stm32h743i-eval.dts              |  160 -
>  arch/arm/dts/stm32h750.dtsi                   |    5 -
>  arch/arm/dts/stm32h750i-art-pi.dts            |  188 --
>  arch/arm/dts/stm32mp13-pinctrl.dtsi           |  888 ------
>  arch/arm/dts/stm32mp13-u-boot.dtsi            |    4 +
>  arch/arm/dts/stm32mp131.dtsi                  | 1567 ---------
>  arch/arm/dts/stm32mp133.dtsi                  |   98 -
>  arch/arm/dts/stm32mp135.dtsi                  |   12 -
>  arch/arm/dts/stm32mp135f-dk.dts               |  376 ---
>  arch/arm/dts/stm32mp13xc.dtsi                 |   18 -
>  arch/arm/dts/stm32mp13xf.dtsi                 |   18 -
>  arch/arm/dts/stm32mp15-pinctrl.dtsi           | 2826 -----------------
>  arch/arm/dts/stm32mp15-scmi.dtsi              |   88 -
>  arch/arm/dts/stm32mp15-u-boot.dtsi            |    4 +
>  arch/arm/dts/stm32mp151.dtsi                  | 1868 -----------
>  arch/arm/dts/stm32mp153.dtsi                  |   59 -
>  arch/arm/dts/stm32mp157.dtsi                  |   48 -
>  arch/arm/dts/stm32mp157a-dk1-scmi.dts         |   82 -
>  arch/arm/dts/stm32mp157a-dk1.dts              |   25 -
>  .../stm32mp157a-icore-stm32mp1-ctouch2.dts    |   49 -
>  ...157a-microgea-stm32mp1-microdev2.0-of7.dts |  161 -
>  ...32mp157a-microgea-stm32mp1-microdev2.0.dts |   59 -
>  .../dts/stm32mp157a-microgea-stm32mp1.dtsi    |  148 -
>  arch/arm/dts/stm32mp157c-dk2-scmi.dts         |   88 -
>  arch/arm/dts/stm32mp157c-dk2.dts              |   94 -
>  arch/arm/dts/stm32mp157c-ed1-scmi.dts         |   87 -
>  arch/arm/dts/stm32mp157c-ed1.dts              |  403 ---
>  arch/arm/dts/stm32mp157c-ev1-scmi.dts         |   93 -
>  arch/arm/dts/stm32mp157c-ev1.dts              |  414 ---
>  arch/arm/dts/stm32mp15xc.dtsi                 |   18 -
>  arch/arm/dts/stm32mp15xx-dkx.dtsi             |  741 -----
>  arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi       |   85 -
>  arch/arm/dts/stm32mp15xxab-pinctrl.dtsi       |   57 -
>  arch/arm/dts/stm32mp15xxac-pinctrl.dtsi       |   73 -
>  arch/arm/dts/stm32mp15xxad-pinctrl.dtsi       |   57 -
>  arch/arm/dts/stm32mp25-pinctrl.dtsi           |   38 -
>  arch/arm/dts/stm32mp251.dtsi                  |  301 --
>  arch/arm/dts/stm32mp253.dtsi                  |   23 -
>  arch/arm/dts/stm32mp255.dtsi                  |    9 -
>  arch/arm/dts/stm32mp257.dtsi                  |    9 -
>  arch/arm/dts/stm32mp257f-ev1-u-boot.dtsi      |   65 +
>  arch/arm/dts/stm32mp257f-ev1.dts              |   55 -
>  arch/arm/dts/stm32mp25xc.dtsi                 |    8 -
>  arch/arm/dts/stm32mp25xf.dtsi                 |    8 -
>  arch/arm/dts/stm32mp25xxai-pinctrl.dtsi       |   83 -
>  arch/arm/dts/stm32mp25xxak-pinctrl.dtsi       |   71 -
>  arch/arm/dts/stm32mp25xxal-pinctrl.dtsi       |   71 -
>  arch/arm/mach-stm32/Kconfig                   |    3 +
>  arch/arm/mach-stm32mp/Kconfig                 |   11 +-
>  arch/arm/mach-stm32mp/include/mach/etzpc.h    |   32 +
>  arch/arm/mach-stm32mp/include/mach/rif.h      |   26 +
>  arch/arm/mach-stm32mp/stm32mp1/Makefile       |    1 +
>  arch/arm/mach-stm32mp/stm32mp1/etzpc.c        |  194 ++
>  arch/arm/mach-stm32mp/stm32mp1/fdt.c          |  258 --
>  arch/arm/mach-stm32mp/stm32mp2/Makefile       |    1 +
>  arch/arm/mach-stm32mp/stm32mp2/rifsc.c        |  364 +++
>  board/st/stm32mp1/MAINTAINERS                 |    2 +
>  configs/stih410-b2260_defconfig               |    3 +-
>  configs/stm32746g-eval_defconfig              |    3 +-
>  configs/stm32746g-eval_spl_defconfig          |    3 +-
>  configs/stm32f429-discovery_defconfig         |    2 +-
>  configs/stm32f429-evaluation_defconfig        |    2 +-
>  configs/stm32f469-discovery_defconfig         |    2 +-
>  configs/stm32f746-disco_defconfig             |    3 +-
>  configs/stm32f746-disco_spl_defconfig         |    3 +-
>  configs/stm32f769-disco_defconfig             |    4 +-
>  configs/stm32f769-disco_spl_defconfig         |    4 +-
>  configs/stm32h743-disco_defconfig             |    2 +-
>  configs/stm32h743-eval_defconfig              |    2 +-
>  configs/stm32h750-art-pi_defconfig            |    2 +-
>  configs/stm32mp13_defconfig                   |    2 +-
>  ...stm32mp15-icore-stm32mp1-ctouch2_defconfig |    2 +-
>  ...tm32mp15-icore-stm32mp1-edimm2.2_defconfig |    2 +-
>  ...-microgea-stm32mp1-microdev2-of7_defconfig |    2 +-
>  ...mp15-microgea-stm32mp1-microdev2_defconfig |    2 +-
>  configs/stm32mp15-odyssey_defconfig           |  172 +
>  configs/stm32mp15_basic_defconfig             |    4 +-
>  configs/stm32mp15_defconfig                   |    4 +-
>  configs/stm32mp15_trusted_defconfig           |    4 +-
>  configs/stm32mp25_defconfig                   |    2 +-
>  drivers/clk/stm32/clk-stm32mp1.c              |    1 +
>  include/configs/stm32f746-disco.h             |    2 +-
>  include/dt-bindings/clock/stih407-clks.h      |   90 -
>  include/dt-bindings/clock/stih410-clks.h      |   25 -
>  include/dt-bindings/mfd/st-lpc.h              |   16 -
>  include/dt-bindings/reset/stih407-resets.h    |   65 -
>  117 files changed, 950 insertions(+), 20362 deletions(-)
>  delete mode 100644 arch/arm/dts/st-pincfg.h
>  delete mode 100644 arch/arm/dts/stih407-clock.dtsi
>  delete mode 100644 arch/arm/dts/stih407-family.dtsi
>  delete mode 100644 arch/arm/dts/stih407-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stih410-b2260.dts
>  delete mode 100644 arch/arm/dts/stih410-clock.dtsi
>  delete mode 100644 arch/arm/dts/stih410-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stih410.dtsi
>  delete mode 100644 arch/arm/dts/stm32429i-eval.dts
>  delete mode 100644 arch/arm/dts/stm32746g-eval.dts
>  delete mode 100644 arch/arm/dts/stm32f4-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32f429-disco.dts
>  delete mode 100644 arch/arm/dts/stm32f429-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32f429.dtsi
>  delete mode 100644 arch/arm/dts/stm32f469-disco.dts
>  delete mode 100644 arch/arm/dts/stm32f469-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32f469.dtsi
>  delete mode 100644 arch/arm/dts/stm32f7-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32f746-disco.dts
>  delete mode 100644 arch/arm/dts/stm32f746-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32f746.dtsi
>  delete mode 100644 arch/arm/dts/stm32f769-disco.dts
>  delete mode 100644 arch/arm/dts/stm32f769-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32h7-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32h743.dtsi
>  delete mode 100644 arch/arm/dts/stm32h743i-disco.dts
>  delete mode 100644 arch/arm/dts/stm32h743i-eval.dts
>  delete mode 100644 arch/arm/dts/stm32h750.dtsi
>  delete mode 100644 arch/arm/dts/stm32h750i-art-pi.dts
>  delete mode 100644 arch/arm/dts/stm32mp13-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp131.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp133.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp135.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp135f-dk.dts
>  delete mode 100644 arch/arm/dts/stm32mp13xc.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp13xf.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15-scmi.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp151.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp153.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp157.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp157a-dk1-scmi.dts
>  delete mode 100644 arch/arm/dts/stm32mp157a-dk1.dts
>  delete mode 100644 arch/arm/dts/stm32mp157a-icore-stm32mp1-ctouch2.dts
>  delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dts
>  delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1-microdev2.0.dts
>  delete mode 100644 arch/arm/dts/stm32mp157a-microgea-stm32mp1.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp157c-dk2-scmi.dts
>  delete mode 100644 arch/arm/dts/stm32mp157c-dk2.dts
>  delete mode 100644 arch/arm/dts/stm32mp157c-ed1-scmi.dts
>  delete mode 100644 arch/arm/dts/stm32mp157c-ed1.dts
>  delete mode 100644 arch/arm/dts/stm32mp157c-ev1-scmi.dts
>  delete mode 100644 arch/arm/dts/stm32mp157c-ev1.dts
>  delete mode 100644 arch/arm/dts/stm32mp15xc.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15xx-dkx.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15xxaa-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15xxab-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15xxac-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp15xxad-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp25-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp251.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp253.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp255.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp257.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp257f-ev1.dts
>  delete mode 100644 arch/arm/dts/stm32mp25xc.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp25xf.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp25xxai-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp25xxak-pinctrl.dtsi
>  delete mode 100644 arch/arm/dts/stm32mp25xxal-pinctrl.dtsi
>  create mode 100644 arch/arm/mach-stm32mp/include/mach/etzpc.h
>  create mode 100644 arch/arm/mach-stm32mp/include/mach/rif.h
>  create mode 100644 arch/arm/mach-stm32mp/stm32mp1/etzpc.c
>  create mode 100644 arch/arm/mach-stm32mp/stm32mp2/rifsc.c
>  create mode 100644 configs/stm32mp15-odyssey_defconfig
>  delete mode 100644 include/dt-bindings/clock/stih407-clks.h
>  delete mode 100644 include/dt-bindings/clock/stih410-clks.h
>  delete mode 100644 include/dt-bindings/mfd/st-lpc.h
>  delete mode 100644 include/dt-bindings/reset/stih407-resets.h
> 
> -- 
> 2.25.1
> 
> base-commit: cde0050618968aae335dfbc930641656d51ff5d0
> branch: upstream_OF_UPSTREAM_V2
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
