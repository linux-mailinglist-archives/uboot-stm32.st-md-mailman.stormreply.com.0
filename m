Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0A7ACCE3
	for <lists+uboot-stm32@lfdr.de>; Mon, 25 Sep 2023 01:27:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70189C6A5EA;
	Sun, 24 Sep 2023 23:27:05 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9310C65068
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 23:27:03 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-59e88a28b98so79379897b3.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Sep 2023 16:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1695598022; x=1696202822;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TknaoYgouHCQEv+KfujJYjrCF5n7UUeHwfKd1f+mMW0=;
 b=QNFjpwZgwA5Jv3BuGUQMBYbm89nkR3mFnttfyKUaREfDTyxPAmuu3bWLL4lf7WSoH8
 cYk7YPqaX3arJy9mvXN1Iv6REW/scOYcKq6h1tHfW9HBT9GA7OVqCsiRJd8FyD1yCb5H
 oa6ErHtXAuTOJ07njHKJL1F53tDEghz8LYoq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695598022; x=1696202822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TknaoYgouHCQEv+KfujJYjrCF5n7UUeHwfKd1f+mMW0=;
 b=c3cnRXuI9+RN63qKCtlr5pxD5QrCd+cDqLKmuJN00DNjTeAcpFeN7S3MgrS8524Q2+
 WKjZDkgU8y8vWNGNNmLkL/TNNTl5/0U/PjupoNxy+DuqcimnGPjOnIwObR7HklsTIX8h
 Ue2jHEzdiBjLdbZSds/XkMyh8ImxPTpMnh/wAMP9nH+Rh6N3qJFRrxDx3CHLqaJv8SRE
 jWrj4woIJofQpNKWFqKHe3MzU9cM+NIPB+90pTeQbgfdp0FnbeA8k24NBdHLFj5q256e
 HYdZkXt5upzxV0q+NrClf9BHKWkUABZNVtNABZHki3/5ocnUz0gcx8t9SgPjreS/0K5B
 w7ig==
X-Gm-Message-State: AOJu0Yy0mKB2wJbUan3WIgrgnnJ7jzjWviiFGAldn33IXj4CrySuVVyB
 vOWPb6ERBbRxNptCTBxWKQavMw==
X-Google-Smtp-Source: AGHT+IFxHqLn3G502xdW+feoG0rVmBXV4QJdKO8QUltIhqSS3nxV4EtG0VDY50rVaw3xlMiHiX+1Ug==
X-Received: by 2002:a0d:df86:0:b0:589:f9c3:8b2e with SMTP id
 i128-20020a0ddf86000000b00589f9c38b2emr3381679ywe.20.1695598022501; 
 Sun, 24 Sep 2023 16:27:02 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-d32b-b307-decd-cdc4.res6.spectrum.com.
 [2603:6081:7b00:6400:d32b:b307:decd:cdc4])
 by smtp.gmail.com with ESMTPSA id
 n185-20020a8172c2000000b0059c01bcc363sm2121992ywc.49.2023.09.24.16.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 16:27:00 -0700 (PDT)
Date: Sun, 24 Sep 2023 19:26:58 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20230924232658.GM305624@bill-the-cat>
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20230924203953.1829820-6-sjg@chromium.org>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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
Content-Type: multipart/mixed; boundary="===============4609746042984508132=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4609746042984508132==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fi7JdFpR8IKyXWTs"
Content-Disposition: inline


--fi7JdFpR8IKyXWTs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> Some commands assume that CONFIG_SYS_LONGHELP is always defined.
> Declaration of long help should be bracketed by an #ifdef to avoid an
> 'unused variable' warning.
>=20
> Fix this treewide.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
[snip]
> diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-imx/cmd_dek.c
> index 6fa5b41fcd38..25ea7d3b37da 100644
> --- a/arch/arm/mach-imx/cmd_dek.c
> +++ b/arch/arm/mach-imx/cmd_dek.c
> @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_tbl *cmdtp, int f=
lag, int argc,
>  	return blob_encap_dek(src_addr, dst_addr, len);
>  }
> =20
> -/***************************************************/
> +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
>  static char dek_blob_help_text[] =3D
>  	"src dst len            - Encapsulate and create blob of data\n"
>  	"                         $len bits long at address $src and\n"
>  	"                         store the result at address $dst.\n";
> +#endif
> =20
>  U_BOOT_CMD(
>  	dek_blob, 4, 1, do_dek_blob,

This really doesn't read nicely.  I would rather (globally and fix
existing users) __maybe_unused this instead.  I think there's just one
example today that isn't "foo_help_text".

--=20
Tom

--fi7JdFpR8IKyXWTs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUQxboACgkQFHw5/5Y0
tywk7QwAshUBGIrDpRCBKN6vKDzJ1EzZkEZlJS1B702ViUn8nq8bTW9BZUaC6h1Y
zRXHi4IRRy0zPpUW1lO/3oonc+yyBV32spYIRv685JgRrgMn07cNC+C8qw2+OJtl
XXaBFsfbBOQ0CbEgonFNcMi/CbuoZMq7CTok0HtYpqUTpoe/tCJwVaXwlFZQ8IqZ
sG/Eum+HpF3XMrkTaqtSIE+c94aLiIe4+r/8BUXQukgkO65HCiZtw1zWOIGs97Vl
eTh0Y7pVePMMEQGu1ibO6mC0t1P9winiGYpx0AAysrKN9RnnDf/LuJ5yjKGWFVpj
3dk/OxpmR2RluZ9UNj70Y30JUqOTL3NUgP6QZ6pmW7HAiAlrd4q5oaTq96fBf6vY
10bgEMoxOtRPpLaHwK/RrAJrbwgyArmu3w/strZ77CtDmHSLCfoJA9fOHoP9rzC4
ZMj9gGzGkmwJ0ExvBcpdKph3VEY2a1qk/203XifwnUl809/OerroSc0coa4xYC+y
l7hQ+me4
=sRIo
-----END PGP SIGNATURE-----

--fi7JdFpR8IKyXWTs--

--===============4609746042984508132==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4609746042984508132==--
