Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 488CE530873
	for <lists+uboot-stm32@lfdr.de>; Mon, 23 May 2022 06:35:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC14C0AA15;
	Mon, 23 May 2022 04:35:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69EACC08D1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 May 2022 04:35:10 +0000 (UTC)
Received: from [192.168.1.107] (87-97-105-216.pool.digikabel.hu
 [87.97.105.216])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9561483EE2;
 Mon, 23 May 2022 06:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653280509;
 bh=Kts/kdBrZZu4M2G4aSzRIUwq2t54jqGLCl0w02eO4hI=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PguVerXlo52nsDfDU1rfvDWDjaknUu3IpqqgFWWWbE7x8LRJ+I2dFg5cByQPwoEYr
 4+J4xbZQxZdFhmv8yOacvcBRA61DA5XonN/IUIVgnP9jnix3GF9z7h+/Z2UlGvNv9e
 SWlXkEnWS43DCYA8M35/dhskaWF9hzz/Kn3hDrEvb3yxxj2LgUph5lqu/EAHhpeAKv
 WrASL38SS/Ys6fEu2ZGAnb1c8XH59JMgInOe7FkLRhQ58elzAOOLeivYrPylgB5Z7a
 TU4kykM+TnC3UTbvyDg4j9TPKustpDo5IYjR6CFF8h0hBuHWPWC7wxDjf/4LtqghqN
 bVy1saeSrS68A==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
From: Heiko Schocher <hs@denx.de>
Message-ID: <c28ce4a9-5d4b-b362-f28d-af4ef5668285@denx.de>
Date: Mon, 23 May 2022 06:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220520183718.1.I3ee35f18672107aad869bbd4b3e53957b16cb304@changeid>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>, vipin.kumar@st.com,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dylan Hung <dylan_hung@aspeedtech.com>, Marek Vasut <marex@denx.de>,
 Mark Kettenis <kettenis@openbsd.org>, Samuel Holland <samuel@sholland.org>,
 Lukasz Majewski <lukma@denx.de>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ramon Fried <rfried.dev@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Vikas Manocha <vikas.manocha@st.com>, Bharat Gooty <bharat.gooty@broadcom.com>,
 armando.visconti@st.com, Andre Przywara <andre.przywara@arm.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Yuan Fang <fangyuanseu@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: fix reference for
	STMicroelectronics
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Patrick,

On 20.05.22 18:38, Patrick Delaunay wrote:
> Replace reference to the correct name STMicroelectronics
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/Kconfig                      | 2 +-
>  arch/arm/cpu/armv7/stv0991/lowlevel.S | 2 +-
>  arch/arm/mach-sti/Kconfig             | 2 +-
>  drivers/i2c/designware_i2c.c          | 2 +-
>  drivers/i2c/designware_i2c.h          | 2 +-
>  drivers/i2c/designware_i2c_pci.c      | 2 +-
>  drivers/mtd/nand/raw/fsmc_nand.c      | 4 ++--
>  drivers/mtd/spi/spi-nor-ids.c         | 2 +-
>  drivers/net/designware.c              | 2 +-
>  drivers/net/designware.h              | 2 +-
>  drivers/pinctrl/Kconfig               | 2 +-
>  drivers/spi/pl022_spi.c               | 2 +-
>  drivers/usb/gadget/designware_udc.c   | 2 +-
>  include/configs/stm32mp15_st_common.h | 2 +-
>  include/elf.h                         | 4 ++--
>  include/linux/mtd/fsmc_nand.h         | 2 +-
>  include/usb/designware_udc.h          | 2 +-
>  17 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Heiko Schocher <hs@denx.de>

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
