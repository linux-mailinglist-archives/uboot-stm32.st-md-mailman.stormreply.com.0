Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 708749AEC4E
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Oct 2024 18:36:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128DDC78F6B;
	Thu, 24 Oct 2024 16:36:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F376C78F69
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 16:36:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43162cf1eaaso15459995e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 09:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729787794; x=1730392594;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y6mdZGc95iFCptp8R5uchmEEMpQZIf+cG9tUgVX4X6U=;
 b=QfL5CuuC+Tl5OpT/QZAriq0/mC+ZqoAkvxOUdySOjIJTik0rxH5ZDRV3k0YG/e6lq3
 RtXW72Bg9RQ9MTk+7LOp2YsS7ogYvZCMq2VoWkCoOdhjT9gt5HgTcrg32xsRPZK1676F
 ukevb9yC91bVt1Da1ZIgqb+oHIdNTvMCjFUR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729787794; x=1730392594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y6mdZGc95iFCptp8R5uchmEEMpQZIf+cG9tUgVX4X6U=;
 b=u0X9SPCewiCyrJv+jGqzOaW53AsKLHNgpJG9GnL+dmEFFgvVSEUOuNghqlW8OYuWnp
 +mbPvTcQZVOg1MbQ45HP24k3k3NtmSo54SwtkKP53MVk1Zvb/IPFYAigkVpgnD6huE/t
 eio6db2a0xFmtgrKMq/QDGL8FX83/Tdsyb95zmc0EPZZ5IZJ3ol7x3YZSAtxjZTT7ENF
 Bu7QsLJkE2XBFXxBEGmwdDllvZz1l0ACXUHpg3fO1XNyMG6ll3boaY/CqOf3APqG3uDQ
 uTN5HRtR9rFi3y5++IeuSK8xAr1s46yokeTExw5NG49FhEcS+X70SHtdO831nOK81co8
 EY7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx0OYp2TktvjUrGPjRwRlPCKa4wBFSPznEwRYX7p2S7ol1LcSbtmT1TyvbNP22dQHyNEKSaGX80nJrrA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBEx7soz7FckGkxcmoG2LipRrgwbgOY9ziZL8RAaYXD8ZlaW/c
 6zCVzdY3GLORSmiGHclK0VauGKnKBeLZa8UhaxzC5kvNsgX3GKL1m8R6sAx8TfTWRrd8V5MWTLr
 oljuLa3d7dR/bdEFZUWSepZLTbjBbuSpl3Efe
X-Google-Smtp-Source: AGHT+IHJqfwQ1ZstZ/zPG7pqAjdMMjWMp0GNUrAWNPD5YbVHYefSBeTJEoNI7dlb/LY/eLpC5GgIk+u0Ly0mkaeVoAw=
X-Received: by 2002:adf:ea92:0:b0:37d:5130:b380 with SMTP id
 ffacd0b85a97d-37efcf067bamr6243097f8f.23.1729787793669; Thu, 24 Oct 2024
 09:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
 <CALeDE9OVd49GiW+M8ygEA5CCF7F8f+MD4okNtk0a8aM1oqsTDQ@mail.gmail.com>
 <CALeDE9OA1EfoddO8yxsjvePAOqy2dMupU2uZnuZMZNtAkgdYZA@mail.gmail.com>
In-Reply-To: <CALeDE9OA1EfoddO8yxsjvePAOqy2dMupU2uZnuZMZNtAkgdYZA@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 24 Oct 2024 18:36:21 +0200
Message-ID: <CAFLszThzGGfPU9wWdxXLfmWpPB4LvGFALptHU_PJwn8BUs4Cqg@mail.gmail.com>
To: Peter Robinson <pbrobinson@gmail.com>
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

Hi Peter,

On Thu, 24 Oct 2024 at 14:16, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Tue, 22 Oct 2024 at 09:48, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
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
> > Also when the migration was first bought up I had a quick look at how
> > to do it for the pinephone and I came up empty handed. Now I've seen
> > the patch for the pinephone and grep for LED_BOOT the only form of
> > docs I find is in the Kconfig and include/led.h, they refer to things
> > that aren't in-tree and the out of tree reference to
> > dtschema/schemas/options/u-boot.yaml, the only in-tree u-boot.yaml is
> > ./dts/upstream/Bindings/mtd/partitions/u-boot.yaml, that I find has no
> > reference to boott leds at all.
> >
> > I feel the reason there's been a recent move to add users of the
> > obsolete method is because the docs for that actually existed and
> > there's nothing for the new method. Maybe the first patch in the
> > series should be to add some actually useful doc rahter than go from
> > docs for the old method to nothing.
>
> So I've tried the patch on the pinephone and it doesn't work.
>
> I suspect you need to at least enable a led driver like LED_GPIO but
> even when I do that, while I can make the led turn on/off manually, it
> doesn't come on in early boot like it does with the old code. There's
> definitely something else missing here.

It's good that you have one of these boards. Would you be able to
debug it and send a patch?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
