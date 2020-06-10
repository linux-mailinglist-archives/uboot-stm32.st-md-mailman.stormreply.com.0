Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FA1F5DFF
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 23:57:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F8EC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 21:57:42 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2D83C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 21:57:41 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j32so3069534qte.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=VEy50IIV2zv4O6PlB8OJhTsNomvD2FCh96bGHcMzChE=;
 b=opWzcqx5v54semMd89++o+gjo7LyD6rL1qYgEjHkOCH6dRtkRojIFBPwAmSE3hNru1
 g1OGdVBLdZpPuo9ToXZMMw1PP/3qaHTSZ8ehMl+jLBPGaozGrnLRNvQaIsYYdFKINppt
 ZdDJl+QIiYsnfhCEwCuWh5GoQ4r6gvSAZ3QGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=VEy50IIV2zv4O6PlB8OJhTsNomvD2FCh96bGHcMzChE=;
 b=JlL1kHHXfA+REhAaROQGL0D7viVI/7j3S607kPXevkSSY/tlJvel0GrKySa7Z2//fc
 +NvwRe6wlY9N3VJrtpTcndEvJ8nqiyt3HY73IZTfDcyx7KB3Qdq0805swydfddlgky9P
 mVxsZ54onW88OW9WK0Kb8CoEtym5ewD56S73cN2Gkpg8kEqPvMehQ9rZfM06+9ynLhfz
 jJgsQR7WqcrvcvOk8AmYeTJO2IhmLiBCWvctaStVXBIsZJSXEVi4wfwpvmbMMql7wt0s
 7XYYj61KZ/hEyKiNkb+cLWpm4ls2saz6PLx9JCxjUEu8cufdGKqAJVGZFxAFrbanXAsr
 BNYQ==
X-Gm-Message-State: AOAM531gwY2WY/KyvX3bNHgNXUvRx2QYNcYhpMnmbvR8NUwIx1KajJxE
 NhOPeLFHCE1koRI9tjnrsZ5hAw==
X-Google-Smtp-Source: ABdhPJy6RZ51Td2wR9QGegniioCVJ81IxKlK4sp7LC29soISgiptubkpaZu5rSsYjjia4D+azYNvxg==
X-Received: by 2002:ac8:46d6:: with SMTP id h22mr5537238qto.145.1591826260682; 
 Wed, 10 Jun 2020 14:57:40 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id i71sm782880qke.75.2020.06.10.14.57.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 14:57:39 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:57:37 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610215737.GO24893@bill-the-cat>
References: <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
 <20200610213522.GM24893@bill-the-cat>
 <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
MIME-Version: 1.0
In-Reply-To: <0b8142d8-2375-ee8f-515d-680f8e93beed@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Patrick Delaunay <patrick.delaunay@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] net: dwc_eth_qos: add Kconfig option to
 select supported configuration
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
Content-Type: multipart/mixed; boundary="===============3187735588286229682=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3187735588286229682==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f3n33hPtqmWgzvaY"
Content-Disposition: inline


--f3n33hPtqmWgzvaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 11:40:33PM +0200, Marek Vasut wrote:
> On 6/10/20 11:35 PM, Tom Rini wrote:
> > On Wed, Jun 10, 2020 at 10:56:40PM +0200, Marek Vasut wrote:
> >> On 6/10/20 10:54 PM, Tom Rini wrote:
> >>> On Wed, Jun 10, 2020 at 10:46:23PM +0200, Marek Vasut wrote:
> >>>> On 6/10/20 10:11 PM, Tom Rini wrote:
> >>>> [...]
> >>>>>>>>> You mean be more like barebox and Linux where the board-specifi=
c stuff
> >>>>>>>>> is kicked up one level and we have a more generic binary?  I do=
n't know
> >>>>>>>>> and there's so much work that would be required before having t=
o move
> >>>>>>>>> this from a Kconfig choice to just Kconfig options I don't see =
that as
> >>>>>>>>> being a relevant question here.
> >>>>>>>>>
> >>>>>>>>> Or did I misunderstand the question?
> >>>>>>>>
> >>>>>>>> More like automatically have a Kconfig option generate it's _SPL=
 and
