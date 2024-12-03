Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F849E181E
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 10:46:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84C74C6C83D;
	Tue,  3 Dec 2024 09:46:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88EE3C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 09:46:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-434a736518eso65721605e9.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733219193; x=1733823993;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVb3WOwzol2NQRxQOEUgBpdDfbZUUCUJEzX9V1aGVBI=;
 b=isdbg3vpAWgXLDolsHia/xd5Bxkb3ex89jfzFN12OXvCB4HXChM16CZFEIwYaxOqqL
 Gus0NrCy5Wt7+dM0mdF/KVIx1J+RVetrL+0Ub4nlQjBO01/+1xA5x6aX2ZaV/KJaPvXV
 g2B261sr49uNSRjT52cx2bL2BVHjDvILK66iFlxNUHYZj746COIFTuBKQS8TZS7qzkD6
 eO306NhTmAoqulfb99unok4mGkCj3qf2gNvPriQczBfKdgfI4PdMlMwaepsmGpWRk+Ew
 m970DSIugdEdTiXUunw2iNFDQklAC3Dm2eXBeWiM+IZvx3v8281kWMpJ2609WLLiO1dW
 bUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733219193; x=1733823993;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BVb3WOwzol2NQRxQOEUgBpdDfbZUUCUJEzX9V1aGVBI=;
 b=hpJSgBwP9cJ/voYGpt9CpqaQEY5ipKkAEK7BTskMiyulqTpOucL1Ku+5zcP7RJm7Hq
 x74O0XtS6R9GuO+XwQXW8Kx5Z7SN85FcHhLJBqBIAJtY4BMVH4sC5NLM0FodVYTvgva6
 UfBCGh2vcHtnp+0rOEBO+L6u17cLRzsErjTNwcNPOIn45i+bWBLCzpKtwlw5fQA8ZmGL
 /JmAdkAmEWN6yD0yb6GZ8QHNfU+dC9l6fn56+JdPTf0PRWVIqS2Kn/gmORnjCju3VeYS
 /SoqSJBWVDqbWbNAjFHHRiCdU8T6LlrMulXkGsQCjFIv7T0KQeQq6vcpmjp/TAU4PyeD
 olXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRA+2zeNRFfpLSOAA/3n6tikJs11pLkEyUTZ+4w670JORmSsG8denlWK/5gQb1f/TAhknHYtQu2iclvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlFVfvcievUyQU/3SC8A5LoHYRcH03iIhLjlgqV6+OAXDdNjOb
 lUxVdL+UiGrbqXljg0PwlCNV3gcy3bXE5X6m7ANdTP/IvjUDhJX8TKjg6A2JNFU=
X-Gm-Gg: ASbGnctvBi/FxaejxKUbUQ3VAz6TVejmQRZS6ULg972NPoH1LZAI2RR/I7HJ42xhRW7
 QpHqqzTvE+vMVig/YAtAt5yUJOD0ayxXzECiSRM+slWa/Hp9AiH93jC/K6j1EPRWENAh5DIUaT9
 tcF/0xVnizFygVkWzvRI3IUkPsY1FDAttwXVqX607D6JIL6W7+Dgd9y3cGN8lodgj3LFiN71AwM
 ZgmdDdA/ZCD4r2cKX5wO/MRA783gGXHcfdWe+bliuMl1iQ5iOIVcQ==
X-Google-Smtp-Source: AGHT+IEa9+h+gsjlKhvdkU0HudK3Gy/L6nsUiyg6VfVe77UBhteSbHnIo235weRKm2UYN9z/UrlRZA==
X-Received: by 2002:a05:6000:156c:b0:385:e88a:7037 with SMTP id
 ffacd0b85a97d-385fd3cd72emr1649253f8f.6.1733219193006; 
 Tue, 03 Dec 2024 01:46:33 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e17574ebsm10643853f8f.30.2024.12.03.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 01:46:32 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
In-Reply-To: <20241129122711.411917-2-patrice.chotard@foss.st.com>
References: <20241129122711.411917-1-patrice.chotard@foss.st.com>
 <20241129122711.411917-2-patrice.chotard@foss.st.com>
Date: Tue, 03 Dec 2024 10:46:29 +0100
Message-ID: <8734j5p096.fsf@baylibre.com>
MIME-Version: 1.0
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/6] fastboot: Fix warning when
 CONFIG_SYS_64BIT_LBA is enable
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

Hi Patrice,

Thank you for the patch.

On ven., nov. 29, 2024 at 13:27, Patrice Chotard <patrice.chotard@foss.st.com> wrote:

> If CONFIG_SYS_64BIT_LBA is enable, following compilation warning is
> triggered:
>
>  CC      drivers/fastboot/fb_mmc.o
> ../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_erase_mmc_hwpart':
> ../drivers/fastboot/fb_mmc.c:215:35: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 2 has type
> 'long long unsigned int' [-Wformat=]
>   215 |         printf("........ erased %lu bytes from mmc hwpart[%u]\n",
>       |                                 ~~^
>       |                                   |
>       |                                   long unsigned int
>       |                                 %llu
>   216 |                dev_desc->lba * dev_desc->blksz, dev_desc->hwpart);
>       |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                              |
>       |                              long long unsigned int
> ../drivers/fastboot/fb_mmc.c: In function 'fb_mmc_boot_ops':
> ../drivers/fastboot/fb_mmc.c:261:42: warning: format '%lu' expects
> argument of type 'long unsigned int', but argument 2 has type
> 'long long unsigned int' [-Wformat=]
>   261 |                 printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
>       |                                        ~~^
>       |                                          |
>       |                                          long unsigned int
>       |                                        %llu
>   262 |                        blkcnt * blksz, hwpart);
>       |                        ~~~~~~~~~~~~~~
>       |                               |
>       |                               long long unsigned int
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Please feel free to take this through your tree.

Acked-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>
>  drivers/fastboot/fb_mmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/fastboot/fb_mmc.c b/drivers/fastboot/fb_mmc.c
> index f11eb66761b..dca7c222f35 100644
> --- a/drivers/fastboot/fb_mmc.c
> +++ b/drivers/fastboot/fb_mmc.c
> @@ -211,8 +211,8 @@ static int fb_mmc_erase_mmc_hwpart(struct blk_desc *dev_desc)
>  		return 1;
>  	}
>  
> -	printf("........ erased %lu bytes from mmc hwpart[%u]\n",
> -	       dev_desc->lba * dev_desc->blksz, dev_desc->hwpart);
> +	printf("........ erased %llu bytes from mmc hwpart[%u]\n",
> +	       (u64)(dev_desc->lba * dev_desc->blksz), dev_desc->hwpart);
>  
>  	return 0;
>  }
> @@ -257,8 +257,8 @@ static void fb_mmc_boot_ops(struct blk_desc *dev_desc, void *buffer,
>  			return;
>  		}
>  
> -		printf("........ wrote %lu bytes to EMMC_BOOT%d\n",
> -		       blkcnt * blksz, hwpart);
> +		printf("........ wrote %llu bytes to EMMC_BOOT%d\n",
> +		       (u64)(blkcnt * blksz), hwpart);
>  	} else { /* erase */
>  		if (fb_mmc_erase_mmc_hwpart(dev_desc)) {
>  			pr_err("Failed to erase EMMC_BOOT%d\n", hwpart);
> -- 
> 2.25.1
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
