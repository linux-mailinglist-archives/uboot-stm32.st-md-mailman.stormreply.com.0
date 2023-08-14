Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D977B194
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Aug 2023 08:31:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 139F1C6B462;
	Mon, 14 Aug 2023 06:31:11 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 817BAC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:31:10 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EA8833F18D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Aug 2023 06:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1691994669;
 bh=fNXoaf1rZpU8rEtXTIseHmOJLx0kC9mdBXuMSmYP+8U=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=fTnEZsECGhghOruTafMfr4/FVMUh3l12PdPHMV7t3jNHnu4yIDPnr/3Nujywpq/8L
 cADP3TJtFaxIG6Mceol/2pMQuvUWbvFy7pDGAQp9sfkDrhROH13WSZU43RTCV2pd9x
 C8RkYoc14jfo7n7k+WWEiCoI2997oYctJwGuWp+VDR92yv61J7eF2104OkIP+/tUy4
 OzJARakLNeuHC7p9LrTD7aR1y5CQb43KLC4xWmWkbtKYuAxFWafUfLbK++N9U9Gyeh
 itaUC9vnMoguLD9qDDDz4MM5KTtvZ9bI3XCullCOf5MO0PyJE9rifL5Q7vWYye9JEG
 2bShKnDx473Gw==
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3175efd89e4so2194443f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Aug 2023 23:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691994669; x=1692599469;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNXoaf1rZpU8rEtXTIseHmOJLx0kC9mdBXuMSmYP+8U=;
 b=h8DwjZKuPaFZUyMeXbZGCdHujsBGiThKhX5jURSJp/sZm1NsM9PL3aRBz8ohUmh3AI
 6L7ihF7Jm/SX0+32xs3MvgY9bfO8YL1QnGOCTSamK7Ktdiad2q8Kh32sHKvN0Lb2q7mP
 8WaFU+GzmGdl/hloEoYHPzKT5hY59sg66ZvVleNU3/bkFy4nPggTPxR38MYOortOuPMV
 uD2cxlnL0Xq8sVMim3GpdtxQHIzm9YPfrWaw/nEJG8zhVNTzt/R6e4oSq31PANiu4sDd
 JZIrAlmmwVE51S5w36fxiWpH0yoYhKw6wiETEHs3pryGNfO23fq4bJfmi9HkH+v1C83J
 tpUw==
X-Gm-Message-State: AOJu0Ywgc8/PJo9GEdddR9DvCaXjqMdlHq7NkYtQHRR900/xGY9im76V
 j+/6U4rbk/Ytqo1hmaCHfQxCAGnq0NemEhMrOyN//cHaP3N3gDB8RXo0Xucd8dFVNmJDwYSTvw3
 b2Js6mxnSjNRMhb2uebQt0A8idu3xWCEVV6NjphBYsFaIPHd2NB0Tza+vhQ==
X-Received: by 2002:a05:600c:3797:b0:3f7:678c:74b0 with SMTP id
 o23-20020a05600c379700b003f7678c74b0mr6125418wmr.12.1691994648821; 
 Sun, 13 Aug 2023 23:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF5Kuz+KCnlMRPNUOR7li2gsPsB0NITcAD7STnbdJZH37QOuaInYFcWrD9BWXxTy9cHUzzBg==
X-Received: by 2002:a05:600c:3797:b0:3f7:678c:74b0 with SMTP id
 o23-20020a05600c379700b003f7678c74b0mr6125390wmr.12.1691994648333; 
 Sun, 13 Aug 2023 23:30:48 -0700 (PDT)
Received: from [192.168.123.94] (ip-062-143-244-162.um16.pools.vodafone-ip.de.
 [62.143.244.162]) by smtp.gmail.com with ESMTPSA id
 f9-20020a7bc8c9000000b003fe20533a1esm13393755wml.44.2023.08.13.23.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Aug 2023 23:30:47 -0700 (PDT)
Message-ID: <ff12490d-3ef8-dc66-2716-4b85ad5dbfea@canonical.com>
Date: Mon, 14 Aug 2023 08:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, de-DE
To: Simon Glass <sjg@chromium.org>, Tom Rini <trini@konsulko.com>
References: <20230813050011.9345-1-heinrich.schuchardt@canonical.com>
 <CAPnjgZ1fxfxUT2g8wfi9YoJt4K2EDgCzy10Tv_D5p3T2yB-dVg@mail.gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAPnjgZ1fxfxUT2g8wfi9YoJt4K2EDgCzy10Tv_D5p3T2yB-dVg@mail.gmail.com>
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Kever Yang <kever.yang@rock-chips.com>, Fedor Ross <fedor.ross@ifm.com>,
 u-boot@lists.denx.de, "NXP i . MX U-Boot Team" <uboot-imx@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Michal Simek <michal.simek@amd.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Liu <jason.hui.liu@nxp.com>,
 Michal Suchanek <msuchanek@suse.de>, Peter Robinson <pbrobinson@gmail.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Andre Przywara <andre.przywara@arm.com>, Ovidiu Panait <ovpanait@gmail.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Nikhil M Jain <n-jain1@ti.com>, Aswath Govindraju <a-govindraju@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Stefano Babic <sbabic@denx.de>,
 Olaf Mandel <o.mandel@menlosystems.com>, Matthias Brugger <mbrugger@suse.com>,
 Leo <ycliang@andestech.com>, Aaron Williams <awilliams@marvell.com>,
 Paul Burton <paul.burton@mips.com>, Tom Warren <twarren@nvidia.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] common: return type
	board_get_usable_ram_top
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



