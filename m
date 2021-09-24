Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF5417AEB
	for <lists+uboot-stm32@lfdr.de>; Fri, 24 Sep 2021 20:23:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45DECC5A4F4;
	Fri, 24 Sep 2021 18:23:04 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 457C2C57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 18:23:02 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 194so28816582qkj.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Sep 2021 11:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZIbnlGvrCL6Bt64P2RK3thPcGtSvHvpRwJqZhVRDpTQ=;
 b=Eu9ezl7dXmA1IQixOtwaKypt9QXbPXIG0gZAnouSMGodsY37aDNfm98jVCUQj7BmF2
 B1WIG0u2DdFDG3fQnf7RETYKOt22qg/hO5sL9Cb13Z9Aybk3dhLuMS/gqM1TYWPVxfCR
 4LDIIrNw0dlwBGvdF0EqxNADK6Mt2fAowh3rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZIbnlGvrCL6Bt64P2RK3thPcGtSvHvpRwJqZhVRDpTQ=;
 b=4PtuaQpxakM07yBFHuwhYMu3ldFzmrqttGwHsQUxxZeQBqnpw83RaGIfnXWx6N1pwA
 kid7mwYUJEAsCPrYDmK7iypfGyevkY+ndtSqxDKAgvnMahthhvlKzwEzX0kCRp5L5+7K
 C7MoqS4vC5/ShBkjxqKdARA3w4IPLRAZq7yfoLRHq8NwPzHrvDoSUHv6hSUjLvTw8Q+A
 xorTz0F5md6R8AKdg1Uah0OAFmO5F6tPQKS0H3VwrBZtYcdwY9glwEl66JhIJ5y/5Uqs
 Bx0xjFewTIhy6hbPX5INCM/Aet37wNlx4lyzL6xL9nkP70ZuMDv8v3bVzvBNXhe13hSC
 37sA==
X-Gm-Message-State: AOAM5325jTUqJ5/pDl9EW7E+4KuwoiIKlbOCL25byeUHdzC+oWht5PPG
 13IkYw1Wy5ZwHgXAA69Aq4qhXA==
X-Google-Smtp-Source: ABdhPJxjDMZkBGYwWGt2ZoeHYMC3UqHtPTSag0koZi+JBaG3TAA0NXPzS9PSik9KfOO06bU6GQMhpw==
X-Received: by 2002:a37:61d4:: with SMTP id
 v203mr12067763qkb.279.1632507781103; 
 Fri, 24 Sep 2021 11:23:01 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-11b7-7bd8-71db-92e9.res6.spectrum.com.
 [2603:6081:7b01:cbda:11b7:7bd8:71db:92e9])
 by smtp.gmail.com with ESMTPSA id c26sm4177397qka.33.2021.09.24.11.22.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Sep 2021 11:23:00 -0700 (PDT)
Date: Fri, 24 Sep 2021 14:22:57 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Message-ID: <20210924182257.GG31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
 <20210922194615.GD31748@bill-the-cat>
 <59ce8fa7-64f2-07c9-ee2b-4b59335b3907@denx.de>
 <20210922200053.GE31748@bill-the-cat>
 <a0fa4277-80be-ce67-73fa-08a5be23088f@denx.de>
 <4f1609c3-0aca-3f49-715b-95c8a3336f61@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <4f1609c3-0aca-3f49-715b-95c8a3336f61@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 u-boot@lists.denx.de, Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v4 0/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Type: multipart/mixed; boundary="===============8257525961527440958=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8257525961527440958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AtnpEaT8eVnHe5fr"
Content-Disposition: inline


