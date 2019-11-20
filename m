Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 363F9104467
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 20:39:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9558C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 19:39:48 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB294C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 19:39:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id u18so973097wmc.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p8Kl+EuUazDuh0YvDBsGVWxXIkRv5ZGzwrKpZc32hiE=;
 b=AiJS1JK4J4DxvP9S9fenEmgcCmJW6mt1P01pBxpEnii57IlgJioqve1v69wYTJLMey
 b4L+/t55Uht8m6J3/hBm0gG3etyu1LMzu7E0eCy9CqGu4V3xi+9qiPj25J8lx+7XHpmp
 IuqHUV18vQxPCbF0OP/gd3l0BImjHPr3J+d7O+H/GkvksZ24CPNZKZOGphD4exa0Pelj
 CUVQdTySVTk+HCBGMl0T3Lg/w9aVn0q/C/4NxEPCQzwsa8RZ//Mht6woroQPEl202gwf
 12tHWuy7fSLZrd5CstEvLqyWFB7D7uqJ+ZeBjni5vvFnryJ62jnCI1mqz1PGbVZsntxX
 82yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p8Kl+EuUazDuh0YvDBsGVWxXIkRv5ZGzwrKpZc32hiE=;
 b=SVLq8kAcu02CNpOkVH6iLCAJDWC5cwKgK1GWD1oQLn0SJrz+jKw0OY+bxg51dSc/Wk
 QgKBAQaJL+b0DAqH2Wy/NkEZz5zTHYOE/ia1VzPSjyXS5Sma70kMkfa72FuaUUiRpQ6I
 ztTJWzN627Pu5TNI8ThLsjtcBUVZAR/P8+VNxIiPZVHj+/vpI7Uk7PvnqYiC7pJpzq82
 MUpfMrqVPgcmh+km+NFXd+WRwHWiB0FsTen9U8XbSkTaKLLR5YSdKQB8VIXTG5yo8ljZ
 Kr2WOLHYrqWsUOMIrjETRI08F4KnZBtT/GZQ4Y4WFjj897rXvcbXFkFLTT6Nx4vJ2pZz
 p8Kg==
X-Gm-Message-State: APjAAAX4Bi3rsQYT03R13y5o2E2PnVZZjlMA7g+5ADJOCbgxl33iXXbj
 FoWmA7nnz9NkWVNtgV/qsI4=
X-Google-Smtp-Source: APXvYqyuECI+F38S2Na0JJya9D0Sbl/5g4JplfaAPvMuAL8TcGxkpVjEfXYRPqJI/aP5K6lNhaEwgA==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr5637200wmb.142.1574278787365; 
 Wed, 20 Nov 2019 11:39:47 -0800 (PST)
Received: from ?IPv6:2a02:8071:6a3:700:51d2:2ba0:bc1:d4b3?
 ([2a02:8071:6a3:700:51d2:2ba0:bc1:d4b3])
 by smtp.gmail.com with ESMTPSA id f13sm271308wrq.96.2019.11.20.11.39.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Nov 2019 11:39:46 -0800 (PST)
To: Tom Rini <trini@konsulko.com>
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
 <54bb624a-5d80-71e9-4c5a-f5bd4aa20851@gmail.com>
 <20191119215230.GJ19317@bill-the-cat>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <7a18d891-3fc4-ed16-65df-f83bc36c748e@gmail.com>
Date: Wed, 20 Nov 2019 20:39:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119215230.GJ19317@bill-the-cat>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCHv2 5/5] env: Finish migration of
 common ENV options
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

