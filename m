Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7F1265045
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 22:10:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51E3BC3FAFE
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Sep 2020 20:10:29 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76935C3FAE3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 20:10:27 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id a2so6413094otr.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Sep 2020 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8f+ipgqpTPtNrlo56c4LDWpkho52QMq0CgWfoFiWpMY=;
 b=mjg4bdTfByoTMbl2z3Uj2pYGPUWLrKxN6mSz2EqFjU+F+LZZl4MpOZusdNzfiB9IyO
 +USY8/YzKzHjskRTA2AMwU5om3YQuBT+rJKXcROxozTt/PSvGkcfkMA4VLs1prVxgV2J
 kQPl123RH+spw8Tj5EdvvPsCd75rSqSPcy1kgVM/O80ZuNkTTUlKEVoCNDHR2tM44uqp
 PcReomeRraD0vrMVZ4TTjnfp+fkKiu7pNHSxF1kO0qQfi6ehT1QzrnwLrWhrKvWUOmvh
 MMAdtJ7eLVxAYOZm+4MGHdOFxpudeAh7LnK/HsTiwnymGUscrP6o9D9OAg3U5yBxxjxC
 xcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8f+ipgqpTPtNrlo56c4LDWpkho52QMq0CgWfoFiWpMY=;
 b=fKnp2sonFT/2fjcrmr6jpbALuCj4s1hsiUwmU4wLcAK4FutLSYdlTCPGZw5MN0gOUM
 QxEnAnSA9w0K4FIyyyq+NhP9XrDlKgqy5q/DTiC9yTZrpvDvPzJupXJ7a9POd1y6IEe3
 2BFiJiR0ohiQBahiXTLZ7gDRuAJIm4mdekG9KlWYm38byv/xt09Pv9gpBoQC0qekMcr0
 qF1kgo5NMy+Af3qRofCI2Rcs2/JE1ERjZd09/tEMKGVWXZD6qZDbTrnHnUTOcO0WMkVB
 Ncsz/uf63lAJQnWiKzP9KHN1K16MKGNmcb5hjmUUQgpllMzhSFr2edsokWxTqE3sme3K
 iKkA==
X-Gm-Message-State: AOAM533Hja2iatdxdG5/9qhZSxK2oYK5faYrdev9/CqevCxyn/7Jqj2t
 yHqU3Mf7e5/nRq39iio3VhI=
X-Google-Smtp-Source: ABdhPJwQo8GRTe332Qh1dMpUS6vn7A8rg/jo5tzm1NX/JYX21pUqe0JBVN4KwtBAnufYAqM3nONN+A==
X-Received: by 2002:a9d:7d16:: with SMTP id v22mr4852260otn.372.1599768626145; 
 Thu, 10 Sep 2020 13:10:26 -0700 (PDT)
Received: from nuclearis2-1.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id g26sm9857otn.77.2020.09.10.13.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:10:25 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@st.com>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Yann GAUTIER <yann.gautier@st.com>
References: <20200909215402.366561-1-mr.nuke.me@gmail.com>
 <f48f0991628c4dda87089f1464da65d5@SFHDAG6NODE3.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <ed73c108-71e5-4940-f9e0-9490758087a8@gmail.com>
Date: Thu, 10 Sep 2020 15:10:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f48f0991628c4dda87089f1464da65d5@SFHDAG6NODE3.st.com>
Content-Language: en-US
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Peng Fan <peng.fan@nxp.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH] mmc: stm32_sdmmc2: Use mmc_of_parse() to
 read host capabilities
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

On 9/10/20 11:04 AM, Patrick DELAUNAY wrote:
> Hi Alexandru,

Hi

[snip]

>> +	cfg->f_max = 52000000;
>> +	mmc_of_parse(dev, cfg);
> 
> Result of mmc_of_parse is not tested ?
> 
> I proposed:
> 
> +	ret = mmc_of_parse(dev, cfg);
> +	if (ret)
> +		return ret;

You're right. I'll get that updated.


> I test this patch with a trace in stm32_sdmmc2_probe on STM32MP157C-EV1
[snip]
> I think that it is a issue U-Boot, in mmc uclass in mmc_of_parse():
> 
> 	if (dev_read_bool(dev, "cap-mmc-highspeed"))
> -		cfg->host_caps |= MMC_CAP(MMC_HS);
> +		cfg->host_caps |= MMC_CAP(MMC_HS) | MMC_CAP(MMC_HS_52);
> 
> In U-Boot this capability is splitted in 2 bits = one for 26MHz one for 52MHz
> And  for card side it is managed on card side by mmc_get_capabilities()

I agree. I am preparing a patch to address this.


[snip]
> 2) some host caps can be added in device tree (they are supported by SOC and by Linux driver)
>      but they are not supported by U-Boot driver, for example:
> 
> #define MMC_MODE_DDR_52MHz	MMC_CAP(MMC_DDR_52)
> #define MMC_MODE_HS200		MMC_CAP(MMC_HS_200)
> #define MMC_MODE_HS400		MMC_CAP(MMC_HS_400)
> #define MMC_MODE_HS400_ES	MMC_CAP(MMC_HS_400_ES)
> 
> 
> I afraid (I don't sure) that this added caps change the mmc core behavior in U-Boot =
> U-Boot try to select  the high speed mode even if not supported by driver....

Two issues here. The first is when devicetree enables an unsupported 
mode, say "mmc-hs400-1_2v". That's a devicetree bug, and not something 
we should fix in the code. Hypothetical exam: DT says
	bus-width = <8>;
but only four lines are routed on the board.

The second issue is what happens when somebody plugs in a UHS SD card? 
UHS support is not enabled by default in the stm32mp1 defconfigs, so the 
mmc core won't try to run it at UHS.

Now if somebody were to enable UHS manually:
	CONFIG_MMC_IO_VOLTAGE=y
	CONFIG_MMC_UHS_SUPPORT=y
Then yes, the UHS switch will be attempted, fail, and the card will not 
be detected.

To work around that, one could implement a .wait_dat0() that returns an 
error other than -ENOSYS. This would cause mmc_switch_voltage() to fail, 
making the mmc core to leave the card at default speeds.

My argument is that it takes conscious effort to break things in the 
first place, so it's not a situation we should worry about.


> The host_caps bitfield should be limited by the supported features in the driver  (or remove the unsupported features)
[snip]
> 	cfg->host_caps &= SDMMC_SUPPORTED_CAPS;
> or
> 	cfg->host_caps |= ~SDMMC_UNSUPPORTED_CAPS;

I think this sort of playing with the flags will cause more confusion. 
People would expect this to come from DT. For example, somebody sets 
"sd-uhs-ddr52" in devicetree. It's more confusing to check host_caps, 
and find that MMC_MODE_DDR_52MHz is not set than it is to see the driver 
trying to place the card in DDR52 and failing.

Alex

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
