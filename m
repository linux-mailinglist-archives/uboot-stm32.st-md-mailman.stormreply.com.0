Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A839E2C5F
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 20:51:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B1F4C6C841;
	Tue,  3 Dec 2024 19:51:49 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57751C5E2D2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 19:51:42 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7fcfac22a30so8077a12.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Dec 2024 11:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733255501; x=1733860301;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PwFyc0U6GgUmwDVxbqx69cdhxxKpP3+Mnvxr4dCavKM=;
 b=OrMHAA+5BttuUCDgTDpBZwwa8wVSGpLw3ErK5EeiFY9ldmg2n/n4pjNwGduRHtN9ED
 PdBgEyDvcZ+t7BpW6Lr3iwrjCrGZ2i3nJMoRO5eoh5jBbT97rBCglBWTvTR1SEEWnipi
 dIoDp4GRzix5lA89HSx7qKqSAmju2M51CASeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733255501; x=1733860301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PwFyc0U6GgUmwDVxbqx69cdhxxKpP3+Mnvxr4dCavKM=;
 b=CpnArzA/ctXjc8DFpb2dEASlIBYJ1aDsvv0AU8TDMKB7Cm3VeOGE1LiwXIT9mZ/kDe
 7rexUBKsKEUqRfmtXcVzHhHQrKtYoV2Tt+fOJd53yJzJ5uLDEAsAUMQfMvFlD36+u7AO
 xpkmItbDzEvbMWJtOu7nu0bDZM1RY24iU/2HGLGLF62ebKLhnnNStMTUNanDWWa1Vpwn
 MU4ATcCK7AsmRZ93Oub5Mr2iv7cVc9hZ6VaE0/7x3ZMDHpE5u9oj8Ame4LNjtOJP3/fM
 hgUbt59mY/o6d0M+R7NgUeV5mRS6SMSJYY/vkmXgUIfxSs8KoLAXqK4cX+cc1jcLYQ+b
 sbFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2FKg49Ml4RDG+7WavBRlvD42ipdosRRfxBEnAcAWtpX3izUwbThLGAL5tkaDrWToda7nFyJ/GTnYGvA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yycj7rrpPJ0IdIvWAOeaefbcYx1qW4kiTtUrzw6BGOFyXT1v72u
 MGQCTvHzGavhAs9q1MLQV3srxyBEuxi9YD508VOblf5zYg4zQRAsiRxus26UYPTtUi6AqH+JiDA
 GnXd2g8BB5JNoRqPZQG65bimMZqmIOcE1GzW/
X-Gm-Gg: ASbGnctX514no33YEalh85FCnb8h+v/H0JW2NFL3osqHgpZL/2TfQU6mL5mZIhE8xom
 smh/wMDEhJwWJX6xEsWLkdX7Er8Reaieg
X-Google-Smtp-Source: AGHT+IEHxjmybLpLzVKeGVtx9pSIbjINHHLnsU4NA3iUHwbVNO9puzJ9Zwk9eiD44DU8T3+zoptb4KyjVk5QFPY9Fpc=
X-Received: by 2002:a17:90a:d407:b0:2ee:5958:828 with SMTP id
 98e67ed59e1d1-2ef011fba90mr5729136a91.9.1733255498974; Tue, 03 Dec 2024
 11:51:38 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
 <20241203194847.GA4022002@bill-the-cat>
In-Reply-To: <20241203194847.GA4022002@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 3 Dec 2024 12:51:25 -0700
Message-ID: <CAFLszTgZiJuWMKZg6q--LEp+58Exgs8P+KaeCBgqmTd+B=SNSA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>, Devarsh Thakkar <devarsht@ti.com>,
 Sean Edmond <seanedmond@microsoft.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Doug Zobel <douglas.zobel@climate.com>, Peter Robinson <pbrobinson@gmail.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ramon Fried <rfried.dev@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Marek Vasut <marex@denx.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Maxim Moskalets <maximmosk4@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
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
 Richard Weinberger <richard@nod.at>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>
Subject: Re: [Uboot-stm32] [PATCH v3 00/25] led: Remove old status-LED code
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

On Tue, 3 Dec 2024 at 12:48, Tom Rini <trini@konsulko.com> wrote:
>
> On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:
> > Hi Simon,
> >
> > > On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com> wrote:
> > > >
> > > > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
> > > > >
> > > > > There has been an LED framework in U-Boot which uses driver model for
> > > > > about 9 years now. Recent work is underway to improve it and provide
> > > > > more features. It is probably a good time to drop the old code, which
> > > > > is only used by 5 boards:
> > > >
> > > > I don't believe, from what I can tell, they are feature comparable, at
> > > > the very least I have not been able to get the Pinephone working with
> > > > this so as it stands I still don't think this patch set is ready yet.
> > >
> > > I don't have that hardware, nor the other 4, so cannot do anything
> > > with this feedback.
> >
> > Don't you have any HW that has a LED on it that you can substitute to
> > see what it does?
> >
> > > Can you please be clear what you are asking me to do?
> >
> > Either produce patches that work on the the pinephone, or docs I, or
> > other developers, can use to implement the functionality.
> >
> > Currently on the Pinephone the green LED lights up in the TPL/SPL
> > (very early before ATF) stage and is lit up right through the the
> > various FW stages, with your patch set I get no LED what so ever.
>
> Please note that needing to confirm that we have equivalent
> functionality between old and new frameworks (and
> https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/
> might cover that) is why this series isn't ready for -next at this time.

Yes, I'm not sure if Peter saw that, so I sent him the link.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
