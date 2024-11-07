Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D279C0EFB
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Nov 2024 20:34:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E66DC6C855;
	Thu,  7 Nov 2024 19:34:04 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F29DC6C83A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Nov 2024 19:34:03 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c948c41edeso1739849a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Nov 2024 11:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731008043; x=1731612843;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EiAodyChFL0tXP/vWzaCiE98JOzLepr/iD/RbOGoOF0=;
 b=SabwbEiao67Kgc7NUWnXvsqJv+PbxNnhGiucaxqb/cwOY2QK8ZnfpjG+Qj7NowGYEO
 HatO8FX0sn/wW9XjmlYgo6PhibA8jrp3dn54NbXsSdnNE/qRBY7DH3nWpQwX5bfrhPtU
 Yk1zSryiMiWptRe9/c9NNE7YWgFllyXmW5A7ysgHuu3LygfXYynuuSgBZLt/N9/ofSBn
 mSQWJE/jMuPFbVQRHZUd86Y1k4mWyiZuPmx8H7/2qlsPrNOohpwwg5N0LKUqC+iCosYI
 +TYtw+E2owrCCZ16SD78Y/1wQjDjV86z5hZSHjtEoIG4RizRAbfCbCCWxG/KVv5bqCCF
 ySdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731008043; x=1731612843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EiAodyChFL0tXP/vWzaCiE98JOzLepr/iD/RbOGoOF0=;
 b=ftAUcGUi3yeN/Rx9ZjKkXfhVPrX5/oU1OoPqqkQQVDyVLfH/D0GGYmyD6fQSmCGR5t
 dSpPMQfZwk1hEuxRyThXh+ZDNVdROt/5/KwJsMSQYEG49aKzmzsz1QCHCFT6ZTHHmsJf
 rYuM/YMu7FOryuhtrAcuXIRy3L1jVUnt/PF6iHnWACZsrGqs3Um8R29gkgvyMJZ3nPpT
 hU7jsXjmKee9HdDog3HuU8YJKLBRV9MovhIZTUARjczzyRyXCSZUEupDxA3/+gWwtk5o
 X5TWbt2vZ0Uq7iN/IhiWRoCsjU14KtS2Zsuikz71HzBerJrA9ImI9aa0KjvI7AC9VaF9
 TYfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOavIbF0T2nea7LyazwcMBQT6/3irRg8kluoRk4epVO0QEIVm5YhmdEfRQQFFvtn20LNEdvvbC8a4oyw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyoPjrawFSyjskfLtE03DKhOzvtzg26VVuK1IGxgL6SfikYVTSV
 ePh8wqncqsTosbhG/01Lffhir/3uPf4tNcbXpjLj1sll6s6RCkSg/aj/R5oZsh2muRaQHUmYR/Y
 v4yA6o7YF0q01qZy0wAWCnmLmpBg=
X-Google-Smtp-Source: AGHT+IFenJ3f2ne1pM3ufhCiRhvTedE3Q1cIkaLpTq+ZlW7vhDBi0Wypawkqm1DuLUaPchqM1dOtDXbwUXuGKs+d9i4=
X-Received: by 2002:a05:6402:2549:b0:5cb:ad37:4f60 with SMTP id
 4fb4d7f45d1cf-5cf0a44426bmr23615a12.26.1731008042752; Thu, 07 Nov 2024
 11:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
In-Reply-To: <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 7 Nov 2024 19:33:51 +0000
Message-ID: <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
To: Simon Glass <sjg@chromium.org>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>, Devarsh Thakkar <devarsht@ti.com>,
 Sean Edmond <seanedmond@microsoft.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Patrick Delaunay <patrick.delaunay@foss.st.com>
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

Hi Simon,

> On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
> > >
> > > There has been an LED framework in U-Boot which uses driver model for
> > > about 9 years now. Recent work is underway to improve it and provide
> > > more features. It is probably a good time to drop the old code, which
> > > is only used by 5 boards:
> >
> > I don't believe, from what I can tell, they are feature comparable, at
> > the very least I have not been able to get the Pinephone working with
> > this so as it stands I still don't think this patch set is ready yet.
>
> I don't have that hardware, nor the other 4, so cannot do anything
> with this feedback.

Don't you have any HW that has a LED on it that you can substitute to
see what it does?

> Can you please be clear what you are asking me to do?

Either produce patches that work on the the pinephone, or docs I, or
other developers, can use to implement the functionality.

Currently on the Pinephone the green LED lights up in the TPL/SPL
(very early before ATF) stage and is lit up right through the the
various FW stages, with your patch set I get no LED what so ever.

Peter
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
