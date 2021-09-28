Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E3C41B67E
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Sep 2021 20:45:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62878C57B6F;
	Tue, 28 Sep 2021 18:45:04 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1388EC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 18:45:02 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id jo30so14075813qvb.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Sep 2021 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6ypCrSmqHUbA2N/vhzdHHf9Tqi9GOxihYK+bmZNdWeY=;
 b=qVYUih8LYGX1N25YmIZezFuorhTACfqWeNbbkcBwOWBI5n6JvbruTZAm4id5k5SNyH
 PtI2k5DtdXO4NIGI0yn4RCzh43kX6LRjxzMKCG/JxiBwiAsgXz/6KiQZ0OwGMCtQst2L
 CVyPgbR8TQq5oZsArRnfiuGONPzgB6kPtlQ74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6ypCrSmqHUbA2N/vhzdHHf9Tqi9GOxihYK+bmZNdWeY=;
 b=k0ILs1d9x2XVjpXbbwnhVVfCxObLKSYdS1emJS/2kvExeOnpBouL6/vUScQtRyI8ls
 eEsew66WYZvV/54nI9gq5FJHdWasIlnoO9cE8H+HnugAyfn6uculbD9DplJZzPLYH7A1
 GtaeOQEN5LTajJVKHICYQRj+aL+hoLuYbwzn0tcm4yOcD8nIRSNxQGJ9lJ+/l1zBxkZ+
 +LLpwTTtU7mF2MSozdi7ay98Sstl7+eq/mtnMtpQCqJ3KG1TqVtQAB8/PfUFnflSrDM5
 eudZF1q/BQncfjOhXQaCDuUlNX2gsTgONL73UsxFOc5S7lpA0ocWBMruqgiCzkbsDGK0
 BVXw==
X-Gm-Message-State: AOAM533RE1DRGDjnRNITMfwrvA+IZxg2zb81jtBlWyEmBw8VzDx8kBl0
 PqdJXYkbvGSIm+ILOqUdgcHrNQ==
X-Google-Smtp-Source: ABdhPJyfNBgOi2OHj90rqQcBx8HFw3+tfSbZ8x+9xT9aW40w7d2jSWJv+KFFzzMkcOqy2LssClivZw==
X-Received: by 2002:a0c:b45a:: with SMTP id e26mr7368678qvf.59.1632854700356; 
 Tue, 28 Sep 2021 11:45:00 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-c022-6242-d139-1392.res6.spectrum.com.
 [2603:6081:7b01:cbda:c022:6242:d139:1392])
 by smtp.gmail.com with ESMTPSA id w9sm7292647qki.80.2021.09.28.11.44.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Sep 2021 11:44:59 -0700 (PDT)
Date: Tue, 28 Sep 2021 14:44:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20210928184457.GT31748@bill-the-cat>
References: <20210913142553.24333-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20210913142553.24333-1-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Farhan Ali <farhan.ali@broadcom.com>
Subject: Re: [Uboot-stm32] [PATCH] mtd: nand: raw: convert nand_dt_init() to
 ofnode_xx() interface
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
Content-Type: multipart/mixed; boundary="===============9201131965702862914=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9201131965702862914==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U3jK8g368jZ6I4TC"
Content-Disposition: inline


--U3jK8g368jZ6I4TC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 13, 2021 at 04:25:53PM +0200, Patrice Chotard wrote:

> nand_dt_init() is still using fdtdec_xx() interface.
> If OF_LIVE flag is enabled, dt property can't be get anymore.
> Updating all fdtdec_xx() interface to ofnode_xx() to solve this issue.
>=20
> For doing this, node parameter type must be ofnode.
>=20
> First idea was to convert "node" parameter to ofnode type inside
> nand_dt_init() using offset_to_ofnode(node). But offset_to_ofnode()
> is not bijective, in case OF_LIVE flag is enabled, it performs an assert(=
).
>=20
> So, this leads to update nand_chip struct flash_node field from int to
> ofnode and to update all nand_dt_init() callers.
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--U3jK8g368jZ6I4TC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFTYqIACgkQFHw5/5Y0
tywsuQv+PoLh02oZqiH8LyWNdKsqUuy22gmr00UXCqPLGxnhlawuxCy8xILMj0Lt
trkZ6ih2wgoDzWoBeOeRD01b4fY6mg8B9ULUimOW2CafcJFx7us4A2SDXvccUeqo
W2lI5xt6I+Bh43TYg9LXZ3bFLlVDuGmpN6NQmHWNnuj5zbOqtOt7WsgSCBG4qD25
QApam9757JoDl6rUtSttM/NK3oqa5mXrzmEfW42bsHyA2PwWJpktZShrox/vcG0Y
dGMIc3TNq9f7TdvQUex+aNkP2P6ChSUh40FHRlrbeoxSzS1bE+IdFVpI0jnYaAvw
HpbRJRbHuqVEFdpStyel8W349d8yUJ3VoKOutK9GIdqRJhRrLcpnRVnVvRicuglL
BNtXPmrUYQKosy3baPPVimNBy6e+gCNwtvVrrZI1rKrPTvMoc8cWBuMLj6uekjl+
2GoagfWGk2O86HEcgES5eka+KNP4+vX3tDcKhdgUOqKw9sz5TUFoVxfKV44kb8Fq
JbTpa/My
=QeUK
-----END PGP SIGNATURE-----

--U3jK8g368jZ6I4TC--

--===============9201131965702862914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9201131965702862914==--
