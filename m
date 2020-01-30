Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FA714D52B
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 03:19:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA899C36B0A
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Jan 2020 02:19:07 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 194A4C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Jan 2020 02:19:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id y6so1615845lji.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DA1z+DoVKX2xQMnv5dX1hV28TE/LERa/U0WewpdxGx0=;
 b=hfxxnyx0xF5DqvcaFRyVwo2SvwztzAqKB3n278aBWcM6HEvFrP7lSfusYRtabySTk/
 ZehTTIBrV0+s+fdlKWqLVBHiznPRRjRjV9R4ICPepuFhqL12Sdjb/uGpyBqsADhSx7zR
 gAzOH4DrWIRMPuAE28K0dQaonLRYMTYfoVPCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DA1z+DoVKX2xQMnv5dX1hV28TE/LERa/U0WewpdxGx0=;
 b=Dgox47JEOdjY5anXWfMKqTHWlIRagGhXnOP/Niv0QQ6E/Ue5I0xPk2GbrbHYxDizlh
 GnzsNuMTHccIE+xkXHoX/9kZakqurfFeQCr8irQidhWSk7A5YPZssJbi1hUSlU8+ktCu
 8kVPCY0LRzzo7ReJDS5WX9KODuTvwzbYg6E9Pllp1SYjutse6ZHVxkZllq/eyNtYcd4w
 k51tiUmgtY8s0iXta+K89F764gGn8iuqdRZOWO5QYbdjbDKt99lh0tZRNHNASJAEUWek
 x81C1rLqh5xGtAoyRnvqnT4yjEwMxXgtB74UdTdCKIXSmsXKSivV/5FtTUXyYssYdQQg
 RdRA==
X-Gm-Message-State: APjAAAUvuesRh2xHHd7y/tFxaZDEg892VJNsL/uytmSNdcP0sV38lMix
 u8EWeJHoX/r0GtXsf/5mg8TTpeS7/WUHAsWRkRMHJw==
X-Google-Smtp-Source: APXvYqzBdWMmGDQFMwbvtiSzd5SZPm3k/5pNXUANb8raD3IkYkkx4uS9KYdk5i8+t3xUSWG5pwlHixoolv/GPXK3vks=
X-Received: by 2002:a2e:9ad8:: with SMTP id p24mr1231221ljj.148.1580350746182; 
 Wed, 29 Jan 2020 18:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-11-patrick.delaunay@st.com>
In-Reply-To: <20200113103515.20879-11-patrick.delaunay@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 29 Jan 2020 19:18:07 -0700
Message-ID: <CAPnjgZ0oX8FcpfQj36SeGzNw6=6=05bCBSbcdP0J4FaOecjXGg@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Heiko Schocher <hs@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v3 10/21] gpio: add function
	check_dir_flags
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
> Add a dir flags validity check with a new function
> check_dir_flags.
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
>  drivers/gpio/gpio-uclass.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
