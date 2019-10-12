Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 089CFD4C3C
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 04:55:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE061C36B0A
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Oct 2019 02:55:14 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F066C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Oct 2019 02:55:13 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i16so9651889oie.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 19:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GtRvEKGlRJfN4o/qg7bfr4ga7k7O7MGpvhlOg2xRoBg=;
 b=S4KhAzo4X1RYHQrQZ2vDJKQOUTxdPvWN6bEFPooSVY62KLNYaT8Jnnpfi1Ys+MefsM
 8iPlHBPKSsgkGuoiS2S+afZWo6NkSCj6D4PO3pJ34KNnmsq5Nid+czQfKqdrZbMtUdMC
 CCqbmxmwLF0ttTHP6U/+g6OWG2SdJXWg1QSU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GtRvEKGlRJfN4o/qg7bfr4ga7k7O7MGpvhlOg2xRoBg=;
 b=Bb7uU6sa06XQB6LnLrGXpVY432oipg5trOEp0dyID9DNstehBPx6HdHOvvI4RvZUAC
 J6au3yI6BHojLtHZDcZyuLB/FUG6w0h2DOt5pYcIc1Ye00yl0A3UKCQopIjf+pYpNdR/
 aqGuAeFD1sWjLhmeKQAH3CAX62NMeG48jqqKXlDRwPVQHyAYTjH/jdQBj9pe6BtPkXID
 bn1wBs9s752Hk2csqOE/vxO1gQFfxFm2infBPB4r+pYwcgJB3cosz+lfEtITgypfJDMt
 CsprpYk0gDAkWuzkpMZChu3qgagf3LcddlABV1A3tSHpzYeufxPL83AwbMDp1lQE42Fh
 PZHg==
X-Gm-Message-State: APjAAAVGI0oIhcQ74m6+NZNQx1TSuTZh2udFlu+HI3dcvVmQuzlL4qm2
 crS8ZtoL0ZReCYxOg4HUrSfATu8Nn2KUUHtwT7SQSA==
X-Google-Smtp-Source: APXvYqxEpJUu+9P3ypybbTdKNJbS+ma9qyEyI/4zkEIqpa/uIO2ducwldOrkQh9smZpejsajRZxoEenWBbZ8Vv2mCeQ=
X-Received: by 2002:aca:5b02:: with SMTP id p2mr14628124oib.94.1570848911811; 
 Fri, 11 Oct 2019 19:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <1564750081-31319-1-git-send-email-patrick.delaunay@st.com>
 <1564750081-31319-2-git-send-email-patrick.delaunay@st.com>
 <CAPnjgZ13q4orq=Yp6r=LzT-uahzaQTF7fcuzdGDGLwrLF76abw@mail.gmail.com>
In-Reply-To: <CAPnjgZ13q4orq=Yp6r=LzT-uahzaQTF7fcuzdGDGLwrLF76abw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 11 Oct 2019 20:55:00 -0600
Message-ID: <CAPnjgZ2jc=2wewxgQszLH9PsiiirR=GO78RcwqJ3DHbGd5x7qQ@mail.gmail.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Cc: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Ryder Lee <ryder.lee@mediatek.com>,
 David Wu <david.wu@rock-chips.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Chris Packham <judge.packham@gmail.com>,
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 2/2] dm: pinctrl: introduce
	PINCONF_RECURSIVE option
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

On Tue, 13 Aug 2019 at 03:34, Simon Glass <sjg@chromium.org> wrote:
>
> On Fri, 2 Aug 2019 at 06:48, Patrick Delaunay <patrick.delaunay@st.com> wrote:
> >
> > In the Linux pinctrl binding, the pin configuration nodes don't need to
> > be direct children of the pin controller device (may be grandchildren for
> > example). This behavior is managed with the pinconfig u-class which
> > recursively bind all the sub-node of the pin controller.
> >
> > But for some binding (when pin configuration is only children of pin
> > controller) that is not necessary. U-Boot can save memory and reduce
> > the number of pinconf instance when this feature is deactivated
> > (for arch stm32mp for example for SPL).
> >
> > This patch allows to control this feature with a new option
> > CONFIG_PINCONF_RECURSIVE when it is possible for each individual
> > pin controller device.
> >
> > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > ---
> >
>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> > Hi,
> >
> > Found her a proposal to have a more clear output of "dm tree" command
> > and to reduce the memory footprint of PINCTRL_FULL for the arch stm32mp1
> > (bdinfo "Early malloc usage" is reduced from 2588 to 2144).
>
> Gosh that is still a lot! But a nice improvement.

Applied to u-boot-dm, thanks!
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
