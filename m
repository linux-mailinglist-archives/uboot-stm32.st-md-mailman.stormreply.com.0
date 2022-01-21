Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE74849656E
	for <lists+uboot-stm32@lfdr.de>; Fri, 21 Jan 2022 20:03:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99764C5F1EC;
	Fri, 21 Jan 2022 19:03:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8728C5F1EB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 19:03:28 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id j85so11022923qke.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jan 2022 11:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ITH60a/Yb6LpRqd27mcRf0XehU35MhJYRs9nAbh/vKs=;
 b=EIBOIKVJymA4ziC4H70sWXTdpDuLNn1wiovY0q6U+d9ojK2KM4TOlstBKdypyzMSC3
 VAYYP2OUaqIwWgMUeRmzRcJg1pYd6+fBxjAb9Pt94L2ujjHf1jEnfXMq1+GO1JbILe/m
 RDxXU9jyo4J3zACQhjwMkgABsTBWW9hIgdCYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ITH60a/Yb6LpRqd27mcRf0XehU35MhJYRs9nAbh/vKs=;
 b=4kDPhyR8N7eby62NK6qyuDvQP31oCkhLgl7okhz/dzT9+q6ggajDzF8t5cntRvFpM4
 YHJBybDiMCRgfJB3pZlSOlrcG0Rlab+ye0zzlyLOUKg7N34vqN4pAEyiLjyVLgaXzdz2
 n7pX8KdfaHVVpKRXGophDf3TZh/row0MpomIPpcKhPBhn/EP8gjJ3yeLF1Z5jlmNRIlb
 A355o9NmLCDd2sjkjaDRI54yH5bqJi9H1T8e98bVNsyqNqpnfyYuDXw60i1Z/y9/YNtX
 GxMcT+x59ewKaiQVv9DY/c8uaYQMyttOBrNIcP4ayHaHOr79LFQ0JKE84d9rYktXd0Yp
 rtFQ==
X-Gm-Message-State: AOAM530dl06aQvqOubiaJe+kVXFsZ5Jnm/veY5Z2yk6BS6zL9Lz41cVe
 v9fmN4JIp9ekmNBxE2UpqG9kvg==
X-Google-Smtp-Source: ABdhPJxvz2GAsQuxdpRh53Lhcs3t27Wa+W0xosohXwHPxkCh46UgcWOTc47fRSDAl6lBlzPbaPTM1A==
X-Received: by 2002:a05:620a:d95:: with SMTP id
 q21mr3823420qkl.178.1642791807843; 
 Fri, 21 Jan 2022 11:03:27 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-2ef0-5dff-fedb-a8ba.res6.spectrum.com.
 [2603:6081:7b01:cbda:2ef0:5dff:fedb:a8ba])
 by smtp.gmail.com with ESMTPSA id ay37sm3475848qkb.71.2022.01.21.11.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 11:03:27 -0800 (PST)
Date: Fri, 21 Jan 2022 14:03:25 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20220121190325.GL7004@bill-the-cat>
References: <20220104132401.3573475-1-patrick.delaunay@foss.st.com>
 <20220104142328.v1.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
MIME-Version: 1.0
In-Reply-To: <20220104142328.v1.5.I5fc8065d06afb12c358588f9078ba15b1cbbe94c@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek Vasut <marex@denx.de>, Priyanka Jain <priyanka.jain@nxp.com>,
 Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 egnite GmbH <info@egnite.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Stefan Roese <sr@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 5/5] Convert CONFIG_AT91_EFLASH to
	Kconfig
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
Content-Type: multipart/mixed; boundary="===============9165019326396766352=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============9165019326396766352==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E0LdhqWfziiBVv4P"
Content-Disposition: inline


--E0LdhqWfziiBVv4P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 02:24:01PM +0100, Patrick Delaunay wrote:

> This converts the following to Kconfig:
>    CONFIG_AT91_EFLASH
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Stefan Roese <sr@denx.de>
> Acked-by: Eugen Hristev <eugen.hristev@microchip.com>

Applied to u-boot/master, thanks!

--=20
Tom

--E0LdhqWfziiBVv4P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmHrA30ACgkQFHw5/5Y0
tyz7hwv+JSKjlh37pzLRAidANfHLWZBbH2Rsq/NokeF84CIPbPOiOrOX5Qi1qv/N
Tm/nvKuAnDxUfqzgal7MjedzXViaEkjKRM38YKnayqHy7caNIoniyheRAxHA5sXD
FH5k/CV3ABCo/JZczbLC5lS+stHzGqXOIvAmjjaFrsBseM7oKK49daJsKTMKGYMu
OK8ynMNJqugOnv7zwqnor0hrN3r7ovAb4087uxHVHdoBKUlGKOIA6NpltcHoKLNG
BvzZR2AwTQ4I78vnwqH6Gg0Tm44Ti5+qNYwY+GBr0ZKWw7MOx+9eeE6ofrAY8c8h
xSoBZPFaZHDpq9xZ27gW03c2cA+EcKwqx3Adzl2qUtE66t7Xp7j/RgykgAy6pVaC
jkd2r60ETs0xDNCGOUs/ePrn/s/lHI94IXTIS/rKWTk89DXzMCNGaeZuBrGoeVBq
J0ek2ln/snb5vcJwF+zYD2bekOyR452ib4RTXEaHHPNt1et6dLQ7ardfdYwjFXug
Nx3pp5mb
=mMEP
-----END PGP SIGNATURE-----

--E0LdhqWfziiBVv4P--

--===============9165019326396766352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============9165019326396766352==--
