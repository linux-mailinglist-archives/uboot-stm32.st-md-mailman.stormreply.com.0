Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A017914D533
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A7EAC36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:40 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2162EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:38 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z26so1123255lfg.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8PJ4fCarBRJZO3+sU6tfEAwS1n9DFGBJ66P/eV5vw7A=;
 b=Jm2JQCt3mwxo+JVMBsvZ60wo5FIu3mL4usOC6Vzh2Gas+1Adtjsp/5DC2S7OEA+odS
 YYQPNBETwk4oEhN0nlmjPSoMsJJtp14p8Fn2y9XrgFKxbGaQWZcu/XrPBH0LFMhpp0v4
 E33mNkXuhO5ehIyKIuenV/sUxDpe7gQb8bzvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8PJ4fCarBRJZO3+sU6tfEAwS1n9DFGBJ66P/eV5vw7A=;
 b=Py+LZw4rAJ87LlQQwkpa/NncBHbgZ42/0f76H9IL7qKzGd6LqPIzgVUnVq9qk7c1IH
 XtHvkN/6xGq5uko6CEx74pg2ykvdAvnvqytH9JXeFtPJ+5CDVYlu/VMHQxrutREDJH+E
 FVkUzMP++NPYmthcWZywgPqVSrZ2wEv89tYX9xmmEFv50w1RBeGyUGsRwyV6b2NccMle
 o5fJMaDducywWZ8K9zyOObeqopPEOsZf8xU3r3bnrusgtg5nDXZwOmL+Q9TliHJ70zkf
 hKxAeMSq36RZk0+lWwzoeYgzsZFspq36AqNXAp7dIwWmFVi7kJB7u7Wwiz05XDkwIw3X
 RyPQ==
X-Gm-Message-State: APjAAAUTMO5OMa6/fcf/E63b5DLcWGUGlIWC0MSYtcl/XDIF8S3w5eQf
 8OX9SFbRDh6zz6Xc2HUjlqeUjKzsORNCckmt+r2irg==
X-Google-Smtp-Source: APXvYqxagnptoMxms+oHKw70wMD1Ppel+2h+/erI7kijOCThCVuU/uDVbNBLBlbAu3gV8rJ7NsEmWSq+eFFL55yBBMU=
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr1211759lfo.139.1580350777019; 
 Wed, 29 Jan 2020 18:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-13-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-13-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:12 -0700
Message-ID: <CAPnjgZ1XNn+WZJHdvs_DTwOiw7NF-qtW4wjXA-i10X+Q5tycew@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 12/21] gpio: update dir_flags management
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
> Update the flag management in GPIO uclass: the desc->flags is always
> combined with the requested flags and the GPIO descriptor is updated
> for further call.
>
> Add a function dm_gpio_get_dir_flags to get dynamically
> the current dir_flags (configuration and value).
>
> This patch prepare introduction of the dir flags support with new ops.
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
>  drivers/gpio/gpio-uclass.c | 27 +++++++++++++++++++++++++--
>  include/asm-generic/gpio.h | 22 ++++++++++++++++------
>  2 files changed, 41 insertions(+), 8 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
