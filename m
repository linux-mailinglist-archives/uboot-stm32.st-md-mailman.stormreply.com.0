Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48E45861E
	for <lists+uboot-stm32@lfdr.de>; Sun, 21 Nov 2021 20:16:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D0D0C597BE;
	Sun, 21 Nov 2021 19:16:06 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFAFAC597BC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Nov 2021 19:16:04 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id a2so14564049qtx.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Nov 2021 11:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p5PJ8449ez4mQZDXRvtsQAx2zBL/ji0eJaVTfRsyiFc=;
 b=AbPO9ldNdwchRiVkAdWhMl0QZhsEP9BQW/eH+e+Kz1iBJln66TqM4bqUewZo3HRAh/
 DKNnbbCmvVsU7N/DPZWuCZJiO+RRDtZwhuXtLVcNAhNUBLX/xB+PLPdTcr2XtB08v5h0
 HsMnfg70QLD6m1FZQIoOCWa9dUa9fm4RiuGcf5vS+PQDh92kyOBwFIUN2vVbi7g37kkn
 nwkP5iZ+27UyXOZGdtXkhYc2Z39jM2aMZwu62ZWBuzFJJrWQsu0ESg3AQA+/VCgXCPQf
 A0SJJ/f2GO/VYFFpEGfDa58zYLkUaze/W5OzqQki3osxNuv/4NpmRkx2sZaWJYU5zMZL
 /TEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p5PJ8449ez4mQZDXRvtsQAx2zBL/ji0eJaVTfRsyiFc=;
 b=QZkAHI2xf99HOCdUDs48u6iPb9gPqOps+stSXLqfnPp3NDBfXzA//qX8YRSdwgc8p9
 nVeUbvcuU/QNuUG8ulbk88e20X4kMF0Npdc4FuBLBWp2hlga5CCyPx/C4fCjo0JgUGk1
 qqKt+wAvj18RyQNGshqHxycUDE/XBI+hwruOUMedvjWy+yelBWiDSdbTblzZ3HdpM2Yw
 mHxFbFKcgtmW6aSTRSYuXwixYeHrJM5AWxyoUncYwCPBjKo5NzzzbTO3RyFM336JXizb
 kU1H8lnuvMYQNVwIr+Q5hEG+03EUOaDoQjlpiQPQbx3bxEHTCzlZr3H1UuKfk3EjVOwc
 owkQ==
X-Gm-Message-State: AOAM532yTg1k1PKuHKp5K263G0R6eYeKV8TX8YFrPmpDk1ZXHtjNPGNy
 bv4vWuPMZLS/B5m1K+2ctuGESwRE11w=
X-Google-Smtp-Source: ABdhPJwFSu80vfUOQCHh9BaFUs5D8Q4O+9ivzIMK+ik7IWGw22ahgdViIJFRTIJWG+d1Gu2WtLS0UA==
X-Received: by 2002:a05:622a:2d1:: with SMTP id
 a17mr24608752qtx.130.1637522163478; 
 Sun, 21 Nov 2021 11:16:03 -0800 (PST)
Received: from [192.168.1.201] (pool-108-18-207-184.washdc.fios.verizon.net.
 [108.18.207.184])
 by smtp.googlemail.com with ESMTPSA id 9sm3239838qkm.5.2021.11.21.11.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 11:16:03 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20211119151203.1.I011e780560149e15eea06471822a1fedfac58766@changeid>
 <20211119151203.2.Ieb1b1a0cf6385c2ce53b33a6d925c0abc3aebfa0@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <c61ab9ea-42d3-e716-d492-41142db09011@gmail.com>