Am 19.11.2019 um 22:52 schrieb Tom Rini:
> On Tue, Nov 19, 2019 at 10:39:18PM +0100, Simon Goldschmidt wrote:
>> Am 19.11.2019 um 02:02 schrieb Tom Rini:> - In ARMv8 NXP Layerscape
>> platforms we also need to make use of
>>>     CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
>>> - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the define
>>>     to 0.
>>> - Add Kconfig entry for ENV_ADDR.
>>> - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
>>> - Add ENV_xxx_REDUND options that depend on their primary option and
>>>     SYS_REDUNDAND_ENVIRONMENT
>>> - On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV_ADDR
>>>     for the pre-main-U-Boot environment location.
>>> - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
>>>     rather it being non-zero, as it will now be zero by default.
>>> - Rework the env_offset absolute in env/embedded.o to not use
>>>     CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
>>>     ENV_IS_IN_FLASH.
>>> - Migrate all platforms.
>>>
>>> Cc: Wolfgang Denk <wd@denx.de>
>>> Cc: Joe Hershberger <joe.hershberger@ni.com>
>>> Cc: Patrick Delaunay <patrick.delaunay@st.com>
>>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>>> Signed-off-by: Tom Rini <trini@konsulko.com>
>>> ---
>>
>> <snip>
>>
>>> diff --git a/include/configs/socfpga_common.h
>> b/include/configs/socfpga_common.h
>>> index baa214399ff9..05bfef75c0df 100644
>>> --- a/include/configs/socfpga_common.h
>>> +++ b/include/configs/socfpga_common.h
>>> @@ -157,21 +157,13 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
>>>    /*
>>>     * U-Boot environment
>>>     */
>>> -#if !defined(CONFIG_ENV_SIZE)
>>> -#define CONFIG_ENV_SIZE			(8 * 1024)
>>> -#endif
>>>
>>>    /* Environment for SDMMC boot */
>>> -#if defined(CONFIG_ENV_IS_IN_MMC) && !defined(CONFIG_ENV_OFFSET)
>>> +#if defined(CONFIG_ENV_IS_IN_MMC)
>>>    #define CONFIG_SYS_MMC_ENV_DEV		0 /* device 0 */
>>> -#define CONFIG_ENV_OFFSET		(34 * 512) /* just after the GPT */
>>>    #endif
>>>
>>>    /* Environment for QSPI boot */
>>> -#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
>>> -#define CONFIG_ENV_OFFSET		0x00100000
>>> -#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
>>> -#endif
>>
>> Removing paragraphs like this one will break configs that haven't made it to
>> a mainline defconfig. E.g. for socfpga_socrates_defconfig, you can chose for
>> the ENV to be saved in SPI instead of MMC as the config supports booting
>> from all sources.
>>
>> How do we proceed with such things? I know that might be non-mainline, but I
>> think throwing this info away is a step-back, not an improvement.
>>
>> [And don't get me wrong: this doesn't affect my downstream boards, they
>> don't save/load env due to secure boot reasons anyway.]
> 
> So, I would be happy to see follow up series that add default values for
> locations for various SoCs.  That would address the type of problem
> you're talking about, I believe.

You mean adding lines like this to env/Kconfig at config ENV_OFFSET
	default 0x00100000 if ARCH_SOCFPGA && ENV_IS_IN_SPI_FLASH

Does that even work? And how well does it scale? I know it's a more 
fundamental problem, but in my opinion, scattering those defaults for 
every arch or board throughout all Kconfig files is not the best 
solution. Although I have to admit I don't have an idea of how to solve 
it better right now...

> 
> I'd be even happier if someone looked at how Zephyr takes a dts file and
> generates a header and adapt that to a way for us to have some values be
> read from a dts* file and turned into a define we can use at build time
> (not just the OF_PLAT data).  That would be a real nice step forward :)
> 

If we have that ENV information in the devicetree, we could just use it 
and dump the defines. No need to convert dts to defines beforehand. Only 
if dts cannot be used, we need something different. But in that case 
(mostly real small SPL, I guess), do we really enable the ENV loading code?

Anyway, thinking this over, I don't see a way out to keep the SPI env 
locations for socfpga when moving to Kconfig, so for socfpga:

Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

BTW: From looking at the include/configs/* changes, 
CONFIG_SYS_MMC_ENV_DEV could be moved to Kconfig, too...

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
