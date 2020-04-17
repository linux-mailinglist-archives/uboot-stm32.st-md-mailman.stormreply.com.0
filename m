Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3191AE73A
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 23:08:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8427C36B0D
	for <lists+uboot-stm32@lfdr.de>; Fri, 17 Apr 2020 21:08:01 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AC04C36B0C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 21:07:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l60so3204545qtd.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 14:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1e+6xiVKy1P5LrOxYV8x2adR6ZNeimqsjmuiQwEw6gE=;
 b=ZBmccWnUN6wSkYcvDE5nH5kPs1nvuZcYPWPjxgRANu6mSYWlPgwXpgLVaEtM3GlmpP
 azfM7D2rtrKO3guA8D48oOEFZSa+QLeeCZ9BpCglkiczUSUFbff6Hz/YPMq9UWvIG/tY
 8AIAVDDncxhTSX1P76MbaJAu/yHWA17M1IjhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1e+6xiVKy1P5LrOxYV8x2adR6ZNeimqsjmuiQwEw6gE=;
 b=NHrwNeDsvcw3kYIeD05VM2ZZd+v+Hzf66QF2OsKXHlHs2+j6KUfciYYWYxf5WwV9Bd
 Y0cqtthf29O8dTlumA+KV4z/Ob1MRh3dMVU4kTT48NrL8cCcfxRqWwEH/r4zCvG3N9gO
 VlBp3HZP58etjNozaro9m0VI/5Pf4nD+TZc/jt2do6busldTqTk4mSpKtMFOJsxWM9dn
 1qZ8MTg0zjIzJ33oZaSRSl+GkCG/quLvgG4hYUGjM++eLr0aK3iw6iQO0dV5pmaoWgP3
 ooEhcZXaXctzLrgZuAg+aIYZlN4DIRIgh2dEGuMe9OI6cw+9lduQhv9fevzideFJYf77
 zEOA==
X-Gm-Message-State: AGi0PubfqUaVa2iz8FVcWwZjjfu1ysppMNXey+mnOM/mM5Xb1Nx7kyAs
 g94PfIBr239Wp30Ply2pZjMwlg==
X-Google-Smtp-Source: APiQypLis+xMEoWZIvikEMLFE8+tiyz9pcuyJHakt97II1Bdy9yAkI3ynUgQ2DUh+hTym0HI/g/H+w==
X-Received: by 2002:ac8:2ac6:: with SMTP id c6mr5320603qta.35.1587157678456;
 Fri, 17 Apr 2020 14:07:58 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-826f-4058-2b78-ede2-0695.inf6.spectrum.com.
 [2606:a000:1401:826f:4058:2b78:ede2:695])
 by smtp.gmail.com with ESMTPSA id v23sm9724767qkv.55.2020.04.17.14.07.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Apr 2020 14:07:57 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:07:54 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200417210754.GD4555@bill-the-cat>
References: <20200228141816.1644-1-patrick.delaunay@st.com>
 <20200228141816.1644-3-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200228141816.1644-3-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>, Michal Simek <michal.simek@xilinx.com>,
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, Stefan Roese <sr@denx.de>,
 Adam Ford <aford173@gmail.com>, Lukas Auer <lukas.auer@aisec.fraunhofer.de>
Subject: Re: [Uboot-stm32] [PATCH 2/7] Kconfig: update reference to
	README.x86
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
Content-Type: multipart/mixed; boundary="===============0162949999587379240=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0162949999587379240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3IWFuR7/O9KKcN6"
Content-Disposition: inline


--g3IWFuR7/O9KKcN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 03:18:11PM +0100, Patrick Delaunay wrote:

> Update reference in Kconfig detected by
> scripts/documentation-file-ref-check
>=20
> README.x86 =3D> doc/arch/x86.rst
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

Applied to u-boot/master, thanks!

--=20
Tom

--g3IWFuR7/O9KKcN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl6aGqoACgkQFHw5/5Y0
tyw3dwv/Y0gkV7ToYc+7huJ4e2spT/yv4j9YPuZc42fb3SoRjaEcO3jzHzvKR256
03ZMQiqyYPsjVWeIwLmVBgKce3C52vjfsXEvqXy1fpoafUeoeRfCrvYUvCtlH+W8
NTi/TsU8Tq0D0m3xKBQyNVcH248vdlQ03tfDdVZ9h8uT/DDGyrXRt/qGsXQLinjH
jlo6QIDOxquHuW0jWWmI87gk77JgjuuooF0kmqurcPfMNXNl8AK23NzHNmZrruXa
dOKxmEL7/7taZMbGfWyhEVfwJEXGkbZ1kEC2LwDEeOIBo2x/FTzB9bvUMvywJrWg
8vr6jiU3IDHIEGWDibIRbWlNoIvroMbplaKKgKVElUsw2R26Yr4yXfiUsFnXJvxi
i+dSxd2xFRTuthAtYY6y2t7CFYPyEFebmU9mwvcnJLVWf5A/zbM9x91TiqjhXdV3
ALadNPhjWHAhqtXlw0YQMf2WEr2ZF4YGAhcfvpGfTKJF13WwaSPZhdNkyntYTdkk
b7k/ikX9
=JhOu
-----END PGP SIGNATURE-----

--g3IWFuR7/O9KKcN6--

--===============0162949999587379240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0162949999587379240==--