Date: Sun, 21 Nov 2021 14:16:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20211119151203.2.Ieb1b1a0cf6385c2ce53b33a6d925c0abc3aebfa0@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lukasz Majewski <lukma@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 2/2] clk: define LOG_CATEGORY for generic
	and ccf clocks
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
> Define LOG_CATEGORY to allow filtering with log command
> for generic clock and CCF clocks.
> 
> This patch also change existing printf, debug and pr_ macro
> to log_ or dev_ macro.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   drivers/clk/clk-composite.c    |  3 +++
>   drivers/clk/clk-divider.c      |  6 +++++-
>   drivers/clk/clk-fixed-factor.c |  4 ++++
>   drivers/clk/clk-gate.c         |  6 +++++-
>   drivers/clk/clk-mux.c          |  8 ++++++--
>   drivers/clk/clk.c              | 18 ++++++++++--------
>   drivers/clk/clk_fixed_factor.c |  3 +++
>   drivers/clk/clk_fixed_rate.c   |  3 +++
>   8 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 12288e10b3..6eb2b8133a 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -4,9 +4,12 @@
>    * Copyright 2019 NXP
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk.h>
>   #include <clk-uclass.h>
> +#include <log.h>
>   #include <malloc.h>
>   #include <asm/io.h>
>   #include <dm/device.h>
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 9df50a5e72..7e8e62feee 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -9,14 +9,18 @@
>    *
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <asm/io.h>
>   #include <malloc.h>
>   #include <clk-uclass.h>
> +#include <log.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
>   #include <dm/uclass.h>
>   #include <dm/lists.h>
> +#include <dm/device_compat.h>
>   #include <dm/device-internal.h>
>   #include <linux/bug.h>
>   #include <linux/clk-provider.h>
> @@ -190,7 +194,7 @@ static struct clk *_register_divider(struct device *dev, const char *name,
>   
>   	if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
>   		if (width + shift > 16) {
> -			pr_warn("divider value exceeds LOWORD field\n");
> +			dev_warn(dev, "divider value exceeds LOWORD field\n");
>   			return ERR_PTR(-EINVAL);
>   		}
>   	}
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 9fcf30fd2e..2a446788e1 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -5,10 +5,14 @@
>    *
>    * Copyright (C) 2011 Sascha Hauer, Pengutronix <s.hauer@pengutronix.de>
>    */
> +
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk.h>
>   #include <clk-uclass.h>
>   #include <div64.h>
> +#include <log.h>
>   #include <malloc.h>
>   #include <dm/device.h>
>   #include <dm/devres.h>
> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> index 708499d95a..aa40daf3d7 100644
> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -7,12 +7,16 @@
>    * Gated clock implementation
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk.h>
> +#include <log.h>
>   #include <clk-uclass.h>
>   #include <malloc.h>
>   #include <asm/io.h>
>   #include <dm/device.h>
> +#include <dm/device_compat.h>
>   #include <dm/devres.h>
>   #include <linux/bitops.h>
>   #include <linux/clk-provider.h>
> @@ -124,7 +128,7 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
>   
>   	if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
>   		if (bit_idx > 15) {
> -			pr_err("gate bit exceeds LOWORD field\n");
> +			dev_err(dev, "gate bit exceeds LOWORD field\n");
>   			return ERR_PTR(-EINVAL);
>   		}
>   	}
> diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
> index fd746f2de3..b49946fbcd 100644
> --- a/drivers/clk/clk-mux.c
> +++ b/drivers/clk/clk-mux.c
> @@ -21,12 +21,16 @@
>    * clock.
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk.h>
>   #include <clk-uclass.h>
> +#include <log.h>
>   #include <malloc.h>
>   #include <asm/io.h>
>   #include <dm/device.h>
> +#include <dm/device_compat.h>
>   #include <dm/devres.h>
>   #include <dm/uclass.h>
>   #include <linux/bitops.h>
> @@ -124,7 +128,7 @@ static int clk_mux_set_parent(struct clk *clk, struct clk *parent)
>   
>   	index = clk_fetch_parent_index(clk, parent);
>   	if (index < 0) {
> -		printf("Could not fetch index\n");
> +		log_err("Could not fetch index\n");
>   		return index;
>   	}
>   
> @@ -170,7 +174,7 @@ struct clk *clk_hw_register_mux_table(struct device *dev, const char *name,
>   	if (clk_mux_flags & CLK_MUX_HIWORD_MASK) {
>   		width = fls(mask) - ffs(mask) + 1;
>   		if (width + shift > 16) {
> -			pr_err("mux value exceeds LOWORD field\n");
> +			dev_err(dev, "mux value exceeds LOWORD field\n");
>   			return ERR_PTR(-EINVAL);
>   		}
>   	}
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index d1a9787071..eff0fa134f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4,6 +4,8 @@
>    * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk.h>
>   #include <clk-uclass.h>
> @@ -22,24 +24,24 @@ int clk_register(struct clk *clk, const char *drv_name,
>   
>   	ret = uclass_get_device_by_name(UCLASS_CLK, parent_name, &parent);
>   	if (ret) {
> -		printf("%s: failed to get %s device (parent of %s)\n",
> -		       __func__, parent_name, name);
> +		log_err("%s: failed to get %s device (parent of %s)\n",
> +			__func__, parent_name, name);
>   	} else {
> -		debug("%s: name: %s parent: %s [0x%p]\n", __func__, name,
> -		      parent->name, parent);
> +		log_debug("%s: name: %s parent: %s [0x%p]\n", __func__, name,
> +			  parent->name, parent);
>   	}
>   
>   	drv = lists_driver_lookup_name(drv_name);
>   	if (!drv) {
> -		printf("%s: %s is not a valid driver name\n",
> -		       __func__, drv_name);
> +		log_err("%s: %s is not a valid driver name\n",
> +			__func__, drv_name);
>   		return -ENOENT;
>   	}
>   
>   	ret = device_bind(parent, drv, name, NULL, ofnode_null(), &clk->dev);
>   	if (ret) {
> -		printf("%s: CLK: %s driver bind error [%d]!\n", __func__, name,
> -		       ret);
> +		log_err("%s: CLK: %s driver bind error [%d]!\n", __func__, name,
> +			ret);
>   		return ret;
>   	}
>   
> diff --git a/drivers/clk/clk_fixed_factor.c b/drivers/clk/clk_fixed_factor.c
> index 41b0d9c060..6c1139e5c5 100644
> --- a/drivers/clk/clk_fixed_factor.c
> +++ b/drivers/clk/clk_fixed_factor.c
> @@ -5,10 +5,13 @@
>    * Author: Anup Patel <anup.patel@wdc.com>
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk-uclass.h>
>   #include <div64.h>
>   #include <dm.h>
> +#include <log.h>
>   #include <linux/err.h>
>   
>   struct clk_fixed_factor {
> diff --git a/drivers/clk/clk_fixed_rate.c b/drivers/clk/clk_fixed_rate.c
> index c5a2a42c92..b5e78c7055 100644
> --- a/drivers/clk/clk_fixed_rate.c
> +++ b/drivers/clk/clk_fixed_rate.c
> @@ -3,9 +3,12 @@
>    * Copyright (C) 2016 Masahiro Yamada <yamada.masahiro@socionext.com>
>    */
>   
> +#define LOG_CATEGORY UCLASS_CLK
> +
>   #include <common.h>
>   #include <clk-uclass.h>
>   #include <dm.h>
> +#include <log.h>
>   #include <dm/device-internal.h>
>   #include <linux/clk-provider.h>
>   
> 

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
