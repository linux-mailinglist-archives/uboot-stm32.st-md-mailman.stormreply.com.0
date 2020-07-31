Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42877234D3C
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 23:40:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5BCEC36B33
	for <lists+uboot-stm32@lfdr.de>; Fri, 31 Jul 2020 21:40:57 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9C19C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 21:40:56 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id l6so30180284qkc.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Jul 2020 14:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8B0iTJfc9p3uBM/AO1AuarivirjbMsrNnQ04/Rn/ZNE=;
 b=J78bCzpg9iEbNP91kuPAXyvA3MW90eW143Yo/lsM5BbOajqfPpVjfkLs3zNtDOrrwG
 uZu1KKS32F5L9lhpcXH56BcIwDSvjdDuCIylWfjmFCrn0Ki6UTT+PaEKvo+KgHQk5hVY
 SvLjH22cvmGrTGBPCNDtUItSILJHCWeizc2K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8B0iTJfc9p3uBM/AO1AuarivirjbMsrNnQ04/Rn/ZNE=;
 b=VBoKW0y/0lSQKxc4C1Pa77bFTInM5uRiidnj1fDt6XKGQTjE+UPQszHcA6Ewf0f4jY
 q3jK84Jib1aFf0rSlRLeUcesmHLitFijAsbHcKqz56GvfWj1Kd6JaMpnQQgy9JKdCbG2
 BPgEnS0KT7yqu2b+0PGoL+dRyPQ0su9FUpmfN7sYn0tOANQlMwlVIH8Iowad0mU21Ytu
 13c3bMozemHX10oVwUvlpjqWODSpTaJctOs4CQBCwcxE5W3EMtJG4ghUvk0pJ/gVjF58
 ya2f4l4GGYYUVVfC/amjWmSChW9WPiS1f1q/ox/Cgv+07H71tqsB0/hvKU/wKPYzhNl/
 immA==
X-Gm-Message-State: AOAM531lAYfltWONYF2OH0Rbqikzbvbj0eqPFK+XUUH9CO0Bi36BKaKY
 Enqtf6LlewnVZP0eZcLO18aFsA==
X-Google-Smtp-Source: ABdhPJxEtWTG21kBWONpZrYWab/WpVHAE/vfIxG7INSkRxBZQxozgDk/zvD4LRk/aXPV/ycU3l6fVw==
X-Received: by 2002:a37:a7cc:: with SMTP id q195mr6120390qke.110.1596231655733; 
 Fri, 31 Jul 2020 14:40:55 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8c61-18ee-3919-a84c-b555.inf6.spectrum.com.
 [2606:a000:1401:8c61:18ee:3919:a84c:b555])
 by smtp.gmail.com with ESMTPSA id l1sm10096613qtp.96.2020.07.31.14.40.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 Jul 2020 14:40:54 -0700 (PDT)
Date: Fri, 31 Jul 2020 17:40:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200731214053.GY6965@bill-the-cat>
References: <20200728095128.2363-1-patrick.delaunay@st.com>
 <20200728095128.2363-5-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200728095128.2363-5-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v4 04/14] env: correctly handle
	env_load_prio
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
Content-Type: multipart/mixed; boundary="===============1419690772671113873=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1419690772671113873==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GYFUIf6OKvquWRcX"
Content-Disposition: inline


--GYFUIf6OKvquWRcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2020 at 11:51:17AM +0200, Patrick Delaunay wrote:

> Only update gd->env_load_prio in generic function env_load()
> and no more in the weak function env_get_location() which is
> called in many place (for example in env_driver_lookup, even
> for ENVOP_SAVE operation).
>=20
> This patch is a preliminary step to use env_driver_lookup()/
> env_get_location() in new function env_select() without
> updating gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--GYFUIf6OKvquWRcX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl8kj+QACgkQFHw5/5Y0
tyz2hgv/aIECaBoH1OKNHv5qna5LWA4sSwKDwaE+nsvLKPFbclPzoM9xraFJ50nz
N/9y6OzuObgsdYJKKhtZOZe5/6cpfQkt1R4KRuAHyPub4cdC+pmzlwShJrdlNcFA
dHla88l0YE4JWYSb829XcjcW4xFv4Bt0br6wX5rR2orUL4h85rT+gZy247JIHQ6/
cpjFr31cR8raX1uJrQRgkg/9PpGrtVD/e8BsGDgjoCjL5WzTajrh0zRyU+ikrDkz
fGHpsG5lMnB/9wYPlH/LvRKIZD3+ZG7yO8eOeXwMFcg6dk5OnilP7OpZwnpkwXlB
cuXNIqSWOAE6CZ4VMY+JTYIjqMjNqjL7Hmet1pbd+oD0/Vcbju+GjxmafnJPol46
1lpV5SUn6iKOnLHFfYjxIQ1iroMgNX1D3grJ3zf4pzSIvMe3PduANYEX3VA4W1Rw
wOdfo0Pzkc/faDYzocZJvZw5cg/cFmwgo+AsSQWXvZTzjtqvRlWAvQQM9x+lERYW
R34LF6mX
=Gu/o
-----END PGP SIGNATURE-----

--GYFUIf6OKvquWRcX--

--===============1419690772671113873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1419690772671113873==--
