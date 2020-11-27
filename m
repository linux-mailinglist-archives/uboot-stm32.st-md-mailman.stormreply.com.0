Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E43722C6832
	for <lists+uboot-stm32@lfdr.de>; Fri, 27 Nov 2020 15:50:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72FF2C56630;
	Fri, 27 Nov 2020 14:50:42 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA988C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 14:50:38 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u4so4497411qkk.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Nov 2020 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hMsAdiXZvJrkXzIgmb5NxrDJtY2TrWSb/gJjx9iA0vE=;
 b=Iq/0lpMebm6KspawxtVxB23NUEpQBzuFqv8HYWWmhKjOo3H4jGFi3rBbdGAkLNWWBw
 4PxtFdgqM+U7b0OtvKuj4bJRLtkKWnGxV3meSLqJuHyEvJiCxkMiutZ8QU9wZ4se3tAW
 m7e0qYczfG8mwwuUp6VMBoDy+aHrtPG47fX04KCzMKSWP4p1ZxF+925HzjaMVM1RocjC
 PamgMlo3Wa6M57Zb+t45hZcBIDxk9p+cP6Tlk0MeFp5rZdaRNH1e3N0yrx1di1J0vWOV
 pqkGGS3zWoaHbUaCnRG7qb3kFwd7m1s1GKeDmjHwC6iv3moYXaYugxx2rd0YGaZ1NhES
 YORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hMsAdiXZvJrkXzIgmb5NxrDJtY2TrWSb/gJjx9iA0vE=;
 b=J+Sa/bGu6mJ6zVzES3AbJQJIUnkyhoqxQUACOdAvagzlWB0HdgfHy1/0EGvYm7qZWu
 ldN+Ef7qGYJ660JEwlWezNfxG00PtVQSFtxD0ffskS3rp4nfTdFsbhJEppr0NOkJ7cjR
 oSpu8qDvzPyXm44noEHFH19mefXysCPt9WXTv8PEBF9AlK30o87DuyVCbOhuWb50Su1Y
 s2HkGcwExdq2a+njA6si63J9U/rwfSQf2vQa3cpwO34oOIQczZUEGxARPqhNpdwMErSm
 mSllx6g4a0R/uFeORfNcH88IF5SXQwuTObTQHKphR5Qk1CLcKIrj6NQmhT0sh5ehf4FC
 EPyw==
X-Gm-Message-State: AOAM532AQ00wV+sJRnd140bF8At6RaaEcYlgU2R3QzCSdawuH/UjZZxj
 30MFDTWiDG92QeBbgeAMC9s3lW+nPJsg3Q==
X-Google-Smtp-Source: ABdhPJz+7JWIgYcR0tTooqJfgUn1iNVngVw21X+cb5Xvb59oEAX8RRueNB7DYZUBwsJqi3zV8hQlbQ==
X-Received: by 2002:a37:a689:: with SMTP id p131mr8706446qke.77.1606488637204; 
 Fri, 27 Nov 2020 06:50:37 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162])
 by smtp.googlemail.com with ESMTPSA id r127sm6152434qke.64.2020.11.27.06.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 06:50:36 -0800 (PST)
To: Patrick Delaunay <patrick.delaunay@st.com>, u-boot@lists.denx.de
References: <20201127102100.11721-1-patrick.delaunay@st.com>
 <20201127102100.11721-3-patrick.delaunay@st.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <19fede5c-166c-1cff-643d-d80cbff6c34b@gmail.com>
Date: Fri, 27 Nov 2020 09:50:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201127102100.11721-3-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 2/9] log: don't build the trace buffer
 when log is not ready
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
> Update _log function to drop any traces when log is yet initialized:
> vsnprintf is no more executed in this case.
> 
> This patch allows to reduce the cost for the dropped early debug trace.
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
> (no changes since v1)
> 
>   common/log.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/common/log.c b/common/log.c
> index ce39918e04..212789d6b3 100644
> --- a/common/log.c
> +++ b/common/log.c
> @@ -228,6 +228,9 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
>   	struct log_rec rec;
>   	va_list args;
>   
> +	if (!gd)
> +		return -ENOSYS;

How early are you expecting this function to get called? AFAIK this will
only return true before board_init_f_init_reserve. Shouldn't functions
that early just not call log in the first place?

--Sean

> +
>   	/* Check for message continuation */
>   	if (cat == LOGC_CONT)
>   		cat = gd->logc_prev;
> @@ -240,15 +243,15 @@ int _log(enum log_category_t cat, enum log_level_t level, const char *file,
>   	rec.file = file;
>   	rec.line = line;
>   	rec.func = func;
> +
> +	if (!(gd->flags & GD_FLG_LOG_READY)) {
> +		gd->log_drop_count++;
> +		return -ENOSYS;
> +	}
>   	va_start(args, fmt);
>   	vsnprintf(buf, sizeof(buf), fmt, args);
>   	va_end(args);
>   	rec.msg = buf;
> -	if (!gd || !(gd->flags & GD_FLG_LOG_READY)) {
> -		if (gd)
> -			gd->log_drop_count++;
> -		return -ENOSYS;
> -	}
>   	if (!log_dispatch(&rec)) {
>   		gd->logc_prev = cat;
>   		gd->logl_prev = level;
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
