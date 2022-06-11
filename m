Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11355547639
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Jun 2022 17:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94AC2C0AA15;
	Sat, 11 Jun 2022 15:50:30 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FB27C03FFF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 15:50:29 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id d128so1248990qkg.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ArVNVVfLlFGbUtOlj9J21NQGWC7m6/noEDYPxvs46KE=;
 b=F/uTQQ9O8K78H87cc7KJvbcjUHLGeoozR/L7YQo6e80/hXMKjwuhDXnCmkbShzGQZK
 C8btjr84xkXR1SLPakTtNW4D0vziUCZ6Ha+tCfKwitCzPKUD7OtCcoirFm2AKRmHnCy0
 fTX7KS6k6J8HWtGpxgfWJCFkFsBdrMGhaG8hjOSf7oM/0TNup2brnbhyXrUlm6/wlMDS
 +oNz8qlQx0uyFzZ1b+TJwUWtVTnrIg62FWQDfFDOEQ0O5WmDyPhoNPVyWCu6QukVbBLb
 j4172ng/ncBD0FDzhUOX0GuBcPGNJO/AEg/G+AkecTC6gro3pFb9fRoIY4xC2FOEq3cW
 JaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ArVNVVfLlFGbUtOlj9J21NQGWC7m6/noEDYPxvs46KE=;
 b=vzf4zQKDxkCQ5ZEHDL/pUysW1yg7L23NPQL7M5n+GOpZvry5KuBaMPvhTBJBIgMTS8
 us/HvkQBHiu1XdjBJ8avc0AicAHv5xOaLUep5vFrYFphn7LE4SRc1uhzv38kETwLG96Q
 MqgfWkrpwWHi72YdunnmZERCAE62f/T1uatG6aZNc3FC8hzKkFU2wGjTtDczAMIiTVsR
 D/Idd/jE9dAaIbWsszUTQ7pTNiclDIXdV9rLoPtxRZP+GWp9hqMJcdAZvnK5frID7OjG
 hekBTcUzCuqss9ayJSZM6s+8OhgZyYaFYDl0wdupVdm9xZHWZqZGqojjQcfAq4FJDZ7l
 NWdw==
X-Gm-Message-State: AOAM532TkyALPcsiHweLenngpF4HZsSoJe+GvgWMtg3pAEP5wuZxjJGT
 qE+B7ZeW1oMlQnvy7cbIxjjyoiJssv3gI6GN
X-Google-Smtp-Source: ABdhPJxqZhWGaAQiW0Juxc2aShr7T/HKXMHiC5B1xTZxC5lgqb4INkoMHKM1dej61J6vPf+AutgfCA==
X-Received: by 2002:a05:620a:884:b0:6a7:347:386 with SMTP id
 b4-20020a05620a088400b006a703470386mr12823650qka.7.1654962627896; 
 Sat, 11 Jun 2022 08:50:27 -0700 (PDT)
Received: from [192.168.1.201] (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with ESMTPSA id
 ff24-20020a05622a4d9800b003051190886dsm1439553qtb.75.2022.06.11.08.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 08:50:27 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <006c5bd3-b8df-d408-f93b-dd1d4c899dfb@gmail.com>
Date: Sat, 11 Jun 2022 11:50:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220602130535.722317-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] stm32mp: prepare RCC support for
	STM32MP13
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

On 6/2/22 9:05 AM, Patrick Delaunay wrote:
> 
> Prepare the support of STM32MP13 RCC, the reset and clock controller
> - update of the RCC MISC driver to bind the correct clock and reset driver
> - reset driver, same than STM32MP15x = drivers/reset/stm32-reset.c
> - clock driver, add a stm32 sub directory to prepare the addition of
>    stm32mp13 drivers named "stm32mp13_clk";
>    the stm32mp1 driver is only required for STM32MP15x family
> - Add RCC node in SOC device tree with the needed tag
>    u-boot,dm-pre-reloc property
> 
> This serie is only a preliminary step for STM32MP13 clock and reset support
> in U-Boot, based on Linux kernel binding [1];
> It prepares the next device tree alignment with Linux kernel and simplify
> the review of the serie with addition of STMP13 clock driver based on CCF
> and on SCMI clocks provided by OP-TEE, with files
> - drivers/clk/stm32/clk-stm32mp13.c
> - drivers/clk/stm32/clk-stm32-core.c
> 
> In the V2, I remove the addition of a dummy stm32mp13 clock driver:
>    [2/4] clk: stm32mp13: add a STM32MP13 RCC clock driver
> 
> [1] Introduction of STM32MP13 RCC driver (Reset Clock Controller)
>      https://lore.kernel.org/linux-arm-kernel/20220316131000.9874-1-gabriel.fernandez@foss.st.com/
> 
> 
> (no changes since v1)
> 
> Patrick Delaunay (3):
>    clk: Add directory for STM32 clock drivers
>    misc: stm32mp13: introduce STM32MP13 RCC driver
>    ARM: dts: stm32: add rcc node for STM32MP13
> 
>   MAINTAINERS                                   |  2 +-
>   arch/arm/dts/stm32mp13-u-boot.dtsi            |  4 ++++
>   arch/arm/dts/stm32mp131.dtsi                  |  7 ++++++
>   drivers/clk/Kconfig                           | 17 +-------------
>   drivers/clk/Makefile                          |  5 ++--
>   drivers/clk/stm32/Kconfig                     | 23 +++++++++++++++++++
>   drivers/clk/stm32/Makefile                    |  7 ++++++
>   .../clk/{clk_stm32f.c => stm32/clk-stm32f.c}  |  0
>   .../{clk_stm32h7.c => stm32/clk-stm32h7.c}    |  0
>   .../{clk_stm32mp1.c => stm32/clk-stm32mp1.c}  |  0
>   drivers/misc/stm32_rcc.c                      |  6 +++++
>   11 files changed, 51 insertions(+), 20 deletions(-)
>   create mode 100644 drivers/clk/stm32/Kconfig
>   create mode 100644 drivers/clk/stm32/Makefile
>   rename drivers/clk/{clk_stm32f.c => stm32/clk-stm32f.c} (100%)
>   rename drivers/clk/{clk_stm32h7.c => stm32/clk-stm32h7.c} (100%)
>   rename drivers/clk/{clk_stm32mp1.c => stm32/clk-stm32mp1.c} (100%)
> 

For this series:

Acked-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
