Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49560433B3F
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 17:52:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 006A5C5C856;
	Tue, 19 Oct 2021 15:52:37 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9ECDC5C853
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:52:34 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id u5so723565uao.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyQTiUOfkQTuEYctIthRbRGvy0XotuVt2GiKqEgGaZk=;
 b=dB0zcxNtdGM0JNnZmxmEZYtm/+MErUIe0LismTuy2ftacUq1R08kSkSaodaT2YhSR8
 e4fxRyT7v/6IwJJDlv0CgdvMxsaBEDb3yTLC5BSi/nuPRpKLDV8eCwIV8ZsuzX4Qrsgj
 fJhNxWe8upw0IzpD+rKh8SHbfbrzd/ayMW8wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyQTiUOfkQTuEYctIthRbRGvy0XotuVt2GiKqEgGaZk=;
 b=JZ3/LwzuPSaK4IPS8lC0Qzq6zOH3adgWrE9Inbfn1GPISjQvyEgE7y6nJSc5qgQNo+
 LQcHF36ktlfbnKGg4QhDlkKTEfGTUpTv6XpLB+DEVHYBAtcJCYIm1ydfIUHqIhuMHuNQ
 sHZAvWA0M/+OT05OB/hv6M0YY8fuUMDNdSuLrZmHKzUqKop5kFbKaBv1bnCYMx7Bc/Sp
 a+2rkPIKjWhnbn8tvwfbeeLZLjgCGnsaO5gPQejkW+6pmWRF6HujpqdSZl/NhLlVKGF3
 8rpdgnseRu8WEkgEIjJyG8LvOB4fXNz256ecqspEMxeusE2m9lx9cobDTjSjn6LqfARU
 cJ1Q==
X-Gm-Message-State: AOAM5317sQLe+cYvJt9O5dhVUezO+JuOeH6Z+hrB0iUwjJNzMBrujrpo
 qg7HArpluLS5AfT/zBBzceCvVl7IwRz6pFNDfnl/Gg==
X-Google-Smtp-Source: ABdhPJyPnsS4kXvVG2a2g1Q3JpEvW81zaK3zTn6FU1Q0faGHu9d+WW3sn2o0Zc/72BvhwvCO5XNqsgxu2pcRv6JTCxE=
X-Received: by 2002:ab0:14a7:: with SMTP id d36mr806518uae.96.1634658753430;
 Tue, 19 Oct 2021 08:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
 <20211019141733.GD7964@bill-the-cat>
 <CAC_iWjKLDA8eK+rGkYHnvH5je7RoOeXOruzKhr=MM3j-4VvxLA@mail.gmail.com>
 <20211019153619.GH7964@bill-the-cat>
 <CAC_iWj+SMQMVx_ckTsc_YySAOiW85ANaToDGvsBp0C4_B8EZnw@mail.gmail.com>
In-Reply-To: <CAC_iWj+SMQMVx_ckTsc_YySAOiW85ANaToDGvsBp0C4_B8EZnw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 19 Oct 2021 09:52:20 -0600
Message-ID: <CAPnjgZ3bDUXmgxr9wzC3dS57h1zB0Z2FwsvWtjZK5m566yfMwg@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, Rick Chen <rick@andestech.com>,
 Sean Anderson <seanga2@gmail.com>, U-Boot Mailing List <u-boot@lists.denx.de>,
 Zong Li <zong.li@sifive.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Tom Rini <trini@konsulko.com>, Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
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
 Priyanka Jain <priyanka.jain@nxp.com>,
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

Hi Ilias, Tom,

On Tue, 19 Oct 2021 at 09:38, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> On Tue, 19 Oct 2021 at 18:36, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Tue, Oct 19, 2021 at 06:30:59PM +0300, Ilias Apalodimas wrote:
> > > On Tue, 19 Oct 2021 at 17:17, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:
> > >
> > > [...]
> > >
> > > > >
> > > > > For some reason this still does not apply for me on -master. Can you
> > > > > please confirm the hash you are using?
> > > >
> > > > The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
> > > > but is easily fixed-up, fwiw.
> > >
> > > The reason is that I rebased on top of the prerequisite series, but
> > > failed to pull in -master.  As Tom says it's a single line of code
> > > that's in conflict.  Shall I send a v5 or will you pull that in Tom?
> >
> > Well, what should that look like exactly?  It fails to apply cleanly on
> > current master.  I had swapped it to CONFIG_SANDBOX, but I gather from
> > Simon's comment it should be OF_BOARD?
> >
>
> It should be OF_SANDBOX.  I tried to fold SANDBOX to OF_BOARD befire
> sending it, but I had some failures I didn't have time to investigate.
> So I'll leave that to Simon's further cleanup

Yes that's fine, my OF_BOARD series can clean it up. We can leave it
as a special case for now.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
