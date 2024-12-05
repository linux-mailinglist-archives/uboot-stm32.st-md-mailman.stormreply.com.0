Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD59E5F8A
	for <lists+uboot-stm32@lfdr.de>; Thu,  5 Dec 2024 21:36:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97D0DC7802D;
	Thu,  5 Dec 2024 20:36:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F214C7802B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 20:36:41 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5d0cfb9fecaso2092739a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 12:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733431001; x=1734035801;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ErnfF7RWGVXMzxD4OMo+c92vkyV1dMgkv6BNzNEOBoc=;
 b=G35xF1gwvHeyKWENsz4/ikXtczLAajLPG6vzjwxc8obkP7u5sLPEbMgbFHK5/UXW10
 iwB5sr9k7z7JiQ38c41zDG4m1qib7P0GV+rBGtZemExTZvgYhpgiPQMGoeP7kyILoCcI
 oVRIolagieQTK9dAce1sKDqQCbzocV2x/rjXipm+ifr+mnOG9nhXz2tgIGt7b6m1OLd1
 y6/iv9sEWAUThSC0tUUYUnRZRnfpLNS65bLVf5WZFwukGHrxwk7T7GqlSggDDdsxaeVJ
 r3Z8DrADj+0nEyUWYiAv+bunF7urTsmj9FnKPT3UtCw2oVsDHJFuB2+drb5SxdFEBE32
 /jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733431001; x=1734035801;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErnfF7RWGVXMzxD4OMo+c92vkyV1dMgkv6BNzNEOBoc=;
 b=FCnJJmJ+QCPRoj9uiK5NSJbJMONnMtahKE939sK3ND/xf4vJ0NFNBsEE44eLzZe0N7
 bAid+yrvTDYxQR+xOSB95n4CabonxqrX/9fBCS8dbL3c/ODYs1tlzMwCFAnKf2e4PmQQ
 lKMXBogrq/uNxaduVIoETrL2rFr+JSyA1tTOPL6UPiY8H/WXcGa3fw6V3Jn5jbCsjsbu
 LF26CL5+oTvvPbmNZ/yW/XjzXkYvRjxKWD5yNP3LTvt9LzY8xagJdWrYVPCrLDjJGZ1e
 dpTFb1cRouGxfP6RVqnEb026e8P+xSCr0UwNz9Jpql/Aaft0cB9Cy1IMH5a/q+oUy/Mo
 8WUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQuAkN27Onckg5DTTblZPkroYviax4kkZbCKC9lnD1AqlizVcAtCF0UjX5d82mRt+1VyD4p8y9XJtgvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUaJJSskwkY6nNkgWLPZ4b+YgSMaJ8WWHP4Q2/l8gwqablXgQU
 4+ZxiBIfW38Lys/18PZO6wblvESPKBuj5iIhXijgnnePzDCqXVerZoYW2vYzsVSiYmZ62dyW3p2
 4IVoS7CLlXpRbwZYRUEFjlF708qk=
X-Gm-Gg: ASbGncsR0lHbCN0TysoQLwVnAa/BE1h+7YZ7W34DYvIH4iLROiIp6ER0cn8bG53vUr5
 /6TXiHLzUc2wmCLQBG5BoPbQJsg1vOXE=
X-Google-Smtp-Source: AGHT+IGOEg1bcxanvSrWaA4zFrHEFmhdylAZcntVFvlZ8ltTXWNgpFA7ZtOF1rryzIs22LPJQzUy3eyJFIdwhzKMdBE=
X-Received: by 2002:a05:6402:3582:b0:5cf:c33c:34cf with SMTP id
 4fb4d7f45d1cf-5d3be691c10mr576117a12.15.1733431000498; Thu, 05 Dec 2024
 12:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
 <20241203194847.GA4022002@bill-the-cat>
 <CAFLszTgZiJuWMKZg6q--LEp+58Exgs8P+KaeCBgqmTd+B=SNSA@mail.gmail.com>
In-Reply-To: <CAFLszTgZiJuWMKZg6q--LEp+58Exgs8P+KaeCBgqmTd+B=SNSA@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Thu, 5 Dec 2024 20:36:29 +0000
Message-ID: <CALeDE9M1aZwVM40gbhMRWsvhKZXL=m1GOeLhDgzR5H2bTShFuw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2236196853003053250=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============2236196853003053250==
Content-Type: multipart/alternative; boundary="00000000000007083006288bdbf5"

--00000000000007083006288bdbf5
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Dec 2024 at 19:51, Simon Glass <sjg@chromium.org> wrote:

