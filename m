Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 825DB6239A7
	for <lists+uboot-stm32@lfdr.de>; Thu, 10 Nov 2022 03:16:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A149C6504E;
	Thu, 10 Nov 2022 02:16:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91F28C6411D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Nov 2022 02:16:09 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id r14so963890edc.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Nov 2022 18:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3p63yUTt4lATNrK4KRA8EWPtM8q3Uyx+DDeGAGZMax4=;
 b=Jcoe72SOBKYoKiOXAm86opVc8a8PnnTH2hNtxjPYG8D48ZaMNjNrpY6x+AXU3G0t29
 cusHvsG4ln+jO5BGf9x4Zi6B8v2DEwfwdbZDg6mzLjT35/xquMtzQNp8tf3vwKRweCqT
 w+BpF9MBP/6E/uUynZWY1tTpLxnOY/0gyZV2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3p63yUTt4lATNrK4KRA8EWPtM8q3Uyx+DDeGAGZMax4=;
 b=NLa/5WdNRj8r9WNWZeK3hUAHLMJ+CPwRBu3rp8p3kkv5Ki3AT+CUbGmCqvx+IOAW86
 W6vCwSUW1BwwVGjTYjCaKT0YvO2nZ1ADLXpoCaVkD1VUrdFhmjEpGZE3WSRaZmciW2ER
 gh/5VXbd6yJih+6yV8MfRxFTnmJEo56kvHuPWhEVusOSLt33Hkz5QIynovlZ/1CcHBpc
 UBIlEAKxK04F4zQNQRGOSLGCtVnDMwt7QmncKLnXFHTUxc8V2y8d0fjsCkMJbHo/IM+K
 YC1pxDUaW/OHYsWRbEJGVvGtIClWG/hpMTQa0FOYXwoiRuWzuvVdhoSGnCO/zqZmjeBl
 f1yg==
X-Gm-Message-State: ACrzQf37oQXXskkUP+VtS9buQj/+tcKGHlZhXpxKRIaWEowlDx8IU/4n
 6K2kpkb+s53F2YQhjZex0Qe66vWrohC6LT8K5PtxHQ==
X-Google-Smtp-Source: AMsMyM6makesUFuTVKqwFjq3OfCr/5wlgUkCmwj25Bff4OiLFunWLhEWCVSCkHDQQjP7PBYHmWqSgmlQ92VQB0JglDM=
X-Received: by 2002:aa7:d282:0:b0:462:1d0f:b172 with SMTP id
 w2-20020aa7d282000000b004621d0fb172mr61079202edq.211.1668046568681; Wed, 09
 Nov 2022 18:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20221104224844.467576-1-sjg@chromium.org>
 <24ff452a-e787-1816-0c70-5e3c931bda7e@gmx.de>
 <CAPnjgZ3-EGARntQYTVsg0=yjkWvpiggq2HMLt=7ghtRx3RxQnw@mail.gmail.com>
In-Reply-To: <CAPnjgZ3-EGARntQYTVsg0=yjkWvpiggq2HMLt=7ghtRx3RxQnw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 9 Nov 2022 19:15:56 -0700
Message-ID: <CAPnjgZ3JWS7qo6xRVGWbDhoSrALUPNw-qGMqO8MmSSR6egtsTw@mail.gmail.com>
To: Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Steven Lawrance <steven.lawrance@softathome.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Stefan Roese <sr@denx.de>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
 Sean Anderson <sean.anderson@seco.com>, Lukasz Majewski <lukma@denx.de>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Anatolij Gustschin <agust@denx.de>,
 Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Andre Przywara <andre.przywara@arm.com>, Andrew Scull <ascull@google.com>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Artem Lapkin <email2tema@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Andrew Davis <afd@ti.com>,
 John Keeping <john@metanate.com>, Ovidiu Panait <ovidiu.panait@windriver.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2 00/25] bootstd: Add a boot menu
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

Hi Heinrich,

On Mon, 7 Nov 2022 at 16:35, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Heinrich,
>
> On Mon, 7 Nov 2022 at 12:15, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
> >
> > On 11/4/22 23:48, Simon Glass wrote:
> > > So far standard boot lacks a boot menu, although it is possible to create
> > > a rudimentary one using the existing 'bootmenu' command.
> > >
> > > Even then, this text-based menu offer only basic functionality and does
> > > not take full advantage of the displays which are common on many devices.
> > >
> > > This series provides a 'bootflow menu' command which allows the user to
> > > select from the available bootflows. An attempt is made to show the name
> > > of the available operating systems, by reading more information into the
> > > bootflow. A logo can be read also, where supported, so that this can be
> > > presented to the user when an option is highlighted.
> > >
> > > Full use is made of TrueType fonts, if enabled. For cases where only a
> > > serial console is available, it falls back to a simple text-based menu.
> >
> > Please, add the link to your design document
> >
> > https://docs.google.com/document/d/1VQeApnLlH6xKm_OI36AhWkJLUEd9OXEvIJXB8aM2de8/edit?resourcekey=0-DwgHpR2S8vJEJzvvwPb-AQ#heading=h.17wg41voij6q
> > is broken.
>
> What happens when you click that? It works for me.
>
> >
> > in future version of this series.
> >
> > The series leaves us with duplicate code in
> >
> > bootmenu_choice_entry() and eficonfig_choice_entry() as well as
> > bootmenu_loop() and bootmenu_autoboot_loop().
>
> Yes OK, but that is the case today and my series actually removes some
> duplicated code, so perhaps that could be cleaned up later?
>
> >
> > The bootmenu command relies heavily on ANSI sequences but VIDEO_ANSI is
> > disabled by default for CONFIG_EFI_LOADER=n which means that the
> > bootmenu command will not work anymore.
>
> Does it not work, or does it just work but in a serial fashion? I
> don't see ANSI codes as being necessary to show a menu.
>
> >
> > >
> > > All of this is implementing using a new 'expo' construct, a collection of
> >
> > Expo is not an English word. Expo is typically used as name of trade
> > fairs. Transaction probably is the right word to use here.
>
> That is debatable I think. Transaction is quite generic and appears in
> U-Boot >400 times. I think it will just be confusing, like the word
> 'metadata' used in the FWU stuff.
>
> Expo is short for exposition. My use of it is somewhat archaic
> perhaps, but even for the meaning you mention, a public exposition is
> not a bad description of what is provided here.
>
> I am not 100% convinced about 'expo' either. Do you have any other ideas?
>
> >
> > Files expo.c and scene.c are in boot/ which does not match a generic GUI
> > feature. They should be placed in lib/.
>
> Yes I was wondering about that, but thought that boot/ made at least
> some sense since the menu will only ever be used for booting...?
>
> I can move it, but I am a little nervous about that, since lib/
> normally has utility libraries. Perhaps lib/expo would be better?

Just to say that I replied to your comments on the doc also, so let me
know what you think.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
