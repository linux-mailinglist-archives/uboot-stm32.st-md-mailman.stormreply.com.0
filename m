Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F571F5DB7
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 23:35:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB26DC36B0D
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Jun 2020 21:35:29 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CD90C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 21:35:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j32so3023495qte.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WssqLmDyh0Ul6/t1rCPM1RIARodQwBENiiFgCD7i8Ns=;
 b=JwBYJwiMXw9uwMZ2BbnVrdj3qa1kvjCB6JXm1gSga2aA5ZLeU1QhsygM5vJxx78V8a
 iKyernZy4Kln05YhXpF5mVT4QOebCyJILiTqpGI77O91+k+q31rxYUZ3ibzyUhUihV6L
 Dbg0c+j3w4vYy64GrJI/ORfVDcWNTYXMBhrxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WssqLmDyh0Ul6/t1rCPM1RIARodQwBENiiFgCD7i8Ns=;
 b=WMOjBGPAcwk5HBQtXpXc90GTIOE9ODwQWWx+gpq6+BAbybaKkX3I93rmfKa9n3TQBn
 MvsLbXrTJrYKOfn0YQWHxokv1BDc/C2FnJFH/zWC/NRASOQyVVwAfqrxYFw1baz/mX+F
 PA+FDtWboYDVqsYxWvrDowEI4h6enpTbuuB6t/ie1gDUlaL9uSOEa4lgQFMtGZ5AoX6Z
 yPFStxlRPmsMRwaLwb5nKpTaWgr/UCpbySL7D/r9J+yU0maUvQCKaTmaXLAbWsU1IgbF
 J066+Xj0Bsy5pDP2U1nUViwdvEZ5o80aHHYbo+rhEvy4Cv0rqCsGvUrJjg90sQ8aylcy
 OKnw==
X-Gm-Message-State: AOAM532VTzVpQKSKeL3ojjZrbgqyFIZt1kGgljFEV9ZBBTyhlo4G5ScK
 483kc3XEchRDloIjHokZB7XZ/g==
X-Google-Smtp-Source: ABdhPJxUubWjSG/UrtYut1TTtrYhCsM/e4yBt7UPH5pG7Af+AK8b5XFdh+rDBk4DXRkvxpUTrrbUsQ==
X-Received: by 2002:ac8:46d6:: with SMTP id h22mr5465268qto.145.1591824926268; 
 Wed, 10 Jun 2020 14:35:26 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-2c5b-4fc8-1785-177e.inf6.spectrum.com.
 [2606:a000:1401:8080:2c5b:4fc8:1785:177e])
 by smtp.gmail.com with ESMTPSA id 10sm678794qkv.136.2020.06.10.14.35.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Jun 2020 14:35:25 -0700 (PDT)
Date: Wed, 10 Jun 2020 17:35:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20200610213522.GM24893@bill-the-cat>
References: <20200610181019.GE24893@bill-the-cat>
 <9f331ffe-b156-8add-e098-69908b80cebf@denx.de>
 <20200610185218.GH24893@bill-the-cat>
 <552c2b40-7aaf-c015-ca49-ef14ae6ac905@denx.de>
 <20200610185851.GI24893@bill-the-cat>
 <ca74b5b5-3de3-c249-16d5-c5e1de742dc2@denx.de>
 <20200610201148.GJ24893@bill-the-cat>
 <a3f20f91-fecb-81ed-6eb7-5070574f2c64@denx.de>
 <20200610205444.GK24893@bill-the-cat>
 <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
MIME-Version: 1.0
In-Reply-To: <e9bd8f83-2542-530a-1c47-3ae839f557a6@denx.de>
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
Content-Type: multipart/mixed; boundary="===============8979555685798580531=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8979555685798580531==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQv0vi9oZBoYbpa7"
Content-Disposition: inline


--LQv0vi9oZBoYbpa7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 10:56:40PM +0200, Marek Vasut wrote:
> On 6/10/20 10:54 PM, Tom Rini wrote:
> > On Wed, Jun 10, 2020 at 10:46:23PM +0200, Marek Vasut wrote:
> >> On 6/10/20 10:11 PM, Tom Rini wrote:
> >> [...]
> >>>>>>> You mean be more like barebox and Linux where the board-specific =
stuff
> >>>>>>> is kicked up one level and we have a more generic binary?  I don'=
t know
> >>>>>>> and there's so much work that would be required before having to =
move
> >>>>>>> this from a Kconfig choice to just Kconfig options I don't see th=
at as
> >>>>>>> being a relevant question here.
> >>>>>>>
> >>>>>>> Or did I misunderstand the question?
> >>>>>>
> >>>>>> More like automatically have a Kconfig option generate it's _SPL a=
nd
> >>>>>> _TPL variant.
> >>>>>
> >>>>> Ah.  Well, that is rephrasing my first question.  Would it ever make
> >>>>> sense to have more than one of these enabled?
> >>>>
> >>>> For some sort of universal SPL, maybe ?
> >>>
> >>> So no, there's not a reason today then and it should be a choice.
> >>
> >> Can you provide some more detailed explanation why we shouldn't genera=
te
> >> _SPL and _TPL variants of Kconfig entries for all Kconfig entries ? It
> >> would make things much simpler and permit configuring SPL/TPL the same
> >> way U-Boot is configured, with their own set of options.
> >=20
> > In the context of this particular thread?  I don't see how it's helpful
> > to say 3 times that we're in fact building for Tegra or STM32 or SoCFPGA
> > when you can't build something that runs on more than one of those.
>=20
> In general.
>=20
> Here I can imagine it is possible to build SoCFPGA+STM32 universal SD
> card image in fact.

So that's the case I brought up at first and you said no to.  I don't
see that in the foreseeable future but I don't feel so strongly about
making this config area tidy enough to argue the point.  So fine, leave
it as separate options, the default y if ... is reasonable enough to
ensure we get functional builds.

--=20
Tom

--LQv0vi9oZBoYbpa7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7hUhEACgkQFHw5/5Y0
tyy+YAv+OB0VdVQYKZQxAG8qAQBCU4oobb8336PjI0VLtGZMzfVnjX//e8bq/Pc8
yJmwtyBvAuMriFnRWrEdK3C76moyIjX13uc8p4f1CE1AmQq1AfkcpNQUIfZrpq3i
/4c/JrNCY890WmDFvBkwqxlDeazNW579bL2LtgP0t+fNiDwRPct1+KyHf+mjc1d/
HY/BPPqvIqfyG95lLdWRJ/w/SApSXtRfSyg8S5kjBzZ2VFt3CWwFGwAz6g8LEwLd
QTSvbBa7DnfnmrLjTxgEmwpIbm6mwcFPyOsO+E1Rvgk8k9KOXVbgD6NZl41sETlZ
tVDt6/NNoQ2MCZrnlRw24zSfA6KHN/R0G6XxQKiIR0HUidOH/GCRc0PypsaiA9W7
up1f1a8OLVC/CbXuQoxdo5Li9e+WzMl0mUq9pIJ14WpCuWWsQTRDp/ZablARHljO
6/Q4TYtnxCL3xTlI8QnLpl8hfKmNhu5MyRDzjEIusiN7EAwzCLY8tXDlK+5QzNGs
4TfdNohQ
=2XqZ
-----END PGP SIGNATURE-----

--LQv0vi9oZBoYbpa7--

--===============8979555685798580531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8979555685798580531==--
