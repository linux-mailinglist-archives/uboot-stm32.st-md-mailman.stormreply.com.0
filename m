Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E50AD1EC4
	for <lists+uboot-stm32@lfdr.de>; Mon,  9 Jun 2025 15:25:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75547C32E92;
	Mon,  9 Jun 2025 13:25:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0AF7C32E8F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 13:25:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A50785C2711;
 Mon,  9 Jun 2025 13:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4021BC4CEEB;
 Mon,  9 Jun 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749475535;
 bh=fk46SS2+TkzfYcriC5jAB6eG6XDHbn1d2BzamCV30vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBy/Q+ks8LRivwYCa2EF6kgOtXZsEOZJNw5UoH5wrX5SFGJqyK1cLpmfO3nNnNiF8
 dAmapUaJhp4YPR9XdeFv0J8+OIyYbJo1/xWLyS8xFOYzEG9Om18fts4By8Nmig/nH/
 hdycqEvwgrXMMtwCof/QXlMbjORoHK3KgXmCxzh0jIXpXrjztmSNBCXhaIkZnsT02h
 IECLLGo7xVFHZHG4CM/zKSWsv20EAe2p1etLZQMPW5C7tjgzdC5E6AhkdR0MSh5O2o
 CBJERZ9Eg68vm2l0P4zkphdSkFODXliX67oXXz/OYNqpuGOmVbPewlvUz0Ua7OT8nn
 R65Pc5tD9CX3Q==
Date: Mon, 9 Jun 2025 14:25:26 +0100
From: Sumit Garg <sumit.garg@kernel.org>
To: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <aEbgxo0WUDPd-S8Z@sumit-X1>
References: <20250607093730.2249536-1-dario.binacchi@amarulasolutions.com>
 <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc8bb4a3-c465-4ae0-a61d-bb2f74a42b64@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Dillon Min <dillon.minfei@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sean Anderson <seanga2@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>, u-boot@lists.denx.de,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [PATCH 0/9] Support stm32h747-discovery board
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

Hi Patrice,

On Mon, Jun 09, 2025 at 03:15:14PM +0200, Patrice CHOTARD wrote:
> 
> 
> On 6/7/25 11:37, Dario Binacchi wrote:
> > The series adds support for stm32h747-discovery board.
> > 
> > Detailed information can be found at:
> > https://www.st.com/en/evaluation-tools/stm32h747i-disco.html
> > 
> > 
> > Dario Binacchi (9):
> >   ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
> >   dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
> >   dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
> >   ARM: dts: stm32: add uart8 node for stm32h743 MCU
> >   ARM: dts: stm32: add pin map for UART8 controller on stm32h743
> >   ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
> >   ARM: dts: stm32: support STM32h747i-disco board
> >   ARM: dts: stm32: add stm32h747i-disco-u-boot DTS file
> >   board: stm32: add stm32h747-discovery board support
> 
> 
> Hi Dario
> 
> For the whole series
> Applied to u-boot-stm32/next

Please give some time for other maintainers to review this patch-set.
The dts/upstream patches in this series aren't clean cherry pick from
upstream. This has to be fixed as otherwise random patches are going to
cause DT sync issues.

-Sumit

> 
> Thanks
> Patrice
> 
> > 
> >  arch/arm/dts/stm32h747i-disco-u-boot.dtsi     | 104 ++++++++++++++
> >  arch/arm/mach-stm32/stm32h7/Kconfig           |   4 +
> >  board/st/stm32h747-disco/Kconfig              |  15 ++
> >  board/st/stm32h747-disco/MAINTAINERS          |   7 +
> >  board/st/stm32h747-disco/Makefile             |   6 +
> >  board/st/stm32h747-disco/stm32h747-disco.c    |  42 ++++++
> >  configs/stm32h747-disco_defconfig             |  35 +++++
> >  drivers/clk/stm32/clk-stm32h7.c               |   5 +
> >  dts/upstream/Bindings/arm/stm32/stm32.yaml    |   4 +
> >  .../include/dt-bindings/clock/stm32h7-clks.h  |   4 +-
> >  dts/upstream/src/arm/st/stm32h7-pinctrl.dtsi  |  34 ++++-
> >  dts/upstream/src/arm/st/stm32h743.dtsi        |   8 ++
> >  dts/upstream/src/arm/st/stm32h743i-disco.dts  |   2 +-
> >  dts/upstream/src/arm/st/stm32h743i-eval.dts   |   2 +-
> >  dts/upstream/src/arm/st/stm32h747i-disco.dts  | 136 ++++++++++++++++++
> >  dts/upstream/src/arm/st/stm32h750i-art-pi.dts |   6 +-
> >  include/configs/stm32h747-disco.h             |  32 +++++
> >  17 files changed, 435 insertions(+), 11 deletions(-)
> >  create mode 100644 arch/arm/dts/stm32h747i-disco-u-boot.dtsi
> >  create mode 100644 board/st/stm32h747-disco/Kconfig
> >  create mode 100644 board/st/stm32h747-disco/MAINTAINERS
> >  create mode 100644 board/st/stm32h747-disco/Makefile
> >  create mode 100644 board/st/stm32h747-disco/stm32h747-disco.c
> >  create mode 100644 configs/stm32h747-disco_defconfig
> >  create mode 100644 dts/upstream/src/arm/st/stm32h747i-disco.dts
> >  create mode 100644 include/configs/stm32h747-disco.h
> > 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
