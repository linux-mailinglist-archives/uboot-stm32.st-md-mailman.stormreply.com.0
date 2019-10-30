Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC44E94D4
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 02:48:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C690C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Oct 2019 01:48:34 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57BFBC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2019 01:48:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id g81so600752oib.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 18:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XZ6zpzJfgNOaInq4XmVFvWpwpqjrrWTIVlWCDva+dQ=;
 b=fUVTEQmioldoxnWs5Nuh0DRkKXTqFX7MqDrYrQ8w0AtB8N0W0m94YCw5cIs5G9KFtI
 cmWvJULbo9xLTEf8CaC6LQXOXQGHI6fFfTcDvvf44weeZfv/MLkmZXmKccFS2OyF1KS9
 ThwVcyH3RKf4DjwIeDG/NZiBBEM6u8d3ouhC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XZ6zpzJfgNOaInq4XmVFvWpwpqjrrWTIVlWCDva+dQ=;
 b=pmPHRMfi6JP7J37VMbWXQBdetrGYFe2HjRh4Dhm9b2STyVHT4sVej340X50wCnob8u
 HvcTg/e68Yqs8A9irFqIEzD++JA6WbH6PbpsyTZfNpTQnxMpC35BpAOxhSEYJEeUOnc/
 Nss5+nK2UADnrow27wOdq5LGHQxjTtxjXg1p5lDTbgXba4DNlMcccCDTVC8xy20yOLTy
 M5cy7Fn0LDF/O/aazTgygsZ30Y0JpDGJiH6CHU+y8zSCubR2Kx4gPFBBHD78w7VSWXCN
 4LBZESuV3xVUKbOB9WbvAUnD/sv4XJmj7U3sr6zGSBFfyuJof7FwV3xZz6AfZfnyINdU
 vWtg==
X-Gm-Message-State: APjAAAVmK1AVP53m8UH9SgUDoyEO4SfRWBaKE+ry8iCP+s1V1BRJvz4m
 bvffOHDJ1fWfxxSi72ZcC5f/6+NRN3E0rWW9wpGsJg==
X-Google-Smtp-Source: APXvYqxp5KuJFwrPXgBjzaii+6aqM6Yb7S9kKYoR0UMnnJajCM/3nzOpn2KQPG/cpXJ0iRjjUEmj+UETLKhhgMvc2W8=
X-Received: by 2002:aca:281a:: with SMTP id 26mr6482929oix.130.1572400110503; 
 Tue, 29 Oct 2019 18:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191023134448.20149-1-patrick.delaunay@st.com>
 <20191023134448.20149-12-patrick.delaunay@st.com>
In-Reply-To: <20191023134448.20149-12-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 29 Oct 2019 19:48:17 -0600
Message-ID: <CAPnjgZ22PGofqr0y9LdBsi1Gqt+tkJeHhECPxrEEv1wweiCM4Q@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Alex Marginean <alexandru.marginean@nxp.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 11/13] gpio: sandbox: cleanup binding
	support
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

On Wed, 23 Oct 2019 at 07:45, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>
> Cleanup binding support, use the generic binding by default
> (test u-class gpio_xlate_offs_flags function) and add
> specific binding for added value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/sandbox/dts/test.dts               | 14 ++++++++++----
>  drivers/gpio/sandbox.c                  | 13 ++++++++-----
>  include/dt-bindings/gpio/sandbox-gpio.h | 24 ++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 9 deletions(-)
>  create mode 100644 include/dt-bindings/gpio/sandbox-gpio.h

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
