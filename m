Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992B2019EA
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 20:05:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 492BBC36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 18:05:21 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 363F8C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 18:05:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id k22so7849931qtm.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GjdtfSqAfWCjLZBDTeEOCIDf9C9gn9K7mx6wV5PYo68=;
 b=aAIky+dizjqL8BY+uk9TJc3LI8x4Aqt+e0O9zijWePfZ1HDn+5dYC/GLipTDWmO2tU
 p05DwG8eDTZaR/mr2qP+BZrbFdU5WTmNt0NtkUGoYP4+mI3VLcMf89XDvCpcsqDOD33z
 DTrouqpHi4jit0VXj/Fjqh2yYKr0aGT8DGsl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GjdtfSqAfWCjLZBDTeEOCIDf9C9gn9K7mx6wV5PYo68=;
 b=RdYmUUCXGeWenxSoeNuqp5yDUvAbDuRD2FTpp/KCFUoVM+uaa7MoN118mm3aFLuEQr
 IqwRF0FuTPPOKGumTfGn3xlt5BKWArklxVVuIjDhf/tj09ljiiDEETNsOGD8WEIISJ8I
 3VSvAtFedd//FsATXkYZkcgtGbIXV72nR/GYJawOtdLPfWyREngolMCKzX+sSnV5Mz6o
 cApSxYcDrlHiFcBjBBWJe9PfFoxmx7onFcSlOdczhyrHbPcQN/n2biSFmAxIDCnWN32G
 dfYQ2v7NKaGFiRZVlh6VWAOVhx9Aa7qvuQiImX2lMg8RFmZQ/YMSx9MitogNvOFN1n+c
 z/1w==
X-Gm-Message-State: AOAM531Wmp/L1ZJgPQ47HU4GWuFjV1N4VLOhXtvf1VYjCwsByFwoiLAd
 GBH4vY/RfOHgB/Yv3yiiOZFpPQ==
X-Google-Smtp-Source: ABdhPJz6uJkMaiS39s/+fbEDtSzhHCF/2XgRUCCff2Wrn96nt8j3tvpzwczhywisJeuMpOcr+KdBxg==
X-Received: by 2002:aed:2437:: with SMTP id r52mr3750063qtc.140.1592589914662; 
 Fri, 19 Jun 2020 11:05:14 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-8c25-1271-b281-e614.inf6.spectrum.com.
 [2606:a000:1401:8080:8c25:1271:b281:e614])
 by smtp.gmail.com with ESMTPSA id g140sm6948095qke.98.2020.06.19.11.05.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jun 2020 11:05:13 -0700 (PDT)
Date: Fri, 19 Jun 2020 14:05:11 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200619180511.GP27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
 <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Wolfgang Denk <wd@denx.de>, Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [PATCH v2 3/9] env: correctly handle result in
	env_init
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
Content-Type: multipart/mixed; boundary="===============7849855298339880549=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7849855298339880549==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v1mHNXBTCsim3EdZ"
Content-Disposition: inline


--v1mHNXBTCsim3EdZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:14:00PM +0000, Patrick DELAUNAY wrote:
> Hi Tom and Marek,
>=20
> > From: Tom Rini <trini@konsulko.com>
> > Sent: jeudi 18 juin 2020 21:16
> >=20
> > On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:
> >=20
> > > Don't return error with ret=3D-ENOENT when the optional ops drv->init=
 is
