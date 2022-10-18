Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2906031D6
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 19:57:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE4D5C64104;
	Tue, 18 Oct 2022 17:57:30 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ABF7C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 17:57:30 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a5so9161022qkl.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ktqHfIq6ZjaqaHI8Ck6GMivlyr3LcQZ/2gX51N21SVk=;
 b=boqdVRiHAwNJqeGNQWfpICyaZC6L/7S8mmid09qTor6VWTtHh8zKsWmmHwhd9zMjFN
 vr3FfvrIaxbmOKWIDj5qCkd/+hXfyaga/ZggXr4stDHTwl1rnie86vNek9lTVTC+b9Of
 BjAEWNIJMn5fkLKRRIsrZoFRXCtGD+5wjXC3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ktqHfIq6ZjaqaHI8Ck6GMivlyr3LcQZ/2gX51N21SVk=;
 b=sjkvCoue0MC3sF6XQxcvEPEnYkNzEGq1xUfvUydikOtIKtiLmO3c4nJmNg4ioOXKx+
 KxQs0wnJWGaNo90MLGulhg+j211radTbEiJkKoCNsvBO3TdHychUzbTYnhfgd6Xh2HKX
 j32ZvzEqoORMzZpPpqxndKlejnFxL/G+BWbC/SN9JWA3uysDWQi15r2fn5tm4KtsHzmu
 Al/Tw49KYXyhlmCAJYhXyZM8380aEx4YT96DDVZhdxbWgYnILyVxnpeAg5XdViB6vaH4
 Ahj6/yofgZQeRhR5l1GqCw2Ls7wPRkEEe1FLUF1sbe83M4uJl/0suUs8zbV0Jeysr1Bx
 BtsA==
X-Gm-Message-State: ACrzQf1hpaB685lfvTx6S+fAyyotpG63nJseC8Wes1QsmrihrTRQ1iKn
 WOeEmZ/67ZUcuHEs/BAS/tDuzQ==
X-Google-Smtp-Source: AMsMyM5wGzG6o/m1Yq2Ahn/RR00JujN8EkFiiBHIGhVskkJ2Y/A/Z0o5StI8796W3j40/KnBevxcNA==
X-Received: by 2002:ae9:f312:0:b0:6ee:ec00:8944 with SMTP id
 p18-20020ae9f312000000b006eeec008944mr2667919qkg.157.1666115849329; 
 Tue, 18 Oct 2022 10:57:29 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9c58-0588-a5a5-a6b0.res6.spectrum.com.
 [2603:6081:7b00:6400:9c58:588:a5a5:a6b0])
 by smtp.gmail.com with ESMTPSA id
 bk18-20020a05620a1a1200b006ec771d8f89sm2864863qkb.112.2022.10.18.10.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 10:57:28 -0700 (PDT)
Date: Tue, 18 Oct 2022 13:57:26 -0400
From: Tom Rini <trini@konsulko.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20221018175726.GO2020586@bill-the-cat>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221018174827.1393211-1-max.oss.09@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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
Content-Type: multipart/mixed; boundary="===============0575813373798680120=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0575813373798680120==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wrNCEKhXQ1Rm601q"
Content-Disposition: inline


--wrNCEKhXQ1Rm601q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 07:48:27PM +0200, Max Krummenacher wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> With LTO enabled the U-Boot initial environment is no longer stored
> in an easy accessible section in env/common.o. I.e. the section name
> changes from build to build, its content maybe compressed and it is
> annotated with additional data.
>=20
> For GCC adding the option '-ffat-lto-objects' when compiling common.o
> adds additionally the traditional sections in the object file and
> 'make u-boot-initial-env' would work also for the LTO enabled case.
> However clang doesn't have that option.
>=20
> Fix this by recompiling common.o into a object file only used for
> the creation of u-boot-initial-env if LTO is enabled.
>=20
> See also:
> https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.=
com/
>=20
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
>=20
> ---
>=20
>  Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index 3866cc62f9a..cd45c720d23 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2451,9 +2451,17 @@ endif
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> =20
>  quiet_cmd_genenv =3D GENENV  $@
> +ifeq ($(LTO_ENABLE),y)
> +cmd_genenv =3D $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c -o env/in=
itial_env.o env/common.c; \
> +	$(OBJCOPY) --dump-section .rodata.default_environment=3D$@ env/initial_=
env.o; \
> +	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@;=
 \
> +	sort --field-separator=3D=3D -k1,1 --stable $@ -o $@; \
> +	rm -f env/initial_env.o env/initial_env.su
> +else
>  cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_environment=3D$=
@ env/common.o; \
>  	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s*$$/d' $@;=
 \
>  	sort --field-separator=3D=3D -k1,1 --stable $@ -o $@
> +endif
> =20
>  u-boot-initial-env: u-boot.bin
>  	$(call if_changed,genenv)

Can we pipe the output instead of making a new object file? Maybe not,
in a portable way it seems. But, I'm not sure the above respects using
O=3D as well so that does need to be checked and fixed if so.

--=20
Tom

--wrNCEKhXQ1Rm601q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNO6QMACgkQFHw5/5Y0
tyw6Ogv+LeDcK9ENJ89iCgmhwcWN/G3AVFCllhwS8Aut82W0azb3ZYYHplOmVpuv
I6BKIOxH1Ad+AgzVnzX8W1HngpACPSjwpHq9PT334bUSZ947mxbfsrCWMUIiQanW
Gt8qQ6Pf5AALIjvdx7JBo21DI1ZuOQrRfxcGyvk7jPyv07jqp46uGACqDebRa2t2
UwKxCsBV3vFSGF/JvNwNASOxyVhL3yRem//AqFBfSiOC/ZrRmtpQVUUenr849J5u
Pb0rFfTpW4YlCTx5n+JjU9UGQJiQLts5RWVTrDV0/PnwXJl4L+y92RonuX/xcOlh
WFuTurx5Tb2P9Wo8ygPuogFXJdTeql+cqS3eY/CoUvM5kz9F26EQlB8icSMG6uC1
Uq6qaIbGA2+ABy/Mvk6VKI1X4bHDgfToOhnhMN+yDAc9s7JOsbqhGIXZXOTXrxRQ
q9Xy26NHSDDyKfb8VIpE7JZ85WQ4iAn8goa1FcFdyT5Kp9mpPghMKg3sg/G/mX4i
rsm4s4ov
=EyRn
-----END PGP SIGNATURE-----

--wrNCEKhXQ1Rm601q--

--===============0575813373798680120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0575813373798680120==--
