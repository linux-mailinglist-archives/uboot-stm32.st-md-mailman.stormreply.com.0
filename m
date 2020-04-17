Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCC91AE73C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8DA8C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:12 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79D68C36B0D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:11 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id w18so1197093qvs.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sgpaCV3c+jfzeP1riXb8EJZSxx63gMW4C5mUGRyKU2Y=;
 b=Tk0Ms29ktMH97UVgwEalrd8XmYJHShXuBw2Pu7zmVrvh4L8fcBN/7Ht1IFBlxpjNPd
 4RpLuj+O3uNCwwq/hfCZ3oqB1trNOMy66ylBJDtFYmYK4o+AO6rPBJlyS27uaLgFjAE9
 IjCVEUQQe19cbXLFiWTBomJWnsXNjZp88Y210=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sgpaCV3c+jfzeP1riXb8EJZSxx63gMW4C5mUGRyKU2Y=;
 b=V3DYGs4qHbTXZC+iJw6UB8azLIkTcTLdtVC6dQZOrL4gek+j45qapXQdq+ySuBOb+R
 MaxQVUZzO9GCQjSIXeGDyeLWQ+O0Mk/0GOFGXZDWLZipSW0y+T6lor2EILC8TCbBHuw1
 Y7M5IVTZh5p+XnfeS6avIRXCFTdiNfYnLtedhlL4DaKZheZBYM3nRA36MgGxrmTYpQxu
 v5p4r0cubXyEzgkUvbPeJ5tYl+PRF/1pv8sshcrZ9gu4Dp3LkTrcjrGqWoundMYwYmlj
 nSAZyrgxRbboKDDc/5I6UX0Y1bs3VXj7L51DR6XWchBC8SA3rJppfeh/Facui49v8f6z
 Mkxw==
X-Gm-Message-State: AGi0Pub6wKcxeM+fC6wyvX4Gm501nq3mOFg5PTbqXRNOYL4leNkTvs06
 9vdGXCrU8I9LM4J3rr+dA3BvZA==
X-Google-Smtp-Source: APiQypIlr3YT9zW8VerjSwK3zcu+30656b7kPJFOFFgwmaTHH2vPg+7BeVxE+NIjwyvs1eWJq59F6A==
X-Received: by 2002:a0c:f748:: with SMTP id e8mr4698658qvo.237.1587157690295; 
 Fri, 17 Apr 2020 14:08:10 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id j90sm18245240qte.20.2020.04.17.14.08.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:09 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210807.GF4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Peng Fan <peng.fan@nxp.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Anatolij Gustschin <agust@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 4/7] doc: update reference to
	README.imx8image
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
Content-Type: multipart/mixed; boundary="===============4448080307201539045=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4448080307201539045==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jIdBwf7/i7YThJrI"
Content-Disposition: inline


--jIdBwf7/i7YThJrI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:13PM +0100, Patrick Delaunay wrote:

> Update reference in many files detected by
> scripts/documentation-file-ref-check
>=20
> README.imx8image  =3D> imx/mkimage/imx8image.txt
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--jIdBwf7/i7YThJrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGrYACgkQFHw5/5Y0
tyz81gv/d9eX5D/OLCnd6V3uozsT2lKcWHmow7/PJkSj8GcXv4xUHG7TD0sIPdO3
rA/eKHG4lTe3IPhaYhga+nfaOhuoTs346F8FLS0c1aLjDUt+/4Yf+wqttQ6MmDhm
d0BS0q0QnBVmbDJMJ7ME8TT+pUDIPFH2/LJZKQXb2iPj3vK9Aqebzg1KGytFaS3G
mjx9y9cbAhqlfckJj7xA4jhcg7DjOti4uDhbOqx4MJ8gqOHmtzlxK09wuz95zBm8
EZMr7bwZ0j66gSyKCpWoAlrB9+9mhKejMxztbf5jns3p+cxmW030V2nQJdRNhfL8
EHRfw/w4VXLMrGqQkL69NsR0St0P8QmHEZuprbhIXUFBlhi3Nzt046GFKVRelvRd
PtWQCPZldjjPO8bxZ/Gs5rY3EeZUM3HkFVJG2+1caJvIHCV7iRjzVwUKlho6N60c
4FqgVkt95J0Qs+pLUlvPvAKl19To3C76z9TCl+atwLZY44RZ5vdg0/xf1nYg9MI6
r9pOkv1I
=YcUl
-----END PGP SIGNATURE-----

--jIdBwf7/i7YThJrI--

--===============4448080307201539045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4448080307201539045==--
