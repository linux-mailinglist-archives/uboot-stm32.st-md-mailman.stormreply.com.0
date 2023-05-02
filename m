Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A03326F53AA
	for <lists+uboot-stm32@lfdr.de>; Wed,  3 May 2023 10:50:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C76DC6A5FD;
	Wed,  3 May 2023 08:50:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29359C69049
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 May 2023 18:41:00 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so4896117e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 May 2023 11:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683052859; x=1685644859;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=188Dznl0ifUtV3we9ngqxolwbM8m32x80p7aogDia14=;
 b=PEnWx9kf8aVom35qISYV1RCfqUaqaxLArRSvB192CnsMgM6c+GzMoSHBWlMC6nRvRd
 BUstsmkIcwQ61BxusHL59NTYrfORXjKM0IZOpBXvncPhDrnO30Tw7XTtJKKEAUTUFLVe
 ZHYNWiswaUwqvL8tCuxWM42nyry3FqFToCbZ5aSmoNW6KCE9mttQP3pGjbYEI7lfU/fV
 u9aU0ZvxcsILQdMuCFUFlRg78FjUyA4D7xogK8sVOaCsX3sugYKbnff+c1jmh4JthBub
 fr67aVtaRZE15oxkQEwTSc9x/+AhHgCzgr5N0U2412m7Ca8DoF/r9YIZCJ/T63a5dHoe
 07tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683052859; x=1685644859;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=188Dznl0ifUtV3we9ngqxolwbM8m32x80p7aogDia14=;
 b=VBx5+5XaUGD6nHIfr91zOuHtYU66BDkyGF2fOBxsTF0ndTo9tcxaCVnrYvOCY78Yam
 Yya+mIEa9i7dr7j+PfxDrthcdB8WcU2S2Psfu3wVtVX8YWk17e+uAhf28JnOBp86vkwr
 vCK7pastr5lWdthHoIB5kqkRyXtJ4+JGFMwieLgg0I2Hs2czErYMqD9fodH4Zl8E7Dwf
 21WjtrArJuDWNptabaY7MVJiJ+Gm3OltXMwNLts5fZZxWgUr6pTTDM8MOlo+zvokFMh+
 5lCupe3/6fJVKJGar5G8F94uMlNRI8FCmLxPlJ67aK8yBufb2BVbTYCGt10bOpgPKSfR
 3aMA==
X-Gm-Message-State: AC+VfDxZy1IwPidyofUtOq/sDv+//AYWFY7hVnOmR8VCVZc27is3DkwM
 zAezwv7loJk9dSV2bloXou0=
X-Google-Smtp-Source: ACHHUZ7RBjxFVrO7r54DMhtIG+HZtcPRkB7w/I9pg9gG270lBn/oc1mZXAx3hxJ3J0N9oUW1yJB6AQ==
X-Received: by 2002:ac2:5199:0:b0:4eb:2643:c6c6 with SMTP id
 u25-20020ac25199000000b004eb2643c6c6mr220009lfi.53.1683052859148; 
 Tue, 02 May 2023 11:40:59 -0700 (PDT)
Received: from DESKTOP-G0QQV4M. ([83.217.200.249])
 by smtp.gmail.com with ESMTPSA id
 l14-20020ac2554e000000b004dda76fad5asm5493722lfk.218.2023.05.02.11.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 11:40:58 -0700 (PDT)
Message-ID: <6451593a.c20a0220.2fb7d.0870@mx.google.com>
X-Google-Original-Message-ID: <20230502184056.xjjo3m5mytllq224@DESKTOP-G0QQV4M.>
Date: Tue, 2 May 2023 21:40:56 +0300
From: Igor Prusov <prusovigor@gmail.com>
To: Michal Simek <michal.simek@amd.com>
References: <20230427203726.11835-1-ivprusov@sberdevices.ru>
 <20230427203726.11835-7-ivprusov@sberdevices.ru>
 <6b4101b8-c047-b8aa-e54b-e8eee03fa2fc@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b4101b8-c047-b8aa-e54b-e8eee03fa2fc@amd.com>
