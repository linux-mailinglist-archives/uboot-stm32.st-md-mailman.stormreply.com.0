Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54196423326
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Oct 2021 00:02:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F41EC5AB80;
	Tue,  5 Oct 2021 22:02:34 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3241C5AB81
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Oct 2021 22:02:32 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id m26so645470qtn.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Oct 2021 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o4XG2iPy5IZ14bH3pfKcoV8tNIAqLa1ueaYTQbtK5fg=;
 b=gLVTZeP5ZQvwXunm1vnpWU1Uk1otcWJYTsUOT90eaxiqzGvcBicLjMsiULkDiMaXd3
 eReAZmbZXOMF7QpfCEjSrKwD0hWMYO6oczAiA6js3eZJBk9u0LMZPbDKVdlhtaoVLmMr
 YS5xiluKY7doEVn9F1nlj1c3/OkgM7nhEEZdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o4XG2iPy5IZ14bH3pfKcoV8tNIAqLa1ueaYTQbtK5fg=;
 b=y5cloCOHPn/niBFaa5LrHLjn0++1WGOjqQ2UUnb9xGZYJFXq88Nlp4ivwX/JytnPEN
 pKdQwhUTKSDtscakl+zVM4zNPRVQfzZxbeKigrTW1t1XZkxdDnZqgAWo5W2piLXJxwu4
 KPzZRnDV5NlK/lBjlHGRMORjMS6dboBI6NBdST2Y0p5mBLMnF4d+suVSNDpesmvffWo3
 JEHEbZW9Wku/cQq5ZQHDxDMqxdjjtTFTcLObhipMJTnIleexoC/IbfaidzQX8ksw+suw
 2xojxa7eSQYAUJOdIYtNAf4G3vB527FNB8ol9zk9m/PY6F9X+eZzWw/qhif/Fw7sk7xW
 mG6g==
X-Gm-Message-State: AOAM531OGB+6Hy/OdZ8OttoJ1I/zBSTuSdymi8l193IAaTBC9Wsort3m
 5JEbKQAUfCXmS7VDu7mOdSc/YA==
X-Google-Smtp-Source: ABdhPJyVh20piOq+5fAT+Yalb1g+M9aWBIRIT4RiKsEQTWApGNB0gJiw6TBwDTmIf6dw2dpY9W99Sg==
X-Received: by 2002:a05:622a:1ca:: with SMTP id
 t10mr22193243qtw.286.1633471351985; 
 Tue, 05 Oct 2021 15:02:31 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-acff-2c31-c6db-812f.res6.spectrum.com.
 [2603:6081:7b01:cbda:acff:2c31:c6db:812f])
 by smtp.gmail.com with ESMTPSA id v8sm13085824qta.21.2021.10.05.15.02.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 05 Oct 2021 15:02:31 -0700 (PDT)
Date: Tue, 5 Oct 2021 18:02:29 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20211005220229.GL31748@bill-the-cat>
References: <20210920175831.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
MIME-Version: 1.0
In-Reply-To: <20210920175831.1.I218b17a86b820ee611e9dd643c1fb40e2b480257@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH] demo: migrate uclass to livetree
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
Content-Type: multipart/mixed; boundary="===============2167022153257118586=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2167022153257118586==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y4wY251JZuCi4Byb"
Content-Disposition: inline


--y4wY251JZuCi4Byb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 05:58:33PM +0200, Patrick Delaunay wrote:

> Use dev_ function to read the sides and colour to support a live tree.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--y4wY251JZuCi4Byb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFcy3UACgkQFHw5/5Y0
tyzDVAwAsgSyjXAUsjASnz1zFTcGny/351/vUCRKn52NPA9SkVroy5LCmVqv7+sW
xXrsXwJEGDtgyiXBRsQzupGlVR4fbOkG+8lg8Altf1Suc5nNmA3K8BXrSRKXgK5d
siGZwQ1j5ExwNOa32iyUvg5GqJU8RnG3sgI2Pm9B4ZIeOvqU9ImWN+nXj3q6b7uf
GrpyfUdeI5To64hY+WcofaTxFQorroqcp1sDfILa8EjfNf3uDF78OfRlYc4DgdkL
oKzIiIEQd4B6/j6kduWZGTJnGljNAUm7tUfbXp3nvtLKohtwqk6inNEgBpv6/jRn
nirx6S4bO7cK+tYA9AktQhUCAM3Vx7w2zdWSWIgxspDBnZGghqHmBA62F1uuylDS
AWZpUDdDQ8BFF6agY/MypwyXytAU7Mr5e1EjpVQulRcjoTEGVz7rXkDxhcfTyXUE
T3f6mItv455GWdoiPvszDJ9/eVfBUTZoXRudiZs3q3pECGWIm9hthQyHFNNIK09e
McQg+pTB
=BLOg
-----END PGP SIGNATURE-----

--y4wY251JZuCi4Byb--

--===============2167022153257118586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2167022153257118586==--
