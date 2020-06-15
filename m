Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF3D1FA0D6
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 21:56:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78247C36B0D
	for <lists+uboot-stm32@lfdr.de>; Mon, 15 Jun 2020 19:56:20 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85B17C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 19:56:18 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u17so13702678qtq.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 12:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EBg6YO27PVonImjnJux70DzNiVUWAXXpluMxgu0dtpA=;
 b=r1hunceQk1qKJK93TPdBCpElG+zlYY1PYma8YHj0PrHTVEvT+wWejWm6ml/r9zSJ0/
 V1CbHfLjuyGnRx2TxSjoPmrSwAgeV+6jtvMqVFNeFM3yjDabkxI9QRT9PlnxMzId8X3J
 eYWd0y4W6HNHxMOsOMOdJVk0iz0iQc+qnPFEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EBg6YO27PVonImjnJux70DzNiVUWAXXpluMxgu0dtpA=;
 b=H2zadZYlQONtp226dykEHeRsnw5MQ5dbf4cyo0AlVuq9Ce+TopI9gTXFexJmMgQ7U6
 Qz0L4eGHcuNsUkDQNBxb+f/9jMKt2ldNPOrhBRUNhifCAEtegNozfO8H/XWEdCAvHos0
 GOyJetc4VX2PeWqH+nmJ2sH114PcUij9OFaxC30RuIyI4lxHmnLa55ZjD4uIGMkXldmJ
 G0rKlBTk+VuIoRuxFHRDlkDlPPbJ+uINpNQLZZz4m07vBAXcGSvdthH7DP6Yf8DWzwKz
 FDXEz1Fl95DnHxbL0mvjgRdPJW7iShw1xBCLTBiFotqSvKC0qWTLQ+MJ8coKinByJOxo
 X2YQ==
X-Gm-Message-State: AOAM530Q33RJopj/L/Wlyoit1OW9VcyWMPtnL35BfStS9zLaEqELQZHt
 h9P1YWJeaGFMtxP4bDbznO1vOQ==
X-Google-Smtp-Source: ABdhPJyDCIM77S8aCoTMAGTYR+G7vK7oH8w2MJQRTDeUJQyaCSK9MPTzWvSc5unxaBy7gIqORtym/Q==
X-Received: by 2002:ac8:176f:: with SMTP id u44mr18600051qtk.0.1592250977446; 
 Mon, 15 Jun 2020 12:56:17 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-e549-6d95-b852-7fe8.inf6.spectrum.com.
 [2606:a000:1401:8080:e549:6d95:b852:7fe8])
 by smtp.gmail.com with ESMTPSA id e16sm13572412qtc.71.2020.06.15.12.56.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 12:56:16 -0700 (PDT)
Date: Mon, 15 Jun 2020 15:56:14 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200615195614.GO24893@bill-the-cat>
References: <20200610172842.3728-1-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200610172842.3728-1-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH] env: Kconfig: cosmetics: update comment
 for SYS_RELOC_GD_ENV_ADDR
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
Content-Type: multipart/mixed; boundary="===============7240467599854253809=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7240467599854253809==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zI7p2u8k6uHMUvOB"
Content-Disposition: inline


--zI7p2u8k6uHMUvOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 07:28:42PM +0200, Patrick Delaunay wrote:

> Update the comment for SYS_RELOC_GD_ENV_ADDR as gd->env_addr is updated
> in board_r.c::initr_reloc_global_data() under the compilation flags
> CONFIG_SYS_RELOC_GD_ENV_ADDR
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Tom Rini <trini@konsulko.com>

Applied to u-boot/master, thanks!

--=20
Tom

--zI7p2u8k6uHMUvOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7n0l4ACgkQFHw5/5Y0
tyxW7gwAlhFvJde37lnRRVxGQmRwwuzYfPJieQLnxU+oBs+UerZ16tZ5KWPD/yxH
ahcojVKJzUJYajOG9pCrZy8LYsRLZfOZJRoRSx8193KWDF6LYvNQzBPocCB3Ny7K
HR+x0OToajIe9JJpeyrZ7FCLbpaHu48bwgK5Cd10KoPMASoTg8ugd6UuR4w6hfIp
z2Ejx2drZ3daV9xHeoOXyn0ILTXUI3xMczs8XNR03iD+c7jzn+JpsS0eeGsxmWkS
tcI0rS9fSsGMpSBgYk8BFl7NQSut2/guxbAwdfqdvejLMv8kG9eVjaRM5LWnR+Pz
pNFhSoCmvsr+TK7y3R53oEWNS2G29ZCypoIbjbEAXn3gZxrWU0l3E4XKapnsQB1N
76hiUeDcdwsUb9FDeNRXs93oE3n5sQad8xmNdzAjsulWsYdHnQP/UyFwgsaLXVQT
LD9lbxXOG5Lkof+WlgAk3pIu0A28J909LBFsc6Lu6h4iSHRnqiaI8IJGiE7gMJT0
GQCDsZ9w
=4sDN
-----END PGP SIGNATURE-----

--zI7p2u8k6uHMUvOB--

--===============7240467599854253809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7240467599854253809==--
