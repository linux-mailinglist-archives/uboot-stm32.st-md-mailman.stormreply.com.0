Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D09A34FC598
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Apr 2022 22:15:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97A47C628AC;
	Mon, 11 Apr 2022 20:15:13 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90ED7C628A6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 20:15:11 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id bk12so12012679qkb.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 13:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2X50+opRYd7AZ5Cv6PAnIs0fIg/GUY5wZ+Q02ZwmO4o=;
 b=qiPUuqQy67A22IrcxWwPJet6Jd3uK/zo+mpIhdf3xNjTa+NFaeFk/qY6tay/s7AxD/
 sLao4810ZOv8X/2A3e70RB0X32V/JFkuKuHENRzzQAu/vHH/XnSbHijNgVsewVvUF95v
 BVEj9gSCfsoMNfBTYeQwforY38vwN50LOMBg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2X50+opRYd7AZ5Cv6PAnIs0fIg/GUY5wZ+Q02ZwmO4o=;
 b=3XGyGnzm+/M4aO3BkZMAqy6FWk0enUP1lU6LPcF3xrPbxZfjxOE52qTEl4uHHH38q1
 rZXeJFse8SATWmFa2dpHtUx+EVIHlNisByJAiS3iqkCyyL9fix3VVy9Q1JxTwk8EFwRM
 uNWeqX1hWtsj8qbwZUuCCKReFR82QukZNHpBnpHjZrsljj/PAUT8BdX8lwYhE8V85WeF
 Mo4xQvnS5A3ChUhrDRa51DgKGkcfpoYuntsJLBi5pxGFNOa78FvlBaz5jcbRnC031prC
 VTUsEJ4bup4xbXukaOCppVHep3nPay/o+/OZzT5R+vcR6EpOYHYMGkpqn7RNiLssb3qd
 ADtg==
X-Gm-Message-State: AOAM531BHhYbJ7wf918+Brj4CB9MazjS7WpXUtHOT0Mt7zUcoDjKCOA9
 cqFQI5joAw2r0AgS/WQZ3WniFQ==
X-Google-Smtp-Source: ABdhPJy/jeyJKyals1jrDfj/nJKpEyf+rZvgQPgZY1all0cXtAgZdd3va7rsPm/dXELR3KaGSDLGJQ==
X-Received: by 2002:a37:845:0:b0:47e:c3fb:b11c with SMTP id
 66-20020a370845000000b0047ec3fbb11cmr866386qki.92.1649708110651; 
 Mon, 11 Apr 2022 13:15:10 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a05622a148300b002ef8ff7afa1sm1285279qtx.21.2022.04.11.13.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 13:15:09 -0700 (PDT)
Date: Mon, 11 Apr 2022 16:15:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220411201507.GY14282@bill-the-cat>
References: <20220322170840.v2.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
MIME-Version: 1.0
In-Reply-To: <20220322170840.v2.1.I87cd34696829974a97e4eae53f9652577d6e2e4b@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 u-boot@lists.denx.de, Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2] cmd: pxe_utils: sysboot: replace cls
 command by video_clear in PXE parser
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
Content-Type: multipart/mixed; boundary="===============5759186862261947351=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5759186862261947351==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1jfuqZkEwGIrd2rY"
Content-Disposition: inline


--1jfuqZkEwGIrd2rY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022 at 05:08:43PM +0100, Patrick Delaunay wrote:

> Since the commit bfaa51dd4adf ("cmd: add serial console support
> for the cls command") the cls command is not enough to clear the
> video display when ANSI console is activated.
>=20
> This patch clears the video device with the video_clear() API
> before to display the bitmap used for the PXE background.
>=20
> This patch avoids to display the LOGO, activated by default with
> commit 7a8555d87136 ("video: Show the U-Boot logo by default").
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--1jfuqZkEwGIrd2rY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmJUjEsACgkQFHw5/5Y0
tyxEZwwApYbZcFXZV5swuikg19XXZ+sHa2s1LIKyEOkT/wCWOi2AqWdLen4VKPlj
yEVUxBx5trzNm0hiWmnhMCz7n2huJwzwoU7MJnRqjVSljd1Nn9+RaoN+XVP8IZMo
SeNX+hnW1YsY86fF2gPIRzPFTPJXkWoac1hzu6LsH+IBLiOibHJ3+tyjIZm8aB9H
5WO0d561FJdRSwDGQ9WsnrT1iByYe7BOtUajgMyGvgmDStg0efE22GCYjAUt0Fv7
4wqlGHOSDJ5o2gvz8UsNz9LsMjg+3qIEPVM/3l3wosGSEmJ13heoXNyslLfsla4j
1GzhBbq267pnUAOPb/525J0bXWO1nl1fgW/qLHAnXE8t8gUpElt2XkNbwDOTnl9A
kgxem7fOsIHFnQ4CZmrEdQwdAoWGh7g2yfl3Af5WKQzPvFwvA3YHMO/+8Ryqj3BX
2BQbbxTJMxTFwtW+uCwLbKYXFtlWRYBauEewHzRe8Rv0t7G0ytlTFfonsueVtruc
5RQzrZ02
=mbf4
-----END PGP SIGNATURE-----

--1jfuqZkEwGIrd2rY--

--===============5759186862261947351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5759186862261947351==--
