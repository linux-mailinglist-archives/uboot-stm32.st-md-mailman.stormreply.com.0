Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1D99E6BFC
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Dec 2024 11:23:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2F7AC6DD9A;
	Fri,  6 Dec 2024 10:23:30 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE0D1C6C855
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 10:23:22 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5cece886771so3520471a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Dec 2024 02:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733480602; x=1734085402;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pzkoXdzTAFB7OE/eqOBSKtd0968FePJFiEquSN7LfpQ=;
 b=JVAlWY3n5VLD6IXCD+SSQTabRQsWT0YxKSqF+6QIMS0Fo5Ke8r19ROO71PDeW1S2P5
 dnQBfXCoZA21B6e+/E+rD5Pq/8/8OV6rn7vV0XRWZg/rJJvtwIngwzXUJ7Mr4Bzr2x9r
 SBaVSztf/t7u17Yz8mXPYDPEZW25UtH1FYw5ONasmXmXE1wZgIB5JE/4BFKPdPcNwNEO
 lZ9N5aJbzdM44MOteaD3XuEi0UXLilsILSN5XbWmdfLUojRnyheKkF75HKf8khbcvocY
 I6qY/Ia4eXtcDlMQHNd++AcY39BUcTeamQ0BUWBd4sdzccDwyOfeit/kpJas1nBXGoKd
 Qp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733480602; x=1734085402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pzkoXdzTAFB7OE/eqOBSKtd0968FePJFiEquSN7LfpQ=;
 b=cY2J1Io2CoN9nlB0vKNXVGqxB60FF2HUFlEE2QeXxBWuaAHGT5sl98HBCYosjuxxCq
 63EUCMKy+RiLtniMdY1yqdp7BCTahjLqUund3UdOoCF5wbnJrFvChm4gTFvlWYEjTaTk
 3PuYmM+K5KwT/BuS6QggJBzofQ1+CgCqrupp7WcqpCmAvHeqPlGuq2a14eutEvz8cyEQ
 vTHcaknKp11T1fC59Nis4cL0UCbHgfUEAKmKc84yxyJJ7HYr4GO8V/4dbZS2JZCzLUE8
 mzvLO9su/fVbjipTYnqT6OYetE2JY3PT2TF9URX3lWQBKxwom+X8RjC9lzssKQObBYDD
 FlEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5AXtztwyX36/DPCCmN+k5DnoezUlEdTAb0aM2VbWQP1faFiBNKy/dK7stIr/spUp1KFQvN4Fv+iNkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxuviBLOFoEEUdcAeRfPPSAnk67kC/SVe3qfqFLgOTuIcfCqCjy
 pLRxGVt0juoJwXc/phlp/CUu0HxwEDccCPYwXvBUnWV9QQ0N6v0uZ8e3fKRIgwb3u1GUn+cXou2
 w74Juz40rkusE4HfQT65HBJ0Y25I=
X-Gm-Gg: ASbGnctR2jU344T6htAKD2BqmOP8l91nIGfNHcVLMpRRPiZUwvLtFV9DsgJjPOUNsvP
 zW9ILzT20jYJR781EqjXNYzU7e+1fO5cn3FA=
X-Google-Smtp-Source: AGHT+IEICA6knxGjNE8s9hiZCrkw9zC8tRpq44D7LCiqQSJdrBAYe2sw01lb39PW5frgrbBWKL0bEZi2IPDoBlz+kEE=
X-Received: by 2002:a05:6402:2708:b0:5d0:d0c5:f258 with SMTP id
 4fb4d7f45d1cf-5d12469949amr6118918a12.0.1733480601831; Fri, 06 Dec 2024
 02:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20241103003322.626036-1-sjg@chromium.org>
 <CALeDE9MfWEAb91uzQPa6_jSo6beJv_GNHTY2TeKnSzFm6V97gw@mail.gmail.com>
 <CAFLszTito2+-qgOc=7bc3i9WmBZZCcAVWSY5hoH0neGjTg6zEQ@mail.gmail.com>
 <CALeDE9MORdUY440JAgHNXdoqWfJy5V9bC=TK5U242QG4Lc1Ptg@mail.gmail.com>
 <20241203194847.GA4022002@bill-the-cat>
 <CAFLszTgZiJuWMKZg6q--LEp+58Exgs8P+KaeCBgqmTd+B=SNSA@mail.gmail.com>
 <CALeDE9M1aZwVM40gbhMRWsvhKZXL=m1GOeLhDgzR5H2bTShFuw@mail.gmail.com>
 <CAFLszTja7=ku__b0+LUbjhVmhML9uPv2613VxSX1pBk1vt24OQ@mail.gmail.com>
In-Reply-To: <CAFLszTja7=ku__b0+LUbjhVmhML9uPv2613VxSX1pBk1vt24OQ@mail.gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Fri, 6 Dec 2024 10:23:10 +0000
Message-ID: <CALeDE9N_hN7MXiNDBF0NmSMitgw2ax=VePSavTJgzPZdTOY-uA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============7651311403487725321=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

