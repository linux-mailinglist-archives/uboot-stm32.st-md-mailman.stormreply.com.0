Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D58586F
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Aug 2019 05:16:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47F8CC36B3F
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Aug 2019 03:16:41 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4458CC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2019 03:16:38 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id j199so33339497ybg.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Aug 2019 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dj0bdEaTTgWwoD0NkXkZwmhSGU4zIxqVxptE7FRiPDM=;
 b=YPvbZlMtQ1lZAmk8DoxpbMgzN9upEIFy1T4ROJb48wdfaLV+Lx0h1sRfrnQZjbiOKZ
 ifDp1Xq/x8oDIHWhFhm6XT9h505hVz2cOqy/cs684BVkgvAxSK7BJ/il7bLg6HsTnIKs
 8034xqY06nixrUw+clrvLWS+GN0J1ONIrhMm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dj0bdEaTTgWwoD0NkXkZwmhSGU4zIxqVxptE7FRiPDM=;
 b=Zs1PYao/nuNgqQiiUaKw1sH2YtYOQqSj9gAYa1kPXjx6dpWtByJHSj7hE6bmCWOfMI
 4Pw5ZO5YCpA6hdIV3s0PVFRXVO4/FlGIASM+8kMAkc4/X9Eyp/1GwCxGlsJDLUIVIX5n
 yddBr2XLmFs6Aa5S/HHnHUhtpqURAJMg8xaB6OIVfiLIHJtSPfGEddlq3+ETwjDqv5Co
 X0kPIwi+CzFH97EPX/W6Gyh2nRBQhSzsnEgceJwX8pV+5KMdk91j8VoUp/yVN4mXfvme
 vbZXFGFmgo1Y8UsbjyqEqTHWLTYVQNY9V6bCGPMsUpdOJRGnBIwLmGa7i8ltbU/9PdH+
 RNDg==
X-Gm-Message-State: APjAAAXHAL9V2zk8k/fpvSwxiKLzfur6uO3QxbTnkGoy8EJUL8hP0NSK
 NanBzX3QZ+55iirF4uM1RjlIxw==
X-Google-Smtp-Source: APXvYqwe2anlUe16uyxBYnCtFjSEG+U9aKzN97KOL1plvLmKSGMb3GGdht0NXsihKyaW9SVxwXsOpw==
X-Received: by 2002:a25:d6d0:: with SMTP id n199mr3637980ybg.243.1565234197604; 
 Wed, 07 Aug 2019 20:16:37 -0700 (PDT)
Received: from bill-the-cat
 (cpe-2606-A000-1401-82DE-5CE2-C4E2-4F31-D572.dyn6.twc.com.
 [2606:a000:1401:82de:5ce2:c4e2:4f31:d572])
 by smtp.gmail.com with ESMTPSA id c7sm20966816ywb.48.2019.08.07.20.16.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 20:16:36 -0700 (PDT)
Date: Wed, 7 Aug 2019 23:16:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@st.com>
Message-ID: <20190808031634.GD9594@bill-the-cat>
References: <20190802125810.9808-1-patrice.chotard@st.com>
 <20190802125810.9808-2-patrice.chotard@st.com>
MIME-Version: 1.0
In-Reply-To: <20190802125810.9808-2-patrice.chotard@st.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 1/2] console: update silent tag
	after env load
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
Content-Type: multipart/mixed; boundary="===============8376878806043676188=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8376878806043676188==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nYjNOXWpwjVqWAsU"
Content-Disposition: inline


--nYjNOXWpwjVqWAsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 02, 2019 at 02:58:09PM +0200, Patrice Chotard wrote:

> From: Patrick Delaunay <patrick.delaunay@st.com>
>=20
> Update the "silent" property with the variable "silent" get from
> saved environment, it solves the issue when:
> - CONFIG_SILENT_CONSOLE and CONFIG_SYS_CONSOLE_IS_IN_ENV are activated
> - silent is not defined in default environment
> - silent is requested in saved environment with:
>   > env set silent 1; env save
>=20
> On next reboot the console is not disabled as expected after relocation
> and the environment load from flash (the callback is not called when
> the INSERT is requested in the created hash table)
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--nYjNOXWpwjVqWAsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdS5QSAAoJEIf59jXTHXZSTVcP/jQQ8ih/rDI4o74WSCPKbWnm
Di40XBhdXsi68JQZjnL/S5zg2vMo4+EimW9YhhUn5IF3ZQ4zpNMVpbVmW8yMTaS4
hOWBBpQuHwNFPLdzOe/BEpANUY08WdrPo0FvHYF9JiVXSeZ5l4X64JBEA6SfPxPt
FWcl98XuuHGtnwqm678kcRb/ga/6NzHN8oIF1arC7+J8WSRy+Mep14av06fE/Ycv
o78k0/A6qcsA4u/xjkE8c16OFotNB/PMl+1P4nAQaNTllvBcmalXMl7mtwKg/W3o
OqCjoS3RjgV5a2SgUgvikL6pg4ZsrPL9zhBlh5lRe8WcJ2ckiqXvFN4yHSdFvu0m
ClF+wPeHhSP4ey4CPuzsX3u2JI9Zed6LvNTKWimzjUiiHavkUE873G7KOF+9njfd
ovhrluLiZzsxk+/FK0BphmVz/9a86Rvw3gEVIbUBNJc7fXPzQFSRIJCq85OxABAT
YLjC+rr8skNjiuuNEs+23T80YoncV+g2yGLd7bbaDWtxrAJDVBTGsnE8AymZ7aVK
Ue9yK1ge83FbJPwxH7huR+EbGdsfFjb6vGyniMGCBT20UoxBkX61wQDUx0Guwue5
X8L5exXR7VYa4n86jFzdjhqhpIsyq47qrYbOBhT6tntOjwd3eBzN41gv8L/jsyRk
+Zdr48Iicn65n2n+Lm+r
=bcBI
-----END PGP SIGNATURE-----

--nYjNOXWpwjVqWAsU--

--===============8376878806043676188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8376878806043676188==--