On 8/13/23 15:36, Simon Glass wrote:
> Hi Heinrich,
> 
> On Sat, 12 Aug 2023 at 23:01, Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
>>
>> board_get_usable_ram_top() returns a physical address that is stored in
>> gd->ram_top. The return type of the function should be phys_addr_t like the
>> current type of gd->ram_top.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>   arch/arm/mach-imx/imx8m/soc.c           | 2 +-
>>   arch/arm/mach-mvebu/arm64-common.c      | 2 +-
>>   arch/arm/mach-rockchip/sdram.c          | 2 +-
>>   arch/arm/mach-stm32mp/dram_init.c       | 2 +-
>>   arch/arm/mach-sunxi/board.c             | 2 +-
>>   arch/arm/mach-tegra/board2.c            | 2 +-
>>   arch/mips/mach-jz47xx/jz4780/jz4780.c   | 2 +-
>>   arch/mips/mach-octeon/dram.c            | 2 +-
>>   arch/riscv/cpu/fu540/dram.c             | 2 +-
>>   arch/riscv/cpu/fu740/dram.c             | 2 +-
>>   arch/riscv/cpu/generic/dram.c           | 2 +-
>>   arch/riscv/cpu/jh7110/dram.c            | 2 +-
>>   arch/x86/cpu/broadwell/sdram.c          | 2 +-
>>   arch/x86/cpu/coreboot/sdram.c           | 2 +-
>>   arch/x86/cpu/efi/payload.c              | 2 +-
>>   arch/x86/cpu/efi/sdram.c                | 2 +-
>>   arch/x86/cpu/ivybridge/sdram.c          | 2 +-
>>   arch/x86/cpu/qemu/dram.c                | 2 +-
>>   arch/x86/cpu/quark/dram.c               | 2 +-
>>   arch/x86/cpu/slimbootloader/sdram.c     | 2 +-
>>   arch/x86/cpu/tangier/sdram.c            | 2 +-
>>   arch/x86/include/asm/u-boot-x86.h       | 2 +-
>>   arch/x86/lib/fsp1/fsp_dram.c            | 2 +-
>>   arch/x86/lib/fsp2/fsp_dram.c            | 2 +-
>>   board/broadcom/bcmns3/ns3.c             | 2 +-
>>   board/imgtec/boston/ddr.c               | 2 +-
>>   board/menlo/m53menlo/m53menlo.c         | 2 +-
>>   board/raspberrypi/rpi/rpi.c             | 2 +-
>>   board/ti/am65x/evm.c                    | 2 +-
>>   board/ti/j721e/evm.c                    | 2 +-
>>   board/ti/j721s2/evm.c                   | 2 +-
>>   board/toradex/verdin-am62/verdin-am62.c | 2 +-
>>   board/xilinx/common/board.c             | 2 +-
>>   common/board_f.c                        | 2 +-
>>   include/init.h                          | 2 +-
>>   35 files changed, 35 insertions(+), 35 deletions(-)
> 
> While you are here, could you please fix the function comment?
> 
> [..]
> 
>> diff --git a/include/init.h b/include/init.h
>> index 8873081685..b1e1451166 100644
>> --- a/include/init.h
>> +++ b/include/init.h
>> @@ -304,7 +304,7 @@ int show_board_info(void);
>>    *
>>    * @param total_size   Size of U-Boot (unused?)
> 
> It seems confused about the param, and we should have a return value.

The parameter with the monitor length (size of U-Boot code) is not used 
anywhere (though it is passed on to functions like 
mrc_common_board_get_usable_ram_top() where it isn't used either).

We should try to eliminate the parameter in further patches.

> 
> Also should explain what this function is used for.

That explanation exists.

I will put the documentation fix into a separate patch so we can apply 
it to 2023.10. I don't know if Tom wants to apply this patch to next or 
to 2023.10.

Best regards

Heinrich

> 
>>    */
>> -phys_size_t board_get_usable_ram_top(phys_size_t total_size);
>> +phys_addr_t board_get_usable_ram_top(phys_size_t total_size);
>>
>>   int board_early_init_f(void);
>>
>> --
>> 2.40.1
>>
> 
> Regards,
> Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
