Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0855F7A44
	for <lists+uboot-stm32@lfdr.de>; Fri,  7 Oct 2022 17:09:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE5AFC640F2;
	Fri,  7 Oct 2022 15:09:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B12DC03FE0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Oct 2022 12:33:58 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id b2so4403725plc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Oct 2022 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1seQOCbzyZXGPwk6eB+8CjDR8FOiR4+rNvnJLGhatwk=;
 b=ggBVGhvmxhluYEiIEqtaVrzVuzbWRGORgaTziRXJTL5NwD3AdRZxZ8z2MvRFDlz8kp
 rI0HJhNWx8XBNcvgNS0i1WMvxWvp4wKJUMUtjaAU+dLnk0eJMeXwSEF74zdCUIValmlO
 7eJExiuKtcko/Jt5hMlEjnnz2uzdVQ7lDVW1teUV203JX5i2aY6AV0/jPy+GXjtxFL4U
 rbrHI8JLIkEMNJKiAGKGkVLd7Qhy/K76NvIG05XUva2mTH7thhm4eBDsK59JODvJLhJD
 bp5QmE/tuDrTFmzu/sBpzRstJh1Ewmw0HH3xGmk15AVDmS/rU7kAl07WSaDWbnhgvsjs
 Jmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1seQOCbzyZXGPwk6eB+8CjDR8FOiR4+rNvnJLGhatwk=;
 b=lg8N0VwmFsDYZ8mUj1sp8pa3v6xb8UMaJ7P1cmM/D3hkE2SApgGUERtaLyOAdYu+D6
 8wITGTpel2maY0GhLiG5B3BRSAbXslro7bEIbQrMxksB/Fuc4a0P5hQzT9of/dkMqWV2
 JmCPwTmuuD7TkkdfxbM1/Wo3zezwBLIkhCTVJbdm5/UHL/1/ycdMnHvCmnBrDRBqwPor
 r9hpCOJpv0EUfRV/5fcdLcqkn8sitBiEcErswy1ByUzVYD+qQFRPQJaAr4yaZn/AF+lt
 jrtb5H58yKD4OO3X2BC4XSI+6aR8VNaNJdDoUReyARlOZXN89dxlpNW28IcNQ7VE2qpf
 FF3A==
X-Gm-Message-State: ACrzQf2ZYV0sazrxXcOZYHgE79uIMj66x/k6pUsRFPvRVx9M9yhlMsqx
 eTgMyE+/jbMBdjfZgjO2B8o=
X-Google-Smtp-Source: AMsMyM69zS1yOmB1X2/4D8M21ezutf8DEcYE0WmfIipoxdbydAdeDhnMOj3vZRi88KPjL/+OIpQBhA==
X-Received: by 2002:a17:90b:4b03:b0:202:a7e1:2c9a with SMTP id
 lx3-20020a17090b4b0300b00202a7e12c9amr5119499pjb.195.1665146036743; 
 Fri, 07 Oct 2022 05:33:56 -0700 (PDT)
Received: from [192.168.0.19] ([183.99.112.216])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170902f38d00b00172fc5b0764sm1367432ple.270.2022.10.07.05.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 05:33:56 -0700 (PDT)
Message-ID: <6fa051af-6aee-a44a-7eae-837b70712206@gmail.com>
Date: Fri, 7 Oct 2022 21:33:53 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Yann Gautier <yann.gautier@foss.st.com>, u-boot@lists.denx.de
References: <20220913112346.301480-1-yann.gautier@foss.st.com>
 <20220913112346.301480-3-yann.gautier@foss.st.com>
From: Jaehoon Chung <jh80.chung@gmail.com>
In-Reply-To: <20220913112346.301480-3-yann.gautier@foss.st.com>
X-Mailman-Approved-At: Fri, 07 Oct 2022 15:09:27 +0000
Cc: Peng Fan <peng.fan@nxp.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] mmc: stm32_sdmmc2: manage vqmmc
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
> The SDMMC IOs can be in an IO domain, that has to be enabled.
> This is done by enabling vqmmc in the driver.
> This has no impact on configurations not using an IO domain, the check
> can then be executed on all platforms managing regulator, and the vqmmc
> regulator enabled on all platforms having it in their DT.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Reviewed-by: Jaehoon Chung <jh80.chung@samsung.com>

Best Regards,
Jaehoon Chung

> 
> ---
> There are 2 checkpatch warnings:
> drivers/mmc/stm32_sdmmc2.c:40: warning: Use 'if (IS_ENABLED(CONFIG...))'
>  instead of '#if or #ifdef' where possible
> drivers/mmc/stm32_sdmmc2.c:580: warning: Use 'if (IS_ENABLED(CONFIG...))'
>  instead of '#if or #ifdef' where possible
> But this cannot be changed as the vqmmc_supply field in struct mmc is
> under flag: #if CONFIG_IS_ENABLED(DM_REGULATOR). For platforms not
> enabling this flag there would be a compilation error.
> 
>  drivers/mmc/stm32_sdmmc2.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index e1240b0cf3..1195134844 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -25,6 +25,7 @@
>  #include <asm/io.h>
>  #include <asm/gpio.h>
>  #include <linux/iopoll.h>
> +#include <power/regulator.h>
>  #include <watchdog.h>
>  
>  struct stm32_sdmmc2_plat {
> @@ -36,6 +37,9 @@ struct stm32_sdmmc2_plat {
>  	struct gpio_desc cd_gpio;
>  	u32 clk_reg_msk;
>  	u32 pwr_reg_msk;
> +#if CONFIG_IS_ENABLED(DM_REGULATOR)
> +	bool vqmmc_enabled;
> +#endif
>  };
>  
>  struct stm32_sdmmc2_ctx {
> @@ -572,6 +576,15 @@ static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_plat *plat)
>  	       plat->base + SDMMC_POWER);
>  
>  	/* during the first 74 SDMMC_CK cycles the SDMMC is still disabled. */
> +
> +#if CONFIG_IS_ENABLED(DM_REGULATOR)
> +	if (plat->mmc.vqmmc_supply && !plat->vqmmc_enabled) {
> +		if (regulator_set_enable_if_allowed(plat->mmc.vqmmc_supply, true))
> +			dev_dbg(plat->mmc.dev, "failed to enable vqmmc-supply\n");
> +		else
> +			plat->vqmmc_enabled = true;
> +	}
> +#endif
>  }
>  
>  #define IS_RISING_EDGE(reg) (reg & SDMMC_CLKCR_NEGEDGE ? 0 : 1)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
