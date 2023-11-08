Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96A67E5BD2
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Nov 2023 17:59:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D937C6B44D;
	Wed,  8 Nov 2023 16:59:16 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0418C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Nov 2023 16:59:14 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6d33298f8fdso3391396a34.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Nov 2023 08:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699462753; x=1700067553;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZnOdKUWWE4zFAKJWidQzEqP0t/m6lENpHeoIBjpMExk=;
 b=SAa00tbAlx4mD9vdhXT5rvuUayUwrQ4/dYhn3qoDP1Gh4B8n9pn8KGHRiRgQPAJb0C
 ci5mO6VHowgHlFxQgCXFUkk2VOTYyLuIFJ693lJs6XSGJm9GxgHC2rR70L0vmwQ2wTvf
 FSBxpb5y6djXb8widL4B+vEEBHhfG3iU9Xm3FknFlKD9nLsFL9y02MkgvBwdEEwvClSm
 jXLOFmM8rD32FUQx4/XgUJlybvGiHVUYbPcNqig12tK+zKIljorAYcMxKYc3gYmr7hAf
 5ctbpzgMfs64gmicITY2Fb2nDhTg22xk9PCKku9HPcmyMfbKUZZ8ynGBzyOXAkQejPM6
 Gu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699462753; x=1700067553;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnOdKUWWE4zFAKJWidQzEqP0t/m6lENpHeoIBjpMExk=;
 b=asJlhib8m162T77yJT/vPq0LdjOftsPjrsQgbcKWLgvILXgq1xLrIdXHnarAd1FY61
 it5iz1Pmn4tfKg09ESQ5axGkdiiBHN4drAIwyB4pI4xMj6wjPLnogMkpfxQhpWwd7n41
 dv6NQhxsHaumfRHPEW48iTThl8v6hgxHEQrgTz/KveESmfw+jOK7KwYTQDAR/KhqBm/n
 ikZjLrYN87Q6iam3U3dkbN7ZJOLT35i9udFhHmRIl+30Xy8n2S69Rzdd4OCL8kBILAqL
 d1nBM+O3FA+EM7vy6TzE+uu9TCkP7vsibAYSpnmd83lx0WWlgNkRNo6QCEM88GDz/U0e
 XpKw==
X-Gm-Message-State: AOJu0YwL0HJ9CILGjHp9iyO8trvlljH2QOeSNqNb9R/sxq5ufH2jsen4
 rKXZQ07gSvPEK3Vdjjq1LWk=
X-Google-Smtp-Source: AGHT+IETEvYweDNabSPYit/y8g1EtPfbXj0e+2RBrbqRDfj8gbZFR7JQQFtUnjhk4bU0jRWqQU4fSw==
X-Received: by 2002:a05:6830:2b21:b0:6be:c1b:ded4 with SMTP id
 l33-20020a0568302b2100b006be0c1bded4mr2768421otv.3.1699462753555; 
 Wed, 08 Nov 2023 08:59:13 -0800 (PST)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 kg16-20020a05622a761000b0040331a24f16sm1073339qtb.3.2023.11.08.08.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 08:59:13 -0800 (PST)
Message-ID: <976548be-3bdd-0655-8bbb-31c7acdbe4be@gmail.com>
Date: Wed, 8 Nov 2023 11:59:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Igor Prusov <ivprusov@sberdevices.ru>, u-boot@lists.denx.de,
 Michal Simek <michal.simek@amd.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231105083809.3293-1-ivprusov@sberdevices.ru>
 <20231105083809.3293-6-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231105083809.3293-6-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 uboot-stm32@st-md-mailman.stormreply.com, Joel Stanley <joel@jms.id.au>,
 kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v6 5/8] clk: Add dump operation to clk_ops
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

On 11/5/23 03:38, Igor Prusov wrote:
> This adds dump function to struct clk_ops which should replace
> soc_clk_dump. It allows clock drivers to provide custom dump
> implementation without overriding generic CCF dump function.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   include/clk-uclass.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/include/clk-uclass.h b/include/clk-uclass.h
> index a22f1a5d84..3419daab34 100644
> --- a/include/clk-uclass.h
> +++ b/include/clk-uclass.h
> @@ -25,6 +25,7 @@ struct ofnode_phandle_args;
>    * @set_parent: Set current clock parent
>    * @enable: Enable a clock.
>    * @disable: Disable a clock.
> + * @dump: Print clock information.
>    *
>    * The individual methods are described more fully below.
>    */
> @@ -39,6 +40,9 @@ struct clk_ops {
>   	int (*set_parent)(struct clk *clk, struct clk *parent);
>   	int (*enable)(struct clk *clk);
>   	int (*disable)(struct clk *clk);
> +#if IS_ENABLED(CONFIG_CMD_CLK)
> +	void (*dump)(struct udevice *dev);
> +#endif
>   };
>   
>   #if 0 /* For documentation only */
> @@ -135,6 +139,17 @@ int enable(struct clk *clk);
>    * Return: zero on success, or -ve error code.
>    */
>   int disable(struct clk *clk);
> +
> +/**
> + * dump() - Print clock information.
> + * @clk:	The clock device to dump.
> + *
> + * If present, this function is called by "clk dump" command for each
> + * bound device.
> + *
> + * Return: zero on success, or -ve error code.

This is no longer correct, but I can remove it when applying.

> + */
> +void dump(struct udevice *dev);
>   #endif
>   
>   #endif

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
