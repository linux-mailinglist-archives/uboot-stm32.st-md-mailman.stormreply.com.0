Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C527DE51F
	for <lists+uboot-stm32@lfdr.de>; Wed,  1 Nov 2023 18:13:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DEAAC6B452;
	Wed,  1 Nov 2023 17:13:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE595C6B44C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 17:13:36 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-66d09b6d007so340796d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698858815; x=1699463615;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zqi4oQ+fI2HNFKzlptsGyxi9hbC2jIZhMA5wcmrHsoQ=;
 b=SRGep47MQk6RQrA6EqzEqyWCWZwp84DouW8LULBQ1LVFKCAfsWdvueNhhcrdEE+feM
 l9MCsDDwiVhkFjJ44rtJcjOr+kE+deSRWuAn7tM8vVttPKTd3eufHlDp0LewPFqOxqbX
 ZRgVxPQJuUnDUBl2RTPlavm/S8G2gdoxPToeZHAovhYnOGMf84i0jf77QosjqfVORBVi
 uAC9bEevyMhWXp8ZWDxZuh9fryQPWug/e3M4V0DSMhRjnvQKUokYS+fsTBUPsn8D1Lv9
 vmLTEMR1bUxyhMfrV3SkEBMoDenIo2gqxWn0hHql/jkhdZfaBFhPgoVj3Mm6gG23XTcH
 Jxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698858815; x=1699463615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zqi4oQ+fI2HNFKzlptsGyxi9hbC2jIZhMA5wcmrHsoQ=;
 b=P81EWISRaD5JyXhdNH8wmAMSCizyRhaECb7wpkkgB8VBkiwhGIgC7SpoQTZtbgGQLE
 QGbB+tAKpiMe9ZuN3O6pKVdPw1HQzRSW+r9QJBykCmm2lrIEbByDpC3beDvJyKoBl3cF
 P3Wb6a7qqEFYzJRTMKE2i4MUJVoAY4ZjV8mYDS9Pp/ee+tlwuyEuDMMai/xYxmKfbkmR
 5IcR0JvXXQgDYkciaBPRZpQILBEvk5BELRLOkTZw9UcPPDkZbaIpMfD8MGfjj+l2ro+c
 /Fzu5rdhbauWCW2dfsaJumE8pjqGlbPZR4mdfYHLjYew8cU/MezXqbvIfAKNL27rBGEt
 EQMw==
X-Gm-Message-State: AOJu0YxchzpXDXdi/odlc/2ufJmwZu4xMA8orJ6t9+XBB7b8ZyeNJgd0
 WxeJPOG2IBCFgX9J+siq34E=
X-Google-Smtp-Source: AGHT+IGHTaoPYy1sfNIp6lRmI0gwb4rtmaiCOcvnjY2OuzNdqXRENpd+VDbjAaPGKw6sRY+htU4aqg==
X-Received: by 2002:a05:6214:194f:b0:66d:237d:8f75 with SMTP id
 q15-20020a056214194f00b0066d237d8f75mr20820368qvk.35.1698858815620; 
 Wed, 01 Nov 2023 10:13:35 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-157-169.washdc.fios.verizon.net.
 [108.48.157.169]) by smtp.gmail.com with ESMTPSA id
 t14-20020a0cea2e000000b00655e428604esm1631933qvp.137.2023.11.01.10.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 10:13:35 -0700 (PDT)
Message-ID: <5d13035b-2f8d-a2cf-5150-99eed7e5bcf5@gmail.com>
Date: Wed, 1 Nov 2023 13:13:33 -0400
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
 <20231017165649.1492-9-ivprusov@sberdevices.ru>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <20231017165649.1492-9-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 8/8] cmd: clk: Make soc_clk_dump static
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
> After introducing dump to clk_ops there is no need to override or expose
> this symbol anymore.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Tested-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   cmd/clk.c     | 4 ++--
>   include/clk.h | 2 --
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/cmd/clk.c b/cmd/clk.c
> index 90cc6fa906..f55911db7a 100644
> --- a/cmd/clk.c
> +++ b/cmd/clk.c
> @@ -59,7 +59,7 @@ static void show_clks(struct udevice *dev, int depth, int last_flag)
>   	}
>   }
>   
> -int __weak soc_clk_dump(void)
> +static int soc_clk_dump(void)
>   {
>   	struct udevice *dev;
>   	const struct clk_ops *ops;
> @@ -81,7 +81,7 @@ int __weak soc_clk_dump(void)
>   	return 0;
>   }
>   #else
> -int __weak soc_clk_dump(void)
> +static int soc_clk_dump(void)
>   {
>   	puts("Not implemented\n");
>   	return 1;
> diff --git a/include/clk.h b/include/clk.h
> index d91285235f..bf0d9c9d7f 100644
> --- a/include/clk.h
> +++ b/include/clk.h
> @@ -674,8 +674,6 @@ static inline bool clk_valid(struct clk *clk)
>   	return clk && !!clk->dev;
>   }
>   
> -int soc_clk_dump(void);
> -
>   #endif
>   
>   #define clk_prepare_enable(clk) clk_enable(clk)

Reviewed-by: Sean Anderson <seanga2@gmail.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
