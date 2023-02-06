Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE368CA65
	for <lists+uboot-stm32@lfdr.de>; Tue,  7 Feb 2023 00:17:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8679C6904B;
	Mon,  6 Feb 2023 23:17:37 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A906C6506E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Feb 2023 23:17:36 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id g8so14865565qtq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Feb 2023 15:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K65rRjAXLopgV+MeYNo6vLTUQgIQzdGhS/Q6FWKlTXc=;
 b=GQgxmgQjwoCHEjW+t6gbzfpX3JykZKUyoumnjsauCo6GDfWb3phxbxs32LnTy9mgK8
 UyWKjX3wCvRQXZO+vKca+RqlmBPxtUCACk7xXLUo6ehzsTqw+7JdNmt4cKEZ9TvdYddK
 AgTpTL5fD67A8eKc4rVfNopo1WFZyU81T1+Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K65rRjAXLopgV+MeYNo6vLTUQgIQzdGhS/Q6FWKlTXc=;
 b=5AFr6tnnhMMsgz86fBnNcSC/9jeD85BbBdfHNilGsi+nJT3FRD1HTR9/X6wcNUTZO6
 JNl/A3ELxKhrUfMji3k9wMwcHSb5bZ1b6Iqf1zGDKgtCpxrHaZyBohthF0JkNDSoIoCz
 1juxsMwt9pcH+KzOb0nNYidqeqhc2WiHokzj5JbAEi2FdxKFGFS9pkOouFD7qzMKYTnq
 K9WmnydG+YdA9Ls41F9RzMyEFRpehJXHPiKS4LUFG7bEYlLVoLIhSeyEnQWRyQ+b21UY
 LOwTe6hMRXZ1jTJq5ilM2GYMbNjEuBqJpubEj29yLKx3gY7eYIGyfsNS52WP4BXR1Gfn
 LbVA==
X-Gm-Message-State: AO0yUKWO0RTngCVN2VMqwvvAHk5ex/ATqfnT/XHq3cRDHm7no7d2d30x
 G87TnwA+iektCn+l8uU6uBPtqg==
X-Google-Smtp-Source: AK7set9QpOqe6+lNE44GA+trJZQPLF24AluXU9v7mL/RDoLezKQDxS5d7CiEWMgVQVkhZQtqwHqroA==
X-Received: by 2002:a05:622a:151:b0:3b8:2a6c:d1e9 with SMTP id
 v17-20020a05622a015100b003b82a6cd1e9mr2102542qtw.18.1675725455408; 
 Mon, 06 Feb 2023 15:17:35 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-7494-fb31-9b5f-683c.res6.spectrum.com.
 [2603:6081:7b00:6400:7494:fb31:9b5f:683c])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05620a20d200b007090f7a4f2asm8254058qka.82.2023.02.06.15.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 15:17:34 -0800 (PST)
Date: Mon, 6 Feb 2023 18:17:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <Y+GKi9MlruCvNZLZ@bill-the-cat>
References: <20230206224838.75963-1-francesco@dolcini.it>
 <20230206224838.75963-2-francesco@dolcini.it>
MIME-Version: 1.0
In-Reply-To: <20230206224838.75963-2-francesco@dolcini.it>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Parthiban Nallathambi <parthiban@linumiz.com>,
 Nikita Kiryanov <nikita@compulab.co.il>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Simon Glass <sjg@chromium.org>,
 Niel Fourie <lusus@denx.de>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Javier =?iso-8859-1?Q?Mart=EDnez?= Canillas <javier@dowhile0.org>,
 Tim Harvey <tharvey@gateworks.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] fdt: validate/fix cells count on
	mtdpart fixup
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
Content-Type: multipart/mixed; boundary="===============6149572039589364015=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6149572039589364015==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i4xpTqD6yhhDBlAr"
Content-Disposition: inline


--i4xpTqD6yhhDBlAr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2023 at 11:48:36PM +0100, Francesco Dolcini wrote:

> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Fixup #size-cells value when updating the MTD partitions, this is
> required to prevent issues in case the MTD parent set #size-cells to
> zero.
> This could happen for example in the legacy case in which the partitions
> are created as direct child of the mtd node and that specific node has
> no children. Recent clean-up on Linux device tree files created a boot
> regression on colibri-imx7 [0].
>=20
> This fixup has the limitation to assume 32-bit (#size-cells=3D1)
> addressing, therefore it will not work with device bigger than 4GiB.
>=20
> This change also enforce #address-cells to be the same as #size-cells,
> this was already silently enforced by fdt_node_set_part_info(), now this
> is checked explicitly and partition fixup will just fail in such case.
>=20
> When the partition list is static the preferred way to pass the mtd
> partition list to the kernel is to either define those in the source DTS
> file or use mtdparts=3D in the command line.
> Tweaking the DT from U-Boot should be avoided, unless some dynamic
> changes are required, since it proved to be problematic when not
> following the evolution of the "standard".
>=20
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.torad=
ex.com/
> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolc=
ini.it/
> Cc: Marek Vasut <marex@denx.de>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v2: improved commit message
> ---
>  common/fdt_support.c | 45 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 35 insertions(+), 10 deletions(-)

I'm dropping the linux-mtd list here and adding a bunch more platform
maintainers. In general, calling fdt_fixup_mtdparts is the wrong choice.
I see we do have a few cases in U-Boot where we're clearly doing
something dynamic to the partition table, but it looks like at first
glance most callers are using this hook when they should either be
having the partition map in the device tree properly (and using one of
the appropriate bindings) or passing the map in via the kernel command
line. I would like to ask everyone I've added to the list here to
please audit your platform and update it as needed. Thanks!

--=20
Tom

--i4xpTqD6yhhDBlAr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPhioUACgkQFHw5/5Y0
tyweUQv/Shsskc3X1H5wB3PLofkjI4t6t8/lsreth8c5MCYSNPJGjgnrf7BxB01G
HOx4A9vIIgwmpue2ObwD8hpSMOz4uLnOYCwOvjnAcc8KXxWwQyrMG/NTLCtY7ebg
vg+3BZazqYRe//oOAM3hSF6cgngI0Y2E4GTvJH/Zzy2KR4sF1pqRjI7eTOdLUhUU
WKeHNbyXDoajg5Utz6o6lJLWnFMyO666dRL5Pi9TirlLdWVWrniiMQO5PulU4Xuj
Zt5FXpqrAUY1ttx7cm5ZAcBVY8lKmEK8pIPZEAN0VemxnXMbvzSbInJsEkPAEwTb
xULpFY64js9gwQnl5v7xi9Zg6DP+VvteaRkRMUGU/m1jhJ4Vnc4KPuXbbTg4TZpO
MQNgVWgaoduXZiQ5XLeJE1EWr/qS3C9P5MlR2fHk2Iknwmdgi60ybz5FAxpu3KTS
64A+TtM988j/ixNzKKQCnXc7IT3By+PWmmu7luSoMv267wjiCgbkp3JVUzC2WXo6
g4lah0Gd
=fq94
-----END PGP SIGNATURE-----

--i4xpTqD6yhhDBlAr--

--===============6149572039589364015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6149572039589364015==--
