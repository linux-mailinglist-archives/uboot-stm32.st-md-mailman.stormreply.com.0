Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75285415093
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Sep 2021 21:41:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7D4DC5A4CD;
	Wed, 22 Sep 2021 19:41:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEE99C5718F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 19:41:18 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id bk29so13707329qkb.8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Sep 2021 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cNUWGOyFKR1d4DW9zzXncdC0W4gGiZ6rT0qL3W7jxFA=;
 b=mDa2rDUrKWX5EfJypRb0RGiN7Ck5Y3rcPl7XTUNT91bfUDDoUQhu6lpXlwvZbQZHKW
 u8gynqdaQ0x1zNSFOGWmR9OTWKzLjjhQlfphc/QAizvvGRWJ83Wf8JCyjmHfmS4vZkAE
 mej7aXncvqbzXkSMov3e1Dhu3LYCxQXDpq7x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cNUWGOyFKR1d4DW9zzXncdC0W4gGiZ6rT0qL3W7jxFA=;
 b=hMvfw6w0JnZhYFedjJ9wkGYTn5467Si3JDvMjDM9btgi9KEZehr7Isn0GYBY01SNQb
 IXC9h6qIhkKq9U0QwjINE/KkKyF0SHg1k+mRyNfE/wDv74NiKyGPlrHqJoslFx0+7L2A
 GNcX+pEm/oP6zrftSDFCL2d+uDnqom8Nzyo7UcQxZnA7syrY4uFsdcwIf4sX24oREHen
 6iJEN69m2YvKBeeqA/L/iga6zXtcfQI69rRBdYkpkbNgm4cZwIBL9DSZDrnPBRUaMvU6
 U45gRd3Lw85TxvBYh8s5nkuQW0Nx+2kQS6/owCwgbV2O/wfH5/VSdJJoEQgSHfCysDDY
 aWQA==
X-Gm-Message-State: AOAM530gKasMnKcF/xM0yuNxQLUPFIqT18pfgNoJO9+blrYNAoR/rJsf
 kjwlb2F+3ZH6lmoUK8cnLlitZQ==
X-Google-Smtp-Source: ABdhPJwFcgJiE8dXrYklvwFKKj+V4yOSi4gnp90TE4urYp+cskMCie+TrGqdOPWp3lyeVnQpwzFweQ==
X-Received: by 2002:a05:620a:1723:: with SMTP id
 az35mr1092752qkb.2.1632339677851; 
 Wed, 22 Sep 2021 12:41:17 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-cbda-a58e-d475-4878-38e2.res6.spectrum.com.
 [2603:6081:7b01:cbda:a58e:d475:4878:38e2])
 by smtp.gmail.com with ESMTPSA id w185sm2649725qkd.30.2021.09.22.12.41.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Sep 2021 12:41:17 -0700 (PDT)
Date: Wed, 22 Sep 2021 15:41:15 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20210922194115.GB31748@bill-the-cat>
References: <20210922162909.1857566-1-patrick.delaunay@foss.st.com>
 <20210922192925.723abcba@thinkpad>
 <a38d6126-2d09-34d4-0b08-0d1da94ed415@denx.de>
 <20210922210536.6c9c2f9e@thinkpad>
 <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