--AtnpEaT8eVnHe5fr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 11:04:28AM +0200, Patrick DELAUNAY wrote:
> Hi,
>=20
> On 9/23/21 3:32 AM, Marek Vasut wrote:
> > On 9/22/21 10:00 PM, Tom Rini wrote:
> > > On Wed, Sep 22, 2021 at 09:56:26PM +0200, Marek Vasut wrote:
> > > > On 9/22/21 9:46 PM, Tom Rini wrote:
> > > > > On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
> > > > >=20
> > > > > > I am talking about using nor%d in MTDIDS in U-Boot UBI
> > > > > > code to look up from
> > > > > > which device to attach UBI in U-Boot.
> > > > >=20
> > > > > OK, so are we not able to pass in the correct name now?=A0 Or
> > > > > just worried
> > > > > about old environment and new U-Boot?
> > > >=20
> > > > Say you have the following in board config:
> > > >=20
> > > > CONFIG_MTDIDS_DEFAULT=3D"nor0=3Dff705000.spi.0"
> > > > CONFIG_MTDPARTS_DEFAULT=3D"mtdparts=3Dff705000.spi.0:-(fs);"
> > > >=20
> > > > Then run "=3D> ubi part fs", which will fail to find nor0, because
> > > > now that
> > > > nor0 is called something else. That is what this series tries to fi=
x.
> > >=20
> > > Yes, and what is nor0 now, and what happens if you use it?
> >=20
> > Now it is "mt25ql02g", for all mt25ql02g on the board, so ... I cannot
> > even select the one SPI NOR I want to use, since they are not even
> > enumerated in any way, they are all the same. You might want to look at
> > get_mtd_device_nm() in drivers/mtd/mtdcore.c .
>=20
>=20
> To comple me use case, on EV1 board can boot from NOR / NAND / SPI-NAND
>=20
> so mtdparts and mtdids are buidl dynamically with
> CONFIG_SYS_MTDPARTS_RUNTIME in
>=20
> afraided board/st/common/stm32mp_mtdparts.c::board_mtdparts_default()
>=20
>=20
> I don't use MTDIDS_DEFAULT / MTDPARTS_DEFAULT.
>=20
>=20
> For example, when I force NOR / NAND presence, I create the MTD variables:
>=20
> mtdids=3Dnand0=3Dnand0,nor0=3Dnor0
>=20
> mtdparts=3Dmtdparts=3Dnand0:2m(fsbl),2m(ssbl1),2m(ssbl2),-(UBI);nor0:256k=
(fsbl1),256k(fsbl2),2m(ssbl),512k(u-boot-env),-(nor_user)
>=20
>=20
> The command "mtdparts" is working in previous U-Boot releaseafraided
>=20
> and it is not more working as the name of MTD device change
>=20
>=20
> Today, without my patch I have
>=20
> STM32MP> mtd list
> SF: Detected mx66l51235l with page size 256 Bytes, erase size 64 KiB, tot=
al
> 64 MiB
> Could not find a valid device for nor0
> List of MTD devices:
> * nand0
> =A0 - type: NAND flash
> =A0 - block size: 0x40000 bytes
> =A0 - min I/O: 0x1000 bytes
> =A0 - OOB size: 224 bytes
> =A0 - OOB available: 118 bytes
> =A0 - ECC strength: 8 bits
> =A0 - ECC step size: 512 bytes
> =A0 - bitflip threshold: 6 bits
> =A0 - 0x000000000000-0x000040000000 : "nand0"
> =A0=A0=A0 =A0 - 0x000000000000-0x000000200000 : "fsbl"
> =A0=A0=A0 =A0 - 0x000000200000-0x000000400000 : "ssbl1"
> =A0=A0=A0 =A0 - 0x000000400000-0x000000600000 : "ssbl2"
> =A0=A0=A0 =A0 - 0x000000600000-0x000040000000 : "UBI"
> * mx66l51235l
> =A0 - device: mx66l51235l@0
> =A0 - parent: spi@58003000
> =A0 - driver: jedec_spi_nor
> =A0 - path: /soc/spi@58003000/mx66l51235l@0
> =A0 - type: NOR flash
> =A0 - block size: 0x10000 bytes
> =A0 - min I/O: 0x1 bytes
> =A0 - 0x000000000000-0x000004000000 : "mx66l51235l"
> * mx66l51235l
> =A0 - device: mx66l51235l@1
> =A0 - parent: spi@58003000
> =A0 - driver: jedec_spi_nor
> =A0 - path: /soc/spi@58003000/mx66l51235l@1
> =A0 - type: NOR flash
> =A0 - block size: 0x10000 bytes
> =A0 - min I/O: 0x1 bytes
> =A0 - 0x000000000000-0x000004000000 : "mx66l51235l"
>=20
>=20
>=20
> before my patch, Ihave always the error "Device nor0 not found!" on mtdpa=
rts
> command
>=20
> =3D> get_mtd_info
>=20
> =3D=3D> get_mtd_device_nm("nor0")=A0=A0 build with MTD_DEV_TYPE(type)
>=20
> =3D=3D=3D> mtd_device_matches_name()
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 and here "nor0" must be=A0 mtd->name ac=
oring the code
>=20
>=20
> or I miss something...
>=20
>=20
> I don't found any way to solve my issue only with "mtdids" variable.
>=20
> so I restore the previous behavior as I expect the mtd name
>=20
> modification can impact many other boards.
>=20
>=20
> A other solution can be change get_mtd_info(),
>=20
> but I was also afraid of side effect.

Thanks for explaining more.  Marek, any ideas on how to resolve this
best, other than logic to restore some form of nor%d being created here?

--=20
Tom

--AtnpEaT8eVnHe5fr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFOF34ACgkQFHw5/5Y0
tyxoUAv/YVGCJP9pEPu/EoT8eVXelW/WWJPv62wFIFMjJryrKL8b5+M82pr6ONJ+
ZIPeXZy38VOiUUKfyw3EVN8tBp3M+A/25q9u/qNQMzrc4kz6HOM2Bbc9dqRFaAdL
Qy7OlOTTz9olqWHTfoC86iEwFtwbYPH5CSzvJTBglUgs5UhxS/9XVSI3mxzs5hOL
ObJ92ipoqoUPK+/WXzwxUE+sOls2sLMEgIzs76HZhmV9jsJEVGcvqfqqD1euC+QF
rtRDxRD5HPF28fHv1cX/eeR6hfcPj5AKaBmSy/T4jZTyi/tlC6zXH98a+qtOJ6AF
muZBVpLnD6UV2uMn1dscnEamELfV/o8Q6A0GuG9Ur1giZpqma7sYDIMztkpVWCsR
Y5BzmUyF8/pGOS7rD4UqS1U/NKUtZSZ48mg7HwgxRc1t3PcjxQYmHhkYEEi/kwrs
OLtE1oZw0L3zHg4PZg1GcyuKfGrqWJK+1aoqyaYdV5VjnZyVcvxL7UNdMrEew4X4
k0L9MZeN
=JjRu
-----END PGP SIGNATURE-----

--AtnpEaT8eVnHe5fr--

--===============8257525961527440958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8257525961527440958==--