X-Mailman-Approved-At: Wed, 03 May 2023 08:50:25 +0000
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Stefan Roese <sr@denx.de>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, u-boot@lists.denx.de,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, kernel@sberdevices.ru,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Igor Prusov <ivprusov@sberdevices.ru>
Subject: Re: [Uboot-stm32] [RFC PATCH v1 6/7] clk: treewide: switch to clock
 dump from clk_ops
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

Hello Michal,

On Tue, May 02, 2023 at 04:02:00PM +0200, Michal Simek wrote:
> 
> 
> On 4/27/23 22:37, Igor Prusov wrote:
> > Switch to using new dump operation in clock provider drivers instead of
> > overriding soc_clk_dump.
> > 
> > Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> > ---
> >   arch/mips/mach-pic32/cpu.c             | 23 ---------------
> >   drivers/clk/aspeed/clk_ast2600.c       | 13 ++++-----
> >   drivers/clk/clk_k210.c                 | 11 +++-----
> >   drivers/clk/clk_pic32.c                | 39 ++++++++++++++++++++++++++
> >   drivers/clk/clk_versal.c               |  7 ++++-
> >   drivers/clk/clk_zynq.c                 | 19 ++++---------
> >   drivers/clk/clk_zynqmp.c               | 13 ++++-----
> >   drivers/clk/imx/clk-imx8.c             | 11 +++-----
> >   drivers/clk/mvebu/armada-37xx-periph.c |  5 +++-
> >   drivers/clk/stm32/clk-stm32mp1.c       | 29 ++++++-------------
> >   10 files changed, 83 insertions(+), 87 deletions(-)
> > 
> > diff --git a/arch/mips/mach-pic32/cpu.c b/arch/mips/mach-pic32/cpu.c
> > index de449e3c6a..2875a1ec7c 100644
> > --- a/arch/mips/mach-pic32/cpu.c
> > +++ b/arch/mips/mach-pic32/cpu.c
> > @@ -148,26 +148,3 @@ const char *get_core_name(void)
> >   	return str;
> >   }
> >   #endif
> > -#ifdef CONFIG_CMD_CLK
> > -
> > -int soc_clk_dump(void)
> > -{
> > -	int i;
> > -
> > -	printf("PLL Speed: %lu MHz\n",
> > -	       CLK_MHZ(rate(PLLCLK)));
> > -
> > -	printf("CPU Speed: %lu MHz\n", CLK_MHZ(rate(PB7CLK)));
> > -
> > -	printf("MPLL Speed: %lu MHz\n", CLK_MHZ(rate(MPLL)));
> > -
> > -	for (i = PB1CLK; i <= PB7CLK; i++)
> > -		printf("PB%d Clock Speed: %lu MHz\n", i - PB1CLK + 1,
> > -		       CLK_MHZ(rate(i)));
> > -
> > -	for (i = REF1CLK; i <= REF5CLK; i++)
> > -		printf("REFO%d Clock Speed: %lu MHz\n", i - REF1CLK + 1,
> > -		       CLK_MHZ(rate(i)));
> > -	return 0;
> > -}
> > -#endif
> > diff --git a/drivers/clk/aspeed/clk_ast2600.c b/drivers/clk/aspeed/clk_ast2600.c
> > index b3cc8392fa..08db21d394 100644
> > --- a/drivers/clk/aspeed/clk_ast2600.c
> > +++ b/drivers/clk/aspeed/clk_ast2600.c
> > @@ -1109,6 +1109,7 @@ struct aspeed_clks {
> >   	const char *name;
> >   };
> > +#if IS_ENABLED(CONFIG_CMD_CLK)
> >   static struct aspeed_clks aspeed_clk_names[] = {
> >   	{ ASPEED_CLK_HPLL, "hpll" },
> >   	{ ASPEED_CLK_MPLL, "mpll" },
> > @@ -1123,18 +1124,12 @@ static struct aspeed_clks aspeed_clk_names[] = {
> >   	{ ASPEED_CLK_HUARTX, "huxclk" },
> >   };
> > -int soc_clk_dump(void)
> > +int ast2600_clk_dump(struct udevice *dev)
> 
> static? apply for all below too.

Indeed, will fix in v2, thanks!

> 
> M

-- 
Best Regards,
Igor Prusov
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
