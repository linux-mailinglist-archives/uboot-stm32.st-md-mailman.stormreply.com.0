Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540064B6A9
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Dec 2022 14:59:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39241C65E61;
	Tue, 13 Dec 2022 13:59:01 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5DF5C035BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 13:58:59 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id j16so11843721qtv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Dec 2022 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DKuSvFtdyrJT+9vSCE4pT1iJIOqVjVt24aJ2web6OG0=;
 b=nEdRwkkltmSf3NI1aztBH5IR1cjvA6oQKPJSKyi2Ss2X6UtC2DjSk00nonYejK9sd4
 3O5Vvs5Pm8sl13XEKJNLwpzTxRpPf6vDLrdfMaoIQn99rdEOqnEO1LVDConpXxt2lcsL
 eGbAx+LA+M8tSeCQDBAm/o+DScdRLJiIuZznOxUBWmmtC3PS1g2glY/6keaI1toYNs2k
 WG2MyjggnTidHJ+EjTdB6p2RtSIe4tLITJP1PZmE5jHJ3Yi60d2xDNxBkpEKN5Dx4K7x
 X2rCLJfKshbn/5+dm0rGBW0iEYG58qpU4txC/69OU9eHSexgVxPmNaNs/S/qtPQngtMS
 QuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DKuSvFtdyrJT+9vSCE4pT1iJIOqVjVt24aJ2web6OG0=;
 b=tsfSINoRm2ihSmosTPRcv4szhmZVEnpT2gT7cUZYI+WzK94tiFGPFvO1i3z2j8V6q1
 LrGCqkFPvBUuUnIjfSyciqbmpvxPjenXktWUpvqB++B7+JnAWThzMzoDoGpFzV5j/D9N
 Qp71XXEr17ak87DmOXjZEMeQZlkpPXTs+1hXb1OFEydz1wyIQRqbmmoHGkADKrf4D4Kr
 F0YVTYaABz7ZvEqgKkWZ6TUopUt2sWzqtEqBzxIdBWtl5aHgmPh83M187iAmuw970n9A
 2+qCcn5lI1Vbb6Vob0mM2sXamI7GFzvwQMqviZ2CdfnAXx5clQFDVUjxUpLb7vcny0MY
 PY9g==
X-Gm-Message-State: ANoB5pmQk4rTscm+BiF8Cjp4HB1qU1kvhTe84doY+Vi5Z1dp4BcBY+fg
 E7NChdD6jYnJJ7rOc90kTSU=
X-Google-Smtp-Source: AA0mqf6UfOFoousOMlYCerrybatDu6DBvU8BPYBWFEzkUEO8XdnbAJMEhWQs1GDR+y4Cdhl64VrZdA==
X-Received: by 2002:ac8:4e0c:0:b0:3a8:18d3:8525 with SMTP id
 c12-20020ac84e0c000000b003a818d38525mr7957066qtw.13.1670939938895; 
 Tue, 13 Dec 2022 05:58:58 -0800 (PST)
Received: from [192.168.1.201] (pool-173-73-95-180.washdc.fios.verizon.net.
 [173.73.95.180]) by smtp.gmail.com with ESMTPSA id
 m10-20020ac866ca000000b003a611cb2a95sm7681917qtp.9.2022.12.13.05.58.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 05:58:58 -0800 (PST)
Message-ID: <3229e627-1fb9-b829-7169-d18853003604@gmail.com>
Date: Tue, 13 Dec 2022 08:58:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221213145708.v2.1.Ia0bc6b272f1e2e3f37873c61d79138c2663c4055@changeid>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20221213145708.v2.1.Ia0bc6b272f1e2e3f37873c61d79138c2663c4055@changeid>
Cc: Tero Kristo <t-kristo@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: clk: probe the clock before dump
	them
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

On 12/13/22 08:57, Patrick Delaunay wrote:
> The clock UCLASS need to be probed to allow availability of the
> private data (struct clk *), get in show_clks() with dev_get_clk_ptr()
> before use them.
> 
> Without this patch the clock dump can cause crash because all the
> private data are not available before calling the API clk_get_rate().
> 
> It is the case for the SCMI clocks, priv->channel is needed for
> scmi_clk_get_rate() and it is initialized only in scmi_clk_probe().
> This issue causes a crash for "clk dump" command on STM32MP135F-DK board
> for SCMI clock not yet probed.
> 
> Fixes: 1a725e229096 ("clk: fix clock tree dump to properly dump out every registered clock")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - simplify the patch after Simon review of V1: always probe the clk device
>    before call to show_clks(), by using device_foreach_child_probe() and
>    uclass_foreach_dev_probe()
> - test UCLASS_CLK only when show_clks is called for child device
> 
>   cmd/clk.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index a483fd898122..ff7c7649a159 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -22,7 +22,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>   	u32 rate;
>   
>   	clkp = dev_get_clk_ptr(dev);
> -	if (device_get_uclass_id(dev) == UCLASS_CLK && clkp) {
> +	if (clkp) {
>   		parent = clk_get_parent(clkp);
>   		if (!IS_ERR(parent) && depth == -1)
>   			return;
> @@ -49,10 +49,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>   		printf("%s\n", dev->name);
>   	}
>   
> -	list_for_each_entry(child, &dev->child_head, sibling_node) {
> +	device_foreach_child_probe(child, dev) {
> +		if (device_get_uclass_id(child) != UCLASS_CLK)
> +			continue;
>   		if (child == dev)
>   			continue;
> -
>   		is_last = list_is_last(&child->sibling_node, &dev->child_head);
>   		show_clks(child, depth, (last_flag << 1) | is_last);
>   	}
> @@ -61,17 +62,11 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>   int __weak soc_clk_dump(void)
>   {
>   	struct udevice *dev;
> -	struct uclass *uc;
> -	int ret;
> -
> -	ret = uclass_get(UCLASS_CLK, &uc);
> -	if (ret)
> -		return ret;
>   
>   	printf(" Rate               Usecnt      Name\n");
>   	printf("------------------------------------------\n");
>   
> -	uclass_foreach_dev(dev, uc)
> +	uclass_foreach_dev_probe(UCLASS_CLK, dev)
>   		show_clks(dev, -1, 0);
>   
>   	return 0;

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
