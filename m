Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF9C6EE683
	for <lists+uboot-stm32@lfdr.de>; Tue, 25 Apr 2023 19:19:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66150C62EFE;
	Tue, 25 Apr 2023 17:19:48 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 718FAC03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Apr 2023 17:19:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1B97E8629A;
 Tue, 25 Apr 2023 19:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1682443185;
 bh=uSGpi3oGJT25TE6X2ObtfHaPjP29ZdehkwA1R+obAOU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RoztfcTiISBaxQr4RPMnb0+C/BB3wS2GfiBLVSV7RWU7EADQM2j+ABI8G0FuuKNiR
 OY7vi5rp7Wn81nTCPD3rHQDL4hhj5Ppm/LpibzxMJIsqcpRVgYub3f+49fRElOOX7j
 bJu8MLy18pOEXGHOsq6T9nz3JDe8Vd8RH0+xCbSlKtIOloSFWsny63UngCrfNLtYFi
 zW16QGPBZrrBV9C4zShTHJFNdL/2BK0KWcAWJt7rfQ0gdXVz2ME/dslhnFQpuOLGnX
 kiT7zkRljYBRmgEif9ROkh6URRrWG2TlVp2omSiae2FhCvj5EMqtS8fhu8I+055Y8Y
 3yeZJ3BDTabzg==
Message-ID: <2576e151-6789-81f1-8b6b-adab49481fec@denx.de>
Date: Tue, 25 Apr 2023 18:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20230424142110.788029-1-patrick.delaunay@foss.st.com>
 <20230424162102.v2.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230424162102.v2.2.Id975ebfa1953ef54fc7558442f64a693fa74bc3a@changeid>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/2] ARM: dts: stm32mp: alignment with
	v6.3
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

On 4/24/23 16:21, Patrick Delaunay wrote:
> Device tree alignment with Linux kernel v6.3:
> - f5a058023239 - ARM: dts: stm32: add i2c nodes into stm32mp131.dtsi
> - 8539ebb435a5 - ARM: dts: stm32: enable i2c1 and i2c5 on
>    stm32mp135f-dk.dts
> - 8539ebb435a5 - ARM: dts: stm32: add spi nodes into stm32mp131.dtsi
> - 15f72e0da4da - ARM: dts: stm32: add pinctrl and disabled spi5 node in
>    stm32mp135f-dk
> - ea99a5a02ebc - ARM: dts: stm32: Create separate pinmux for qspi cs pin
>    in stm32mp15-pinctrl.dtsi
> - a306d8962a24 - ARM: dts: stm32: Rename mdio0 to mdio
> - 0a5ebb1f3367 - ARM: dts: stm32: Replace SAI format with dai-format DT
>    property
> - ccdab19738a6 - ARM: dts: stm32: add adc support to stm32mp13
> - 022932ab55fd - ARM: dts: stm32: add adc pins muxing on stm32mp135f-dk
> - ab2806ddad9d - ARM: dts: stm32: add dummy vdd_adc regulator on
>    stm32mp135f-dk
> - e46a180c060f - ARM: dts: stm32: add adc support on stm32mp135f-dk
> - 9ebf215fbae1 - ARM: dts: stm32: add PWR fixed regulators on stm32mp131
> - 16f4ff60519a - ARM: dts: stm32: add USBPHYC and dual USB HS PHY support
>    on stm32mp131
> - 4a47f0f3e936 - ARM: dts: stm32: add UBSH EHCI and OHCI support on
>    stm32mp131
> - 2a46bb66c47f - ARM: dts: stm32: add USB OTG HS support on stm32mp131
> - 9ebf215fbae1 - ARM: dts: stm32: add fixed regulators to support usb on
>    stm32mp135f-dk
> - 16f4ff60519a - ARM: dts: stm32: enable USB HS phys on stm32mp135f-dk
> - c4e7254cf6dc - ARM: dts: stm32: enable USB Host EHCI on stm32mp135f-dk
> - 44978e135916 - ARM: dts: stm32: add pins for stm32g0 typec controller on stm32mp13
> - 4f532403b1e5 - ARM: dts: stm32: enable USB OTG in dual role mode on
>    stm32mp135f-dk
> - e1f15571c96c - ARM: dts: stm32: add mcp23017 pinctrl entry for stm32mp13
> - 6cc71374002e - ARM: dts: stm32: add mcp23017 IO expander on I2C1 on
>    stm32mp135f-dk
> - 7ffd2266bd32 - ARM: dts: stm32: Fix qspi pinctrl phandle for
>    stm32mp15xx-dhcor-som
> - 21d83512bf2b - ARM: dts: stm32: Fix qspi pinctrl phandle for
>    stm32mp15xx-dhcom-som
> - 732dbcf52f74 - ARM: dts: stm32: Fix qspi pinctrl phandle for
>    stm32mp151a-prtt1l
> - 003b7c6b24f4 - ARM: dts: stm32: remove sai kernel clock on
>    stm32mp15xx-dkx
> - f2b17b39bfff - ARM: dts: stm32: rename sound card on stm32mp15xx-dkx
> - dee3cb759d3d - ARM: dts: stm32: Remove the pins-are-numbered property
> - ae8cf3b48727 - ARM: dts: stm32: add i2s nodes on stm32mp131
> - 619746a27bd0 - ARM: dts: stm32: add sai nodes on stm32mp131
> - c5e05d08ef90 - ARM: dts: stm32: add spdifrx node on stm32mp131
> - 0a5afd3ee0d0 - ARM: dts: stm32: add dfsdm node on stm32mp131
> - bf9d876bea2e - ARM: dts: stm32: add timers support on stm32mp131
> - a3183748371d - ARM: dts: stm32: add timer pins muxing for stm32mp135f-dk
> - a9060c1326bc - ARM: dts: stm32: add timers support on stm32mp135f-dk
> - a12154058f75 - ARM: dts: stm32: Fix User button on stm32mp135f-dk
> - 2f33df889e99 - ARM: dts: stm32: Use new media bus type macros
> - 366384e49551 - ARM: dts: stm32: Update part number NVMEM description on
>    stm32mp131

Thanks.

Reviewed-by: Marek Vasut <marex@denx.de>

You really could've just included the one Linux 6.3 commit hash and 
wrote this is synced with Linux 6.3, since all the commits listed above 
would be part of the Linux 6.3 commit hash anyway . It would make the 
commit message shorter, but this variant is also fine.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
