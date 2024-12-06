Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C89E618E
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2024 01:01:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40BB4C78033;
	Fri,  6 Dec 2024 00:01:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83DBAC7802D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 00:01:17 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-aa629402b53so172502466b.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 16:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733443277; x=1734048077;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k92sKxFlNMmCAne6oe4pe794OpLTvB9KIfNrlyxYQRs=;
 b=fReGEgecNSZDsKxH/7JbhEiioXb7PZxFkhwPTtQ9wOdZg+d1TcEk90DDFyldgbqOVa
 LjkjQERhyU/hsqDNzfxqlUPPiOIhIDf833hfZVQqcELMo7Vb19cipDCtvnKGQnle7YiO
 SmwK8/yHhWlI8x9EYJBDCgM9Q5m7fl0gSyhdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733443277; x=1734048077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k92sKxFlNMmCAne6oe4pe794OpLTvB9KIfNrlyxYQRs=;
 b=LAfLVzkXyyilT2P2d07igx4M+XHtZH47+e1QrR2z2YCJjFq0DyPlDLuHeq/2Km4kye
 B6XMGmzSpcZjt/R1xXLobtGuhzFGRooTWk+XEKqBEv6yqBw/rFaN77Yc1NSs1ox/GVH8
 CrrbdOZf0aVE6Mnf3GTIUOy0CmtrfEMXpNzAzJ0EYohE6b8hYLTVAg/ESiDLSmPXWWVr
 UhCmeQV0ezxeiHrnK1NezpNalxqicMDpV1iTYOZxx+3P8tqOPC8Pq05Mz3+0mlDQ4lmk
 XjZlKNSAbrEND4/Gb+MuOMq4xxWXQ1WJqqHt1aqkUwP4C70+QnOnk62W1+iFJq+qpl4M
 ohfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURg31fzgC8IW0RoEdvlO2FU4REaB+MJw3qbayF+nssIQGzQelzEbyxx5GUGAb59Xv3eO4YFeOdHzYngg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6D4fOQ3j+gT06MWoWVFRtRGCg8Epav6ZmUwYGSur/dRF72bsb
 v0wPeCA/SW+l9697f4HXrxKPUWV6/14gKRyP9AWX8NKLXjCCxzN0uPpt0Ak4bDm2p2UkaGvft4y
 APqul4F1DgPm2J70vR53M9qpBr5oT0xKwq71M
X-Gm-Gg: ASbGncsF5NE007iHSq6O0se3ui0APhRDBUDVF3e8S1FiHFxfQPHAzX0kReEEy1Q6Sxk
 9k4QBdGl66+D+kJ63aqTgrY/zChUil8Q8
X-Google-Smtp-Source: AGHT+IGZ2gW4vd1o3LotH87EgoD1UBkD1H+y3vYQeJQUp4ZNx80D0cTlMCWTPmp1xFHWPNAZNkAeTsIqlORpZ2bfmQ4=
X-Received: by 2002:a17:906:30cc:b0:aa5:1d08:dad7 with SMTP id
 a640c23a62f3a-aa639fb0e5bmr43308666b.9.1733443276944; Thu, 05 Dec 2024
 16:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
 <20241203194847.GA4022002@bill-the-cat>
 <CAFLszTgZiJuWMKZg6q--LEp+58Exgs8P+KaeCBgqmTd+B=SNSA@mail.gmail.com>
 <CALeDE9M1aZwVM40gbhMRWsvhKZXL=m1GOeLhDgzR5H2bTShFuw@mail.gmail.com>
In-Reply-To: <CALeDE9M1aZwVM40gbhMRWsvhKZXL=m1GOeLhDgzR5H2bTShFuw@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 5 Dec 2024 17:01:05 -0700
Message-ID: <CAFLszTja7=ku__b0+LUbjhVmhML9uPv2613VxSX1pBk1vt24OQ@mail.gmail.com>
To: Peter Robinson <pbrobinson@gmail.com>
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

Hi Peter,

On Thu, 5 Dec 2024 at 13:36, Peter Robinson <pbrobinson@gmail.com> wrote:
>
>
>
> On Tue, 3 Dec 2024 at 19:51, Simon Glass <sjg@chromium.org> wrote:
>>
>> Hi Tom,
>>
>> On Tue, 3 Dec 2024 at 12:48, Tom Rini <trini@konsulko.com> wrote:
>> >
>> > On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:
>> > > Hi Simon,
>> > >
>> > > > On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com> wrote:
>> > > > >
>> > > > > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
>> > > > > >
>> > > > > > There has been an LED framework in U-Boot which uses driver model for
>> > > > > > about 9 years now. Recent work is underway to improve it and provide
>> > > > > > more features. It is probably a good time to drop the old code, which
>> > > > > > is only used by 5 boards:
>> > > > >
>> > > > > I don't believe, from what I can tell, they are feature comparable, at
>> > > > > the very least I have not been able to get the Pinephone working with
>> > > > > this so as it stands I still don't think this patch set is ready yet.
>> > > >
>> > > > I don't have that hardware, nor the other 4, so cannot do anything
>> > > > with this feedback.
>> > >
>> > > Don't you have any HW that has a LED on it that you can substitute to
>> > > see what it does?
>> > >
>> > > > Can you please be clear what you are asking me to do?
>> > >
>> > > Either produce patches that work on the the pinephone, or docs I, or
>> > > other developers, can use to implement the functionality.
>> > >
>> > > Currently on the Pinephone the green LED lights up in the TPL/SPL
>> > > (very early before ATF) stage and is lit up right through the the
>> > > various FW stages, with your patch set I get no LED what so ever.
>> >
>> > Please note that needing to confirm that we have equivalent
>> > functionality between old and new frameworks (and
>> > https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/
>> > might cover that) is why this series isn't ready for -next at this time.
>>
>> Yes, I'm not sure if Peter saw that, so I sent him the link.
>
>
> I have seen it, I have not had the chance to dig out my pinephone to test it again because I was traveling and had competing priorities on my time (and I do this as a hobby).
>
> But also I think we have a little time on this, the new functionality only landed recently and we've had a LOT of deprecated functionality hang around for a lot longer than that. I think we should get this right rather than jam it through.

There's plenty of time for you to test. But we're really not losing
anything by applying these patches (and also [1]). It is more likely
to work for your board, but if it doesn't, we can focus efforts on
what is wrong rather than trying to keep the old code around.

One of the challenges I have, as someone who also does this as a
hobby, is that few people are willing to take on deprecation efforts.
This work is not very interesting, most of the time, and it is
extremely hard to get things to actually land, since anyone can raise
their hand and say that it doesn't solve a particular use case. I
suppose most people do U-Boot things in their spare time and few have
a lot of time to test or try things out. So there needs to be a
balance struck, to encourage more people to help.

Regards,
Simon

[1] https://patchwork.ozlabs.org/project/uboot/list/?series=432093&state=*
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
