Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C513C5B
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 02:01:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9AE01C35E04
	for <lists+uboot-stm32@lfdr.de>; Sun,  5 May 2019 00:01:50 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05402C35E03
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 May 2019 00:01:49 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b10so11350718wmj.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 May 2019 17:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XE+MSj5u5UMznLum06vC3HLb6o//58nvUK/97f+OsB0=;
 b=kR9IfkZYfX+pTbzpE8qV8GTtz0ibcBciPzmHb8A5fHsRa5WxiVM4Eb49k6auDIRxPW
 qnNtHeCFPuojbSgWtmnamnefB36vpd3a24QNqu/G+4dUKfpt6v+MmvJm+fmzVMQM1fsE
 i0qZ3LtQ51ui2HxP/sjN1RaeRRbQJfv67quxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XE+MSj5u5UMznLum06vC3HLb6o//58nvUK/97f+OsB0=;
 b=j8GNz5EDUwfn33sCVaTxIn3T/Fv4qStK0fm1NBBDDllDP3YO1RbKOG9TilhA7ElSt+
 Q8pGgo1i0fZGIKzu0YWA7UelxnyvqDFlnierKxkUEJtHbCmLB4D/vmbhJQv4+mC/1Nac
 TiVUL2zbomzNwEhCiAn+NeabKx3/SV1OylqBtxUC/QEgxr21OK+4Pl7IHd3mXwy1wAF8
 OaSUxShDegCWRXBhbqy5movJprymgGiOdz/L2rrA4fVaSJu4bfWQcnz3jHBAjVupoJH2
 uJgWwclCJtg+5s0zCKsIp3bHTJlz4cOEX+HbMnoYt+iqO9rN0JqVpcvNPsJ9rbbKTvfQ
 67Qw==
X-Gm-Message-State: APjAAAXpTgb+WKTbrX1H+tTEonWQmp/Nej+/4eXZcflH/BmegfJa4t0f
 G/Tr/6C3+L3x74iQfYz9ZrL8gQ==
X-Google-Smtp-Source: APXvYqz4KfLOHIvBX7Uy59kH+lydF5nHZIMDRc13nW+F2tAC49utr0PydSgkcM2yIND3A58LMCEwDA==
X-Received: by 2002:a1c:5f02:: with SMTP id t2mr11211744wmb.19.1557014508467; 
 Sat, 04 May 2019 17:01:48 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
 [65.184.141.147])
 by smtp.gmail.com with ESMTPSA id v1sm5652424wrd.47.2019.05.04.17.01.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 04 May 2019 17:01:46 -0700 (PDT)
Date: Sat, 4 May 2019 20:01:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20190505000140.GF31207@bill-the-cat>
References: <20190501075827.12992-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190501075827.12992-1-alex.kiernan@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Adrian Alonso <adrian.alonso@nxp.com>, Ken Lin <Ken.Lin@advantech.com.tw>,
 Vanessa Maegima <vanessa.maegima@nxp.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Stefan Roese <sr@denx.de>,
 Chris Packham <judge.packham@gmail.com>,
 Richard Hu <richard.hu@technexion.com>, Marek Vasut <marex@denx.de>,
 Akshay Saraswat <akshay.s@samsung.com>, Stephen Warren <swarren@nvidia.com>,
 Stefan Agner <stefan.agner@toradex.com>, Ingo Schroeck <open-source@samtec.de>,
 Toradex ARM Support <support.arm@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Ian Ray <ian.ray@ge.com>, Simone CIANNI <simone.cianni@bticino.it>,
 Ramon Fried <ramon.fried@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Raffaele RECALCATI <raffaele.recalcati@bticino.it>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Akshay Bhat <akshaybhat@timesys.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH v3] Convert
	CONFIG_SUPPORT_EMMC_BOOT to Kconfig
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
Content-Type: multipart/mixed; boundary="===============3626424489366442665=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3626424489366442665==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YzP2aztyG+deqng7"
Content-Disposition: inline


--YzP2aztyG+deqng7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 07:58:27AM +0000, Alex Kiernan wrote:

> This converts the following to Kconfig:
>    CONFIG_SUPPORT_EMMC_BOOT
>=20
> As requested by Michal Simek <michal.simek@xilinx.com>, these boards
> have no eMMC so CONFIG_SUPPORT_EMMC_BOOT has not been migrated:
>=20
>   xilinx_zynqmp_zc1275_revB
>   xilinx_zynqmp_zc1751_xm018_dc4
>   xilinx_zynqmp_zc1751_xm019_dc5
>   xilinx_zynqmp_zcu100_revC
>   xilinx_zynqmp_zcu102_rev1_0
>   xilinx_zynqmp_zcu102_revA
>   xilinx_zynqmp_zcu102_revB
>   xilinx_zynqmp_zcu104_revA
>   xilinx_zynqmp_zcu104_revC
>   xilinx_zynqmp_zcu106_revA
>   xilinx_zynqmp_zcu111_revA
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Acked-by: Lukasz Majewski <lukma@denx.de>
> Acked-by: Patrick Delaunay <patrick.delaunay@st.com>
> Acked-by: Ramon Fried <ramon.fried@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Tested-by: S=E9bastien Szymanski <sebastien.szymanski@armadeus.com>

Applied to u-boot/master, thanks!

--=20
Tom

--YzP2aztyG+deqng7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJczifkAAoJEIf59jXTHXZS2xIQAJeg6EvLiXFznUOnAMlRBxWB
fdXgQQvGXZsEKXfUc1fJWX7QEQGxjlBH5YqUt+T4OYLZlutyq3dLzp7P5Rla/+ib
yEVvNwpYqGNkLBoWhl/qzoGU/cKtAeoJJZIcPZsHiY7JAFz6/GhLHvapsX7UTXy7
TdK55PQfdq2raRlCJH1u5bI9vtKskDCrgrx/EV666T8q3NH6XFYJsNyCcXB00oSX
59mCSoRONQKHpzourmZvfDbfrQUiqvxu2VUc2MWdGtx96jLFKY/+GS8Kt785aH6k
62jAr3ifi0XAy1K+4/zmm4InfFY4TdBTPuTfjzYVw+D2bCkZGo43tSZfgWqCfRjh
AnM9h6zIu3Hv9lr4KeKDamPtSr2+giG2GeI3ItIblz6IUcYyU77qt2lyLab31TKi
BtwaM49Jv1/pfxtuEtXPFphygo1yVtZQvoGo4KldG02OZmMmZ+MskF7sFX91cL63
mVnQHCPnsZ6hT4VKTG+qsJIYJKJxptaURMmg6iOHIq0fvugaRWfam6ujkfJekfq2
hbZA5VOqo4x6HyX1NevX87dioEbaf6ypSbZLFVUkztJjq92ABp7BQ6N/jT48SJ+q
W1qIEwrj4Z9PqkwJgSsttqUHCPdUj0BJqaprI9fQ6Zutn82nux34L4RUhwtbT3iF
kzNkD6N143ONsEpjnqWc
=2zhN
-----END PGP SIGNATURE-----

--YzP2aztyG+deqng7--

--===============3626424489366442665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3626424489366442665==--