> >>>>>>>> _TPL variant.
> >>>>>>>
> >>>>>>> Ah.  Well, that is rephrasing my first question.  Would it ever m=
ake
> >>>>>>> sense to have more than one of these enabled?
> >>>>>>
> >>>>>> For some sort of universal SPL, maybe ?
> >>>>>
> >>>>> So no, there's not a reason today then and it should be a choice.
> >>>>
> >>>> Can you provide some more detailed explanation why we shouldn't gene=
rate
> >>>> _SPL and _TPL variants of Kconfig entries for all Kconfig entries ? =
It
> >>>> would make things much simpler and permit configuring SPL/TPL the sa=
me
> >>>> way U-Boot is configured, with their own set of options.
> >>>
> >>> In the context of this particular thread?  I don't see how it's helpf=
ul
> >>> to say 3 times that we're in fact building for Tegra or STM32 or SoCF=
PGA
> >>> when you can't build something that runs on more than one of those.
> >>
> >> In general.
> >>
> >> Here I can imagine it is possible to build SoCFPGA+STM32 universal SD
> >> card image in fact.
> >=20
> > So that's the case I brought up at first and you said no to.
>=20
> I think I don't understand this part.

You're talking about a binary that runs on more than one dissimilar SoC,
yes?

> > I don't
> > see that in the foreseeable future but I don't feel so strongly about
> > making this config area tidy enough to argue the point.  So fine, leave
> > it as separate options, the default y if ... is reasonable enough to
> > ensure we get functional builds.
>=20
> This patch is OK as-is.

Yes, since I'm no longer asking for changes to it, it's fine.

> My point is more in the general direction of being able to configure
> SPL/TPL/U-Boot separately, without being forced to craft nasty ifdeffery
> in include/config/board.h if I need something enabled in SPL, but not in
> U-Boot, and vice versa. And for that the Kconfig should be able to
> somehow emit the _SPL/_TPL/U-Boot options of all symbols I think, so
> that we won't need separate entry for each.

I haven't seen a case where the nasty ifdeffery in a config header file
wasn't basically either:
- Now wrong (we _have_ the symbols today to say we don't want X in SPL)
- Working around a case where we need to use $(SPL_TPL_) somewhere but
  didn't know that we could use $(SPL_TPL_) to fix the problem instead.
- Now not useful (for example, disable CMD_xxx for SPL, but we've really
  sorted things out so now so doing that didn't help anything).

Now I'm happy to admit that I just might be missing a case as I've only
gotten as far as "undef CONFIG_[ABC]" and BOOTCOMMAND is possibly
leading to embedding a long string where we really don't want it.
Please point me at more undef cases that need to be resolved in some
way.  Thanks!

--=20
Tom

--f3n33hPtqmWgzvaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hV1EACgkQFHw5/5Y0
tyya0Av8D4b2hYe7HS7RrKIECqlsce2I/VBN61xDNLmpEjNWjNmLARmsquppkt8Q
lUPjRyUc9KoB8dyAbMOuYc2O2ogsmsFZNtObRE+Oqh/kbAgey5cpD3syIkAK4QHA
r96iRCTAwYBpnKrOG494rziBnsvnbWbs0PhrnFyEkvJTW2mzUMhbpEq3Y4OGdrf4
CQ7R7ym0f2CNU4oXvC5NfgtUXEaRyKbnnEEp/zJF6o6vqp/Vu07BHKaGrVZUVUTY
IXxia6XsoFiuxT1rGZ8E898pyTHOvZVG73RiYFCG5KOfs7+dImt4gc6Xb2Zjx7ed
NUzE4sEcFzV5y+hSnjEXHfHKYRoANSvaUfNuGzOjBcQynOpeFg9PXYz1fOi+4RL9
vrp1rrgYlLAI6NdwOmk0LKm5rapKkP1uX9G6/O3uybxPNe63jOdBlWotEQdQJHNm
xAyOUbzMmX1Rha7DBkbA5F969RvZywNLSYjY0tPc+5oJ68vOciqpWk1bl147DY9d
skpb7ZnK
=Me4P
-----END PGP SIGNATURE-----

--f3n33hPtqmWgzvaY--

--===============3187735588286229682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3187735588286229682==--