MIME-Version: 1.0
In-Reply-To: <56df80f7-aa1d-3cff-5b29-16fdafcf7bcf@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Heiko Schocher <hs@denx.de>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5612717002837156382=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5612717002837156382==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 09:24:24PM +0200, Marek Vasut wrote:
> On 9/22/21 9:05 PM, Marek Beh=FAn wrote:
>=20
> Hi,
>=20
> [...]
>=20
> > > > I find this either not complete or not needed:
> > > >=20
> > > > - either you need mtd names to be of this format so that old MTDPAR=
TS
> > > >     config definitions do not need to be changed, i.e. something li=
ke
> > > >       CONFIG_MTDPARTS_DEFAULT=3D"nor0:1M(u-boot),0x1000@0xfff000(en=
v)"
> > > >     does not work currently, and you want to make it work.
> > > >=20
> > > >     I find your solution here incomplete because MTDPARTS can also =
be
> > > >     used to be passed to Linux as mtdparts parameter, but there is =
no
> > > >     guarantee that the "norN" numbering you are creating in U-Boot =
will
> > > >     be the same as the one in kernel.
> > > >=20
> > > > - or it is not needed, because you can remove MTDPARTS definition f=
rom
> > > >     the board config entirely and move the information into device =
tree.
> > > >     In fact this was the main idea behind making the series
> > > >       Support SPI NORs and OF partitions in `mtd list`
> > > >     The SPI-NOR MTDs after this series can have conflicting names,
> > > >     because you can still choose between them via OF path with the =
`mtd`
> > > >     command.
> > > >=20
> > > >     Tom and I were of the opinion that MTDPARTS should be deprecate=
d and
> > > >     removed in favor of OF. Marek Vasut says that this is not possi=
ble
> > > >     for every board, and so needs to stay.
> > > >=20
> > > > BTW, I find it a little weird for Marek to defend old API which sho=
uld
> > > > be converted to DT, when in discussion about DM USB / Nokia N900
> > > > USB TTY console [1] he was defending the opinion that we should be
> > > > heading to DT in U-Boot.
> > > >=20
> > > > [1]
> > > > https://patchwork.ozlabs.org/project/uboot/patch/20210618145724.255=
8-1-pali@kernel.org/
> > >=20
> > > That USB discussion is completely unrelated to the problem here, the =
USB
> > > discussion is about internal (i.e. not user facing) conversion to DM/=
DT.
> > > The user-facing ABI does not change there. Also, that discussion was
> > > about patching USB stack to permit new non-DM/DT operation, not fixing
> > > existing one.
> >=20
> > This is not only about the user ABI (altough now I agree that you are
> > correct there, see below). What I meant is this:
> >    Should we push for converting to device-tree even if for some boards
> >    it is not possible, and would mean removing them?
>=20
> The N900 could however be converted to DT as far as I can tell, there was=
 a
> solution which didn't end up patching the USB core with legacy stuff.

Just for the record and to hopefully end this specific tangent, the
"fix" at the time was to correct the "CONFIG_USB means host or gadget"
so that N900 has more time (and an active developer on) migrating gadget
as it does not use host.

--=20
Tom

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmFLhtcACgkQFHw5/5Y0
tyxd6wwAhM3zmgvF4sCvPVoYJjDvZdfKP/5CiXPUiJLA1Effj2lTGOe6OzxBf2yA
Ar27XAqVvRrci/cVL3Osy9B3p270mGlAA6jIm7yEy8NuTOo+GeeB179ba/32xgdi
ARFcTRMRQDYDy/8yedMxu93EjlqXJs1PxCwJeHgHNxU5jhnyJlikqjr5Jal+DTf1
4Y4E9FqTGk3aA0kuuqkQvtsis02zF2geBgZx9AoYClHREoSmDHZJ/yB1/+ZxuA+T
3GmdSF47BbIG6Dk3+KsVMzdYhbKbrV41XpylSLsIVAiclRlI3rpc/XVqlrm7ew/l
aqql4R4slF5bhapkxpd17BdGdxJzUUGQwU3BQRr8uKVlgZ2Q6gfl0xp9MQ1TbLIB
3BaFgmR6jeFUwFt4xodFqorpl0QUDJkyrp1oYpVSx0YXQWc4xxjxk/ZjJKpHaDdO
/pEhgxmEMm+EC49KXiUrdnIfA/1rmlnWoM5Wora5O3dt3hobeJhvVP/OHNwwjZML
+nWS/6e0
=FW9R
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

--===============5612717002837156382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5612717002837156382==--
