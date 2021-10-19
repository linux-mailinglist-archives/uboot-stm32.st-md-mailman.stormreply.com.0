Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F698433ACE
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 17:38:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A7C0C5C854;
	Tue, 19 Oct 2021 15:38:46 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19193C5C853
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:38:43 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id v195so3895424ybb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p7iHZuVM7j9qr48DIoUn57aGfWjpoBdOW01a9VfjRWY=;
 b=W4Wee8oZ3dIbQjU3ENn+EuA87jc8BQsyebDccNpoWoDSYZHCj/ktvqmY9iooJbQOOB
 NrzQq0oObflVnbZngyeUOTEJR6dgtSu2FVMQXd99Bwsm/msui6zkrCpc1s+CB7vOWNnO
 Vy7KxD2PWAFZe10muJticBcsSjxfNGTiqjZTndO3TeNPk7JN1O6SLh31mlsXLqA4QDO2
 1ALAaIX9Xaw7xLFEJvRXlhrT7SAzPfwCnmd5hCVsfXmXM9FylC4YRxlQznM4xoR5BVFz
 5kE0fy6e61X3+Ey5NIUdPWAMGLB92o9GxqcBrTVV5hXWnFaC7WmU6Cx1PdeVcUah0yuf
 hL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p7iHZuVM7j9qr48DIoUn57aGfWjpoBdOW01a9VfjRWY=;
 b=UQkY0Y1SHuUBI4nZ2MfcQjzQtNYOTbhC4MevxqQDFVud7FGDBpEf1hYkbc0OkijXI6
 UH2GCH5x79IZovvBHsanuLG/WOGkwbtCBdtcOl5hoNRqi0UapaLUSJXkiN0w8xG+RXiJ
 sFimV9Izx6wYm6tjL3v2RJNYUOs2b7Vi5KHpmB7Nr7Pi1/HsczZaBn8W2of5ghhIvZc/
 OyBkq1UpWksDnZoorqN55zYihZGA/tMl43kQ96g/1uSUwX/QHW0II/78sgqvh+gWZBDZ
 18tP5DSC1M3OBN48TsuEXsw1ZODXHwm7OBR1nJlIdVqNHmOlCDLEBN5sDRCAgiu3p8sX
 qKFQ==
X-Gm-Message-State: AOAM533tsqmH2ZN/RhZsnmLj9229qo2RsA6rThnZZA8PZx2YD4Vl5gxh
 UMpnjEQmz/qP0aQJ2u9HQWhwOyIqX7P6t0xNOPz5qQ==
X-Google-Smtp-Source: ABdhPJyTXU0cldkGhcZ0dmQTmpMB5HnCoZNyf/AIkrXpNnEc5EAmOV6JtfRycoN5USWBn/7YK4WND+rYWa7HwkL8htw=
X-Received: by 2002:a25:bacd:: with SMTP id a13mr39475149ybk.216.1634657922523; 
 Tue, 19 Oct 2021 08:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
 <20211019141733.GD7964@bill-the-cat>
 <CAC_iWjKLDA8eK+rGkYHnvH5je7RoOeXOruzKhr=MM3j-4VvxLA@mail.gmail.com>
 <20211019153619.GH7964@bill-the-cat>
In-Reply-To: <20211019153619.GH7964@bill-the-cat>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 19 Oct 2021 18:38:05 +0300
Message-ID: <CAC_iWj+SMQMVx_ckTsc_YySAOiW85ANaToDGvsBp0C4_B8EZnw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Zong Li <zong.li@sifive.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Heiko Schocher <hs@denx.de>,
 Asherah Connor <ashe@kivikakk.ee>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Ramon Fried <rfried.dev@gmail.com>, Peter Robinson <pbrobinson@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>, Wasim Khan <wasim.khan@nxp.com>,
 Harald Seiler <hws@denx.de>, Nandor Han <nandor.han@vaisala.com>,
 Andre Przywara <andre.przywara@arm.com>, Tim Harvey <tharvey@gateworks.com>,
 Green Wan <green.wan@sifive.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Steffen Jaeckel <jaeckel-floss@eyet-services.de>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo Yu-Chi Liang <ycliang@andestech.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Pratyush Yadav <p.yadav@ti.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4] sandbox: Remove OF_HOSTFILE
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

On Tue, 19 Oct 2021 at 18:36, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 19, 2021 at 06:30:59PM +0300, Ilias Apalodimas wrote:
> > On Tue, 19 Oct 2021 at 17:17, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:
> >
> > [...]
> >
> > > >
> > > > For some reason this still does not apply for me on -master. Can you
> > > > please confirm the hash you are using?
> > >
> > > The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
> > > but is easily fixed-up, fwiw.
> >
> > The reason is that I rebased on top of the prerequisite series, but
> > failed to pull in -master.  As Tom says it's a single line of code
> > that's in conflict.  Shall I send a v5 or will you pull that in Tom?
>
> Well, what should that look like exactly?  It fails to apply cleanly on
> current master.  I had swapped it to CONFIG_SANDBOX, but I gather from
> Simon's comment it should be OF_BOARD?
>

It should be OF_SANDBOX.  I tried to fold SANDBOX to OF_BOARD befire
sending it, but I had some failures I didn't have time to investigate.
So I'll leave that to Simon's further cleanup

Regards
/Ilias
> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
