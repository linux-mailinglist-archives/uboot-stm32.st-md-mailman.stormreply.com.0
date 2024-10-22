Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4C19AA1F7
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2024 14:15:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A83C6DD66;
	Tue, 22 Oct 2024 12:15:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EFA1C57194
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 12:15:46 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e3f35268so3997840e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729599345; x=1730204145;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pNTFFiDhvjS02pYi2E36x2cwn0ld7G4zNAPfrwiz67k=;
 b=c97JfsjCyD36n9zhM2CtqKKxTCokWDuViD0XETn8tELToZiXwg47G5roWbm8G+VCbr
 DQRC+FuwsxmpmSLTYvtyONaYofqIDeLY+vumCMdrZpVir8V4kKQwBFS8C/a0eqiHyXFB
 Z4Hb9f+krhVZ2dvKYxuBxAE0N2nQEM7pU9Bkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729599345; x=1730204145;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNTFFiDhvjS02pYi2E36x2cwn0ld7G4zNAPfrwiz67k=;
 b=u2W2EZWCrw6P5em/loxY0L07XkGVEDFXgaptZUmxU+o2dkR76w1w7Gb7xF+zPoU1w1
 vy7H3ZrZkh3lg1/65iOEtxL3z/asKfUhRbxfjkgjpTQMwSkjIoXjCQDfQs0s0nFaU/dc
 ukkoBukOvKz+JsJuGkVAXctnA/CQ/lVL7w5oOyhOb2abiOKFYk1fyiUyTYZ/gt3lcNie
 E1ya8qE2kQ+cZq9p7GwhGOEHleOkFr+CxzjOIZBj5EhSTR8JzVUQASgFf/wh/sxzzU5c
 Td7+QTtniuUcXZtcDx21AD5s/yCrSuY9+V5jIZ7eaXbdt4S0xzoqJDls+0XNjZbu7ess
 Yykg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBJTxmg+8v/Aq0fYXnihwlZORv2TXX5ADV8YbVLgPHyZ+HS7Z/tInL4Z6WZYfX/FzecyyVfEC/L6XQPA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvqxZ0f8zsxG8xPnt8mRaVKuoElfWZWyyhF7/OxBjmNWaGAiN5
 ICjnlofceynaqp0O06Ix1y4N1wBDc+pjlmkM1ObukrWgk9mrM13eaAQ01tYdH/tG2iGcymJFZtm
 JPuNLvLP9J+U0e107QryxgBSZxFvabZ7pBZkq
X-Google-Smtp-Source: AGHT+IEQOf5Uth+EbYU6C8n0FmGmq35lcVLjqELZ6jNADa/5wekxFkyQcP1MpfN9icNtCardmm2IB4CXjRqc0Cai5c0=
X-Received: by 2002:a05:6512:39cc:b0:539:e436:f1cc with SMTP id
 2adb3069b0e04-53a1546cc59mr8133444e87.52.1729599345254; Tue, 22 Oct 2024
 05:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
In-Reply-To: <20241021172613.GN4959@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 22 Oct 2024 14:15:34 +0200
Message-ID: <CAFLszTguu7hRpsSLxADsBkMgTzA_-fAR0t8Axv+8=OvxJvSRCw@mail.gmail.com>
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

On Mon, 21 Oct 2024 at 19:26, Tom Rini <trini@konsulko.com> wrote:
>
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

Perhaps I didn't understand what you were saying. I thought you meant
to enable LED and LED_BOOT on these 5 boards?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
