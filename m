Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D67C32044
	for <lists+uboot-stm32@lfdr.de>; Tue, 04 Nov 2025 17:21:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DE1EC62ED4;
	Tue,  4 Nov 2025 16:21:27 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E57E4C030AF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 16:21:25 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-656b612e607so262228eaf.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 08:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1762273284; x=1762878084;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XPGQR6/GshY0bEVmFkGgKky3vbGIjMpaa8LpSAM7ILI=;
 b=OS0Zh7HNEt/ZBtq+ynEXszGHYy9/6TygIsTUffnF0qDk1cAQM2vS2joxvp3uaFJYtl
 0xlnsrDimNOwv5M2DoEUSs4+NmoRr+4aGWbgJC11QzCcwdPvs91pi6QGysqJ8LeCq+Ym
 iQxpn5GQKHQMTfC0nuvBwaU+LnQ5QyRmYJnH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762273284; x=1762878084;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPGQR6/GshY0bEVmFkGgKky3vbGIjMpaa8LpSAM7ILI=;
 b=w4KyLcsEJ0VIWLUsvf+28PlvfrCatcpIwcqX9EzFTCv/0BQF0CyxNHcqwaOer0+c6K
 R98NXCj8CpSZ7oNXD6zExk80WqWQN4JkmZ7GsR2rdRI4BQZmFfUuLzeoK8wpr1s0yiGl
 06X3BxzanbAlycyvVramk+GJm1VNEFaQTuMONk0Sw1YHwzjnUHBL74mhGbggu7FuzAuM
 3Zrq473SlVrqD9aMD3ygrYHNN5uT2nCDz6/IUE56V5sFWCoPR2oxT06ZkgEbXlBjydu/
 D5HQZHs2p819LA57AiY3x8uB5GWV2ajwfNOn48HBsxQMqp2acgmh1kQJT6hViQE2nBAS
 W+uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYxF9X1fcKUJ+oUlxEgRgvxC45R6GAPiQr8FUXjwAL2JAOVL5tw+rK/i6sx42XJEkTaHx/ofi+GoFF7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjtCcWeW+q2BpWMYvlFZl0OxpyA6nC+ULw/PnDYtwLxwPbn7Mn
 3LCdbv5B/NM+nFO0qH8KmcgdVpdLbPeFXVVUMqkiChE/Qvoz/c2yPU+HlczgXNP9IFU=
X-Gm-Gg: ASbGnctKzp6j06PhlWrhxahkVrNkjqhqxjfzbKWO/xHAHIxF4PjQcp67sEjn6f93Fwc
 eCqyGx1vSvr+vIkrWPrUXrAMbtaOMVwb5FdP8OnBBCKX5uA3aEI0p0YCWjlLkA8yP27lRtAXxpg
 eRszOQjuq1eFir/QVAzyhPh/Hk/MxvCcY7Hie41xfjOEgQ5yZctWW7haCfZq40rtL3pIXVOB5B2
 QApmfA+B1cdv1NWoxJtVh0jgsap19i/dDqEFwg5b/luCwaohpjVAf3sO92oH9xOJfA8luBBidAh
 rribTyJTlLaeVvWjbOZttxI+gTZOlaL7NR9ZjQaUirrQ2OwmgT1oQrCVAePnUhDL2T3sMFz0IlB
 cAMTB9u6IGOpw8bdc04aanSs8iEmtWzFCddRogUl3Y9sdSzb9Bh/ejZA6KSLFsbUr/gMxHnGWbH
 T6yFPz9GBniqhQAKSt6cJU6UbqCPQgXcLFRhrywuedzTCpj8Ijqw==
X-Google-Smtp-Source: AGHT+IEG5m+6Cwrolq1Pd1WnLVIBaQRVx1r4VJ3+mMmkPowteA/ZtrluGaBCnV+tsI58PvG1oNnuig==
X-Received: by 2002:a05:6820:1613:b0:656:b62a:e554 with SMTP id
 006d021491bc7-656b62aef73mr605933eaf.2.1762273284486; 
 Tue, 04 Nov 2025 08:21:24 -0800 (PST)
