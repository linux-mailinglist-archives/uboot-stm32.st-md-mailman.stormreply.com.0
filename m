Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4890943BD5B
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 Oct 2021 00:42:05 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01AF7C23E53;
	Tue, 26 Oct 2021 22:42:05 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC1D8C0614D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 22:42:02 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id br18so701171qkb.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 15:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TtINjRQV4QvnzBHhwJxtUzu/F96J4xM5QBHRGIN+WfY=;
 b=mSSTd01e4I5dfLSeUaVYN66LiyGNvy2rceZTEV2N5Uaj6zq3VMos7I3JkVv+7UK+ZT
 UkOr53z5kUQKBKun9nWTq23orEHZ1wBSg1ZKUlMdSFWmRu/IfCebzWsWEUtsG0reWwpD
 nkHvUdSMIcY12RVOexyYSflE01oXoYN3Y8EBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TtINjRQV4QvnzBHhwJxtUzu/F96J4xM5QBHRGIN+WfY=;
 b=YVNRd0OPOOYOstefM5P6b2dAF3ZpplHKTtnGQOvYeWJygiLxoodqfHDnwI3EK2tCEG
 PSrPbVjVSwGxizFFpfUB+NYLfybkeKHTR+1kz9LCphmTxNTkKYWTaE9emRFR2LC54eZp
 MjfM2330hmI7WKdikoJ8GtwMOH9GKlTzxhcw9rVIg8DpkZzEwAkZSLadGvbLadWo5Gb4
 Z4w1oVmYDfOvgDLLm4qP/6sz6rTr5SeRkTKVPHQjqQzaXr96vePnwfQHVS6o0MBTy0qk
 ESw0Fzh6ua9Z958M9TsN9Y2v/BXlZ2N6C3Oz3fLqlLSle1xeiKvDxyC2sQlAvv+Xd63a
 YmDg==
X-Gm-Message-State: AOAM5308Ety//wftFO2G0RbcALDA4PZ2Jt/6zoNU4cwh/Jas47FhBHN+
 f4MHVwhRyMwyKRNtQaoLlBHVLg==
X-Google-Smtp-Source: ABdhPJyhxc971gYdAyKylomckfH5DItRLUbtcVMOfgOlcba13sV50szYH+FiQ9CoOd5/9gNYgcQayQ==
X-Received: by 2002:a05:620a:2481:: with SMTP id
 i1mr21447426qkn.286.1635288121040; 
 Tue, 26 Oct 2021 15:42:01 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-0044-6cb5-81ac-bb0c.res6.spectrum.com.
 [2603:6081:7b01:cbda:44:6cb5:81ac:bb0c])
 by smtp.gmail.com with ESMTPSA id c15sm11201794qkg.60.2021.10.26.15.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 15:42:00 -0700 (PDT)
Date: Tue, 26 Oct 2021 18:41:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211026224158.GN8284@bill-the-cat>
References: <20211022170544.1.Ib218a8a747f99cab44c3fac6af649f17f003b2e2@changeid>
MIME-Version: 1.0
In-Reply-To: <20211022170544.1.Ib218a8a747f99cab44c3fac6af649f17f003b2e2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Matthias Brugger <mbrugger@suse.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Torsten Duwe <duwe@suse.de>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] lib: uuid: fix the test on RNG device
	presence
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
Content-Type: multipart/mixed; boundary="===============6851014513345266747=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6851014513345266747==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Content-Disposition: inline


--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2021 at 05:05:47PM +0200, Patrick Delaunay wrote:

> Correct the test on RNG device presence,when ret is equal to 0,
> before to call dm_rng_read function.
>=20
> Without this patch the RNG device is not used when present (when ret =3D=
=3D 0)
> or a data abort occurs in dm_rng_read when CONFIG_DM_RNG is activated but
> the RNG device is not present in device tree (ret !=3D 0 and devp =3D NUL=
L).
>=20
> Fixes: 92fdad28cfdf ("lib: uuid: use RNG device if present")
> CC: Matthias Brugger <mbrugger@suse.com>
> CC: Torsten Duwe <duwe@suse.de>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmF4hDYACgkQFHw5/5Y0
tyyIcgv/eV9zOkABp3ydZBjZR++dPbDj1PIUR1LHdg74X9SLwatAJ7TJ3ECi0wyN
KqJXV5j/tIgw2V/HsRsBLxwXq84CompUvxhAKSlxN6DaQ0qYpl/+tMXdyknQ099f
hMfeWkQCQE4Sq0ymKN3oev/EozaVwaE5zHKXDT84MIFYH18BjASYl1RUj1UCBhiT
7OJN25xBrqDa1az0WdMRAC1Aj/0kquYROYpvrUIbLHWLhaXcu10TGB28dD/levq3
IIbYe6eKJUS2873HpR8DgH9kzH1buTGjfg9+ptE+qUJdJFGYp4IxbH00Z3aCKPjr
sv87mGdcDO+YNiLTWASGHioZaoSrSmqBcnnkWh4+7GJtHcKywU5zmAID/xdShbND
8RkJ5nP+SMa9ZeCIZYuO/mzGi8HJDqzzxco6MvIdwRQ+2Zqs8CnpKQ5woiZfoBFE
tufivz510srwUdLgrJ2lJEOjNcoDPrQJSCDUx7/7dzCfCAfQUUYaM7SZOL13F7xc
JFMkCXNC
=qCT1
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--

--===============6851014513345266747==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6851014513345266747==--
