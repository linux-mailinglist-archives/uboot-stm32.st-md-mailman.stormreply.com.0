Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4995E27EDC5
	for <lists+uboot-stm32@lfdr.de>; Wed, 30 Sep 2020 17:48:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E3A3C36B37;
	Wed, 30 Sep 2020 15:48:55 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B77ABC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 15:48:52 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id cy2so1138427qvb.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Sep 2020 08:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CVVwwvj7/i0Wk5bvLK/OwkJE5oUJPZDW2hyYIQrsQS8=;
 b=es0uH4ErA5HLg5MvODlgKFc7JlUBuefGLQzM/nYeK3hCPLIoPkXkJ88EZ1+UeCW/hW
 eKNWFqPPPdlK6fRLZQRqhxPg2NONTG5KtMapT6DhxHoe38inNIgs8S6pPq/CPa5LhD6A
 St9XAxVujphyegyWHJR5JZ4fWu52k2Tbj23u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CVVwwvj7/i0Wk5bvLK/OwkJE5oUJPZDW2hyYIQrsQS8=;
 b=kYiSnoEZgbD8+10YR4bCXg4wREMxNWzsy11gYKj99u7Ba44ouNzHeGRL9y8m2iJkMP
 UzhFEkvSmTOmuKOczDwl9EAiHQX2J1vFUH1+6AZBuoJwippaBus7gZuStagwa/NScDB+
 N9NR4V8gyfexunLP8qG0zrNe3AKlvzLMgo4xwjgkjkcNMa6PVkmb0fHmStXNkOJbEGMZ
 lvRajyUwGJ+Thprt5xOO9i3QypG/Pnxs4IMj+2YIjTR/nbG92aO3tUity5e8vz92trX5
 /kBWeo1DoeX+FDGhY4gt/HNz8uoh0ZoN8NWQqmsbAvZkb0TxUqSxStS02P/huPckU0Pv
 WLQA==
X-Gm-Message-State: AOAM531X8qoUlGO7tjQig+Util5rBazgDCWp2UxqpBqASlzFfzVE+4Cd
 hH3gOKWXQuWOYiYGvVi+61g4aA==
X-Google-Smtp-Source: ABdhPJwgHtx2grxbHfRPsGt6ElZG8lnoGCZHV0vZV9tbh/4ZRi52gccYVkOa/W2rph4jkD5OscCtBA==
X-Received: by 2002:a0c:80c3:: with SMTP id 61mr3006365qvb.23.1601480931621;
 Wed, 30 Sep 2020 08:48:51 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-2185-3192-0f2f-246c.inf6.spectrum.com.
 [2606:a000:1401:8ebe:2185:3192:f2f:246c])
 by smtp.gmail.com with ESMTPSA id g5sm2634671qtx.43.2020.09.30.08.48.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 08:48:50 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:48:48 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200930154848.GE14816@bill-the-cat>
References: <20200930174454.v2.1.I3f984b644583cb7080d779898cebfed8669d3f33@changeid>
MIME-Version: 1.0
In-Reply-To: <20200930174454.v2.1.I3f984b644583cb7080d779898cebfed8669d3f33@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: chenshuo <chenshuo@eswin.com>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Simon Glass <sjg@chromium.org>, Tero Kristo <t-kristo@ti.com>,
 u-boot@lists.denx.de, Thirupathaiah Annapureddy <thiruan@linux.microsoft.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH v2] optee: copy FDT OP-TEE related nodes
 before generic FDT changes
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
Content-Type: multipart/mixed; boundary="===============2483316704024541267=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2483316704024541267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WG9qowv1NtzwMEkm"
Content-Disposition: inline


--WG9qowv1NtzwMEkm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 05:45:08PM +0200, Patrick Delaunay wrote:

> From: Etienne Carriere <etienne.carriere@linaro.org>
>=20
> Move call to optee_copy_fdt_nodes() introduced by [1] before generic
> changes in kernel FDT so that platform specific changes are not
> overridden by the changes made by this function.
>=20
> Link: [1] commit 6ccb05eae01b ("image: fdt: copy possible optee nodes to =
a loaded devicetree")
>=20
> Fixes: 6ccb05eae01b ('image: fdt: copy possible optee nodes to a loaded d=
evicetree')
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>=20
> Changes in v2:
> - rebase on master branch
> - add Fixes tag

Note that this applied cleanly for me and I reworded the commit slightly
differently to also include a fixes tag.  I'm currently testing this
(just to be safe).  Sorry for not being clear in the other thread I
would just grab that and add the tag.

--=20
Tom

--WG9qowv1NtzwMEkm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl90qOAACgkQFHw5/5Y0
tywBVgv8CsMP193SFYTwhYTeZi7StE/pW67u90Q3ngskSfpraad2z2SV3IjS+7Gf
N4p/D9s4dGe/Vxj6+J3uRJjusXz6uE80Skg1j5ureCX/WDW6epRBphHlhp8Iuzmj
uZXL0GQs85AwBxDpbPl1vclBXI42yh+VC5H1c3aiWw1KxwGdmNBAemiXWgwUEoiq
2lU/Ukm5sI8GhpYkG+hskAfNlWT2wJWVAygiicHpm0GSVSvLQch5xHvoQlrVHZpq
p0Mi97q6LhIvpdykXTG0rwR0YCfFbyBGRzBB/HF3QisuyoKb19tpH0qoYx2DttCG
l+VMqvIBvUU0X0EGVX+3+IHxQOgZfF0w3HkqayP1lUaCbXh56LIp8yWVVXpgRmW/
3Tw3No3AJ7CG3cfWvb3GLG5eWg8H0fAtrNP2FZxFDz+IjubtlL6THgyujBLLcwP7
kVZyyK7+EeMPMx61fTWiHjypLJFxH6Q6l1MMHac2rhhi9+/T5PQuOBY6kp/sru5L
4PHLn+Ia
=d113
-----END PGP SIGNATURE-----

--WG9qowv1NtzwMEkm--

--===============2483316704024541267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2483316704024541267==--
