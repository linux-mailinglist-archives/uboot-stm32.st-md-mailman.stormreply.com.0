Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7314D52C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B11A7C36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:08 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 321D3C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:07 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n18so1563515ljo.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lGMXL3lJ1YxD2OW3JMauZ/ZIxaVZuwo3QULcknIQxc8=;
 b=K7l7yBUUNErH+aA6ToEnUuaf5MoE7+nLhAVvd0X5G8ZrjZHSXJPyqIGmZ/aT+i4EQm
 Z5lpWrxbHPWKVDT6vkMfuy6TnUOTQyQCjXYBHY3ArPbYcP6Le99Swksb5Ct2BXcGU7c9
 JnktwwZ3jYylarM+4ppdsak1hVyzcZrrStRr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lGMXL3lJ1YxD2OW3JMauZ/ZIxaVZuwo3QULcknIQxc8=;
 b=bWpV658HUvt5bG5W6bZzpjeZZUOJwmAwVQffsQt4o4vhoa0VBVA/o8F232uobTPRt4
 2wbzTg9BBSev2LGFJOLcQLBmM8zaMljBX/aj1fD2KXeotYS7/+i2274nV3br9KMwFu1d
 OhvKNf8SiGBywVmytosrJuvMEwBnUZmyM/tqV8td0SiT4+Tx640pab/uHdtVP41ak+sB
 XWshcbCV87/H7OqJh92oiQOgz7uq8PLOz6A+DIIZLt5ae6eDD1CZGoBb5IU5ltEG7HVS
 q27bnLRc/ygNzkAFr9jQ/pmXrf7zEJhng3TMLZlYRqGW3mdqgBJSSNKWhb7njJIR88uO
 tqnw==
X-Gm-Message-State: APjAAAXt9QERQoti1fNeyw40vNf5h1WMBw3+2YxEGBuAl1Kt4Dop3c4Y
 8R2CR0uTnk7cyIa6oC7mfuF77knKq8Pky6BTsO/uxQ==
X-Google-Smtp-Source: APXvYqyMs8LGnFeUgNWJ+oAy5aHTEZH40/mxFeR9ajq70hhBzsdcsr8QzCu4kqlgNaFrSfl7a6XNpEa+K8x4jsxVA+g=
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr1178550lja.131.1580350746169; 
 Wed, 29 Jan 2020 18:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-14-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-14-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:11 -0700
Message-ID: <CAPnjgZ1KK6p+Df5LVLt=CZZx80PwDfQXRCKmY=RBDXve7pVrHA@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 13/21] gpio: add support of new GPIO
	direction flag
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
> This commit manages the new dir flags that can be used in gpio
> specifiers to indicate the pull-up or pull-down resistor
> configuration for output gpio (GPIO_PULL_UP, GPIO_PULL_DOWN)
> or the Open Drain/Open Source configuration for input gpio
> (GPIO_OPEN_DRAIN, GPIO_OPEN_SOURCE).
>
> These flags are already supported in Linux kernel in gpio lib.
>
> This patch only parse and save the direction flags in GPIO
> descriptor (desc->flags), it prepares the introduction of new ops
> to manage them.
> The GPIO uclass supports new GPIO flags from device-tree
> (GPIO_XXX define in include/dt-bindings/gpio/gpio.h)
> and translate them in the dir flags (GPIOD_XXX):
> - GPIO_PULL_UP     => GPIOD_PULL_UP
> - GPIO_PULL_DOWN   => GPIOD_PULL_DOWN
> - GPIO_OPEN_DRAIN  => GPIOD_OPEN_DRAIN
> - GPIO_OPEN_SOURCE => GPIOD_OPEN_SOURCE
>
> This patch also adds protection in the check_dir_flags function for
> new invalid configuration of the dir flags.
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
>  drivers/gpio/gpio-uclass.c | 30 ++++++++++++++++++++++++++++++
>  include/asm-generic/gpio.h |  6 +++++-
>  2 files changed, 35 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
