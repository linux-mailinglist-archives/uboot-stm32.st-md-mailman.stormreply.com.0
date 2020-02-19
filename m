Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA8163D75
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 08:28:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC4CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 07:28:05 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A7FEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 07:28:02 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id w15so8490186uap.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Feb 2020 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2ipNImJFECk7ba7hD5WR2HZ7NAlUtvDxxHC1kAKIAo=;
 b=rBjpCMYNiQXRsaAQwARdl3xmIpdUPEOh21jdew+uUaLolQC8VhVNl/YouxcjXHs7/5
 Ere4dIA+ulSqBqtz/zOmS3ufoHeSWH67NbCFPlWG+n+0BeV7vZnBMDTnQaN3A1YyS8ro
 xOExbqTwFa9waeJu0lctuIJI45it4JmEQl3zoY/b7KNQZfq/Xqorv2EfjjrXkKYgpvbQ
 7OfYRFUTnJUovT41CX9EwuUrx8FAU0JRl72Tp1gNgPos6QglCXKMaXprbN8A5OZZQ2SF
 jtYjkBzJB293vpooc3RIAc9F/KH8KYrhpBQ6Eg7x2aax3cdSGMW+sJg8f84stigx993v
 CFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2ipNImJFECk7ba7hD5WR2HZ7NAlUtvDxxHC1kAKIAo=;
 b=sJrSg++aTTbd32uSo3yMicE24DnKXhAVKn0MzGpuGgVlJ3L8/VuY4e5hBCbHARNDLz
 ACfY7Hut+N/uVdjf6pTE6paqKmSwsyKANQ+6vP2PqL8xRaoZOT/ut5PJg2R/06HHi+UN
 pBwHrnPtuq6580QlVU9jljzGOOXdvsiU3eoS2YB5t2cXej/+NDN5HTScUeLm7fPSbVB4
 rmheW/zDkdGnC06bbgY8aT+iYQxUVdxkjdFsz2BmAFYkIiIc9ODA4IevUNl2zrYl17ct
 D64ttTMdgpBs3WtbCq01pv24SyhDKM0i9S/gg8kD2P5UaPncKq4IaJ11CNWLHNqFXcx8
 mnJw==
X-Gm-Message-State: APjAAAXGKVw0J1Bx2URlCI0xz01eZtFM+R11WRmKKaZrdfIECbWFopMJ
 2cPawf98xnlRYU0PFI1G8ECKjkjtLVHSuFkJlSY=
X-Google-Smtp-Source: APXvYqw1ROM+yy99f0lrESmz7QGa8+SH3+hg1vJQoIeE/b9eI6Y9ppH3XdkpPjiNKx77jc0PBsnAu+ScTpaBe2FfuLc=
X-Received: by 2002:a9f:282a:: with SMTP id c39mr12140092uac.103.1582097281163; 
 Tue, 18 Feb 2020 23:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20200218083503.5468-1-patrick.delaunay@st.com>
 <6ca7cd1f-c86e-aa38-adf8-8b9ee3f56dd8@denx.de>
In-Reply-To: <6ca7cd1f-c86e-aa38-adf8-8b9ee3f56dd8@denx.de>
From: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Date: Wed, 19 Feb 2020 08:27:50 +0100
Message-ID: <CAAh8qsy6yDHsUu3Mv=Oma0SMn9QLdNVLjQHF-yTugmB4_fahRA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Peng Fan <peng.fan@nxp.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sekhar Nori <nsekhar@ti.com>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 b.galvani@gmail.com, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Michal Suchanek <msuchanek@suse.de>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v4 0/5] usb: host: dwc2: use driver model
	for PHY and CLOCK
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

On Tue, Feb 18, 2020 at 6:53 PM Marek Vasut <marex@denx.de> wrote:
>
> On 2/18/20 9:34 AM, Patrick Delaunay wrote:
> >
> > In this serie I update the DWC2 host driver to use the device tree
> > information and the associated PHY and CLOCK drivers when they are
> > availables.
> >
> > The V4 is rebased on latest master (v2020.04-rc2).
> > CI-Tavis build is OK:
> >     https://travis-ci.org/patrickdelaunay/u-boot/builds/651479714
> >
> > NB: CI-Travis build was OK for all target after V3:
> >     https://travis-ci.org/patrickdelaunay/u-boot/builds/609496187
> >     As in V2, I cause the warnings for some boards:
> >     drivers/usb/host/built-in.o: In function `dwc2_usb_remove':
> >     drivers/usb/host/dwc2.c:1441: undefined reference to `clk_disable_bulk'
> >
> > I test this serie on stm32mp157c-ev1 board, with PHY and CLK
> > support
> >
> > The U-CLASS are provided by:
> > - PHY by USBPHYC driver = ./drivers/phy/phy-stm32-usbphyc.c
> > - CLOCK by RCC clock driver = drivers/clk/clk_stm32mp1.c
> > - RESET by RCC reset driver = drivers/reset/stm32-reset.c
> >
> > And I activate the configuration
> > +CONFIG_USB_DWC2=y
>
> Simon, can you test this on SOCFPGA ?

I can test if it probes, but I don't have anything running on that USB port
the socfpga_socrates board has. Would that be enought to test?

Regards,
Simon

>
> [...]
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
