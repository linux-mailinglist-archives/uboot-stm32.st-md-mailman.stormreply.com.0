Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B82779A9D60
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2024 10:48:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62312C78027;
	Tue, 22 Oct 2024 08:48:57 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20E20C78012
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 08:48:50 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-539f6e1f756so6273031e87.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729586929; x=1730191729;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yXOG4bAnuNruA+w4vpSbSR1SmdXTLwDkoXzo1msrvxY=;
 b=PEO+4vINIF6qf8IRzExZQMHeksywdHHEns+/e5v7X4dEcWJz2T2gdgPePOU/IUKcC5
 Kbp4j+yx6HN0IHHJN7QMjf3+E3LB1qJJ5HRDsnaJKvyjX5S28jyBK0q+jEr4jriNbOWm
 mJCs1BmU67GEsf77LTjBwiGXbVCgvUggtlfT5PhIDsVvLYQjME2pyhmHGToFbbB3XUFf
 llO8FNoDYPHTGyHAR0+g/78T2eYYPv9211c1Osj9kYY0LI/weqwsJqmfe5k5su6IURFT
 sg7kzCM8dqqqt0FRYB2pcQA1iq58fzmcEcpb8vb+PcHmmFkTVpShy9MIDOrbozkjqd/c
 wiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729586929; x=1730191729;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXOG4bAnuNruA+w4vpSbSR1SmdXTLwDkoXzo1msrvxY=;
 b=K9fpeeSZD4lUav7t7dmYEvj3ohmC0zutPcCy6F/SD4xn7BoG/PKwv8TkdY5NSPl7dZ
 Y9+kRmcNnPOhbe/R6B+eNFUr1Lxm5otCej+6ijvWyB3LA2giXCQCbiotOZHKsgSqPrKc
 nbTHESXM0aHPHhoLN2Cp36FToiVO73VsACGCi2ST9BAZqY0rlF8ldK+samApeCe7fbUA
 tuSnelBeE3p654MSKdMChoKV3gEttYy3jOkcNx3VUBKZHHs2M0SA99StfyaUqLBhi1ln
 KimvCSiDzoWkXdGRtKL7hnIi0dXxFnrpvpLuCu/G+mE2exASQJ7Jy9CFCJOXYECuLw/V
 uUlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP2ieqUIIIlfVEPFliHpxFaB6kaNtAMoCDETFMehvmyVyX0S6Qz6UXrG9TMhnzlhMqXEUwYTuNvjx0WA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJwCKxM7ZE3yARDZbInjwrdelgSRiL9iCbCNdmA7D3B+tk0HuT
 muTTZO74L8uG9UNJK7plWx+pNg6/K7/VLTAJBh9z/kYdNRmFMIYmUOLy/h20QlaTEkk809+3HYv
 zB3EoIqeCD2h+T0oCF9FwFz2AJ7w=
X-Google-Smtp-Source: AGHT+IESDJ30NOXZlrNVe3MHVFVKMJkdGbCKDDCyLk3bWq90A/sQPszJvQs3aN/4SDx3h9OLgyN10NY18y3fsS59Y2U=
X-Received: by 2002:a05:6512:acc:b0:539:e9b4:7ff6 with SMTP id
 2adb3069b0e04-53a15445f78mr7872135e87.45.1729586928951; Tue, 22 Oct 2024
 01:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
In-Reply-To: <20241021172613.GN4959@bill-the-cat>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Tue, 22 Oct 2024 09:48:37 +0100
Message-ID: <CALeDE9OVd49GiW+M8ygEA5CCF7F8f+MD4okNtk0a8aM1oqsTDQ@mail.gmail.com>
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
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Weinberger <richard@nod.at>, Artur Rojek <artur@conclusive.pl>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
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

> On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> > There has been an LED framework in U-Boot which uses driver model for
> > about 9 years now. Recent work is underway to improve it and provide
> > more features. It is probably a good time to drop the old code, which
> > is only used by 5 boards:
> >
> >    ./tools/qconfig.py -f LED_STATUS
> >    5 matches
> >    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
> >    socfpga_vining_fpga
> >
> > This series attempts that.
> >
> > Changes in v2:
> > - Combine code-removal and defconfig changes
> > - Add a patch to enable LED and LED_BOOT for these boards
> > - Add a patch to enable LED and LED_BOOT for these boards
> > - Enable LED on the 5 affected platforms
> > - Reorder patches for bisectability
>
> So I believe this means you missed the feedback of just doing the blind
> migration rather than disabling the feature, like we used to often do
> for cases where it's just a matter of changing CONFIG options. It
> should:
> - Not introduce a failure to build
> - Just work on platforms with either OF_UPSTREAM or semi-recent device
>   trees
> - Just start working on those platforms when they do move to
>   OF_UPSTREAM.

Also when the migration was first bought up I had a quick look at how
to do it for the pinephone and I came up empty handed. Now I've seen
the patch for the pinephone and grep for LED_BOOT the only form of
docs I find is in the Kconfig and include/led.h, they refer to things
that aren't in-tree and the out of tree reference to
dtschema/schemas/options/u-boot.yaml, the only in-tree u-boot.yaml is
./dts/upstream/Bindings/mtd/partitions/u-boot.yaml, that I find has no
reference to boott leds at all.

I feel the reason there's been a recent move to add users of the
obsolete method is because the docs for that actually existed and
there's nothing for the new method. Maybe the first patch in the
series should be to add some actually useful doc rahter than go from
docs for the old method to nothing.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
