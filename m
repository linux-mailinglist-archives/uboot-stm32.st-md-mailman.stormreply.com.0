Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEEA9AB496
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2024 19:01:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC9DC6DD9F;
	Tue, 22 Oct 2024 17:01:26 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE4DC6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 17:01:19 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a998a5ca499so739567166b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 10:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729616479; x=1730221279;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5hZ7TxmuWVdMYQM6FK4UPGLewCCDmvomuMHhfQf+4Is=;
 b=RcbPdEx6mVXBjU5ztmiiq2pYw5MsV3y8kRBwPDwewrnAD9VD87lHBmsb28gER7sb9T
 eve4v4CZ+lMBcV8eRfrf/ersNZ+bNp7TyF+lxvkm0ROb7gcMgxudADXycvJja1JvEhTr
 9iT6x4dArOliLFq/XnUO3h4tpOnpd66aCpUJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729616479; x=1730221279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5hZ7TxmuWVdMYQM6FK4UPGLewCCDmvomuMHhfQf+4Is=;
 b=WMVWNRyXqzPdH6uu5z5oXKkkQMXYcLEEEMczqFN9ye4GQ0teWnwoaHwlyVc36vDo6M
 ebDEAEifxESpm5QY7AOq/S88V+K6X3dUo8Z1syYHJiB95toU2GYRpR9AaLzZvaVhW/hY
 Mnxsws1OK49YrPbEw/yqWKB6VNGMTj5gRhetk7Y9aPzgyibdETKmfXLNK8BoWuyPCXQk
 8ztIkdzi7XQ4z+9Xl//DERi7vSF8YQStoP3ZoB55jup9QNm2qIQpSQNoEm4DMct/j1Ln
 WRm3iyiAxi2gwICeyXsXoUpEjB70O4gbb4U9Dmpb+nSkAvl/j6NXTUIDL45K4VZ+n5Ky
 EJqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXVKl8zDp7FG0d97YTdQiwIktYnF9UofdbIf4k1iqGJXyOtLe96brXQtATHCTFbjT6oWe+7vs2KoqnxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPwr4dp8fymr3QXe94kJtyhg1VlG3GNlLpAQ8X2AHfEv7bnyGP
 6S0YtBxygV2MFqMI8EznzEATcXclEJrBwXPYN9v+ywNvO2VUZ4JwN1exzgGCtKzrXo199a6t2h1
 olbIKTIK1F0wqulgITwxlRipkwgEne/0DO1v8
X-Google-Smtp-Source: AGHT+IGJ27CwJs4Z4ktN0LEh0MeFx/aFCCbkqFj3PWkvwAXZmKv/dop3LkcszLXflbY9zGGkn9pkPmC8IR3Q8xchsUs=
X-Received: by 2002:a17:907:928b:b0:a99:5773:3612 with SMTP id
 a640c23a62f3a-a9abde181e0mr4338666b.36.1729616478862; Tue, 22 Oct 2024
 10:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
 <CAFLszTguu7hRpsSLxADsBkMgTzA_-fAR0t8Axv+8=OvxJvSRCw@mail.gmail.com>
 <20241022140204.GY4959@bill-the-cat>
In-Reply-To: <20241022140204.GY4959@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 22 Oct 2024 19:00:46 +0200
Message-ID: <CAFLszTj92aehOTfy_MJmaS316jRs5yYgDKFA5htOoSZs1=faNQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sam Edwards <CFSworks@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Johan Jonker <jbx6244@gmail.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Angelo Dureghello <angelo@sysam.it>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Doug Zobel <douglas.zobel@climate.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ramon Fried <rfried.dev@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>, Marek Vasut <marex@denx.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Maxim Moskalets <maximmosk4@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michal Simek <michal.simek@amd.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Weinberger <richard@nod.at>, Artur Rojek <artur@conclusive.pl>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/25] led: Remove old status-LED code
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

Hi Tom,

On Tue, 22 Oct 2024 at 16:02, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Oct 22, 2024 at 02:15:34PM +0200, Simon Glass wrote:
> > Hi Tom,
> >
> > On Mon, 21 Oct 2024 at 19:26, Tom Rini <trini@konsulko.com> wrote:
> > >
> > > On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> > > > There has been an LED framework in U-Boot which uses driver model for
> > > > about 9 years now. Recent work is underway to improve it and provide
> > > > more features. It is probably a good time to drop the old code, which
> > > > is only used by 5 boards:
> > > >
> > > >    ./tools/qconfig.py -f LED_STATUS
> > > >    5 matches
> > > >    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
> > > >    socfpga_vining_fpga
> > > >
> > > > This series attempts that.
> > > >
> > > > Changes in v2:
> > > > - Combine code-removal and defconfig changes
> > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > - Enable LED on the 5 affected platforms
> > > > - Reorder patches for bisectability
> > >
> > > So I believe this means you missed the feedback of just doing the blind
> > > migration rather than disabling the feature, like we used to often do
> > > for cases where it's just a matter of changing CONFIG options. It
> > > should:
> > > - Not introduce a failure to build
> > > - Just work on platforms with either OF_UPSTREAM or semi-recent device
> > >   trees
> > > - Just start working on those platforms when they do move to
> > >   OF_UPSTREAM.
> >
> > Perhaps I didn't understand what you were saying. I thought you meant
> > to enable LED and LED_BOOT on these 5 boards?
>
> Ah, OK, I see the disconnects now, sorry. The first comment I saw was
> Marek's on patch #2. So yes, along with Peter's request instead of one
> commit to disable and another commit to enable, just do 5 commits to
> migrate from one to the other please, thanks.

In order to maintain bisectability I need to delete some code in each
of those commits. But if that is OK, then yes, I believe this is
possible.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
