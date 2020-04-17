Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 864611AE72C
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:06:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 524C7C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:06:46 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E980C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:06:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id j4so3958051qkc.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+0UeIC5Ht7GvDr6z+gVsF2rDu90M70HR06D+6Wn84NA=;
 b=XCdDKkLV0tvZ2zeRGl8RZjtWHfYxpN2h4jlwX6BrWUCxQgOKryGPb5yN5tW4P+FRVo
 cixfqW/QCKKSb8yNctpUqW7YADICbmBrI21rQdyBb0Iry2JqhqFAXRRB65eNsIdA+AqY
 nfwKKww79zhuV46ziESgyhULqA1P0m2DWtfDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+0UeIC5Ht7GvDr6z+gVsF2rDu90M70HR06D+6Wn84NA=;
 b=HevULr8H/NLhM6vQInGgxrhjPCcM41gTHXg3ir+LKVIrXfc5Rg0WbEJS5sqfM1HO8x
 EszZdDxi9mR7gjb5Avd1UOWajBzFdis/orM4KW82asDsLBRWezW7SItvKAPfq8OiWsG9
 DCIKZZGSr4bTzdcPDYDlsS6fMMUfRVH/bz5rdtme+n9cUBdzWD51MtKcMwwiRcb84jno
 bLku3xc6coLIjmIPytoNZ+C8foIRspIdmwzpyO5EifTFS2x2YNfmWeSRXgDaDEZTVtX4
 rF9l5ChQSMrOtuXho6ocDQHngDX/PSPIjlRvkGTJB/42PVL8PPsQzl5xsPqgDIW+V6NI
 pswA==
X-Gm-Message-State: AGi0PubaKYkJtZDZRu9m4DvKVi6+IKe2ddnxDqn0Y319rvCI/Cz+Rnu0
 QzHZQjVdrk5a4/00eeO/tgROxQ==
X-Google-Smtp-Source: APiQypK8itHGaVfHbQ9MMyZ4CI/yxLikTFLM15Ebgubi8qnG/T1XyT1tLRB5IOO+NhyuAb4SHbmUFQ==
X-Received: by 2002:ae9:e805:: with SMTP id a5mr5212019qkg.493.1587157603030; 
 Fri, 17 Apr 2020 14:06:43 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id u35sm5526333qtd.88.2020.04.17.14.06.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:06:42 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:06:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210640.GQ4555@bill-the-cat>
References: <20200113103515.20879-1-patrick.delaunay@st.com>
 <20200113103515.20879-11-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200113103515.20879-11-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 10/21] gpio: add function
	check_dir_flags
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
Content-Type: multipart/mixed; boundary="===============3505808770946519081=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3505808770946519081==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GeDkoc8jIzHasOdk"
Content-Disposition: inline


--GeDkoc8jIzHasOdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:35:04AM +0100, Patrick Delaunay wrote:

> Add a dir flags validity check with a new function
> check_dir_flags.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--GeDkoc8jIzHasOdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGl8ACgkQFHw5/5Y0
tyzyAwv+PQ8b8YK78mV38HYvY/Vh1MgFZ+F/PU9I2CG6oZBOI5wQAGxt2ldufDXx
f8mEwgcok7mOZW4CZlQgjl0vi6GiF3aalYk1ndoWAC1a9zx5FJbNXAWP2aOaatKG
QiynoLMUDvfJA2w36NHt/ttYz3r1yKYdJYYE1d4r7VA6NPvlDXyl/djifOVXyPDi
dXHMJZ9iN3nBDPLceFx4Vr8CYFxe2ShnKXR1TLMV8N8+HLiV078weJ58dxq6PNJ+
kT7j6yyj9SEdJBHNYTj2Y63m2afq+rssLhn0AVGPzi9D9HKlnaGa2ulGP1eKqoNZ
bGHlu5arfJT6ycprnGnY1uzwThNo1gpUZy2VzoPH3CNJvtwWSuT8W9+DhRBzs9Ig
cjGKDMuZbWQ9y2RyGo47IKrNGtY/rtYSRrCOwETOdQM/7liwf3VAYIVm8nUssakC
oOG40RAxiZamwWJS6EL6HWjRSai374cdJ4VGk1iPFhN6RqbYTpBgyqCi0d6NwdkQ
LWq9McDf
=d/wl
-----END PGP SIGNATURE-----

--GeDkoc8jIzHasOdk--

--===============3505808770946519081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3505808770946519081==--
