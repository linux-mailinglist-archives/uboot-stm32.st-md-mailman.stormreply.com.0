Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E812E94D6
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CE13C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:52 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CDDCC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:51 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id r27so607536oij.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SL4QQqq7eGt1y0UxMS6XHYUDhwTBQtvRlIhS+wSk9wk=;
 b=CSlzya8GM+z8F4j+6l2oXxEOPBdzwvX3osz8DYM8ZNdSF315VP8Yxd6VJNlXqeh9Wq
 SVhWt3uaGcQN5GwptZoOgI3yeoQxah20dtBepW+E+dV2ll9niFI+tjESc7MPDDSbO+6b
 5e9rxi1PnH/VQaU6aOG4Ks0hHwlmxCzV5nou0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SL4QQqq7eGt1y0UxMS6XHYUDhwTBQtvRlIhS+wSk9wk=;
 b=CX4OvdQtxqNeFx88QSkkCTfPcZN1fHGJjMYd5PNkzUuJ1tx14UGOfidQiMw1jhErTX
 tx1v15NaMWGdNoA7dp5Xi3sE/8/Oaizjh+JmGCD1ohxzaY2UdXfv6zCTRpuzNJbSqND6
 3CpOi1QZ8/e/JHcFFNP/SsYjexsvyQHpH4NxubnnrF8rQXcBeuhUbmf2WqmgEd6Wpq1e
 4P3hgVPOEw4PGILVwX9mLAEv07Bg3gpdb85lyftiAYwm1S49qKI6z0qgIy4vB++EIcY5
 jupTOom969YEroYU85Vqrl9NNCi6vhc4PYVB0EIdqTZt9advTOjWJNQwUNgEApKYELXZ
 Om9Q==
X-Gm-Message-State: APjAAAX5XKrbMhczOs9IslQTQzZ/oEdq7bMLouwWnBhX4XZo5xCtDyvJ
 vf10Ee7ctC4ErwoAszxk7diE2dzOD/x/KVGQv52fQ+j8
X-Google-Smtp-Source: APXvYqzyd6pXi0kiHQjpLFpS6cWLx2t29gaNxczg7O/YVGKQmRjCM/7zijCKpUkfYBdYCbVMDF8/JqNF6EkDLCfjtWY=
X-Received: by 2002:aca:211a:: with SMTP id 26mr6455486oiz.122.1572400129405; 
 Tue, 29 Oct 2019 18:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-7-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-7-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:35 -0600
Message-ID: <CAPnjgZ2rSG47Etzh-RZo3jQPakdn0NGQ5Xey5B3CL5c2fyKkmg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Bin Meng <bmeng.cn@gmail.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 06/13] gpio: add support for new flags on
	gpio configuration
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> This commit manages the flags that can be used in GPIO specifiers to
> indicate if a pull-up resistor or pull-down resistor should be
> enabled for output GPIO and the Open Drain/Open Source configuration
> for input GPIO.
>
> It is managed in driver with a new ops in gpio uclass set_config.
>
> These flags are already support in Linux kernel in gpiolib.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/gpio/gpio-uclass.c | 62 +++++++++++++++++++++++++++++++++++++-
>  include/asm-generic/gpio.h | 56 ++++++++++++++++++++++++++++++++++
>  2 files changed, 117 insertions(+), 1 deletion(-)
>

To me this seems like a pretty annoying interface. The uclass has to
call the driver multiple times with each enum and the driver may end
up reprogramming the pins multiple times to get it right.

Normally we want to program things correctly once, before enabling the function.

On the other handle I think what you have is better than adding new
methods like set_open_drain().

But overall I think it would be better to define a new struct like
gpio_config that holds some flags and perhaps a few other things. Then
the uclass can set up that struct and call the driver once with it, to
set up the pin. It could include input/output too, so that if
set_config() is defined, the uclass uses that instead of
direction_output(), etc.

What do you think?

Also we should update the sandbox driver to include tests for new
methods. It looks like you have done pinctrl but not this?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
