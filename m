Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74865433A76
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Oct 2021 17:31:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3CD54C5C853;
	Tue, 19 Oct 2021 15:31:40 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 852F6C5C853
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 15:31:37 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id d131so6582026ybd.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=slqLCDNqV9Na+9dLQ2VtTo+lHmJIFcEGwZRdTgWqej0=;
 b=B555SIHq4eAVQ4I71z6TG92lBljqNr4KzXDWhZxZaSthArdhKqJkLQtZ+/9s+wOUv8
 FAldyYeaKJUaQOU8OXvChago12xqaYjJJB2QRwlNtUoU1b+GPmwXrz1cnfqMNnVadV1g
 B0H3rFRxMGvziX3IK6IV0lZfdI7zakHdObNCeYEwdTC4xWBi2OX1r5Y6uElY03iWf3nA
 AG0IwYm2eBc79bdBldq2j9ZZguq47jkJ8MB10TzGhFeaJQkHORem9ZTg2HdKxJIxa1tr
 0qzz2hVg5efCX+OrRhgiZ2otIQXPxwpTeBX/Qtsrdl7lxD0m8Tg+omwOMiLrazv1D2UT
 MZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=slqLCDNqV9Na+9dLQ2VtTo+lHmJIFcEGwZRdTgWqej0=;
 b=n7XS19dspFsMWbg2zb7ZrboHJP7qawz8UezR4AvUdA+yfLW7PtdiuGcMlHydD3nMTv
 oMGcvpIZ3XagC0R0ArVfQ3Q3Py7Jt6ol+5fh2fiM/6svNLkr8p5P+NB5hZtlJ2rPaj+B
 U0SnBVKxYvBLPDMfjogC+Bl86PsXfyj6V3sNMZK5j/KY5dGpDX7JRoQV3/TkaGJXnooG
 D4O5EL1zd8bxIWRGHoNO1CS3HVEmmNZS1fmSO70vHHSEPF1Bpmx9SOxYEcuiOUSSVZ+e
 2HTODtW2N8NyJRDQuEOY0IooIuTyMZNtgLHO40kSIbB84ko8vu+olxKvHM7VK7uR1JBK
 Wodw==
X-Gm-Message-State: AOAM532ymBapvRh/LqlX50rwCbby4pJHmtALo1kZYxAcD1K4jEEplr46
 YR2I4Un6Z3bLZEM2sKnd07ly+aWyJmQ7FT70rmGPWQ==
X-Google-Smtp-Source: ABdhPJzcRMnIKYPpzpXR2+UYEfneZEEB3THaXIXlDI8tKO04VTh3EJMk+ASsSMAz5NHPhneMOoJX4mASNcWkAv1X2VY=
X-Received: by 2002:a25:bacd:: with SMTP id a13mr39429602ybk.216.1634657496524; 
 Tue, 19 Oct 2021 08:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211019130725.171193-1-ilias.apalodimas@linaro.org>
 <CAPnjgZ3TOc7aEBWx0JDy3L=b1C-u39A6gnFFjqT5U1L9H4dDug@mail.gmail.com>
 <20211019141733.GD7964@bill-the-cat>
In-Reply-To: <20211019141733.GD7964@bill-the-cat>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 19 Oct 2021 18:30:59 +0300
Message-ID: <CAC_iWjKLDA8eK+rGkYHnvH5je7RoOeXOruzKhr=MM3j-4VvxLA@mail.gmail.com>
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

On Tue, 19 Oct 2021 at 17:17, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 19, 2021 at 08:03:07AM -0600, Simon Glass wrote:

[...]

> >
> > For some reason this still does not apply for me on -master. Can you
> > please confirm the hash you are using?
>
> The hunk for scripts/Makefile.spl still fails (it failed on v3 as well),
> but is easily fixed-up, fwiw.

The reason is that I rebased on top of the prerequisite series, but
failed to pull in -master.  As Tom says it's a single line of code
that's in conflict.  Shall I send a v5 or will you pull that in Tom?

Thanks
/Ilias
>
> --
> Tom
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
