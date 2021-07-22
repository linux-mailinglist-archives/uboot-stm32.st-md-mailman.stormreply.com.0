Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD793D2C7A
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Jul 2021 21:10:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94D00C5A4CE;
	Thu, 22 Jul 2021 19:10:50 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F52C5A4CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 19:10:49 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 a17-20020a9d3e110000b02904ce97efee36so989671otd.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 12:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z6QmZVVkx2cjEeg9kP3meDxuS13CBZP+BiXvPuSNHSI=;
 b=HRkDpiZEv70xfWddCjbUf0urewb/0d3fKy1KTtdDcWNz+5cE0z8lNJNgz6stHat5zU
 DYAs8O+v7YXemNHbFbfcD950QLK2AAi/R6RB9plRuC4eigYZe905vINvRVuWS22jkgO6
 EEy9+pLpDvn2OObYI+GD+1bS48wKw1cMoXyQJTFFUFTbpnGw6S/OsDiV8tBiukyEYk0C
 p+7FxW613ujgkmhgzQlJ3AJ9hRwASfJG6ua3NKOZvs3fW69P/xXAuVYu+8QmBfWaPAO3
 LEXQ2d7LZ7fSVisTvBVnFv+ykHMo7Cl24WN9c88nNbofJ8bDfSpaRpo0T6qLTzH6RP8u
 wA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z6QmZVVkx2cjEeg9kP3meDxuS13CBZP+BiXvPuSNHSI=;
 b=SiiPLqDUBcJupP3vjtTB1a6/Fk/60KUEt5ACQbx0KuH8VbX4eQu6xT+8tAt+vthq33
 +MKAM7oPERgWtnU6wUkjyXDkQ5SclezFoXGM8JZbINC0Hk21xBnQY6mUH0puFJ2u0Tuh
 C5sFcfU4iRkzhxpthPX69VAQXDmFLXuRsqnOuvxnin1UffJLH1+J8+69AcYBeQEdTzz+
 vt4a7PY1WuWkBcDNMxvmqvzcszuX9JwKfDA9xXERdamToiioQDzyp8CNOw4dSkWKpMxl
 dlu7aI2KoW6Pq6A1PFr+ZWKHPsVNIUgxMO92kRu0UtqFFc0pJmLMDG1hIX1KZ6Q0ht4o
 aWEA==
X-Gm-Message-State: AOAM5313TT9oq8Ltpn5XZ+e/Q7OsZHws1uRv17KHyu3bYhAaWytpIwIT
 zLZKML45hNlCdCpOZgXpH7r/zbrAuhJMrD9v9+0=
X-Google-Smtp-Source: ABdhPJyjXZCOwnHljo0Hy5KduJhzRPK0RDIf7XEgVwyQ2CJSxftMNJ4sCvl+lNDvpDqRJoHyBJj/tleH51kp0CVamHc=
X-Received: by 2002:a9d:12f:: with SMTP id 44mr915137otu.14.1626981047995;
 Thu, 22 Jul 2021 12:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210720181530.2949296-1-patrick.delaunay@foss.st.com>
 <20210720201526.RESEND.3.I51d64e06abf3ec51ff46a149a6aede4a79dbc79a@changeid>
In-Reply-To: <20210720201526.RESEND.3.I51d64e06abf3ec51ff46a149a6aede4a79dbc79a@changeid>
From: Ramon Fried <rfried.dev@gmail.com>
Date: Thu, 22 Jul 2021 22:10:36 +0300
Message-ID: <CAGi-RU+FbBpi80koBhKvnuqeb_6H2-95=Xvk8nO6gbxGeEaPQQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 3/3] net: define LOG_CATEGORY
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

On Tue, Jul 20, 2021 at 9:15 PM Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Define LOG_CATEGORY to allow filtering with log command.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>
>  net/eth-uclass.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/net/eth-uclass.c b/net/eth-uclass.c
> index 5146bd6666..c2a97d723a 100644
> --- a/net/eth-uclass.c
> +++ b/net/eth-uclass.c
> @@ -5,6 +5,8 @@
>   * Joe Hershberger, National Instruments
>   */
>
> +#define LOG_CATEGORY UCLASS_ETH
> +
>  #include <common.h>
>  #include <bootstage.h>
>  #include <dm.h>
> --
> 2.25.1
>

Applied to u-boot-net/network-master
Thanks,
Ramon.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
