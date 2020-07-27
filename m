Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79022ED5D
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 15:33:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AFE5C36B25
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Jul 2020 13:33:05 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05307C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 13:33:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id c12so3122773qtn.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=whDyPmEmRRZ4GlQYRUkpU2jwVvm0SOlStEEzLOfFakQ=;
 b=JWnmWZoFXPNJdqVGzk9m5xicee8PSazoV/CUGgkNju5krglzp/mCZ00tPphcGqCtlC
 aOo6vzqjuiFefn1TLy9JP9m8PmedDM7L/jPlTL8FzkZYOC8Qp9DxIA4zJVze8r0S/FVB
 CPaIb8/XfCKwJYl/TfocvMPj9pJXxQZS9ajqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=whDyPmEmRRZ4GlQYRUkpU2jwVvm0SOlStEEzLOfFakQ=;
 b=XV8VBnNNYqM68a3OMjlNaT44NrIw9EHbL8bugONFcgKTqRNI7m6MHqzBoscWDLaL9t
 EnHgBZTl10uVu5mJiIjwpi7cwji+RQzUiFDlB6xK1/mUPltVFpa1C4d9PmkrIs/wK+oa
 s4H2EXUddPfFHRUXnRqjU2uVaDEgz20Gp8yeyov5RiQxYeILbwUDTwbUoiUT2irYAdEP
 QiGwZUbwwQdE7Vrcc3anglwzlOEccTNjmsJJfLK+7IV7QGaIhwNwuBYYhx8dZ3kLhibL
 873E8eQDXg9+DFMCtSAduyYMRs9L4SzmtgkV/DV5UOBkaOhYTgOcP8/Q7qQzIk44atpb
 Xu/g==
X-Gm-Message-State: AOAM531qiN0EbDl4u94q+yEfSVzu1B3yRoIWCxvM7aKxSZ705zG/xZlv
 gZUgWJ3XChDuejVSdsWe1u11Wg==
X-Google-Smtp-Source: ABdhPJwnLJ/tE1Zwy3WYQ0yL1HQ5cpoFfMJlseRdecHz/ZYffbMsSr5Gxw3HvjeceYUv0+tH2PP2IQ==
X-Received: by 2002:ac8:ac3:: with SMTP id g3mr22170168qti.178.1595856782983; 
 Mon, 27 Jul 2020 06:33:02 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-f1b9-a518-346f-c376.inf6.spectrum.com.
 [2606:a000:1401:8c61:f1b9:a518:346f:c376])
 by smtp.gmail.com with ESMTPSA id r48sm14345970qtr.17.2020.07.27.06.33.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 06:33:02 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:32:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200727133259.GF6965@bill-the-cat>
References: <20200624081751.2220-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200624081751.2220-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: add failing trace in env_save
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
Content-Type: multipart/mixed; boundary="===============1820419510702289793=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1820419510702289793==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X3gaHHMYHkYqP6yf"
Content-Disposition: inline


--X3gaHHMYHkYqP6yf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 10:17:50AM +0200, Patrick Delaunay wrote:

> Add trace in env save to indicate any errors to end user and avoid
> silent output when the command 'env save' is not executed.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--X3gaHHMYHkYqP6yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8e14sACgkQFHw5/5Y0
tyyQLAv/bKgGXoQnIx8DKvA6b4WabJoUJkkYNuWCd4BwGBDSo1tEZ3mCjgoFjFMc
KdNQBoye9bZIzDM3ia9uRYzWjmwrSOpU0HVU3KiqXeNuu+N+8HyD1oFCbwM8I5Q/
Tt4mRIqf/pSLUg7PR2bAYFnmHLvsTFPz1VnKeKRrrAwYTjoUErQKlAA0/01n6U8z
Pu6T/EhrVrAWZRKoCS0cGkHpxmR6iDB3y0MtSypS3Nx43gvhpEnXCXTawKVtLAsj
eqR3JodCrB/gsCtg8lyLNIKzWkAwFg5XLdab5jD3zIjiW2rMXaJ9JnIvzONOA+sY
5DgTUvylX0pX/Fr3GQ8EkhQS5s7l00o2x56GzhYr9Tzq8uoilGg5G72Jy9K1bdIf
RSpYpFcCbG2uOChtkvk71m1kqPALlY2S0JARhhK+8DKQGjxDus3y+8OHWTHOIW06
C8FWSpf/9Zvm7TKSHx91IGsDZfLHBuHthbY396Kf4k/QSusrpf+mHyL8BqCsK1k5
pP/MQJkV
=w1+c
-----END PGP SIGNATURE-----

--X3gaHHMYHkYqP6yf--

--===============1820419510702289793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1820419510702289793==--
