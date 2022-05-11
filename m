Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B2523A8B
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 May 2022 18:44:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE95AC03FC3;
	Wed, 11 May 2022 16:44:23 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90593C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 16:44:22 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id fu47so2422138qtb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mR3v+XOMHDXL4v/SJZtfJ+YpdcF+fj8rNIeihTl174o=;
 b=OiusNln6NUMRqqmGCbKkTiUrDHTemhTUI7k6G3s2+uhdiiAcAI7po8BU8o6gyO7hM0
 hEi5QbIFRLn4CEmq3mrIDhIpSuqxdQ0m3XK9seU7w66hekvvvLkWwM6n/bH2s52SRXa2
 6dtOUArPc/K64H2G/keMPwh/ZksGfQBLVxgREPO57Z3WoO9NjDFZFbj0RbKjFzrlrPXJ
 qiMARVMhipCZ3ruYL9Mje/qT3kj7h2rhIsHeZ8Xd7rwrbW/tJ0jnlbq1tJWFrNISdA44
 EEMe0vL+e+E91x1IIbF8ZAenCkaQuojZpKDNYbp8e1I46JXOrmm89a0IQ87TYX/qfdrk
 w/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mR3v+XOMHDXL4v/SJZtfJ+YpdcF+fj8rNIeihTl174o=;
 b=dirZXFOJzYyqe6hw49chN8vw2pL/FCNTdCsuDXaj5CInY12crILmi2Hdc0gj65bGtY
 w/T9TRTLoK2PBYRePmVv++Y09VbLwI2xUb5RdKLC8t8nAwmW7UBDzc6iunykSNri9pO9
 0bZr7GBvxMo2bObP3g8VJxkWVniimBQlO8UrQfzi0zuoEXcZB8MTNvH29/0Sly0eXV5y
 N4XcDPMoy5m+8IyzUTT7telwjNxWATzJLSh7OEiKHQubI70KqF36d9ayQxd14aOgtJg1
 IUuJzjFiObJ+oNIb1EbhsL+49D/88hHBRH2WcsKfosQzFvEJXKGWA6tQ+dlFSKqmyqr2
 YabA==
X-Gm-Message-State: AOAM530x+8d72mtwDGDYDNNq1r/H4yRz4tUFhlI8gY02hD2aBJWFB1MM
 nviGG9JiSd1eZNMcYOWjJR4PYhkHdhA=
X-Google-Smtp-Source: ABdhPJwwW9t8KBw/LCBafa1B2hzh6K4XRlgA4Xrcb95p2jw1/iTixaQfDXgb7QZ88V0wIo+AuHc/vg==
X-Received: by 2002:ac8:5a86:0:b0:2f3:c9f8:3807 with SMTP id
 c6-20020ac85a86000000b002f3c9f83807mr23339768qtc.552.1652287461206; 
 Wed, 11 May 2022 09:44:21 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-18-248-138.washdc.fios.verizon.net.
 [108.18.248.138]) by smtp.googlemail.com with ESMTPSA id
 h7-20020a05620a10a700b0069fc13ce23csm1424280qkk.109.2022.05.11.09.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 09:44:20 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <41b170c1-99ba-18ac-4a94-01c90f67b97c@gmail.com>
Date: Wed, 11 May 2022 12:44:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20220510075114.1238086-1-patrick.delaunay@foss.st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 0/4] stm32mp: add minimal RCC support for
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

Hi Patrick,

On 5/10/22 3:51 AM, Patrick Delaunay wrote:
> 
> Add a minimal support for STM32MP13 RCC, the reset and clock controller
> - update of the RCC MISC driver to bind the correct clock and reset driver
> - reset driver, same than STM32MP15x = drivers/reset/stm32-reset.c
> - clock driver, add a empty driver for STM32MP13x =
>    drivers/clk/stm32/clk-stm32mp13.c
> - Add RCC node in SOC device tree with u-boot,dm-pre-reloc property
> 
> This serie is only a preliminary step for STM32MP13 clock and reset support
> in U-Boot, based on Linux kernel binding introduced by [1] and it prepares
> the next device tree alignment with Linux kernel.
> 
> The functional STMP13 clock driver based on CCF and on SCMI clocks
> provided by OP-TEE and the clock and reset references in SOC device tree
> will be pushed when the associated patches in [1] will be accepted.
> 
> [1] Introduction of STM32MP13 RCC driver (Reset Clock Controller)
>      https://lore.kernel.org/linux-arm-kernel/20220316131000.9874-1-gabriel.fernandez@foss.st.com/

I'm not really sure what the purpose of this series is. Can you
elaborate a bit on why we need a dummy clock driver? Why don't
you just add the binding to the device tree without the associated
driver?

--Sean
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
