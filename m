Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D27061127A
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 15:15:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F37C63324;
	Fri, 28 Oct 2022 13:15:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94D9FC640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:12:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 bh7-20020a05600c3d0700b003c6fb3b2052so3201071wmb.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=YBuXlDPYeEjxpNG7Es7wfj+ggyXAJ10na939zgwdVRw=;
 b=aM5TFsbkCrraNRQC5H861D/Z7JY0WCo/4AjIb1Ph7HwzM/EsSY1PwLNOthJG1lJ+Wu
 EPkl+Pu50wBoLrJAu6bYykfKT5HUrsvkVY5/+6YCNPJGsDLC5E1m2ue+Rz67FSkIje0/
 hgujUzSa2lBLrj6tevBu8yz9/ZKJIIDAmiWKzzjIZs4H+nKfRHeUPQnlF+umSZx+QEUN
 7Wnd6Qcdmkug7mFJiZJwKz+00/Dwl97BoNzDu3MTOxlo6cuDkq2o6fhpnEnTS9Ll5ER9
 PLgHBXKXELBze8VIszfw9Icw/v/Dj6LLyfr3zRU7EZ7+wVCIRUjjwVet3WIqYZJvbuyX
 g80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YBuXlDPYeEjxpNG7Es7wfj+ggyXAJ10na939zgwdVRw=;
 b=toCxQ1Jy9oTBfsYBEa8kejk+B5lsRxXrmkdH3NNLjHvkoJ1RssGrhd5nRjkEY5xVQJ
 wO6Td2DbbdQhpI9SxtMozrri9FKAnosLFUYCXl5uV406EYhfnoOHFb15WrYv16dB5X7a
 TpHExBxj4CKIHGqgrNM4UftYQltoyU6ouSIVwBE9xB9AFk2c2ZisAwHIo/M9vujkC/tl
 eMWypYYHXLBJyFqZCIdgJiAHAAJ9Ga/1fuS/eAYrLgmFjhpNj3Z6roFKaIHCgZn2QBEE
 B2RZ+T8fBrDUvN21JBvmVaOY3OabxQ3u+llJwJaP8A8ZeQMaRiwrEE8pg3I0lRnItcOS
 Murg==
X-Gm-Message-State: ACrzQf2FzFXBFkldxXyPILgWrhGywKwkWBjenw751sNXB2YFIMvQxYir
 +hqC6hXihdRdrlZtDuuVNVO9Xw==
X-Google-Smtp-Source: AMsMyM6nXyj4PGcxixUBg3I/8/ndBadn0TH2TGkvx+PLFeR05azxTwwO8PYJOz8PtFdrjXlMMPKHDQ==
X-Received: by 2002:a1c:7c03:0:b0:3cf:4969:9bab with SMTP id
 x3-20020a1c7c03000000b003cf49699babmr8569899wmc.176.1666948320184; 
 Fri, 28 Oct 2022 02:12:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:9e9c:c6c2:95a3:c182?
 ([2a01:e0a:898:f380:9e9c:c6c2:95a3:c182])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf483ee8e0sm7401866wmb.24.2022.10.28.02.11.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:11:59 -0700 (PDT)
Message-ID: <b12e98c6-757e-a425-bdf7-84dbdc80a2a7@linaro.org>
Date: Fri, 28 Oct 2022 11:11:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.1.If04f25e393f3af8cd75af331ca2f432a7a1b88e8@changeid>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221028110055.1.If04f25e393f3af8cd75af331ca2f432a7a1b88e8@changeid>
X-Mailman-Approved-At: Fri, 28 Oct 2022 13:15:02 +0000
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/3] cmd: pxe: reorder kernel treatment in
	label_boot
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 28/10/2022 11:01, Patrick Delaunay wrote:
> Reorder kernel treatment in label_boot at the beginning of the function.
> 
> This patch doesn't change the pxe command behavior, it is only a
> preliminary step for next patch, build kernel_addr before parsing
> the label initrd and fdt to build the next bootm arguments.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   boot/pxe_utils.c | 49 ++++++++++++++++++++++++------------------------
>   1 file changed, 24 insertions(+), 25 deletions(-)
> 
> diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
> index d5c215ae2c1d..844ab72252bf 100644
> --- a/boot/pxe_utils.c
> +++ b/boot/pxe_utils.c
> @@ -522,6 +522,27 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   		return 1;
>   	}
>   
> +	if (get_relfile_envaddr(ctx, label->kernel, "kernel_addr_r",
> +				NULL) < 0) {
> +		printf("Skipping %s for failure retrieving kernel\n",
> +		       label->name);
> +		return 1;
> +	}
> +
> +	kernel_addr = env_get("kernel_addr_r");
> +	/* for FIT, append the configuration identifier */
> +	if (label->config) {
> +		int len = strlen(kernel_addr) + strlen(label->config) + 1;
> +
> +		fit_addr = malloc(len);
> +		if (!fit_addr) {
> +			printf("malloc fail (FIT address)\n");
> +			return 1;
> +		}
> +		snprintf(fit_addr, len, "%s%s", kernel_addr, label->config);
> +		kernel_addr = fit_addr;
> +	}
> +
>   	if (label->initrd) {
>   		ulong size;
>   
> @@ -529,21 +550,14 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   					&size) < 0) {
>   			printf("Skipping %s for failure retrieving initrd\n",
>   			       label->name);
> -			return 1;
> +			goto cleanup;
>   		}
>   
>   		initrd_addr_str = env_get("ramdisk_addr_r");
>   		size = snprintf(initrd_str, sizeof(initrd_str), "%s:%lx",
>   				initrd_addr_str, size);
>   		if (size >= sizeof(initrd_str))
> -			return 1;
> -	}
> -
> -	if (get_relfile_envaddr(ctx, label->kernel, "kernel_addr_r",
> -				NULL) < 0) {
> -		printf("Skipping %s for failure retrieving kernel\n",
> -		       label->name);
> -		return 1;
> +			goto cleanup;
>   	}
>   
>   	if (label->ipappend & 0x1) {
> @@ -573,7 +587,7 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   			       strlen(label->append ?: ""),
>   			       strlen(ip_str), strlen(mac_str),
>   			       sizeof(bootargs));
> -			return 1;
> +			goto cleanup;
>   		}
>   
>   		if (label->append)
> @@ -588,21 +602,6 @@ static int label_boot(struct pxe_context *ctx, struct pxe_label *label)
>   		printf("append: %s\n", finalbootargs);
>   	}
>   
> -	kernel_addr = env_get("kernel_addr_r");
> -
> -	/* for FIT, append the configuration identifier */
> -	if (label->config) {
> -		int len = strlen(kernel_addr) + strlen(label->config) + 1;
> -
> -		fit_addr = malloc(len);
> -		if (!fit_addr) {
> -			printf("malloc fail (FIT address)\n");
> -			return 1;
> -		}
> -		snprintf(fit_addr, len, "%s%s", kernel_addr, label->config);
> -		kernel_addr = fit_addr;
> -	}
> -
>   	/*
>   	 * fdt usage is optional:
>   	 * It handles the following scenarios.


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
