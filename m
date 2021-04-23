Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D434E3696D3
	for <lists+uboot-stm32@lfdr.de>; Fri, 23 Apr 2021 18:23:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C510C57B53;
	Fri, 23 Apr 2021 16:23:57 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BDC2C57195
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 16:23:55 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id y12so36789355qtx.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sXYurpP4e22+urPnUZr8/u7nhU4u92LCPEY7YD5O3Dc=;
 b=lvfNI9TvmWgG9OWfLsa+uP4rhZOShc1oaP6zLDltV8WFMvQQMaDhW9XYOAdj6iSxBb
 YP/36/5QASZFVluyEzR2T+5CSLpoCA3mO0CDGKrr379Gc9iKwIGOwiglZEvkonhk4O9n
 lO9Jn63xvsHZQ1wBYDi7x0oG87d3DTzPv3Dms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sXYurpP4e22+urPnUZr8/u7nhU4u92LCPEY7YD5O3Dc=;
 b=L55wLVTxyc37RAV352UPUUjPbCZvZwDXxemZT0I/kEBVJCyPjP73i3Wk+ZUJp7A73e
 b09TJkB/OIKx6tkJKy6YuGcE2859cc0KrOvVatYsAUzxnlWa8/eViJcA63HD5oTUfa+w
 +5lnXDHvViS73rBjWhTcMymBauBAnNT5uxuJwYXt154nuphvZba4dB/PLbbIesRX4OJ7
 lc7TdQhNkwh0YyBsn0odGHvLKOfxVRIMgLlEtKXqBaIp/flsQD3eRGcDIYTN8cSmnpJh
 wSEs50l7CqLfpO2l+4/5u0sdob0L50IVjYHiSuXFQ0zBHDSCts/WbQqLrfwsFb93+aQ6
 kBGg==
X-Gm-Message-State: AOAM531LRhbmFNSNoqpxATmENor4RukoyQGEMzpsC1Vy0/KGx0qmK2jq
 Z8IKqcNyO6wemAorXoyqpVBpvg==
X-Google-Smtp-Source: ABdhPJwQHsvDwh4H4QsdY4nHMr1V+tObgUg7vhVo+Kz2P5p1OvpGDQ5k1qb4jMeN0T9rYJlrTbM05A==
X-Received: by 2002:ac8:6910:: with SMTP id e16mr4540851qtr.323.1619195034569; 
 Fri, 23 Apr 2021 09:23:54 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-140-239.ec.res.rr.com.
 [65.184.140.239])
 by smtp.gmail.com with ESMTPSA id j185sm4710869qke.1.2021.04.23.09.23.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 23 Apr 2021 09:23:54 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:23:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20210423162352.GP1310@bill-the-cat>
References: <20210310091632.17103-1-patrick.delaunay@foss.st.com>
 <20210310101622.v2.3.I610bbc969f02fce04b772ee13cec3c26634abdc2@changeid>
MIME-Version: 1.0
In-Reply-To: <20210310101622.v2.3.I610bbc969f02fce04b772ee13cec3c26634abdc2@changeid>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Bin Meng <bmeng.cn@gmail.com>,
 Tero Kristo <t-kristo@ti.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Stefan Roese <sr@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH v2 3/8] lmb: add a max parameter in the
	struct lmb_region
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
Content-Type: multipart/mixed; boundary="===============0549775809034261629=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0549775809034261629==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4XpwNWb+sZ5UXMKR"
Content-Disposition: inline


--4XpwNWb+sZ5UXMKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 10, 2021 at 10:16:27AM +0100, Patrick Delaunay wrote:

> Add a max parameter in lmb_region struct to handle test
> in lmb_add_region without using the MAX_LMB_REGIONS
> define.
>=20
> This patch allows to modify these size independently for
> memory of reserved regions in the next patches.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to u-boot/master, thanks!

--=20
Tom

--4XpwNWb+sZ5UXMKR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmCC9JcACgkQFHw5/5Y0
tyy1vwv+MF/pEkdosLhrTVeEbJsFL3m0nbX/0bJHRAIc35SD4G4LUitDp6HJvlIH
6Cv8Ec6JxkIFYl72UTi6x/E7XPkXOeV8VE+4bU3JQONdRhlDVC3MCNccf2PjqlN/
c5wodoCzKynBi5Ejb/dcmvU2IJhFk1A0cbhA2s+4TmyKCA6sT7QiUkwuRyap84/0
hOBNHPbpXqJRzCitUgNlh3LaIeXzW6Lc0TLapaPg7P4TXailtvLlzidubpM9VdBd
hri/EDh1a5lNRH44o82QwVhU8HQ5DcIZ3ryIu1l+khuAhc8aGAYi7dFELSAASu1t
CrJis/8rlrdsQzshHbu97u2qoiNyEAPsatXT2NDXoxYjw3UUIHcPDnTXi1rUYvQ2
oHv8WYcIz5bqqy97zsEJIDB35wMzlrLauE9rPvTCuE4+ecFNLsow4T788BqaNn0S
9CwMK8lYoWJwYQk47FoV6OMnOO3CikiI6iHsAMTH3f1RqGgSkfHNdmO2v5ZzSCY3
xgA+EAtP
=+j+6
-----END PGP SIGNATURE-----

--4XpwNWb+sZ5UXMKR--

--===============0549775809034261629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0549775809034261629==--
