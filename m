Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F8658CE53
	for <lists+uboot-stm32@lfdr.de>; Mon,  8 Aug 2022 21:08:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9EEC5E2C6;
	Mon,  8 Aug 2022 19:08:53 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 251A1C04000
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Aug 2022 19:08:51 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id z3so7225917qtv.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Aug 2022 12:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=oZOsnrOem05UuX654csfNjq61s3rujJshalARyYTN0o=;
 b=X5acNb+DnSOJ62/NaDnj/XEf6de3XhTGgRVeZQwevfiGIHAGTnuC1nSeuZ9IEUU4fK
 tTz2EPOa34sneeCGpTooeKyNn7P88zwPJRk9fx7cAVfXqED0RpJr3Z/kPxUgKN23W/rd
 oJ1fqCDZgZ/nnIdNQxpsiVdalGd6Egfjxgvz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=oZOsnrOem05UuX654csfNjq61s3rujJshalARyYTN0o=;
 b=KMQzqV8YsiLUBJZsrPni/7x3CdhoRmps6AufwegZxTM3b+lyOY5TSMhwjvKwvEXmFz
 EQ4KA8HoUce9OUoFdbN3vFTQd88sz4unlB+Ncj1ceP+VswYKwMFucaZlKDu265+h41fy
 ZKWzOQJwBnLhjffVIj94fyBwoyz70G2jyZbSQnhXWfGbg7SsoapO/AzWcqae275vJVLp
 08oDBwBH+Vq4EYdP8thfyNPxqn5Sa2f+6EOTUyvsZW7YI/yjCZnbNNLGQjoIVEeMSsg9
 bHJZryAtEuV83hWMvzxvKQIkjyW97zTqRLRKslpYDXYu0jPrJ67bg1zhCNz+9DCWxSxr
 qe+g==
X-Gm-Message-State: ACgBeo1VfJ6PwFgXQiLStrE3mGP5YnWBWSVIyCpfr59ccfPiPuuF2jMt
 9itkSyxQcW5dstv+WhhLaxwsrA==
X-Google-Smtp-Source: AA6agR6MnjvJLodG2HpDyaiel3xBpSRSJPcMJ4rIeqX3XeSlwBzCNTaYifxAdTwjtU2ZCV7r9/d8dA==
X-Received: by 2002:ac8:5915:0:b0:31f:31c8:7406 with SMTP id
 21-20020ac85915000000b0031f31c87406mr17827350qty.347.1659985730189; 
 Mon, 08 Aug 2022 12:08:50 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139]) by smtp.gmail.com with ESMTPSA id
 i25-20020ac871d9000000b00342f960d26esm2407100qtp.15.2022.08.08.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 12:08:49 -0700 (PDT)
Date: Mon, 8 Aug 2022 15:08:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <20220808190847.GS1146598@bill-the-cat>
References: <20220802085526.272953-1-patrice.chotard@foss.st.com>
 <20220802085526.272953-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20220802085526.272953-2-patrice.chotard@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Joe Hershberger <joe.hershberger@ni.com>,
 u-boot@lists.denx.de, U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Ramon Fried <rfried.dev@gmail.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] net: dwc_eth_qos: Add
 eqos_get_enetaddr callback for stm32
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
Content-Type: multipart/mixed; boundary="===============1957855415254969454=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1957855415254969454==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h87GnGnUMDU+BcVC"
Content-Disposition: inline


--h87GnGnUMDU+BcVC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 10:55:26AM +0200, Patrice Chotard wrote:

> Add .eqos_get_enetaddr callback defined as eqos_null_ops() to avoid
> illegal access.
>=20
> Fixes: a624251461bf ("net: dwc_eth_qos: introduce eqos hook eqos_get_enet=
addr")
>=20
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Reviewed-by: Ramon Fried <rfried.dev@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--h87GnGnUMDU+BcVC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmLxXz8ACgkQFHw5/5Y0
tyyrVgv/SOPLWONKUate86tiD82/uE0HjPTvoZS2qosthN4gPSgKHswEirk2JZ9z
cSPfnCxPbESobuArIJ2brDwKhHiLKT1jS030Vqk1d7xpZW3rRA3yUWz/4pidVyu8
MVs/oPmGRNzCbDcZR9XBygTn0O85lBLCmu3io0xzYDsb3LDuW7Y6PgUgz1LSNWHN
AqEFQ2Nhx/isShGxJ0ngGUJ0BS/ZUOSX7OAwdTyrkd+oFjoInSRmtsJhY5IkxppK
En0GI8nfpfvAk9yBQlteGr8GrvoFOvbreEULdiaabByTJu7qs5JveWa1mgQMv0h3
I0w60gQHEkLYBN5GEz+4/ieUp5Zw78MHI3VKHCj0bMlFAEXidUpG9+sAqZSRugYi
mNwm/bNFDXe1oMJsrS1GTMwy0cipt3rHqNJNNRWsmt0xyTDj9D+UytBpQkKzxn6i
AQ5mB5XYGX8ugPH3WpBzop6y28NORRsxlYUCo43zaXuqcE4z3NjBtQlfgIFkNzSR
g1ToNlpO
=OblV
-----END PGP SIGNATURE-----

--h87GnGnUMDU+BcVC--

--===============1957855415254969454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1957855415254969454==--
