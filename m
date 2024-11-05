Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 255719BD02F
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Nov 2024 16:15:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C14A1C71287;
	Tue,  5 Nov 2024 15:15:54 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4860C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 15:15:47 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so662003866b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Nov 2024 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730819747; x=1731424547;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PUq+F/fOhlX2dQRABqwxE+3OjzAWCkgyEDjETl3bw9g=;
 b=cSF/g58pRNo41xewN53oVaOFN1/8cBSFr4N0tN6ZmrHu8f0gLYYImJlewFyv6CuRyF
 LdVjSdjzVSR5aAXMz+qKwUXwwW1c+b45WcK6HfippA4qhBsVUOdBntcq57vn5qnXNvxR
 b0wimcKamdmIEaAvycAJNMqV9Munwql32Oh/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730819747; x=1731424547;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUq+F/fOhlX2dQRABqwxE+3OjzAWCkgyEDjETl3bw9g=;
 b=byRI8576HEpSNilgXyIVJ7un9tfqfrR4WsBJjodsOAqFsWwGymzaPaK5RpKc5IP95E
 FaSsWoICDhcHwqyE+dr1Wq4v4pbRPIR471MNpt50JQzQEA+wm5/Wp9AG7QzUj3etBgbO
 Atrv5PDCXQbMnjo+xG256y6NcO3ytOAoFXBh+a2we2ava+uh7bM8qjN6hE05uOh6VwTh
 Xx4w0OvZ01kj3rWOzxP6QeP6EQFB9iQjFx/40Qi71OVTn0KcpddCwtSPHaf5IIuZEtr2
 y54txPcMiXRCoB2AIrZmq1uVe9J+PSW+c0xwofApRLlaqZka/0SI1zDKm/wshLgYUy08
 FACA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+W09h2+rUzC16OUgXE5SIxu485gXNu/GUgZ7UoKSxZ0FdKM7oom7UpQEzNqjqTW4945GVkgM8vUm6KQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGSBzyAe+aDDsz1R8A/ovL/aBNMvv/tTmiIlVjWNRnoA9YhTzz
 SPc+eWK7IS1uZvS7S0pAAHq67OIrD1GrZgLmxufXqAXr4waljHHdcAEMoXy3rdkz/s8lLyqI1Jt
 MFuSH5EZE8rwY1bIjepqVos1+X/5DRPWT51ol
X-Google-Smtp-Source: AGHT+IG7FUKFi0QmomJAcgMUzgviYGIB8kYQ3E+P3Lo04LWUC+0Q0U76JUKqFasicDh4xq4TTmvtIZLk/g3d2+Rp2As=
X-Received: by 2002:a17:907:2d91:b0:a9a:80cc:c972 with SMTP id
 a640c23a62f3a-a9e655a8980mr1569945666b.27.1730819746951; Tue, 05 Nov 2024
 07:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
In-Reply-To: <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 5 Nov 2024 08:15:34 -0700
Message-ID: <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sean Anderson <seanga2@gmail.com>, Charles Hardin <ckhardin@gmail.com>,
 Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Tien Fong Chee <tien.fong.chee@intel.com>,
 Angelo Dureghello <angelo@sysam.it>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
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
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
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

Hi Peter,

On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
> >
> > There has been an LED framework in U-Boot which uses driver model for
> > about 9 years now. Recent work is underway to improve it and provide
> > more features. It is probably a good time to drop the old code, which
> > is only used by 5 boards:
>
> I don't believe, from what I can tell, they are feature comparable, at
> the very least I have not been able to get the Pinephone working with
> this so as it stands I still don't think this patch set is ready yet.

I don't have that hardware, nor the other 4, so cannot do anything
with this feedback.

Can you please be clear what you are asking me to do?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
