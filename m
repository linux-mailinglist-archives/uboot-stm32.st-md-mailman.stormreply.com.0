Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3714D532
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02045C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:30 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C20C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:28 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id q8so1549841ljj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j53VTAORIMUyMKGATblHqY3+5XY0uwlWCV8bXgElzWQ=;
 b=i0jnR01cz1vDFU4nkMASb7YJ6K5oHqaN+gPGoH9f0HoAzAIBjX7XWLVqv6AUb4TXjI
 dx1OncOV8KnefCi0uM5s+VZktxhJ21i1fMS0QY2+yERE3ZLw/UOE2IRwjgV2H92955BH
 FnFUz30hLeco5R0022x3sNN7lrDegLb0KcdxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j53VTAORIMUyMKGATblHqY3+5XY0uwlWCV8bXgElzWQ=;
 b=pqgPPtsPpTbHAN3idxsmFlXBD5JSoL46spUvqS7q1E7UN8lA/kJwWSzRG44w0GHWwd
 ZmPSO+66tagVYhvhec0xfGvmzx+fi6udXM/HSXVrPUdlX6RtFlepsDXmmyy6cgv/uBXY
 KvDZHbbY0IKHXffkqDDpulpaalAV6Xqte6GXjXiVXH6I0/bIhRCNjFXkeFopyk06gWLd
 yCAvoAwhiPVZH7Pw1Sl3VjnxAM9wCaVYJVi9hqyX/dOxPoOmzZSVPRdhnXOl35vFyd5I
 zpbWVh8Gjg3vSxvsrsWfMzp26fXcq1pjbM1VVNoB9t0tjLwevlyrdwcYEtjop4IXlxSD
 dQTA==
X-Gm-Message-State: APjAAAV1TGV8Reag42proTS7Mnaekb1HKOfHcHzR4p4+kalZtpdqZRw6
 xjbudA27z/u7tO9ciAWbUK62E1Y/Qxk1ZqwSPrwdrw==
X-Google-Smtp-Source: APXvYqzoaLvcG7vwrt+IF8jeK2d+unCIoE+2hdqal7av17Kk76WLlojArAwfEP5a/4NWf9yqYWAgCYKbwUXUUzKh9o8=
X-Received: by 2002:a2e:3c05:: with SMTP id j5mr1179165lja.131.1580350767386; 
 Wed, 29 Jan 2020 18:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-16-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-16-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:16 -0700
Message-ID: <CAPnjgZ0-vVqXSKzHzFuSCyCQ_0TBEHAeKt1TBzE4R=CrK2SH9Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 15/21] gpio: add ops to set dir flags
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
> Add the ops for GPIO driver set_dir_flags() to set the dir flags.
> The user can update the direction and configuration
> of each GPIO with a only call to dm_gpio_set_dir_flags() or
> dm_gpio_set_dir() and respecting the configuration provided by
> device tree (saved in desc->flags).
>
> When these optional ops are absent, the gpio uclass use the mandatory
> ops (direction_output, direction_input, get_value) and desc->flags
> to manage only the main dir flags:
> - GPIOD_IS_IN
> - GPIOD_IS_OUT
> - GPIOD_IS_OUT_ACTIVE
> - GPIOD_ACTIVE_LOW
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
> Changes in v2:
> - change the proposed ops for pin config to set_dir_flags/get_dir_flags
> - reused the existing API dm_gpio_set_dir_flags/dm_gpio_set_dir
> - add a new API dm_gpio_get_dir_flags
>
>  drivers/gpio/gpio-uclass.c | 17 ++++++++++++-----
>  include/asm-generic/gpio.h | 16 ++++++++++++++++
>  2 files changed, 28 insertions(+), 5 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
