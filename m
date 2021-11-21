Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE245861D
	for <lists+uboot-stm32@lfdr.de>; Sun, 21 Nov 2021 20:14:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1346CC597BE;
	Sun, 21 Nov 2021 19:14:54 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF97C597BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Nov 2021 19:14:52 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id bu11so11039997qvb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Nov 2021 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/yAVxTXUYU92m97qcdUqlcgqLZz5VWFRe2ICAnLRLNU=;
 b=cICrodQHn7dxLhYI2NrqDMVAOW51j6jnZKzzE8mr2Lnb7vz8ZuWqiL49JjL18SeeZD
 8EA4AhoSlkd1cv8lDvFZJoTmRciag1b4B2Ct7jNgFkFCW1rTFNi58pQmVkKz45o4XdW5
 WyzHsJmZBYq7++pQSmz7GJs7eKL9bqN4q5QWT8W2tFoMd0RIkuzoVqMiIBoPFYg7Vlh1
 F6mE7mq67m6FP6ewq3BiGr/nODDeNDhgYHsZtcoIJudtjsJovSnrUg+wsmZ47LDdehTv
 DK6SkzTvXgdfnmXq/Pv4v8Kw7AGk5cnqKgSBpO+UA9/clpIEFgEci3jYjyjHB0eHvjH9
 zX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/yAVxTXUYU92m97qcdUqlcgqLZz5VWFRe2ICAnLRLNU=;
 b=KDmmY8PE78MB8d0NwQADJns0kAwCZik+T22JyeOUbfzRu9WlzyyBd8dyBLd0uYo5j8
 fzMAHGlZ5ceWwKpc/DxWpPWzfLcEe89y3GWMKIvIZCaBo8sAvvP1wL7wueUdaWzq0UOi
 Tu++pBOf47OopvtmZ8Ut4t+mRJ4u+NXQ9mxYK+FLN5yPreMztxalzEJfeia3pdI6dEFK
 dLMPZhbMrGnFwP5vX4WbxteZfBWPzrx15qc7uMP+4KXZD+QC0xwUduVHhHmEYMSMlgQ/
 6JZga9GwnQS18DvKydheYlerC2OYUAoTRx/R/9HJXpR1ObgdgAGVXbiNPBSQ4MRJ/mN2
 f1Xg==
X-Gm-Message-State: AOAM532MVUBxQ6KL9YgkYxV1YG+0sSymdRar7JhQyGL59UZv+BPwwK5o
 4lZ2+PkF6rJj9+wZ4QKPsT5tGujWQeY=
X-Google-Smtp-Source: ABdhPJyd/eNmRidqLXKkzYPuSpDwSKfs5QHmLbdEB6caE4ApYKsf6EpXOTDEJHpFUYj3Ogvfl4ppWw==
X-Received: by 2002:a05:6214:caf:: with SMTP id
 s15mr91354195qvs.33.1637522091626; 
 Sun, 21 Nov 2021 11:14:51 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-207-184.washdc.fios.verizon.net.
 [108.18.207.184])
 by smtp.googlemail.com with ESMTPSA id t9sm3342492qkp.110.2021.11.21.11.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 11:14:51 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <aee3214c-a7dc-fb73-ea64-e47fea500762@gmail.com>
Date: Sun, 21 Nov 2021 14:14:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 1/2] clk: cosmetic: reorder include files
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

On 11/19/21 9:12 AM, Patrick Delaunay wrote:
> Reorder include files in the U-Boot expected order:
> 
> the common.h header should always be first,
> followed by other headers in order,
> then headers with directories,
> then local files.
> 
> It is a preliminary step for next patch.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   drivers/clk/clk-composite.c    | 6 +++---
>   drivers/clk/clk-fixed-factor.c | 9 +++++----
>   drivers/clk/clk-gate.c         | 9 +++++----
>   drivers/clk/clk-mux.c          | 5 +++--
>   drivers/clk/clk-uclass.c       | 2 +-
>   drivers/clk/clk.c              | 2 +-
>   6 files changed, 18 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index bb5351ebc0..12288e10b3 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -5,13 +5,13 @@
>    */
>   
>   #include <common.h>
> -#include <asm/io.h>
> -#include <malloc.h>
> +#include <clk.h>
>   #include <clk-uclass.h>
> +#include <malloc.h>
> +#include <asm/io.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
>   #include <linux/clk-provider.h>
> -#include <clk.h>
>   #include <linux/err.h>
>   
>   #include "clk.h"
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 8d9823bdab..9fcf30fd2e 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -6,16 +6,17 @@
>    * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
>    */
>   #include <common.h>
> -#include <malloc.h>
> +#include <clk.h>
>   #include <clk-uclass.h>
> +#include <div64.h>
> +#include <malloc.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
>   #include <linux/clk-provider.h>
> -#include <div64.h>
> -#include <clk.h>
> -#include "clk.h"
>   #include <linux/err.h>
>   
> +#include "clk.h"
> +
>   #define UBOOT_DM_CLK_IMX_FIXED_FACTOR "ccf_clk_fixed_factor"
>   
>   static ulong clk_factor_recalc_rate(struct clk *clk)
> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> index 006d3b6629..708499d95a 100644
> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -8,17 +8,18 @@
>    */
>   
>   #include <common.h>
> -#include <asm/io.h>
> -#include <malloc.h>
> +#include <clk.h>
>   #include <clk-uclass.h>
> +#include <malloc.h>
> +#include <asm/io.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
>   #include <linux/bitops.h>
>   #include <linux/clk-provider.h>
> -#include <clk.h>
> -#include "clk.h"
>   #include <linux/err.h>
>   
> +#include "clk.h"
> +
>   #define UBOOT_DM_CLK_GATE "clk_gate"
>   
>   /**
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index f1becd20d8..fd746f2de3 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -24,14 +24,15 @@
>   #include <common.h>
>   #include <clk.h>
>   #include <clk-uclass.h>
> +#include <malloc.h>
> +#include <asm/io.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
>   #include <dm/uclass.h>
>   #include <linux/bitops.h>
> -#include <malloc.h>
> -#include <asm/io.h>
>   #include <linux/clk-provider.h>
>   #include <linux/err.h>
> +
>   #include "clk.h"
>   
>   #define UBOOT_DM_CLK_CCF_MUX "ccf_clk_mux"
> diff --git a/drivers/clk/clk-uclass.c b/drivers/clk/clk-uclass.c
> index 493018b33e..f2d2642754 100644
> --- a/drivers/clk/clk-uclass.c
> +++ b/drivers/clk/clk-uclass.c
> @@ -16,6 +16,7 @@
>   #include <errno.h>
>   #include <log.h>
>   #include <malloc.h>
> +#include <asm/global_data.h>
>   #include <dm/device_compat.h>
>   #include <dm/device-internal.h>
>   #include <dm/devres.h>
> @@ -23,7 +24,6 @@
>   #include <linux/bug.h>
>   #include <linux/clk-provider.h>
>   #include <linux/err.h>
> -#include <asm/global_data.h>
>   
>   static inline const struct clk_ops *clk_dev_ops(struct udevice *dev)
>   {
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1efb7fe9f3..d1a9787071 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5,13 +5,13 @@
>    */
>   
>   #include <common.h>
> +#include <clk.h>
>   #include <clk-uclass.h>
>   #include <log.h>
>   #include <dm/device.h>
>   #include <dm/uclass.h>
>   #include <dm/lists.h>
>   #include <dm/device-internal.h>
> -#include <clk.h>
>   
>   int clk_register(struct clk *clk, const char *drv_name,
>   		 const char *name, const char *parent_name)
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