--===============7651311403487725321==
Content-Type: multipart/alternative; boundary="0000000000007f4fff0628976707"

--0000000000007f4fff0628976707
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Dec 2024 at 00:01, Simon Glass <sjg@chromium.org> wrote:

> Hi Peter,
>
> On Thu, 5 Dec 2024 at 13:36, Peter Robinson <pbrobinson@gmail.com> wrote:
> >
> >
> >
> > On Tue, 3 Dec 2024 at 19:51, Simon Glass <sjg@chromium.org> wrote:
> >>
> >> Hi Tom,
> >>
> >> On Tue, 3 Dec 2024 at 12:48, Tom Rini <trini@konsulko.com> wrote:
> >> >
> >> > On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrote:
> >> > > Hi Simon,
> >> > >
> >> > > > On Tue, 5 Nov 2024 at 07:18, Peter Robinson <pbrobinson@gmail.com>
> wrote:
> >> > > > >
> >> > > > > On Sun, 3 Nov 2024 at 00:34, Simon Glass <sjg@chromium.org>
> wrote:
> >> > > > > >
> >> > > > > > There has been an LED framework in U-Boot which uses driver
> model for
> >> > > > > > about 9 years now. Recent work is underway to improve it and
> provide
> >> > > > > > more features. It is probably a good time to drop the old
> code, which
> >> > > > > > is only used by 5 boards:
> >> > > > >
> >> > > > > I don't believe, from what I can tell, they are feature
> comparable, at
> >> > > > > the very least I have not been able to get the Pinephone
> working with
> >> > > > > this so as it stands I still don't think this patch set is
> ready yet.
> >> > > >
> >> > > > I don't have that hardware, nor the other 4, so cannot do anything
> >> > > > with this feedback.
> >> > >
> >> > > Don't you have any HW that has a LED on it that you can substitute
> to
> >> > > see what it does?
> >> > >
> >> > > > Can you please be clear what you are asking me to do?
> >> > >
> >> > > Either produce patches that work on the the pinephone, or docs I, or
> >> > > other developers, can use to implement the functionality.
> >> > >
> >> > > Currently on the Pinephone the green LED lights up in the TPL/SPL
> >> > > (very early before ATF) stage and is lit up right through the the
> >> > > various FW stages, with your patch set I get no LED what so ever.
> >> >
> >> > Please note that needing to confirm that we have equivalent
> >> > functionality between old and new frameworks (and
> >> >
> https://lore.kernel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/
> >> > might cover that) is why this series isn't ready for -next at this
> time.
> >>
> >> Yes, I'm not sure if Peter saw that, so I sent him the link.
> >
> >
> > I have seen it, I have not had the chance to dig out my pinephone to
> test it again because I was traveling and had competing priorities on my
> time (and I do this as a hobby).
> >
> > But also I think we have a little time on this, the new functionality
> only landed recently and we've had a LOT of deprecated functionality hang
> around for a lot longer than that. I think we should get this right rather
> than jam it through.
>
> There's plenty of time for you to test. But we're really not losing
> anything by applying these patches (and also [1]). It is more likely
> to work for your board, but if it doesn't, we can focus efforts on
> what is wrong rather than trying to keep the old code around.
>

I'm sorry but I disagree, bulldozing patches in just because it's suitable
for you but breaks actual usecases is not the right way to do thing, at the
moment this works and it useful features for users. Actively breaking valid
UX Is hostile and not the right way to do things!


> One of the challenges I have, as someone who also does this as a
> hobby, is that few people are willing to take on deprecation efforts.
>

I do this as a hobby too, you are not unique here.


> This work is not very interesting, most of the time, and it is
> extremely hard to get things to actually land, since anyone can raise
> their hand and say that it doesn't solve a particular use case. I
> suppose most people do U-Boot things in their spare time and few have
> a lot of time to test or try things out. So there needs to be a
> balance struck, to encourage more people to help.
>

I'm sorry, I do feel for you, I have the same problem and I end up spending
most of my spare of late reading emails due to the deluge.

But actively breaking valid usecases by bulldozing things through, it NOT
the way to handle things, I'm sorry here what role you perceive you play
whether it be a full time employee, paid contractor or hobbyist isn't a
valid reason for forcing through patches, please do not use that as a
reason.

