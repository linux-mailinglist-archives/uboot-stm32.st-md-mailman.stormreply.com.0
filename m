Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 720596E6CC6
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 21:14:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23622C6A5FA;
	Tue, 18 Apr 2023 19:14:30 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30957C69065
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 19:14:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 33BF685F71;
 Tue, 18 Apr 2023 21:14:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681845268;
 bh=qQp/n4uajIqOgO7/R6HPD999DFIq2OtAbKllJ7OQAEw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QVQBx6m94a6XFM+5HLYqffXqbsDAQpN5gIZY11REzByX8iKYi2FkElvOChC1ZTOBM
 wiAmiT88wwSibG5EQ6kY5SraAPFNYSEIzgkygUmI+MgTIg+AFMdakLAvv0UYg1Is0n
 GqC7YYCUmBfTAlVOCYDdsrbbH3GNXEAB5sa/w25BT/7RKzexcjkyTy6vQDVvQdvzLI
 s/IpdDBM32Ta6Wn/KUJ2N5ugLLjZ00rDEaG8Nh9ZWxBQ2bN1ggI/f4I5qbyqChVVT/
 mPcx+pnaKf5v/bJ2cOxshpQu1asWdbmIysGfMQJITS+9BIaAon1c6M8WrEoia3ZOHX
 2tOdD4AEPbxRg==
Message-ID: <eb7556d1-8283-70dd-790c-925c10ba02a0@denx.de>
Date: Tue, 18 Apr 2023 21:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230418135941.774340-1-patrick.delaunay@foss.st.com>
 <20230418155937.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230418155937.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: dts: stm32mp: alignment with
	v6.3-rc3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 4/18/23 15:59, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v6.3-rc3:
> - ARM: dts: stm32: add i2c nodes into stm32mp131.dtsi
> - ARM: dts: stm32: enable i2c1 and i2c5 on stm32mp135f-dk.dts
> - ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
> - ARM: dts: stm32: add pinctrl and disabled spi5 node in stm32mp135f-dk
> - ARM: dts: stm32: Create separate pinmux for qspi cs pin in
>    stm32mp15-pinctrl.dtsi
> - ARM: dts: stm32: Rename mdio0 to mdio
> - ARM: dts: stm32: Replace SAI format with dai-format DT property
> - ARM: dts: stm32: add adc support to stm32mp13
> - ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
> - ARM: dts: stm32: add dummy vdd_adc regulator on stm32mp135f-dk
> - ARM: dts: stm32: add adc support on stm32mp135f-dk
> - ARM: dts: stm32: add PWR fixed regulators on stm32mp131
> - ARM: dts: stm32: add USBPHYC and dual USB HS PHY support on stm32mp131
> - ARM: dts: stm32: add UBSH EHCI and OHCI support on stm32mp131
> - ARM: dts: stm32: add USB OTG HS support on stm32mp131
> - ARM: dts: stm32: add fixed regulators to support usb on stm32mp135f-dk
> - ARM: dts: stm32: enable USB HS phys on stm32mp135f-dk
> - ARM: dts: stm32: enable USB Host EHCI on stm32mp135f-dk
> - ARM: dts: stm32: add pins for stm32g0 typec controller on stm32mp13
> - ARM: dts: stm32: enable USB OTG in dual role mode on stm32mp135f-dk
> - ARM: dts: stm32: add mcp23017 pinctrl entry for stm32mp13
> - ARM: dts: stm32: add mcp23017 IO expander on I2C1 on stm32mp135f-dk
> - ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcor-som
> - ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp15xx-dhcom-som
> - ARM: dts: stm32: Fix qspi pinctrl phandle for stm32mp151a-prtt1l
> - ARM: dts: stm32: remove sai kernel clock on stm32mp15xx-dkx
> - ARM: dts: stm32: rename sound card on stm32mp15xx-dkx
> - ARM: dts: stm32: Remove the pins-are-numbered property
> - ARM: dts: stm32: add i2s nodes on stm32mp131
> - ARM: dts: stm32: add sai nodes on stm32mp131
> - ARM: dts: stm32: add spdifrx node on stm32mp131
> - ARM: dts: stm32: add dfsdm node on stm32mp131
> - ARM: dts: stm32: add timers support on stm32mp131
> - ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
> - ARM: dts: stm32: add timers support on stm32mp135f-dk
> - ARM: dts: stm32: Fix User button on stm32mp135f-dk
> - ARM: dts: stm32: Use new media bus type macros
> - ARM: dts: stm32: Update part number NVMEM description on stm32mp131

Please either include commit IDs for all those commits too, or just 
include commit ID of the kernel version to which these DTs are synced 
to. I would prefer the later. Also note, Linux 6.3-rc6 is out, so why 
sync to 6.3-rc3 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
