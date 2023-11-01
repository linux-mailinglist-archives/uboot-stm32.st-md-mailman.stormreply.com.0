Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D97DE515
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Nov 2023 18:12:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D9EDC6B452;
	Wed,  1 Nov 2023 17:12:14 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84B1BC6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 17:12:13 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-670e7ae4a2eso9546806d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 10:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698858732; x=1699463532;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uRuxvJsK/N1oREgCV2uD8VdTs3lvdBwA54CvH8KsMlU=;
 b=XONET73SaIn3N3Ke7dzisZMFdGWg1bodHQPKXGQGPwmf/EB4u70ZyzwI1WJ52D+rsZ
 8zWOhkKEOHeLV0e2Eo9kJMrg24liohvlxx3vWulb24cuavMmcjwTARQ9bwbcujEGyNZS
 TbJqWzbSNB60wKUC5G/X9a2l5lCYHDpxmR0Y7KkIKy4kXWekJlv8thQsKs4xzxSaOVba
 4nubbFtLSYEe+0mu5oiFVvC5Yv/bCqlvi3zLTXfU5mfCbvd0e4e5SK/rNlUlfCcP9FWu
 5CblXEnG83gsy8fdDY+05IKj4+O63XdJwpaJQrES4zHWwsmUXjqiqwMSN0ZqA4WqqGRd
 pszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698858732; x=1699463532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRuxvJsK/N1oREgCV2uD8VdTs3lvdBwA54CvH8KsMlU=;
 b=X1rXuYJ5d5lNc5yj+0MTFFkOPmbdvP0WJODVgd9BFjGkjQSUwcuo8LRcJMlKT5+Cxh
 B6pF53IiQSQHntr+h+g11islHHOV7OmDteYWKHDqQ8734bzklNGgBr7+HOZAu+yTywUg
 Rspif7bEE1ejKuYY1OHZ5YG1gLSmgcdbhg6MNUowGS05NddYTcWe4aJT90Mn8c56nURe
 +92YvsEXrX566E/5JrECAXH3uWFyyfC8sjFeHMOkmpeuHi5FgbdypO96vHf3UsyQqNuZ
 PL8weHUcXzA+0Me+6SLtFynEDDusaP4l1/IcTsWnrPekINp2srmqYrihEpewJxCJyv7N
 HKRg==
X-Gm-Message-State: AOJu0Yz311xK5bEVODBpRPX/0cPvC11DpVqurOZopnsMNLYbmds2TCXm
 FkF75DlFNdZ2c/YBw2zJndk=
X-Google-Smtp-Source: AGHT+IEh9pcDdj7MSOdioIiR+CHysM01noGu3l8//+J+dTQNeFosR4AJLog5PEU1ITw+Aw2h9Wcy5Q==
X-Received: by 2002:a05:6214:5c6:b0:66f:ac56:fb9b with SMTP id
 t6-20020a05621405c600b0066fac56fb9bmr4718605qvz.22.1698858732348; 
 Wed, 01 Nov 2023 10:12:12 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 cp13-20020ad44aed000000b0066d32666a20sm1651513qvb.71.2023.11.01.10.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:12:12 -0700 (PDT)
Message-ID: <d4bc9fbc-d8de-0a72-d8cd-c54dcf5a4d5e@gmail.com>
Date: Wed, 1 Nov 2023 13:12:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek
 <michal.simek@amd.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231017165649.1492-1-ivprusov@sberdevices.ru>
 <20231017165649.1492-4-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231017165649.1492-4-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 3/8] clk: k210: Move soc_clk_dump
	function
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

On 10/17/23 12:56, Igor Prusov wrote:
> Move clock dump function to avoid forward declaration after switching to
> dump in clk_ops.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>   drivers/clk/clk_k210.c | 92 +++++++++++++++++++++---------------------
>   1 file changed, 46 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/clk/clk_k210.c b/drivers/clk/clk_k210.c
> index c534cc07e0..2f17152021 100644
> --- a/drivers/clk/clk_k210.c
> +++ b/drivers/clk/clk_k210.c
> @@ -1238,52 +1238,6 @@ static int k210_clk_request(struct clk *clk)
>   	return 0;
>   }
>   
> -static const struct clk_ops k210_clk_ops = {
> -	.request = k210_clk_request,
> -	.set_rate = k210_clk_set_rate,
> -	.get_rate = k210_clk_get_rate,
> -	.set_parent = k210_clk_set_parent,
> -	.enable = k210_clk_enable,
> -	.disable = k210_clk_disable,
> -};
> -
> -static int k210_clk_probe(struct udevice *dev)
> -{
> -	int ret;
> -	struct k210_clk_priv *priv = dev_get_priv(dev);
> -
> -	priv->base = dev_read_addr_ptr(dev_get_parent(dev));
> -	if (!priv->base)
> -		return -EINVAL;
> -
> -	ret = clk_get_by_index(dev, 0, &priv->in0);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Force setting defaults, even before relocation. This is so we can
> -	 * set the clock rate for PLL1 before we relocate into aisram.
> -	 */
> -	if (!(gd->flags & GD_FLG_RELOC))
> -		clk_set_defaults(dev, CLK_DEFAULTS_POST_FORCE);
> -
> -	return 0;
> -}
> -
> -static const struct udevice_id k210_clk_ids[] = {
> -	{ .compatible = "canaan,k210-clk" },
> -	{ },
> -};
> -
> -U_BOOT_DRIVER(k210_clk) = {
> -	.name = "k210_clk",
> -	.id = UCLASS_CLK,
> -	.of_match = k210_clk_ids,
> -	.ops = &k210_clk_ops,
> -	.probe = k210_clk_probe,
> -	.priv_auto = sizeof(struct k210_clk_priv),
> -};
> -
>   #if IS_ENABLED(CONFIG_CMD_CLK)
>   static char show_enabled(struct k210_clk_priv *priv, int id)
>   {
> @@ -1342,3 +1296,49 @@ int soc_clk_dump(void)
>   	return 0;
>   }
>   #endif
> +
> +static const struct clk_ops k210_clk_ops = {
> +	.request = k210_clk_request,
> +	.set_rate = k210_clk_set_rate,
> +	.get_rate = k210_clk_get_rate,
> +	.set_parent = k210_clk_set_parent,
> +	.enable = k210_clk_enable,
> +	.disable = k210_clk_disable,
> +};
> +
> +static int k210_clk_probe(struct udevice *dev)
> +{
> +	int ret;
> +	struct k210_clk_priv *priv = dev_get_priv(dev);
> +
> +	priv->base = dev_read_addr_ptr(dev_get_parent(dev));
> +	if (!priv->base)
> +		return -EINVAL;
> +
> +	ret = clk_get_by_index(dev, 0, &priv->in0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Force setting defaults, even before relocation. This is so we can
> +	 * set the clock rate for PLL1 before we relocate into aisram.
> +	 */
> +	if (!(gd->flags & GD_FLG_RELOC))
> +		clk_set_defaults(dev, CLK_DEFAULTS_POST_FORCE);
> +
> +	return 0;
> +}
> +
> +static const struct udevice_id k210_clk_ids[] = {
> +	{ .compatible = "canaan,k210-clk" },
> +	{ },
> +};
> +
> +U_BOOT_DRIVER(k210_clk) = {
> +	.name = "k210_clk",
> +	.id = UCLASS_CLK,
> +	.of_match = k210_clk_ids,
> +	.ops = &k210_clk_ops,
> +	.probe = k210_clk_probe,
> +	.priv_auto = sizeof(struct k210_clk_priv),
> +};

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