Received: from bill-the-cat (fixed-187-190-202-235.totalplay.net.
 [187.190.202.235]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-656b6f61a93sm216083eaf.9.2025.11.04.08.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 08:21:23 -0800 (PST)
Date: Tue, 4 Nov 2025 10:21:21 -0600
From: Tom Rini <trini@konsulko.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20251104162121.GA6688@bill-the-cat>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-1-b42847884974@foss.st.com>
 <CAFLszTiT9iLx6gguhVui2Qh0Ew89yhvpDggKwPo71cB+Rv=xJA@mail.gmail.com>
 <aQavXq6jVagkIa53@thinkstation>
 <CAFLszThdV7cZ-uBXzqRYWv-HsGbNJV9BVKVOC4FQUD1yjZDNkg@mail.gmail.com>
 <20251103141726.GJ6688@bill-the-cat>
 <bcd23bda-23f5-4e65-b09f-93ec4eb60414@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <bcd23bda-23f5-4e65-b09f-93ec4eb60414@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Simon Glass <sjg@chromium.org>, Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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
Content-Type: multipart/mixed; boundary="===============9087845247387660765=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9087845247387660765==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NMiOv1mOKgz4MCMu"
Content-Disposition: inline


--NMiOv1mOKgz4MCMu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 03:01:31PM +0100, Raphael Gallais-Pou wrote:
>=20
>=20
> On 11/3/25 15:17, Tom Rini wrote:
> > On Sun, Nov 02, 2025 at 08:53:43PM +0100, Simon Glass wrote:
> >> Hi Raphael,
> >>
> >> On Sun, 2 Nov 2025 at 02:10, Rapha=EBl Gallais-Pou <rgallaispou@gmail.=
com>
> >> wrote:
> >>> Le Sat, Nov 01, 2025 at 10:03:59AM +0100, Simon Glass a =E9crit :
> >>>> Hi Raphael,
> >>>>
> >>>> On Thu, 4 Sept 2025 at 14:53, Raphael Gallais-Pou
> >>>> <raphael.gallais-pou@foss.st.com> wrote:
> ...
> >>>> Please add a test for this in test/dm/ofnode.c
> >>> Hi Simon,
> >>>
> >>> I'll gladly do that, but I haven't write and use any test in U-Boot. =
 So
> >>> it is a bit foggy how to implement it.
> >> There is some info here:
> >>
> >> https://docs.u-boot.org/en/latest/develop/testing.html
> >>
> >>> Do we want to create a fake device-tree and test each configuration or
> >>> do we want to test in the _current_ device-tree if timings are correc=
tly
> >>> set according to the index value ?
> >> It looks like there is a 'display-timings' node in test.dts, with three
> >> subnodes, so you should just be able to get an ofnode for that and then
> >> read out one of them and check it.
> > OK, but what is the utility in doing that? We don't, and aren't, going
> > to have tests for every valid possible DT node, and this isn't
> > introducing new library parsing functionality (the most recent patch to
> > test/dm/ofnode.c was for ofnode_graph and that is important to test). We
> > don't have display-timing tests to start with, so we're fine not adding
> > something more here.
> >
>=20
> (Adding back Patrice, whom had been removed from CC.)
>=20
> Got it, so nothing to do on my side.

For this specific part of the series, yes, this seems fine.

--=20
Tom

--NMiOv1mOKgz4MCMu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaQooAQAKCRAr4qD1Cr/k
CmXDAP9uzpcOa+uoGXZCOygBJwFcy2WMNjfUnbVPd7puotZ9tgEAgYlK2ApJRB47
EL3dF2lm3gnwbuaFSnvSPzmbiV4kiAc=
=ODew
-----END PGP SIGNATURE-----

--NMiOv1mOKgz4MCMu--

--===============9087845247387660765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9087845247387660765==--