--0000000000007f4fff0628976707
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 6 Dec 2=
024 at 00:01, Simon Glass &lt;<a href=3D"mailto:sjg@chromium.org">sjg@chrom=
ium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Hi Peter,<br>
<br>
On Thu, 5 Dec 2024 at 13:36, Peter Robinson &lt;<a href=3D"mailto:pbrobinso=
n@gmail.com" target=3D"_blank">pbrobinson@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, 3 Dec 2024 at 19:51, Simon Glass &lt;<a href=3D"mailto:sjg@chr=
omium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Tom,<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 3 Dec 2024 at 12:48, Tom Rini &lt;<a href=3D"mailto:trini@=
konsulko.com" target=3D"_blank">trini@konsulko.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, Nov 07, 2024 at 07:33:51PM +0000, Peter Robinson wrot=
e:<br>
&gt;&gt; &gt; &gt; Hi Simon,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; On Tue, 5 Nov 2024 at 07:18, Peter Robinson &lt;<a =
href=3D"mailto:pbrobinson@gmail.com" target=3D"_blank">pbrobinson@gmail.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; On Sun, 3 Nov 2024 at 00:34, Simon Glass &lt;<=
a href=3D"mailto:sjg@chromium.org" target=3D"_blank">sjg@chromium.org</a>&g=
t; wrote:<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; There has been an LED framework in U-Boot=
 which uses driver model for<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; about 9 years now. Recent work is underwa=
y to improve it and provide<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; more features. It is probably a good time=
 to drop the old code, which<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; is only used by 5 boards:<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; I don&#39;t believe, from what I can tell, the=
y are feature comparable, at<br>
&gt;&gt; &gt; &gt; &gt; &gt; the very least I have not been able to get the=
 Pinephone working with<br>
&gt;&gt; &gt; &gt; &gt; &gt; this so as it stands I still don&#39;t think t=
his patch set is ready yet.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; I don&#39;t have that hardware, nor the other 4, so=
 cannot do anything<br>
&gt;&gt; &gt; &gt; &gt; with this feedback.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Don&#39;t you have any HW that has a LED on it that you =
can substitute to<br>
&gt;&gt; &gt; &gt; see what it does?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Can you please be clear what you are asking me to d=
o?<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Either produce patches that work on the the pinephone, o=
r docs I, or<br>
&gt;&gt; &gt; &gt; other developers, can use to implement the functionality=
.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Currently on the Pinephone the green LED lights up in th=
e TPL/SPL<br>
&gt;&gt; &gt; &gt; (very early before ATF) stage and is lit up right throug=
h the the<br>
&gt;&gt; &gt; &gt; various FW stages, with your patch set I get no LED what=
 so ever.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Please note that needing to confirm that we have equivalent<b=
r>
&gt;&gt; &gt; functionality between old and new frameworks (and<br>
&gt;&gt; &gt; <a href=3D"https://lore.kernel.org/all/20241110115054.2555-1-=
ansuelsmth@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/all/20241110115054.2555-1-ansuelsmth@gmail.com/</a><br>
&gt;&gt; &gt; might cover that) is why this series isn&#39;t ready for -nex=
t at this time.<br>
&gt;&gt;<br>
&gt;&gt; Yes, I&#39;m not sure if Peter saw that, so I sent him the link.<b=
r>
&gt;<br>
&gt;<br>
&gt; I have seen it, I have not had the chance to dig out my pinephone to t=
est it again because I was traveling and had competing priorities on my tim=
e (and I do this as a hobby).<br>
&gt;<br>
&gt; But also I think we have a little time on this, the new functionality =
only landed recently and we&#39;ve had a LOT of deprecated functionality ha=
ng around for a lot longer than that. I think we should get this right rath=
er than jam it through.<br>
<br>
There&#39;s plenty of time for you to test. But we&#39;re really not losing=
<br>
anything by applying these patches (and also [1]). It is more likely<br>
to work for your board, but if it doesn&#39;t, we can focus efforts on<br>
what is wrong rather than trying to keep the old code around.<br></blockquo=
te><div><br></div><div>I&#39;m sorry but I disagree, bulldozing patches in =
just because it&#39;s suitable for you but breaks actual usecases is not th=
e right way to do thing, at the moment this works and it useful features fo=
r users. Actively breaking valid UX Is hostile and not the right way to do =
things!<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
One of the challenges I have, as someone who also does this as a<br>
hobby, is that few people are willing to take on deprecation efforts.<br></=
blockquote><div><br></div><div>I do this as a hobby too, you are not unique=
 here.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
This work is not very interesting, most of the time, and it is<br>
extremely hard to get things to actually land, since anyone can raise<br>
their hand and say that it doesn&#39;t solve a particular use case. I<br>
suppose most people do U-Boot things in their spare time and few have<br>
a lot of time to test or try things out. So there needs to be a<br>
balance struck, to encourage more people to help.<br></blockquote><div><br>=
</div><div>I&#39;m sorry, I do feel for you, I have the same problem and I =
end up spending most of my spare of late reading emails due to the deluge. =
<br></div><div><br></div><div>But actively breaking valid usecases by bulld=
ozing things through, it NOT the way to handle things, I&#39;m sorry here w=
hat role you perceive you play whether it be a full time employee, paid con=
tractor or hobbyist isn&#39;t a valid reason for forcing through patches, p=
lease do not use that as a reason.<br></div></div></div>

--0000000000007f4fff0628976707--

--===============7651311403487725321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7651311403487725321==--
