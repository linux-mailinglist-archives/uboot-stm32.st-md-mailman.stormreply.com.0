Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435549E56C
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jan 2022 16:06:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 897C6C60467;
	Thu, 27 Jan 2022 15:06:03 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA41C60464
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 15:06:02 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id e17so5225600uad.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jan 2022 07:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mLaFP3NUTTeaqUgYmzw/LC9YLEI/ZkQbTZfIPqAFmuc=;
 b=aFfGO5q9i35tp8kMFbGd7PLlSH8wbGAHZQlSs/fK+JyHyRGDu9buTUNzOv8ce9KWpH
 1DajRBaxe8KikP7oOGNxgOoXi6JQpJNEpg9bSIEbQ2dfepTdy8nNBSGR/BVxYz79glzo
 PmOZW+FDoGeSGwrqT0p3rezbpGwwY/Bsts4Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLaFP3NUTTeaqUgYmzw/LC9YLEI/ZkQbTZfIPqAFmuc=;
 b=tihzwU6x85I9xLiNIArkNK4YQ73HQpjrs6J8UB0xqhzaEl1x8ZS/yo2EPi38TMCca+
 bDUU1p5++Zvfhl8lN0k22ZNbpN49eRhLxDH+r/d8rsYQGjDIJWwZODpSxRO0+yxaYnK3
 hjbA7zYc8RjDT9ECIbloB5JNWaOYmv/YNwtxU1LhSCVUDfUJzya2GRxSRdegLz9WYAcg
 NYYFkwUvtUGq5C+dZqpyzFjoF998APFxO3Lym/2r4g9ykI+NzserNEgWC5KvnGTv96sR
 KedNXZIRxyLKzgA09n5tbjC0fiqSHAAO0KCbd0kng91WEeXGkZim3L6Ti8iLqa92G6JQ
 pT3Q==
X-Gm-Message-State: AOAM530zKhC6HV4QsDVV18jgSLfB3SuAkAb62ckBpe6nyy1tSk/I2hRW
 vlUZnmy64h9J7sPJH3n6ZbtPLtVtDX71PuW86TGtag==
X-Google-Smtp-Source: ABdhPJxU7x8hxOgFpofbyPwx82NWpB4Op5wdNvaKCZrKGam1gbJsmlvn7fmAMIsFd033foCI/oxCyP83b6YhuCCH2wA=
X-Received: by 2002:a67:e0de:: with SMTP id m30mr1662310vsl.51.1643295960954; 
 Thu, 27 Jan 2022 07:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20220117154922.1085936-1-patrick.delaunay@foss.st.com>
 <20220117164919.v2.2.I85a4f70465cef5ef600f264706dca84c55c7efdb@changeid>
In-Reply-To: <20220117164919.v2.2.I85a4f70465cef5ef600f264706dca84c55c7efdb@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 27 Jan 2022 08:05:47 -0700
Message-ID: <CAPnjgZ3bvw_9JEBbOiRcxidiRY36uhzjDBzZRyg7nLgsHehY=A@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] dm: compare full name in
	uclass_get_by_name
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

Hi Patrick,

On Mon, 17 Jan 2022 at 08:49, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Change uclass_get_by_name to use a strict string compare function
> "strcmp" with the parameter 'name'.
>
> This patch avoids issues when strlen(name)<strlen(uc_drv->name) as
> the function uclass_get_by_name() no more use uclass_get_by_name_len(),
> which limit the check with "strncmp" and length of name.
>
> This problem is detected by the sandbox test for log filter:
> in log_get_cat_by_name(), uclass_get_by_name("spi") = UCLASS_SPI_EMUL
> for "spi_emul", it is not the expected result = UCLASS_SPI
> for a search by name.
> But it is the expected result for search with partial name
> uclass_get_by_name_len("spi", 3).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>
> (no changes since v1)
>
>  drivers/core/uclass.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

To save code space, could we avoid copying the function and instead
use len == -1 to mean to check the whole thing?

>
> diff --git a/drivers/core/uclass.c b/drivers/core/uclass.c
> index 336ea8d243..32b6cef167 100644
> --- a/drivers/core/uclass.c
> +++ b/drivers/core/uclass.c
> @@ -196,7 +196,16 @@ enum uclass_id uclass_get_by_name_len(const char *name, int len)
>
>  enum uclass_id uclass_get_by_name(const char *name)
>  {
> -       return uclass_get_by_name_len(name, strlen(name));
> +       int i;
> +
> +       for (i = 0; i < UCLASS_COUNT; i++) {
> +               struct uclass_driver *uc_drv = lists_uclass_lookup(i);
> +
> +               if (uc_drv && !strcmp(uc_drv->name, name))
> +                       return i;
> +       }
> +
> +       return UCLASS_INVALID;
>  }
>
>  int dev_get_uclass_index(struct udevice *dev, struct uclass **ucp)
> --
> 2.25.1
>

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
