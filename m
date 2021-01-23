Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2A30175E
	for <lists+uboot-stm32@lfdr.de>; Sat, 23 Jan 2021 18:46:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58255C56630;
	Sat, 23 Jan 2021 17:46:34 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D22A3C5662E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jan 2021 17:46:32 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id r77so8330612qka.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Jan 2021 09:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4TJx+qOOfQkI21mzh2mJ7zcoerD0xKxZykig9Fc+sqM=;
 b=b+5LADRHm8z4BzRafFzrKolZClm8jeVCwrFgIs03yE/hX7mezBpQDhs3Ey+Qh91GJJ
 dvobeljeCWzBNL78KJb5UFrdNm/leeD+Y6dP+BjSrQmnGJalTybcd6pQBV+0tdNZuWL6
 vQ6lS0d0JTAJ3nSBhRbTi7EXwUb5KnhAW1bO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4TJx+qOOfQkI21mzh2mJ7zcoerD0xKxZykig9Fc+sqM=;
 b=EuF45RZJRVjym9evkXHAlEov9yQYBp/i+cgl3He72I9PLJJQqfKKt1pl90qz7TFvAo
 OrosfxDdhX/zYvbOHEWP3LnV7nv1Vr20l/8n7bIqP5eKa8ozfiHKlyFm/bvDIj6KuxpU
 /603FdrlApUuhpuAVh+eQAYhBf+fayZ/ShrlBgcFBFpm7i2r6ZhgkzezYrhqGOANHplh
 Hqmp2sOZro5md3K1I3ul1Tpa4UqyT2E93xdz93aFgFxDXOlio2HZQZZcuXFVYHbyXkgw
 a0GzaQP39liVtp9tAr+Iu4wgF67+hP6JixURSS0yZzXB+5pFppKy2tjRiTuVz1yyCZrA
 TqCA==
X-Gm-Message-State: AOAM532g1rrVVq5TxrQIm8hrdLSMZ1b0h0vzu1Z5HAkN7tdeX2viwsNx
 /CLdLrUF7c5XSZDW38M/BSZJsg==
X-Google-Smtp-Source: ABdhPJwHhsBbfdeAc8h9n4x21GAoL7RhMoBwtfbBX0y17UDwZX6vcCHT/a+zk4blB4v2dOlXCkNhUQ==
X-Received: by 2002:a37:bcc6:: with SMTP id m189mr1041193qkf.88.1611423991717; 
 Sat, 23 Jan 2021 09:46:31 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b03-a7ce-d03b-54ef-694d-5531.res6.spectrum.com.
 [2603:6081:7b03:a7ce:d03b:54ef:694d:5531])
 by smtp.gmail.com with ESMTPSA id a16sm7563913qta.69.2021.01.23.09.46.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 Jan 2021 09:46:31 -0800 (PST)
Date: Sat, 23 Jan 2021 12:46:28 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210123174628.GS9782@bill-the-cat>
References: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
MIME-Version: 1.0
In-Reply-To: <20210114120355.1.I3bbd596e6af847434c65a45cd845fe58e55bdbc5@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Bin Meng <bmeng.cn@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: Re: [Uboot-stm32] [PATCH] doc: update help message
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
Content-Type: multipart/mixed; boundary="===============4728445026512386679=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4728445026512386679==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m4ZQ3NHD/ILiPeC+"
Content-Disposition: inline


--m4ZQ3NHD/ILiPeC+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 12:04:04PM +0100, Patrick Delaunay wrote:

> Update the help message used for 'make help':
>=20
>   Documentation targets:
>     Linux kernel internal documentation in different formats from ReST:
> =3D>
>     U-Boot documentation in different formats from ReST:
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--m4ZQ3NHD/ILiPeC+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmAMYPQACgkQFHw5/5Y0
tyxxegv+L+duKMLcuuawA+OhXSy2AVIN+KPr5eQrM5sZonXVrEkhQPxZBJr4k6XE
yztq5fdPDNxbpyZSwXpbL8YZby4Z5EQY+DkJX5LZRN7JJ1eOp4i/Zgur0cAC2deY
iAXi6C9cSov1gmVEoSkamgQM0J28I+gFPXMHUGfJ+BNfhIPFIYrJuTFRPgPVDcKu
eDD+FwAQe0vpNnD+kfTks3fgY4DRhNgBhJIIFB2tN2QKAYdXHELrTGiuLsPPsBmt
05qg/H0AF+1CuuhYSzCZQdqApVhc9HkTbfmh20bCo7HZvsDVjAwlnerq+GDETzLi
PUmhV0QRwukyjCZhwtjYpUtNjqRVssd1zQ5zpKnHiX5JeqvL8tSkSjVO/uBG052c
XOozqIhAP/piPoOHIK1ylAMrNa3IHmEBzb3UW7GpoRegloAthi191k+1wI/ookLr
oLbOj0xDzSRgO9PjbHbUKpq7FpjPiPnMd4OW2lRJfUfiPifauhTxG41AH1iePvMk
PKDtnVE7
=wc6V
-----END PGP SIGNATURE-----

--m4ZQ3NHD/ILiPeC+--

--===============4728445026512386679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4728445026512386679==--
