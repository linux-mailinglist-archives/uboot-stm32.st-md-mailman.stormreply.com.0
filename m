Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DABB2C685E
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 16:01:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5969C56630;
	Fri, 27 Nov 2020 15:01:57 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4F69C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 15:01:55 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z3so3387186qtw.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 07:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LgKPXkSkBID5adT08tFqGguFAQL0MisvaTtyyBvywQU=;
 b=DTalXRCVcrXdktf9inHvHkHgj+wbvSTJFm6+n9cSQTlFSK3fyRk0uLPJT0XZaeGBxf
 qUoQ9YdroyUiYKZgevKC1Z6wGtJUk+Ch7ap7eAJ4aoJxXvKCg5wQpn2U3MwmXuJHWBo/
 i55rwiE513Fbg+WKEkqk/nnb/SukKrYQB1iMZaLD5Vs0jcbfyVyxsnatHjp3VlPjF6uN
 7wBbIVfaAZuH01UxmHn+U/bVZemK15ZmLyB9dGXVnWxulfZ7sshTn5K7lbsJGaB4bGP8
 JIMa7cZrw6x68UG5TVFw9rBvXgZK5j3CN1pnE2CeXm6/1RpEoKPejQJpHiQK/G3wb6yY
 31Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LgKPXkSkBID5adT08tFqGguFAQL0MisvaTtyyBvywQU=;
 b=fvyffZeEWmKxsq3EQOceapxCIgiLoznQwTeryV1SMbngdnu59LrMdQ6EukdM0I4NFT
 h8S0AqcYEe1QAce5zaFNELbzSsF+ItS9MXEwUsln8zlaBGB4hac/+fp7/mbPxCsLLpBu
 Y08Xhfwr/LcHnFvYM3iCyKx5sYa0Qg+tplJY+YG3EeGUpRXkbsje+GRMIMVmCJJdzMw0
 S8nLBoH8+K0MWhubBy0jOSlWFtJZlL8qd3GmehpFuhtQRD4+1fW5QRv2XunyJ4/rObW6
 P0nLjMYQDq9l4mZuMr2EJ76Fvwj31BHqeD2jKuRtIJROKQW16IqiR7KLFf15TUS4giWd
 JlpA==
X-Gm-Message-State: AOAM531g2LwnhiZQvJY4kHIJfpNU0YlCwzohR//Y3P4HHfZ2LE9C7yLX
 Nf9IaxtQaG7Vaf8ZPwKfQv2DZMzSnM7Pvw==
X-Google-Smtp-Source: ABdhPJwxJPrBE/6qaUP/A7vsgI4g8sh2VS1qsDKD8Rjh/OhD+HgO5KBDfLWuVTTGpAB7pC+BJ7QJkA==
X-Received: by 2002:ac8:734c:: with SMTP id q12mr8459614qtp.239.1606489314200; 
 Fri, 27 Nov 2020 07:01:54 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id i9sm6015052qtp.72.2020.11.27.07.01.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 07:01:53 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <07e2863f-aa2a-e995-1958-9bae28006a46@gmail.com>
Date: Fri, 27 Nov 2020 10:01:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127112000.v2.4.I01167328d604e359d69c0d241754caeec1f65ebe@changeid>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 4/9] log: use console puts to output
 trace before LOG init
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

On 11/27/20 5:20 AM, Patrick Delaunay wrote:
> Use the console puts functions to output the traces before
> the log initialization (when CONFIG_LOG is not activated).
> 
> This patch allows to display the first U-Boot traces
> (with macro debug) when CONFIG_DEBUG_UART is activated
> and not only drop them.
> 
> For example for traces in board_f.c requested by the macro debug,
> when LOG_DEBUG is defined and CONFIG_LOG is activated.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> Changes in v2:
> - replace printascii by console puts, remove test on CONFIG_DEBUG_UART
> 
>   common/log.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/common/log.c b/common/log.c
> index 212789d6b3..a4ed7d79f8 100644
> --- a/common/log.c
> +++ b/common/log.c
> @@ -246,6 +246,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
>   
>   	if (!(gd->flags & GD_FLG_LOG_READY)) {
>   		gd->log_drop_count++;
> +
> +		/* display dropped traces with console puts and DEBUG_UART */
> +		if (rec.level <= CONFIG_LOG_DEFAULT_LEVEL || rec.force_debug) {
> +			va_start(args, fmt);
> +			vsnprintf(buf, sizeof(buf), fmt, args);
> +			puts(buf);
> +			va_end(args);
> +		}
> +
>   		return -ENOSYS;
>   	}
>   	va_start(args, fmt);
> 

Couldn't this be done like

  	va_start(args, fmt);
  	vsnprintf(buf, sizeof(buf), fmt, args);
  	va_end(args);
  	rec.msg = buf;
	if (!gd || !(gd->flags & GD_FLG_LOG_READY)) {
		if (gd)
			gd->log_drop_count++;
		if (rec.level < CONFIG_LOG_DEFAULT_LEVEL ||
		    rec.force_debug)
			puts(buf);
		return -ENOSYS;
	}

I don't see the optimization of not doing the vsnprintf() coming up very
often. Also, shouldn't this return 0 instead of ENOSYS if something is
actually printed?

--Sean
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
