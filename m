Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A66400180
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 16:50:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E856DC57B51;
	Fri,  3 Sep 2021 14:50:19 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF89C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 14:50:18 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id w19so7141246oik.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Sep 2021 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4BNVJ0YeZm+ozHzna6rD2VqO7S2bRhgKSJBcKs9mO5w=;
 b=H0+FM7weSplNLt9vvmMjckbJvAlOL8ND5+565g3V96V5TaLQHfumVUxKuWcJZZKHzU
 cHM+6aeB2bNzJJtBfiVCm1KIBRlOqHybK34NlEe6FEiih6y+PUjcRKP7Pg695AT4SUXB
 DfLCPETB6ywtobzBRLtfdaYiIX1DpODcEtce93qLSz2NkSIQo/C1laO0CodFLyJDT5LX
 WjKPUE+rANM1+CpzePm7pr60XE+P5Qr7Yt6GBHXB7aQWF40fCyIAtDwPcwmjVhDDJaKp
 sG/TBC0wwM8yyaHU/HTg52w7XAsaSORuk9rY8KcNrSy/NPm7sgJScBqH/l0FGPGxqVTy
 MaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4BNVJ0YeZm+ozHzna6rD2VqO7S2bRhgKSJBcKs9mO5w=;
 b=heXD3uCoMUieBOaVhQHPCh6SfkNU8f14NMF3BUhDwfTeyyv8EPgnLa0boNY8F/AZSl
 mtQMlBliVvbUAs9uKC19I7/OO3o3FxcVHroB/LqwXMvqCmWXo2ASuCGvzO2NAw6mL/Ze
 FJzUZAMYbnovoOP/rnZ8d2/Tgng+R1BEwuraOFDkthoH4LGKdNONh5zoNH03UCIeppEp
 qGhUx8Kwoq+ya4OgkzzcovhyRNE5SM3/cfdfTrtQmWZdjsCSUtm+w6VxkfNdUAspzP6O
 7O/dx/m8Zb4ZAGW5RUIRad0A3V/tSVb/+v1dW8s97lPdckCvIcYKJs0UYRgMGd+5H2ui
 7lOg==
X-Gm-Message-State: AOAM532MkZFrvirRYnQqI6Ov8byZapYRqXUOYeh41Ap12uE4PZbTQDt6
 WjX/KviFy8l4iQDhoiN78lA=
X-Google-Smtp-Source: ABdhPJyON3BmertShXOuVisN6juLxmAWmltd77IpfN82JF5KtXts793u3iCLcMBrMLuhVCPZmmBrdQ==
X-Received: by 2002:a05:6808:199b:: with SMTP id
 bj27mr3036274oib.129.1630680617207; 
 Fri, 03 Sep 2021 07:50:17 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id w15sm1055691oiw.19.2021.09.03.07.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 07:50:16 -0700 (PDT)
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <6bd9dc07-e23b-1bfa-9520-0d7b00db06c1@gmail.com>
Date: Fri, 3 Sep 2021 09:50:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210902120202.1.If7ddbb0eecde3d5db357ef27cb0833abbdacd362@changeid>
Content-Language: en-US
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Jean-Philippe ROMAIN <jean-philippe.romain@st.com>,
 Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 dillon min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] arm: stm32: Disable ATAGs support
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



