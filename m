Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0209417B1B
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Sep 2021 20:29:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A52A7C5A4F4;
	Fri, 24 Sep 2021 18:29:40 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74AA0C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 18:29:39 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 11so6803674qvd.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 11:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kkELDOKa/09ByzPgqWnmEeu+o8VkCzmsoFqodAwsq2w=;
 b=cfMFkJdTWUR33SG2lLpIAPiVSTO9z+JdBvr/o1fnETiNKFDyWfu8Vlra1dpuMUOIT0
 qy0HA9VT7/1e+q+HAVb4+SCkhakwmB4ZGRqoGU60ouVkHaH+Otq5VIxuFMTlBMa5s7hg
 OBD8WR7hG3wYsDSNxcnsr6JGLcHgpIYfQG4uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kkELDOKa/09ByzPgqWnmEeu+o8VkCzmsoFqodAwsq2w=;
 b=NIfBCh1w/EbRbG1EDPYHpGILL3EIju3yLWW/BccUNzwSIbzgzlcZ5X2NHK+sNnZUT+
 e/2FoPgAgonp7bP8/05hGYFH96wAAfKK116bBpvLe34RVQQoAZypIXW/gZQZPg7L8iDC
 xVMQeG2BEt1SCV5SC9ykvgg+uK4gIH1LAQIPC/3KuXzypD6cMU8GWSmgnKxfZVKcYi2C
 QxB8t1xIbeCJ0OEmn3msBvnFAtH6vGLIivlcnczJ4Oid4VLZuourjQYP5b6HV+ZFPE+S
 u+0SKmAUZJ5hcJRq3jPUtF8izbj6/jdvqVs+g698b5wV+LJ8318xymG2G8EZ60AvbNgI
 D+Sg==
X-Gm-Message-State: AOAM530cb6g8zNd/NYRly8yK80hEg+DOQpBd2g9VA5T09V5Vx8arqjgy
 kp7j96w7IVYKr9DTypGbwbuKfg==
X-Google-Smtp-Source: ABdhPJzezPbOeM9ikrT7QzZk9a3v9QjnclOFJU3XcocdPxneTrliKqPI6oGO3UUqLh0ZhfniwHF/9g==
X-Received: by 2002:a05:6214:3a9:: with SMTP id
 m9mr11128078qvy.22.1632508178488; 
 Fri, 24 Sep 2021 11:29:38 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-11b7-7bd8-71db-92e9.res6.spectrum.com.
 [2603:6081:7b01:cbda:11b7:7bd8:71db:92e9])
 by smtp.gmail.com with ESMTPSA id x3sm6818222qkl.107.2021.09.24.11.29.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 11:29:37 -0700 (PDT)
Date: Fri, 24 Sep 2021 14:29:35 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210924182935.GL31748@bill-the-cat>
References: <20210921181848.1.I7649d2cbc9b43ca9aef6daa71bb76212a3ff9822@changeid>
MIME-Version: 1.0
In-Reply-To: <20210921181848.1.I7649d2cbc9b43ca9aef6daa71bb76212a3ff9822@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Vipin Kumar <vipin.kumar@st.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: remove SPEAR entry
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
Content-Type: multipart/mixed; boundary="===============4481703117483816157=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4481703117483816157==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UDq0p1ry40hcSP8u"
Content-Disposition: inline


--UDq0p1ry40hcSP8u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 21, 2021 at 06:18:51PM +0200, Patrick Delaunay wrote:

> As the lastest spear directories are removed, delete the associated entry
> in the MAINTAINERS file:
> - arch/arm/cpu/arm926ejs/spear/
> - arch/arm/include/asm/arch-spear/
>=20
> Fixes: 570c3dcfc153 ("arm: Remove spear600 boards and the rest of SPEAr s=
upport")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Applied to u-boot/master, thanks!

--=20
Tom

--UDq0p1ry40hcSP8u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFOGQ8ACgkQFHw5/5Y0
tyxqpAv8D4jx/qgG7o7rtKKzyD/mmMvQoNvqryhtvU0EIFYtsy2kwaUqbS9cgqBa
iDG6dKEpdFI2w09Ct+iACTz13Xj738qlZr5KY1RXs1YKyBRtynXZHFWKmYikzJzH
mRrVmj+uUeolv+o9smV0YpFnl5/pXkvcxfZGX32nx6In+X39L8G96L2iFIJAkRPp
C8q6a0A9IcZclSr1IQttHVMyX1t+ImruJm1wcsLZQ3sl2+E6Deg9+8Ikl+eLxhFW
bi6vLzHGams6A7CwF1GryTPIYhDgmjw6i70oPJSAKE06aSstnfI1b2Wt2zL+Kwp7
5GDGgX4Avd120n/xABUfkCvZV12Of0Vcg5VmNgHd+Nlbx17MTANVKbkXc2fX8m1d
MGW4qB+e5Z6/3fXL4oosOfXAyre2ta561t9BVdIk0qLV5gOxL+d26guemIXqfwpS
+oL1yuKYl3Kq6H4S7+85TUiK41A4Qh/bxOBZ1omsO/aZYRpqU+zHgWLG4dX4CFrj
xlF3QAOu
=LvSQ
-----END PGP SIGNATURE-----

--UDq0p1ry40hcSP8u--

--===============4481703117483816157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4481703117483816157==--