> > > absent but only if env_driver_lookup doesn't found driver.
> > >
> > > This patch correct an issue for the code
> > >   if (!env_init())
> > >      env_load()
> > > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the backend
> > > env/ext4.c doesn't define an ops .init
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  env/env.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/env/env.c b/env/env.c
> > > index dcc25c030b..819c88f729 100644
> > > --- a/env/env.c
> > > +++ b/env/env.c
> > > @@ -295,7 +295,10 @@ int env_init(void)
> > >  	int prio;
> > >
> > >  	for (prio =3D 0; (drv =3D env_driver_lookup(ENVOP_INIT, prio)); pri=
o++) {
> > > -		if (!drv->init || !(ret =3D drv->init()))
> > > +		ret =3D 0;
> > > +		if (drv->init)
> > > +			ret =3D drv->init();
> > > +		if (!ret)
> > >  			env_set_inited(drv->location);
> > >
> > >  		debug("%s: Environment %s init done (ret=3D%d)\n", __func__,
> >=20
> > I'm adding in Marek here because this reminds me of similar questions /=
 concerns
> > I had looking in to his series.  At root, I think we're not being consi=
stent in each of
> > our env backing implementations about where flags such as ENV_VALID are=
 set,
> > and return values / checks of functions.
> >=20
> > Just outside of the start of the patch context here, we set ret to -ENO=
ENT and just
> > past this, if still -ENOENT we say ENV_VALID and point at the default
> > environment.
> >=20
> > But, I don't follow the patch commit message here.  If we don't have
> > drv->init we call env_set_inited(drv->location) but we won't have change
> > ret to 0, which means that later on down the function we go back to def=
ault
> > environment.
>=20
> The cause of the issue is because the init() ops is optional in "struct e=
nv_driver".

Right.

> When this opt is absent, I assume that the initialization is not mandator=
y but
> this inititialization need to be tagged in gd->env_has_init with the call=
 of
> env_set_inited() function=20

So when drv->init isn't set we are already calling env_set_inited(...).
If that's not the case, what's going on?

> And the ENV backend is FOUND (don't return -ENOENT)
>=20
> else the next call of env_has_inited(drv->location) always failed : in en=
v_load()
>=20
> I see the error  in EXT4 env backend,.all the other backend as a env_init=
() function
>=20
> But some othe backend don't define the .init operation and have the issue
>=20
> eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) =3D {
> ext4.c:135:U_BOOT_ENV_LOCATION(ext4) =3D {
> fat.c:128:U_BOOT_ENV_LOCATION(fat) =3D {=20
> mmc.c:393:U_BOOT_ENV_LOCATION(mmc) =3D {
> onenand.c:108:U_BOOT_ENV_LOCATION(onenand) =3D {
> sata.c:117:U_BOOT_ENV_LOCATION(sata) =3D {=20
> ubi.c:179:U_BOOT_ENV_LOCATION(ubi) =3D {
>=20
> The other don't have issue:
>=20
> flash.c:358:U_BOOT_ENV_LOCATION(flash) =3D {
> flash.c:368:	.init		=3D env_flash_init,
> nand.c:382:U_BOOT_ENV_LOCATION(nand) =3D {
> nand.c:389:	.init		=3D env_nand_init,
> nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) =3D {
> nowhere.c:32:	.init		=3D env_nowhere_init,
> nvram.c:117:U_BOOT_ENV_LOCATION(nvram) =3D {
> nvram.c:122:	.init		=3D env_nvram_init,
> remote.c:54:U_BOOT_ENV_LOCATION(remote) =3D {
> remote.c:59:	.init		=3D env_remote_init,
> sf.c:306:U_BOOT_ENV_LOCATION(sf) =3D {
> sf.c:312:	.init		=3D env_sf_init,

Right, there should be a problem showing up on a ton of locations, not
just ext4 which is why I'm concerned / confused here.  While ext4 isn't
as widely used yet as I would expect, FAT/MMC are.

> > So isn't this a problem in most environment cases then?  Thanks!
>=20
> I don't sure which environment configuration can case issue (only one ENV=
 without drc->init() function)
> But no issue if at least one CONFIG_ENV_IS_ is activated with driver impl=
ementing init ops=20
>=20
> But I see the issue in SANDBOX when I activate EXT4 only target. (CONFIG_=
ENV_IS_IN_EXT4),=20
> And no more issue when I add CONFIG_ENV_IS_NOWHERE.
>=20
> PS: no direct issue if env_init result is not checked
>        but I check this result in the sandbox tests in next patches:
> 	if (!env_init())
> 	     env_load()
> =20
>        but anyway inconsistent value of gd->env_has_init=20
>        which can be a problem for any env_has_inited() calls

Right.  I think there's some bigger inconsistency going on here that
needs to be fixed.  I'm also confused / concerned how you're not seeing
env_set_inite(..) being called.  if (!NULL) is true.  Thanks!

--=20
Tom

--v1mHNXBTCsim3EdZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7s/lcACgkQFHw5/5Y0
tyzapAv+K+ErgsfNp9EPZTZDIRXoPuz2+cm3YtEwMczLz+DB3MH7zbh8ZdOzNwrp
OFHpRigZOiqH2GHmtrlIQUR/S4vYsdQbt0eQ2RDLadHJX4JHlzaODXl5x278TxVl
I+xZqnvzfPcfImNl563GnX3op2c7lO5U8sl8ZUKs/eY64OMnZ3ryf8eeB29ZnF1F
2e/vyRKeKFimid4ORnwZTEX4dKXO43cv9GXKo3T5jInF/BrShm/eidNAuUlb3Qom
p/7y3U8hMG0hj6mggAwl3cVi09En+y1BMaDkDF83VoJZaxdDO66wezY53eWk3lP6
qH2assqeYsfvtIF8e0fW6xakd8Mk5ABrlDTxW0hArUCFLVG4PA8ZG60KOksVnLB1
R5CbY8HeeEZ5PD7o6HBAm+z0yBDBWIKCW/5DfpFxURbjS3bWeeDfOsCygBf4YfWu
SVY8aD5CJtUjq8HKBWlPE5rFo/n0xxUaQyI++HKsFrq6qwM+nbKtlQ34yitN5Ovy
oNRGRFAN
=IZwh
-----END PGP SIGNATURE-----

--v1mHNXBTCsim3EdZ--

--===============7849855298339880549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7849855298339880549==--