On 9/2/21 5:02 AM, Patrick Delaunay wrote:
> These platforms never had to support an ATAGs-based Linux Kernel, so
> remove the options.
> 
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Reviewed-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Slowly, but surely, configs/*.h will grow to zero.

> ---
> Hi,
> 
> this patch is a rebased version of the STM32 part [1] of Tom's patchset [2].
> 
> I also update the new file include/configs/stm32h750-art-pi.h
> 
> [1] [13/13] arm: stm32: Disable ATAGs support
> https://patchwork.ozlabs.org/project/uboot/patch/20210204022415.20589-13-trini@konsulko.com/
> 
> [2] arm: nanopi2: Remove unused code
>      https://patchwork.ozlabs.org/project/uboot/list/?series=227910&state=*
> 
> Patrick
> 
> 
>   include/configs/stm32f429-discovery.h  | 5 -----
>   include/configs/stm32f429-evaluation.h | 5 -----
>   include/configs/stm32f469-discovery.h  | 5 -----
>   include/configs/stm32f746-disco.h      | 5 -----
>   include/configs/stm32h743-disco.h      | 5 -----
>   include/configs/stm32h743-eval.h       | 5 -----
>   include/configs/stm32h750-art-pi.h     | 5 -----
>   include/configs/stm32mp1.h             | 5 -----
>   8 files changed, 40 deletions(-)
> 
> diff --git a/include/configs/stm32f429-discovery.h b/include/configs/stm32f429-discovery.h
> index 9d029fbcc6..dbbce49475 100644
> --- a/include/configs/stm32f429-discovery.h
> +++ b/include/configs/stm32f429-discovery.h
> @@ -27,11 +27,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_CBSIZE		1024
>   
>   #define CONFIG_SYS_MALLOC_LEN		(2 << 20)
> diff --git a/include/configs/stm32f429-evaluation.h b/include/configs/stm32f429-evaluation.h
> index fefdb2dd15..29a41e8067 100644
> --- a/include/configs/stm32f429-evaluation.h
> +++ b/include/configs/stm32f429-evaluation.h
> @@ -29,11 +29,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_CBSIZE		1024
>   
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32f469-discovery.h b/include/configs/stm32f469-discovery.h
> index ba9f05a61b..b9b932c651 100644
> --- a/include/configs/stm32f469-discovery.h
> +++ b/include/configs/stm32f469-discovery.h
> @@ -29,11 +29,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_CBSIZE		1024
>   
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32f746-disco.h b/include/configs/stm32f746-disco.h
> index 08d050adfa..b72b989c2c 100644
> --- a/include/configs/stm32f746-disco.h
> +++ b/include/configs/stm32f746-disco.h
> @@ -36,11 +36,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000	/* Timer is clocked at 1MHz */
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_CBSIZE		1024
>   
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
> diff --git a/include/configs/stm32h743-disco.h b/include/configs/stm32h743-disco.h
> index 6e10dbdfe9..e5bb08eec7 100644
> --- a/include/configs/stm32h743-disco.h
> +++ b/include/configs/stm32h743-disco.h
> @@ -24,11 +24,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_MAXARGS		16
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>   
> diff --git a/include/configs/stm32h743-eval.h b/include/configs/stm32h743-eval.h
> index 268d39c7ad..89169f85d5 100644
> --- a/include/configs/stm32h743-eval.h
> +++ b/include/configs/stm32h743-eval.h
> @@ -24,11 +24,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_MAXARGS		16
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>   
> diff --git a/include/configs/stm32h750-art-pi.h b/include/configs/stm32h750-art-pi.h
> index 3fd5461167..a9006e224a 100644
> --- a/include/configs/stm32h750-art-pi.h
> +++ b/include/configs/stm32h750-art-pi.h
> @@ -24,11 +24,6 @@
>   
>   #define CONFIG_SYS_HZ_CLOCK		1000000
>   
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -#define CONFIG_REVISION_TAG
> -
>   #define CONFIG_SYS_MAXARGS		16
>   #define CONFIG_SYS_MALLOC_LEN		(1 * 1024 * 1024)
>   
> diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
> index b372838be8..fb4e4fb0bc 100644
> --- a/include/configs/stm32mp1.h
> +++ b/include/configs/stm32mp1.h
> @@ -33,11 +33,6 @@
>   #define CONFIG_LOADADDR			0xc2000000
>   #define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
>   
> -/* ATAGs */
> -#define CONFIG_CMDLINE_TAG
> -#define CONFIG_SETUP_MEMORY_TAGS
> -#define CONFIG_INITRD_TAG
> -
>   /*
>    * For booting Linux, use the first 256 MB of memory, since this is
>    * the maximum mapped by the Linux kernel during initialization.
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
