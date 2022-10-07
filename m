Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F065F7A46
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Oct 2022 17:09:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD53EC04003;
	Fri,  7 Oct 2022 15:09:28 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5A7AC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Oct 2022 12:33:24 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 2so4551630pgl.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Oct 2022 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i6nfTvud+sQmNgYNLbLvpA2Vf/ibbT2O8VyRGPFPlO8=;
 b=VorRNKvj/CLvPXUcaOO9x3MX0kvZF9ctpKORX2y1+kmenrYEdl0jylA6gqe8CZ4rHu
 v7qB7qL75AiXkL0zpMGq3qqkTtuJkYzAmmCZOlIlvXrcFgABtRJ1mft9PUZb8e+ov4KR
 EP8tOyf/YNMe9qQDvNKtt4sKHIIJthjg+RMvtyxEX393SCWXu0eWQeEWpt7ZArBV2EFD
 h4vcUdA6FyDsieJdyCrFXYPy18eOfn0lsOYRh8o9mM48YqBM9LFoHPB8fKekk3VfQdPK
 iU85iINPkQSHbO8thjvLSI6ghOPARbsdA2e41ABAgpKmFU93EhLeQEvYgSpoefnkWFXh
 2Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i6nfTvud+sQmNgYNLbLvpA2Vf/ibbT2O8VyRGPFPlO8=;
 b=yxgYAWIjcCTGeLwqxccO8DMo5RDzLf37b8UgaA7L7CJi98nFBEif4vJaAFG+9R89Y7
 czTQVVvH7a/D15v4SctZyZV/XOBUDmrlFuhFOgJUfWRWgWEH4eqo7gPzhTFie2+mrQbv
 YDhxOkDmXiEGu/xfkBl8LlTvKQJ3cI3eYhpbYITHUF8reuq2jHJE1Hzn8io+y0kgeP8Y
 TSCT26j5924r8QfSKThU+cqlTZCmB8GKawsKF0d3LtacUbgWGNFfypjNXxEH0nURq0ag
 8iqYYnd3gG6fXE6i2QSVeCjcOf2anw+gXrPXhvK6QZCOlryR+B6ydYh4jH864wglN5y2
 4Qew==
X-Gm-Message-State: ACrzQf3zgiyCnqaKKRo5dSw/qCeJ0Ld99F/oY86vEEA31VPZtwPWnOL5
 C6YeebsLOgGUjb1RzTGZ+k0=
X-Google-Smtp-Source: AMsMyM5h2FJ7FC0nMCWGzNI9hCY29ZvEzR3SGgDbnmhaXI2NsUufdLoW15u6R2i5FCqhrZKADn7HaA==
X-Received: by 2002:a05:6a00:2a08:b0:561:f966:ae20 with SMTP id
 ce8-20020a056a002a0800b00561f966ae20mr4715267pfb.45.1665146003106; 
 Fri, 07 Oct 2022 05:33:23 -0700 (PDT)
Received: from [192.168.0.19] ([183.99.112.216])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a170902c94100b00179f370dbe7sm1410799pla.287.2022.10.07.05.33.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 05:33:22 -0700 (PDT)
Message-ID: <606b2b91-4382-3d22-2504-49a8e7ee144c@gmail.com>
Date: Fri, 7 Oct 2022 21:33:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
Content-Language: en-US
From: Jaehoon Chung <jh80.chung@gmail.com>
In-Reply-To: <20220913112346.301480-1-yann.gautier@foss.st.com>
X-Mailman-Approved-At: Fri, 07 Oct 2022 15:09:27 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] mmc: stm32_sdmmc2: add dual data rate
	support
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



On 9/13/22 20:23, Yann Gautier wrote:
> To support dual data rate with STM32 sdmmc2 driver, the dedicated bit
> (DDR - BIT(18)) needs to be set in the CLKRC register. Clock bypass
> (no divider) is not allowed in this case. This is required for the
> eMMC DDR modes.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index bfce8a2e4a..3cfa5a66f1 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -598,13 +598,16 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  	 * clk_div > 0 and NEGEDGE = 1 => command and data generated on
>  	 * SDMMCCLK falling edge
>  	 */
> -	if (desired && ((sys_clock > desired) ||
> +	if (desired && (sys_clock > desired || mmc->ddr_mode ||
>  			IS_RISING_EDGE(plat->clk_reg_msk))) {
>  		clk = DIV_ROUND_UP(sys_clock, 2 * desired);
>  		if (clk > SDMMC_CLKCR_CLKDIV_MAX)
>  			clk = SDMMC_CLKCR_CLKDIV_MAX;
>  	}
>  
> +	if (mmc->ddr_mode)
> +		clk |= SDMMC_CLKCR_DDR;
> +
>  	if (mmc->bus_width == 4)
>  		clk |= SDMMC_CLKCR_WIDBUS_4;
>  	if (mmc->bus_width == 8)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
