Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB21AE73F
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64567C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:30 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 532B6C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:08:28 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id p19so1654617qve.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Bq7hOkd1MeoXWDuppaTqKB/sssJfTZo8x6XgJTk67LY=;
 b=OGey1xmZHZPxcNcgQ3XcmUBokj0IuUqUdX9ZTr9LWzjcPsECggtg4+oH6OU13K5hkl
 DaeD6in5b1vtly9E8Cb4X4ISBO3PPvR3DFe3MT103OQG2EGHLIIurSo7uaWFt/m0hlF/
 vu9JRai2lIbxw66oqN93iNGIhLLJ5lp6Np8Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bq7hOkd1MeoXWDuppaTqKB/sssJfTZo8x6XgJTk67LY=;
 b=pB4G1vS26ZGuz1qJtLwiXhVyIdFRcG+Ca2C6iPi+Dpw3+S/Q8WnT10fgUU1yqEyPBx
 XqR8oLJOGse3HRHoQYFPH8SPbm05ipCoExowJkcE5DlFN90sWNuDDlsE+3XrazgkZU9M
 2YcVCJ9jLa5pRRziW8slnwhj/tuFKVTGl4iX7H82uk2vjNjJu6liB0PMX746+uqwvioL
 0CCmxw9IAdVohTj9FIPbubbrO4P4HHwc8APkWuBgrQb0ZIQKb1t2Y8K79p9zR5PTLwxi
 nbv8jqrsGIndO1kTKnwut4lZ6ieumDB/F+76dEkhtUjH/KBdtOjJfmOBlp6pRYxDzwxA
 mQOA==
X-Gm-Message-State: AGi0PuZr40E7nnXo+NMpitGsAdN5vUwPHvBbcjV7CHD6QNoVztELv6Pg
 s6ebGtpKsn3vjA7oxejkm3MDSg==
X-Google-Smtp-Source: APiQypIZkiWQFFjHaT0U6whw0M+oeZCvuiWznJ/WlhuhHA9dfQpERr861n+uaNEDqiOe8enRX7a8tg==
X-Received: by 2002:ad4:5546:: with SMTP id v6mr4929405qvy.11.1587157707207;
 Fri, 17 Apr 2020 14:08:27 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id c6sm17592530qka.58.2020.04.17.14.08.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:08:26 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:08:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210824.GI4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot@lists.denx.de,
 "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabio Estevam <festevam@gmail.com>, Stefano Babic <sbabic@denx.de>
Subject: Re: [Uboot-stm32] [PATCH 7/7] arm: imx: update reference to
	README.mxc_hab
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
Content-Type: multipart/mixed; boundary="===============5652471821800712752=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5652471821800712752==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YgGp9RfepglW4nsE"
Content-Disposition: inline


--YgGp9RfepglW4nsE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:16PM +0100, Patrick Delaunay wrote:

> Update reference in files detected by
> scripts/documentation-file-ref-check
>=20
> doc/README.mxc_hab  =3D> doc/imx/habv4/*
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--YgGp9RfepglW4nsE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGscACgkQFHw5/5Y0
tywyKgwAtvWMAkOVtNgIi9C1wS961sxXAjjQMIRNJYsF7T+HS0qUL+PVLZSXKQTd
EPjggiB4O/4yk4neXvsi4cqcJrKDB9KZMe3MyyhmIz3a35dhqWUj13oEjDIaA8OR
xcspV6aA0LpxFN4XUCj2g/fhKf8rPGYWa/PLfrgCAMnZhJtDtonYjcZwTHgr1oU7
6h3/uueekK3rrXEanJClF1GtCQrSB88bh3x/xRA0Enu8t6OFOTPlf8T6givxUYkc
TO0fYA9uGrR1g169Wr54ILdVZf6IytcT5dhpSC7t9W2DnXuxoiA2KOcr0Xa7gxz6
b/AhdT+2iWv/MtW3n3IpEUVgYpe7ulryTPk1LKYblqA2erARsvxjJ3hb6E1Ck1tG
JO1pGWX48lyn2qt8N1AeUklrmBMLEymsyu7utgyAhPtfkSGGZvISt7SQrwY+lOEX
5w9BaVeQzjWiY8fG+caGL7lctqOJTBuP+s9tA88pSHOF9wDJjm+MWFdU4ipX31R6
z6hAxBCl
=6N/d
-----END PGP SIGNATURE-----

--YgGp9RfepglW4nsE--

--===============5652471821800712752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5652471821800712752==--
