Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3011AE73E
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29C28C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:24 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F95AC36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:22 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w29so3243833qtv.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FNkPydfRAEpWfRHNCRN7Y1naIMkQDGWqpyfQlzrcQuo=;
 b=eTB2zO2yTPWBXwlZIZs5L7DW9ACqqkGS48St35OmC4Ro0+OYqlrbZ47YABXcUwTCbC
 ser2uamqlrmu+l4hafu+aes/hZKELOR3ch3Ub4m0Bo9WNPzTpolIS10GaSID/zPAI+BQ
 ni6ue/s2ZUC8WPjs0sO4OfYkRsO/y2rWfo3kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FNkPydfRAEpWfRHNCRN7Y1naIMkQDGWqpyfQlzrcQuo=;
 b=ncdOlpROch7haBp8RBxCa4/JWOzDABvaWp3azWZadMIXYQVjEFxMYg7DrmHKLgjc0D
 Z8mlmE4/jOfnfdzBdou/4YE05etd78tXF2qyqk7qg26luxP4YSTAbtcT0x2KlhTMOqch
 i97KEWZRVJaWdOQJGcoLWiaFPtBn/P+XKknw3eAAxHty5rGNz9TFGMX9AOKgmDGPK/hh
 SqqCMudflhiLAqx6BZvdhn6xdfAF/5P9lZY6fuJXadCiowK+89iAUzwzdEAXt1zf8PYQ
 Ze5COMDJFZGKIwYTCZLX1uqv78DVyydZGP2OWCZxbRZ/W0oYVNtWI9ZpR1eRqkjFIEXG
 KX5A==
X-Gm-Message-State: AGi0PuZKJH7ICNDe8y5WuZWc2/mEv2Zjs3D8zZkLl4r8BdCgvR5eBZZv
 cmOp9SD7bE45C3ioRFYXc8vz2Q==
X-Google-Smtp-Source: APiQypJ2CX9fmcAGJRHRukLMjVbPcjCKfLf0vKn3vj/s89BjLTbrGJZ0XY1RvE9t950GfNN9S5xbxA==
X-Received: by 2002:ac8:735a:: with SMTP id q26mr5047494qtp.233.1587157701506; 
 Fri, 17 Apr 2020 14:08:21 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id l8sm8972806qtl.86.2020.04.17.14.08.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:20 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:18 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210818.GH4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-7-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-7-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joe Hershberger <joe.hershberger@ni.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH 6/7] doc: device-tree-bindings: update
 reference to binding directory
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
Content-Type: multipart/mixed; boundary="===============1389034136621868186=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1389034136621868186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X2rN3GNvz+yeh2G1"
Content-Disposition: inline


--X2rN3GNvz+yeh2G1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:15PM +0100, Patrick Delaunay wrote:

> Update reference in files detected by
> scripts/documentation-file-ref-check
>=20
> doc/devicetree/device-tree-bindings/  =3D> doc/device-tree-bindings/
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--X2rN3GNvz+yeh2G1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGsIACgkQFHw5/5Y0
tyw5JgwAiorXq+PNzmKagcG8a7/qAJWTCJHfF8vuqjNaYn9XurHvPNuofaOHBkEo
hTZHmEJoQVnWYHb2mHIcS0FSt0nzkAyVB63DzD/dVlFgK3DeH7Xvl4O4vlDRYASn
qIJcdmYAKihZvOUStDOWtQ/OsXq1c7NPyiulhfK5VYxRwhW0+2XKeLZG36tzMX6q
s4CAes9+vH9UuJ9fbd4sFyw5m9j56jOPM4Yt4t+qGyjKsSpHUe4mK0zOW8VGcOjM
RtY3U9ug+5RQfqTqm5LFkiz2q+ryXvdLMV+55NJIz/i8QTVnwGFIQVixpjMfTPDt
NWckC51GKBJMPbHRsGdIyTqhA0oy8AstwUCE6IIKx40StBWRsPDY4w6YiKedrDl4
wGJDo/8MyWfVCfJlbsaVmcyu2UKHrk3uFHornrq8mcIxtazqz0Duprv6Kh51jZih
gNV3DSBWCzf/coXKvU45EwAIivITIu8k2vR3IXmdo8swHset3kcPdELronbTXyNy
HI8dE3YQ
=zZFi
-----END PGP SIGNATURE-----

--X2rN3GNvz+yeh2G1--

--===============1389034136621868186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1389034136621868186==--
