Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EEABC14D52D
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB045C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:13 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EFAC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:11 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f25so1535707ljg.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lIWO8rrck/+zgiQdGFjohz5Ac89mnn2l1mhkW7Fkk4c=;
 b=RucG+CboQbNxx+XhRTUVXkxc4GbX3gfn1Pqm4wHvpAy3VLgRHEm21cy5ynVuk7aB64
 KhtAKueJZ1KzUwKIqcRSuddiGvgwo7LcZujtZVfzNX9RiizE4UbxlhXJKNKwMPihSjiH
 E3WU7HsyfaanQeThpoBgoZ2XfmC4vtRviV590=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lIWO8rrck/+zgiQdGFjohz5Ac89mnn2l1mhkW7Fkk4c=;
 b=SWaiE7oTJk5XR1bTJAA2zwXFPe+7iRVZ04msS+uBJhSO+W9YKNe+w0Cid34pe577j0
 4tW82jGkwwvDYoE8FhI5QML74aJQgVzzfNMCfyZBN8XgkGpkWPkV/c3nFKnncMWlILse
 2/g6FYz5kBZHq6mqoQpUkeKjewPVSTsRKpiyZp+DK/FqkkeFcjLxhMJW500WXR/2o3lL
 LHdQ0wbPjKP6Wn1SdwqoszDsjakL8MkuX/P3gvD31FmkCXY0p0yEr+O8dLmXwah2RifB
 JMTlsF1qgT7QQyZEPlD7NYRY5dGkSBWGqKaX4mHf9OUreqQGL0FLAUrM+WwsRQTCwvkE
 YEfg==
X-Gm-Message-State: APjAAAXhoze8649h0ZR8tIh7hgH+vnPuUDpc/HA3IKbcX0oOp+91/hH+
 O7+vjgQBpF5OZdl+m2LtL6R4nn+eSSzZYhKrFJUF3w==
X-Google-Smtp-Source: APXvYqz497Wg0gb8+0jdKxV4Au6T0WrAn2ytykKJfKcfCVfZPbV6QYgF5cRaqiiqgnbj8jn+NjvErsdtOH5BhWn5OTE=
X-Received: by 2002:a05:651c:111a:: with SMTP id
 d26mr1249648ljo.153.1580350751013; 
 Wed, 29 Jan 2020 18:19:11 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-10-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-10-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:05 -0700
Message-ID: <CAPnjgZ2N+g2chu30mhTDho64DkM+pngDyWWSicVEhgSsXXtK2g@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 09/21] gpio: add function
	_dm_gpio_set_dir_flags
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
> Introduce the function _dm_gpio_set_dir_flags to set dir flags
> without check if the GPIO is reserved.
>
> Separate the reserved check for "set_dir" and "set_dir_flags".
>
> This patch is a preliminary step to add new ops.
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
>  drivers/gpio/gpio-uclass.c | 38 +++++++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 13 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
