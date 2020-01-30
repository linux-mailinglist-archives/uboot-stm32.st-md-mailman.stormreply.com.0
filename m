Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E114D528
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:18:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 891C1C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:18:51 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 419DEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:18:49 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id r19so1602775ljg.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ce63YA81Qf5efAC6FMTBjwwUbEANw8xlc3qHvoGtT6U=;
 b=oCnPSw53OFAoBnaooeXAanXpK57Zf4mkMWRg/H6E3VsMFXSJLFC3B5+HNcuzm54wLN
 4Cj4hMiYJQRME8OCBYUkmiaYCn7lnjLFETQ4vrHFM5hV0U87eh0jV/OUcILy76lSKUsN
 nn9Zk+7z/00cVsx/pNbJxccIbg6NN+ndaQ3ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ce63YA81Qf5efAC6FMTBjwwUbEANw8xlc3qHvoGtT6U=;
 b=BLrMrRJx6usH+Xwl9oDIIWC17XCO9dMhCbG86X8QriSpY/r1V6nWbbSkrG7zGB+A5c
 9ehS8IGy/dSiQjnIr3PX0/RdDCHhB5oyUz8nn63ytm+UfuEM0huA69HwIjfpvZd1YNDl
 XDl2K7xnjBei/WkIfcYkFK/P6dBOgJh4ZScVjDaFQdPnk4TQ5YGVbNiSd9TRk7irmErw
 wrwvliEZRfsM11H4mOLv/Kjvu4gwP5dO+NQLTfvNkR2nirFpHKSHOc8WMzgpDdoZhFno
 zuliofPyjcPXDBfDu4FcQX5tOX96pAgoK4YDcYvzpEHSY6PMUjcfMqMl5xc8wQnLDkUB
 Y3XA==
X-Gm-Message-State: APjAAAWGs5/Ds3alQ7JjnLWOc8pQfO9heoZP6AWB7pQL5dYH7DfYiYth
 /bKaQB9ei9RSy9fb44V70lDl8uOfkbTQYYXsZMuaQQ==
X-Google-Smtp-Source: APXvYqxBv5k6+AQm+uDjGuRcyBWzvzqcXn0VoPlsYeYn4zfSLs7fM+joWmTkDW5tqoRvhwEO3cTokltNC26j5ND5XFo=
X-Received: by 2002:a2e:3202:: with SMTP id y2mr1356678ljy.132.1580350728259; 
 Wed, 29 Jan 2020 18:18:48 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-9-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-9-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:03 -0700
Message-ID: <CAPnjgZ2pm2KemNfba=rWEVLqL_eq7tsaxHd3XDHeH+otCQVY+g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/21] gpio: add function
	_gpio_get_value
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

On Mon, 13 Jan 2020 at 03:35, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Introduce the function _gpio_get_value to get the GPIO value
> without check if it is reserved.
> This patch prepare new ops introduction.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
> This patch was part of v2 08/14
> = gpio: add ops for configuration with dir flags
>
>
> Changes in v3:
> - Split the previous patch [PATCH v2 08/14] to help review
>
> Changes in v2: None
>
>  drivers/gpio/gpio-uclass.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
