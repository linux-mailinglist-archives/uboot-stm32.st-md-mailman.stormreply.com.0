Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9559AECAA
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 18:52:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F506C78F6B;
	Thu, 24 Oct 2024 16:52:51 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48478C78F69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 16:52:43 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5c94b0b466cso1398762a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729788763; x=1730393563;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oenq2X7z2zaYul/29pngbzDgtCwAdsg+ZDSf6N5KXN0=;
 b=RlrNV9qogJ0OJL95IHMqT62vDCet7QS27UU3hPkD+dvlCB2PvGB6jeMhKmUeEP+XGD
 MI63f69795T2giyyGHCxrTkKfwq+yIbD8N2kVQlgl5CCQkfL8qRUME4GP3Bm0SwGkvwm
 +Rx8mBFX6h2Y1Hh7tBIZYOf4uA76dQDT5ZM3l5RSKkh2WlYrGZUh0ZsZ+9LsWyN2CYOh
 oZs8fDRtwg5A8V0bDakkjluwUeRtQkn93wCLcSm1YLqKY6b3olBOn2+8yj40vZyU3yOn
 loHF5Ku6e5lU+WQoYlVC2s6GX7iiFB1csiaWXiKayfbE0M3nZhMicBLRiipRSKqmJyZj
 m3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729788763; x=1730393563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oenq2X7z2zaYul/29pngbzDgtCwAdsg+ZDSf6N5KXN0=;
 b=M0pKFrOuq3jJ81dPlLUArXELuYezYozXozVtQprT8xRy52cCv0cQJ8FJ56vrMXpEkd
 VCysaBRf3kA2G0YDMST3yReDDiXrT6eTBL3xcj6JCDsFPvl+tXcK0rNS9qr0nCRRqyrR
 LEFfbPTVTzZvE3URhoU7qN/UhmUHuPs4n8OHKNvG8fk1vThILx2dxcwe+oLnHvE6rGyj
 yZvPUQvJvaLgRqZo89SB5aJ+VrhK3T0UdTokXFSy8djehUf9hHAI8j1pO4/Iz4koi3g/
 xZH3qPjajFPhxtk64cSS/fdemEKE9A51jZHgc07HdfmiMYPo+6BcBJ63WLfgBg1FD6jK
 XjbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9vbYyNuhSznoyKwU4y+F2Z9MthIxjd4dylTnEXlU2Yl7BwT1NrRd6nJGSh4PvJmBOucUDjxMdFaYCMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwqZc00VvVa39WOADURBMXbfCoxQK0ze3AZnoAmlLEM+ybJngak
 Ty5AhxqBa4X4se71jjq+6lthlAi1cR+EmmCxxHiRZdW9J/bPxZEMDs7vzPeKCarAMrcXZtLtciY
 IJ66iuLolqzWOi2GHA0qZt0d50m0=
X-Google-Smtp-Source: AGHT+IG4NiAIcrET4kI6FLDfF9ZbxaqASRHQjAoF8Cc2tYzqbyfGoI9vFTK0RXcntPYtbPPCbeJH0cGJyXMTC1REStU=
X-Received: by 2002:a05:6402:34ca:b0:5cb:6ca4:f4cd with SMTP id
 4fb4d7f45d1cf-5cba2427f70mr2020156a12.7.1729788762277; Thu, 24 Oct 2024
 09:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
 <CALeDE9OVd49GiW+M8ygEA5CCF7F8f+MD4okNtk0a8aM1oqsTDQ@mail.gmail.com>
 <CALeDE9OA1EfoddO8yxsjvePAOqy2dMupU2uZnuZMZNtAkgdYZA@mail.gmail.com>
 <CAFLszThzGGfPU9wWdxXLfmWpPB4LvGFALptHU_PJwn8BUs4Cqg@mail.gmail.com>
In-Reply-To: <CAFLszThzGGfPU9wWdxXLfmWpPB4LvGFALptHU_PJwn8BUs4Cqg@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 24 Oct 2024 17:52:31 +0100
Message-ID: <CALeDE9NjjmHUDBkQ39wWkBnP-xXS5OTLy+=-prSQS38WcjHDDA@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sam Edwards <CFSworks@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Johan Jonker <jbx6244@gmail.com>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
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

On Thu, 24 Oct 2024 at 17:36, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Peter,
>
> On Thu, 24 Oct 2024 at 14:16, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > On Tue, 22 Oct 2024 at 09:48, Peter Robinson <pbrobinson@gmail.com> wrote:
> > >
> > > > On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> > > > > There has been an LED framework in U-Boot which uses driver model for
> > > > > about 9 years now. Recent work is underway to improve it and provide
> > > > > more features. It is probably a good time to drop the old code, which
> > > > > is only used by 5 boards:
> > > > >
> > > > >    ./tools/qconfig.py -f LED_STATUS
> > > > >    5 matches
> > > > >    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
> > > > >    socfpga_vining_fpga
> > > > >
> > > > > This series attempts that.
> > > > >
> > > > > Changes in v2:
> > > > > - Combine code-removal and defconfig changes
> > > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > > - Add a patch to enable LED and LED_BOOT for these boards
> > > > > - Enable LED on the 5 affected platforms
> > > > > - Reorder patches for bisectability
> > > >
> > > > So I believe this means you missed the feedback of just doing the blind
> > > > migration rather than disabling the feature, like we used to often do
> > > > for cases where it's just a matter of changing CONFIG options. It
> > > > should:
> > > > - Not introduce a failure to build
> > > > - Just work on platforms with either OF_UPSTREAM or semi-recent device
> > > >   trees
> > > > - Just start working on those platforms when they do move to
> > > >   OF_UPSTREAM.
> > >
> > > Also when the migration was first bought up I had a quick look at how
> > > to do it for the pinephone and I came up empty handed. Now I've seen
> > > the patch for the pinephone and grep for LED_BOOT the only form of
> > > docs I find is in the Kconfig and include/led.h, they refer to things
> > > that aren't in-tree and the out of tree reference to
> > > dtschema/schemas/options/u-boot.yaml, the only in-tree u-boot.yaml is
> > > ./dts/upstream/Bindings/mtd/partitions/u-boot.yaml, that I find has no
> > > reference to boott leds at all.
> > >
> > > I feel the reason there's been a recent move to add users of the
> > > obsolete method is because the docs for that actually existed and
> > > there's nothing for the new method. Maybe the first patch in the
> > > series should be to add some actually useful doc rahter than go from
> > > docs for the old method to nothing.
> >
> > So I've tried the patch on the pinephone and it doesn't work.
> >
> > I suspect you need to at least enable a led driver like LED_GPIO but
> > even when I do that, while I can make the led turn on/off manually, it
> > doesn't come on in early boot like it does with the old code. There's
> > definitely something else missing here.
>
> It's good that you have one of these boards. Would you be able to
> debug it and send a patch?

Well I spent some time this morning and never got any further other
wise I probably would have. When I first tested this against the
2024.10 release I discovered the new boot led stuff has been only
added in this cycle [1] yet you mention above the other code has been
obsolete for 9 years, not sure how that's possible if there's been
nothing to migrate to. Also looking at the patchset the docs are
bbasically non existent! so without having to dig through the code to
work out how to specify the led, like Is there DT requirements etc
it's not something that I have many more cycles for ATM.

Peter

[1]  https://lists.denx.de/pipermail/u-boot/2024-October/566459.html
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
