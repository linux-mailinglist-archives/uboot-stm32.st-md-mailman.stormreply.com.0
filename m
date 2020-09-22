Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C39274500
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Sep 2020 17:08:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 434EEC3FAD5;
	Tue, 22 Sep 2020 15:08:24 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1BB3C3FAD4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 15:08:22 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id q63so19311701qkf.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Sep 2020 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BilbgUHpinodlQodoycZQjkVDD8wA1UunnQ+0aHcV50=;
 b=rLYTIgRkExg0S2WK//ycHllfkRbS6uiWKODIZGR92bswOzenZnDziRWDtxLJwUJz5N
 ycyGBszjYIJaIIEc97Piz6W5sUODw5agvVUhY7Szt7a3F459xDl8mjvzmarRR2reY/s2
 VENn5AvPO7gG0pxTwDDr1rLKmz2d2arbnZKjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BilbgUHpinodlQodoycZQjkVDD8wA1UunnQ+0aHcV50=;
 b=N5NHXtZz0/3EpUMItOfVyWUSCAikTJquY4e/CoHMEivSqlh5+5hlYXhJSWf8+tbJPR
 iWf6wHuwN7sxz4CeoBTOI1pDT0U6pR+SoFOpbWm5v62d4cY/aD2FpCw6+mRQDXVz+5Ya
 NrwrdZ+0IKTeS6/LTCVo+y3NgsHu0XI0jFSftua9ENm+XANVjgVmAqSGPQ0PLyqdhI6B
 LRG0MuT0wqVnZZ8gR1K0pNFzxuUpI/O8jbm4N1r1xtNv3PROmxjJOCLllsFeevqlmxZP
 HxeOUzugATUVD5o/1C/JZ2lUu8v13iMk5PL7uduQ7GPyEJrenPlwC4cRxeJ8gqfiaGZE
 laHA==
X-Gm-Message-State: AOAM531fB6D6y03HpaJKOKXdFBHy191J7FZAnXHIKicJlQBxUAhyrgm3
 sxPwNICKsPRegjjLiNlkHyPktA==
X-Google-Smtp-Source: ABdhPJwFJZ3obbmsxWGIsd9Qz+8SfxmbtteQFOoh6DBYA0X3N7V9wije44zlxnlTYAgOowvFqUwPZA==
X-Received: by 2002:ae9:e8c2:: with SMTP id a185mr5358349qkg.435.1600787298757; 
 Tue, 22 Sep 2020 08:08:18 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-a44d-5ac0-e6e7-4c04.inf6.spectrum.com.
 [2606:a000:1401:8ebe:a44d:5ac0:e6e7:4c04])
 by smtp.gmail.com with ESMTPSA id k5sm11256326qkc.45.2020.09.22.08.08.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 22 Sep 2020 08:08:17 -0700 (PDT)
Date: Tue, 22 Sep 2020 11:08:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200922150816.GI14816@bill-the-cat>
References: <20200703153646.28533-1-patrick.delaunay@st.com>
 <20200703153646.28533-8-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200703153646.28533-8-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot-amlogic@groups.io, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v3 7/7] arm: meson: change trace level for
 phy errors managed by uclass
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
Content-Type: multipart/mixed; boundary="===============7696530796047173324=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7696530796047173324==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wG6oWOmweUVxAUPD"
Content-Disposition: inline


--wG6oWOmweUVxAUPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 05:36:46PM +0200, Patrick Delaunay wrote:

> As the error message is now displayed by generic phy functions,
> the pr_err can be change to pr_debug.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/next, thanks!

--=20
Tom

--wG6oWOmweUVxAUPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl9qE18ACgkQFHw5/5Y0
tyyIngwAuSj9JVhiMwfqaztoAClPPhHDBAP+XeEcwsK5vaRvqC6uMcrSRP5SvEav
omYzUzjRnHzbPNrE1eVK86JhHAlOkjuX7jL1KuuWlB08PeXEpQkxbvUeK8OZ5D8c
o/C9/Rg2HPLYm1c9wgPBjMWCQpM1QP1AVmAkVGp6aW9NUHL8zydbkMK7jOLGZwCP
NGHkC/skLcjLPqXpmVI+sNF0Fg1/hExzqaZHumEdnOYaMxXVamao54SW5XrtJS4t
kpwc04LTdqU4mQoJrFNCyHCaGohoHpgyURafjf4RQHpg50qO9eavy4+hE4o4JQZD
4vdNRSBMarmzE4dOLFJ8XlacZGp5brxNvVVDJ/4HMjirc3wMRZd7klvvyt0FWdwR
VPP+DOuFO+mWi4dp7KnvKgYPg3/hNyUnHyXNACLxQOozcRsPOLUkPsEhL4agu/vl
fjDHlkE5XJApxsR7Nj0M9OWx1KR29Kyovcd10et0DJq1OhCOrP58zZS8POJGnLPB
1zn+mUh1
=blzh
-----END PGP SIGNATURE-----

--wG6oWOmweUVxAUPD--

--===============7696530796047173324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7696530796047173324==--
