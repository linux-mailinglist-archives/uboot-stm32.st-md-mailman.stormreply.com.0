Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A852BA12561
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 Jan 2025 14:50:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C806C7801F;
	Wed, 15 Jan 2025 13:50:43 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D61DDC6DD6D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 13:50:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ab34a170526so187606566b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1736949035; x=1737553835;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n6GyjMMcZ5Ne7y3J6xECHIpnyZsqzOVOMePYqzx69Zs=;
 b=LwUBK6muY7GD8+H+ZXBS+BoO6lJc3//oJAeKVOOVBcxdXB0LZO3kgrAD8qIq9TLsRy
 TpkjNJqUtMxLao08I34GE0z8uckdVMN8YBraqpvGqCSApeqWAhmf11XxPM4rHx+ipdmo
 l2sa/pYiovNIRwVkb1eV+tisJuUSOiHlLPGiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736949035; x=1737553835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n6GyjMMcZ5Ne7y3J6xECHIpnyZsqzOVOMePYqzx69Zs=;
 b=B7BU6CJekLYGMyPTveFgyzPs1VOjf4/F72Of/ws0UKWbJtc7nA4UpvgQSVz9r8u8Yh
 TIHvCtOXmkNPoWWSeQEgznIqG3f+GnfosTpwtaPVRdRhHMYcosa/FqRvU8ZG8ez7oMMq
 63Exwbm/3XEv27XisYTq9U7JftfJ3LIyRX67nfrlIl0pSukvIBqqJ5ZWkTUTxIrRSFb/
 XTLg6rwyT3Kp6sJr4veOoapx7pn16pDFPulqTZdRKDbmuXYLI1zGXzeDC6r33qOSZVbO
 aHw4pvsBQpjT3yl3YYzkX1I1KIpDuFoH2ClppZiVtYIKm2+9GVlUjEf2+t1G0eQHl4iD
 BcJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdBvF1+ty68yaxpmPMEqXUlJAhO4Tm5BElEzgC6wPfNsbrTvy7SHHsoGaH+cJEXwJpSPg2GBCOiE1Spw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyQ7bRpknyJYjqheNSpHDw/IQmvNL/z2yOucBtXnl9bQLaLjinb
 W6fFUgNHUixbc4uWIXze81mC/iNOwDNIYVa8cZ9ZVMOC9OhTgwnkGkNc1i18OGbg1dshqIjMkzc
 JYgJewb/I2Hx3veaNux27C0TGWK8GmP9XB15Y
X-Gm-Gg: ASbGncvOY4SwiG5TLV73PPRC/hPePK1YeP04JY5+XkN4FQQxNGhTgjI5GE71l/moOgK
 y9uTqjE+j19hCumiRqfwwWYdUFvx+46TrDv0eIaw=
X-Google-Smtp-Source: AGHT+IEb2hbG5qHr3THitJKxug3alTByYWPPct2dv43m3mCI9Q54NDBpCNN/bv5iqweoBRWKimF/X5nTTiPCJbX26tY=
X-Received: by 2002:a17:907:c0d:b0:aaf:1183:ec2c with SMTP id
 a640c23a62f3a-ab2ab6bfc89mr2383962366b.5.1736949035194; Wed, 15 Jan 2025
 05:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
 <20241203194847.GA4022002@bill-the-cat>
In-Reply-To: <20241203194847.GA4022002@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 15 Jan 2025 06:50:23 -0700
X-Gm-Features: AbW1kvZD2TxAXPYqX4CIRQrWgitRqTpk9mnEuW2FFclGO2erZ9XAfOCKTdV-dyI
Message-ID: <CAFLszTj=x_ESLVmJ09zS8=7Nydu9Rw6u7CKJYb7G9nMykHe++w@mail.gmail.com>
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

Link to series:
https://patchwork.ozlabs.org/project/uboot/list/?series=431000&state=*

Current status: marked 'changed requested' in patchwork. Applied to sjg tree.

Peter, if you would like to retest this series now that [1] is in
-next, please do. Or if you can make time for some development with
your device, that would be welcome.

Regards,
Simon

[1] https://patchwork.ozlabs.org/project/uboot/list/?series=432093&state=*
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