> Hi Tom,
>
> On Tue, 3 Dec 2024 at 12:48, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:
> > > Hi Simon,
> > >
> > > > On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com>
> wrote:
> > > > >
> > > > > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org> wrote:
> > > > > >
> > > > > > There has been an LED framework in U-Boot which uses driver
> model for
> > > > > > about 9 years now. Recent work is underway to improve it and
> provide
> > > > > > more features. It is probably a good time to drop the old code,
> which
> > > > > > is only used by 5 boards:
> > > > >
> > > > > I don't believe, from what I can tell, they are feature
> comparable, at
> > > > > the very least I have not been able to get the Pinephone working
> with
> > > > > this so as it stands I still don't think this patch set is ready
> yet.
> > > >
> > > > I don't have that hardware, nor the other 4, so cannot do anything
> > > > with this feedback.
> > >
> > > Don't you have any HW that has a LED on it that you can substitute to
> > > see what it does?
> > >
> > > > Can you please be clear what you are asking me to do?
> > >
> > > Either produce patches that work on the the pinephone, or docs I, or
> > > other developers, can use to implement the functionality.
> > >
> > > Currently on the Pinephone the green LED lights up in the TPL/SPL
> > > (very early before ATF) stage and is lit up right through the the
> > > various FW stages, with your patch set I get no LED what so ever.
> >
> > Please note that needing to confirm that we have equivalent
> > functionality between old and new frameworks (and
> > https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/
> > might cover that) is why this series isn't ready for -next at this time.
>
> Yes, I'm not sure if Peter saw that, so I sent him the link.
>

I have seen it, I have not had the chance to dig out my pinephone to test
it again because I was traveling and had competing priorities on my time
(and I do this as a hobby).

But also I think we have a little time on this, the new functionality only
landed recently and we've had a LOT of deprecated functionality hang around
for a lot longer than that. I think we should get this right rather than
jam it through.

Peter

--00000000000007083006288bdbf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Dec 2=
024 at 19:51, Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chrom=
ium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Tom,<br>
<br>
On Tue, 3 Dec 2024 at 12:48, Tom Rini &lt;<a href=3D"mailto:trini@konsulko.=
com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:<br>
&gt; &gt; Hi Simon,<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Tue, 5 Nov 2024 at 07:18, Peter Robinson &lt;<a href=3D"m=
ailto:pbrobinson@gmail.com" target=3D"_blank">pbrobinson@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Sun, 3 Nov 2024 at 00:34, Simon Glass &lt;<a href=3D=
"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; There has been an LED framework in U-Boot which us=
es driver model for<br>
&gt; &gt; &gt; &gt; &gt; about 9 years now. Recent work is underway to impr=
ove it and provide<br>
&gt; &gt; &gt; &gt; &gt; more features. It is probably a good time to drop =
the old code, which<br>
&gt; &gt; &gt; &gt; &gt; is only used by 5 boards:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; I don&#39;t believe, from what I can tell, they are fea=
ture comparable, at<br>
&gt; &gt; &gt; &gt; the very least I have not been able to get the Pinephon=
e working with<br>
&gt; &gt; &gt; &gt; this so as it stands I still don&#39;t think this patch=
 set is ready yet.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t have that hardware, nor the other 4, so cannot d=
o anything<br>
&gt; &gt; &gt; with this feedback.<br>
&gt; &gt;<br>
&gt; &gt; Don&#39;t you have any HW that has a LED on it that you can subst=
itute to<br>
&gt; &gt; see what it does?<br>
&gt; &gt;<br>
&gt; &gt; &gt; Can you please be clear what you are asking me to do?<br>
&gt; &gt;<br>
&gt; &gt; Either produce patches that work on the the pinephone, or docs I,=
 or<br>
&gt; &gt; other developers, can use to implement the functionality.<br>
&gt; &gt;<br>
&gt; &gt; Currently on the Pinephone the green LED lights up in the TPL/SPL=
<br>
&gt; &gt; (very early before ATF) stage and is lit up right through the the=
<br>
&gt; &gt; various FW stages, with your patch set I get no LED what so ever.=
<br>
&gt;<br>
&gt; Please note that needing to confirm that we have equivalent<br>
&gt; functionality between old and new frameworks (and<br>
&gt; <a href=3D"https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmt=
h@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
all/20241110115054.2555-1-ansuelsmth@gmail.com/</a><br>
&gt; might cover that) is why this series isn&#39;t ready for -next at this=
 time.<br>
<br>
Yes, I&#39;m not sure if Peter saw that, so I sent him the link.<br></block=
quote><div><br></div><div>I have seen it, I have not had the chance to dig =
out my pinephone to test it again because I was traveling and had competing=
 priorities on my time (and I do this as a hobby).</div><div><br></div><div=
>But also I think we have a little time on this, the new functionality only=
 landed recently and we&#39;ve had a LOT of deprecated functionality hang a=
round for a lot longer than that. I think we should get this right rather t=
han jam it through.</div><div><br></div><div>Peter<br></div></div></div>

--00000000000007083006288bdbf5--

--===============2236196853003053250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2236196853003053250==--
