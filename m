Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E56368E4
	for <lists+uboot-stm32@lfdr.de>; Wed, 23 Nov 2022 19:32:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E1F6C6507C;
	Wed, 23 Nov 2022 18:32:28 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E60C6506F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 18:32:26 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id j6so12682976qvn.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J5ouZdh8o3+4EtheFaAYI+04DTCefAnqbL/alc4S24g=;
 b=PPR06h9DS7KvqwFUswhPV/QsU4qEg+enUzKaQsgmgvsmsYSdwQdiQvE5eMe33OcZGU
 c372Giduj5kKOBeUE/u3+vFwO3ytvu34RylgOMKau8arddJBlgnoudBgla+EEca1fRvZ
 EbDp/N3pEIelpjG1JavmKyUijF1eVdV7AGKrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J5ouZdh8o3+4EtheFaAYI+04DTCefAnqbL/alc4S24g=;
 b=4oSI0g7ULneFWrb8Xu+FJI2wxzx7aAs+AuJFCkGZp7nGlqkFNdMYYOsZB3V2GS6ZoV
 XpNNQrN8z4/g9yw54PxAHBmYF69Be4S4E/EtbPv8H/ybdlDibjrSp+1XO2hCv1XY3fLx
 EbeRfhN3yqPByPRIF0V8aDby8P2E6ZcMkp5uuQBjVHXbM0EZNwlLSpv9nDftP6uNzz5y
 tDYld/R2X5J6PB9Hf4/uQe3iTRo6UppjWpyIMhZERudn5htQrfafkj8xc1RrFkJfb/49
 PC9zBSHdf59nMgvwxb/Q2VJHj1G0YlyNHFwV8QzuvE9TDznky0wjrPLyn8GQTqAvOwqu
 dBDA==
X-Gm-Message-State: ANoB5pkeTqo2xcLBOe85l+FOauwsD2MNz6j20kKYg+hN9hnohGQ3OzTe
 Ewiq8UmNVkko+pgoGCnBW6Ki3Q==
X-Google-Smtp-Source: AA0mqf5aV+1oZhCfdQRzydTNSgX7wczYNa31dmaDru792Y0OdDgb3/Vp6eQUFgdJIdOGxJ8X3Hps2w==
X-Received: by 2002:a05:6214:3241:b0:4bb:6c4c:6beb with SMTP id
 mt1-20020a056214324100b004bb6c4c6bebmr13129653qvb.40.1669228345393; 
 Wed, 23 Nov 2022 10:32:25 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-b4e9-18be-6c79-e0de.res6.spectrum.com.
 [2603:6081:7b00:6400:b4e9:18be:6c79:e0de])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05620a448100b006cec8001bf4sm13015876qkp.26.2022.11.23.10.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 10:32:24 -0800 (PST)
Date: Wed, 23 Nov 2022 13:32:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221123183222.GB3787616@bill-the-cat>
References: <20221108085222.1378781-1-max.oss.09@gmail.com>
 <20221108085222.1378781-2-max.oss.09@gmail.com>
 <20221123181840.GA1482451@bill-the-cat>
 <20221123182252.d256feeti4iuaf63@pali>
MIME-Version: 1.0
In-Reply-To: <20221123182252.d256feeti4iuaf63@pali>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Du Huanpeng <dhu@hodcarrier.org>, Max Krummenacher <max.oss.09@gmail.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Samuel Holland <samuel@sholland.org>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>, Heiko Thiery <heiko.thiery@gmail.com>,
 Stefan Roese <sr@denx.de>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH v4 1/1] u-boot-initial-env: rework make
	target
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
Content-Type: multipart/mixed; boundary="===============3599417113183205439=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3599417113183205439==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A6N2fC+uXW/VQSAv"
Content-Disposition: inline


--A6N2fC+uXW/VQSAv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2022 at 07:22:52PM +0100, Pali Roh=E1r wrote:
> On Wednesday 23 November 2022 13:18:40 Tom Rini wrote:
> > On Tue, Nov 08, 2022 at 09:52:22AM +0100, Max Krummenacher wrote:
> >=20
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >=20
> > > With LTO enabled the U-Boot initial environment is no longer stored
> > > in an easy accessible section in env/common.o. I.e. the section name
> > > changes from build to build, its content maybe compressed and it is
> > > annotated with additional data.
> > >=20
> > > Drop trying to read the initial env with elf tools from the compiler
> > > specific object file in favour of adding and using a host tool with
> > > the only functionality of printing the initial env to stdout.
> > >=20
> > > See also:
> > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c77@foss=
=2Est.com/
> > >=20
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > Acked-by: Pali Roh=E1r <pali@kernel.org>
> >=20
> > Alright, so 'make tools-only_defconfig tools-only' now fails to build
> > because we're missing the dependencies to make sure that we have
> > generated/environment.h available.
> > https://source.denx.de/u-boot/u-boot/-/jobs/532186
>=20
> We cannot generate generated/environment.h in tools-only mode without
> real board because environment is always board dependent.
>=20
> Therefore that new env tool has to be compiled only when doing full real
> board build, not just tools-only build.
>=20
> So I would suggest to extend Makefile put that new tool under some "if"
> to exclude compilation in tools-only mode.

Note that "tools-only_defconfig" builds a functional sandbox U-Boot, so
it's probably easier to get the dependencies right in the Makefile
logic, rather than special case them.  Especially since we're now
building this for everyone it's now a race to make sure we did generate
that file? I don't have a strong preference on how this is solved,
however.

--=20
Tom

--A6N2fC+uXW/VQSAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmN+ZzIACgkQFHw5/5Y0
tyy2WgwAuOZjn0lu03Eth/48MAHOpBLgUxdg14kedhyYk2i2qJrESPVAXSZVF8yl
aZshCtRpRYaxTowu/+JEbesgh9rt6bfwd/X49UPrpWtnAv9gQeMa297nJCCaDD7w
L/Gqfqem0up9MCF7HNd+3gbKoXHaXfekyRaj8Q9TpleI+VfElz5TnbKv+ZM3gnxv
KQR79FBYtT3G9zTf8YaI7vD2W/lmfapBiFeLSZ8Ug0fjRXEHz1vp6xHdMQiNVxIq
tFqmNl0gpDVlO9xqLUwdU7QPUVRXMs0aw+A5INlzCkXhpXfNWgReSGTTwybI5rT0
CH5CqCW6Pr+VuHGe0VzlbbQzK42u4zpZ3mmXmBCL6J0pCKvY90AKwEJdkod9qhmW
PXdWViimzhOpjB2r+k0RBz/KDm+yBoOxZGHUdk4v9iPQ9hY1vGjXsfs9MENcUNrq
i90v39zgo0X0twcu1glItph1neR+9rHvZrmc2nwoK5FRYiylrMdHHPofA8j7fx6s
+nOfyIWD
=h8m4
-----END PGP SIGNATURE-----

--A6N2fC+uXW/VQSAv--

--===============3599417113183205439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3599417113183205439==--
