Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C29205599
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 17:16:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFAC2C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 23 Jun 2020 15:16:37 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E235BC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 15:16:36 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id i3so6145846qtq.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2020 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i2VAxdIWsKYT94k4nrd3gGRESK1cDjScZ/muHpugsEc=;
 b=A8g6e/OKNA3FzX2ovc6zuVTe4oDW5xvLya5eanD5YY16uujyLLgmJPj3dQEQO8vAWb
 0eppStbIcxtbwfApX0IxVfOtVFDxgkDX72mKubAezG0RIT/NDrVEEgFanFv/ZneAuQV8
 GrgGgFLC+wdWVxSZ2+T8UMioLeKnGhnU8oLmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i2VAxdIWsKYT94k4nrd3gGRESK1cDjScZ/muHpugsEc=;
 b=lbzeK2Ncbid41geleAQ+wuaEXApFKKK4Fn+lI+O3DHquLAqPlT7mIEtlXBD0s8E4WW
 Jf511IIqoGWA31w127txZ5Op9/vmctmAkVGYBCbQ6jCIhQ/tHEbE+5JRoPOX8x3yV4ht
 +EdeMHm1v+XQ57PN8bLszMY4pURx6SndyebGHy/s264uajfpoIDks6whQjrIfBEfB3aP
 HPeH0Ij99qD8DF2S6jABEni2NBve+sG7C+xjfHvl4rIkkFtI3dRAVvnrqrf/JS0ov9iX
 BRijBiZjphI2T6CsQTgtZ8go7pSOFmO2mWOQ8oPRKyZa5ms1f6dzqaHlyEnHtId9lmbe
 79SA==
X-Gm-Message-State: AOAM530Z+L+UTBL489zlRWbBES69BXQ8ARrhu5Fa23eu9shiUh9iIMW0
 s28FYuZTzA+qNj/1iuou7Qh9gg==
X-Google-Smtp-Source: ABdhPJwMVTJrhR772EpDgwKkzGRAIORx5xSJfYJ8f9ZLdQ/zeprhMpYaVBNfEYJc6ELrYo3qj8kQeA==
X-Received: by 2002:ac8:1c36:: with SMTP id a51mr3106392qtk.138.1592925394808; 
 Tue, 23 Jun 2020 08:16:34 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-d176-503d-c80d-f934.inf6.spectrum.com.
 [2606:a000:1401:8080:d176:503d:c80d:f934])
 by smtp.gmail.com with ESMTPSA id z60sm843981qtc.30.2020.06.23.08.16.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:16:33 -0700 (PDT)
Date: Tue, 23 Jun 2020 11:16:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200623151631.GT27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
 <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
 <20200619180511.GP27801@bill-the-cat>
 <fd7c790062454362bf9d3153046144a9@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <fd7c790062454362bf9d3153046144a9@SFHDAG6NODE3.st.com>
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
Content-Type: multipart/mixed; boundary="===============4169896024757145318=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4169896024757145318==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pd63dsUMqOR/a9gp"
Content-Disposition: inline


--pd63dsUMqOR/a9gp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2020 at 01:13:55PM +0000, Patrick DELAUNAY wrote:
> Hi Tom,
>=20
> > From: Tom Rini <trini@konsulko.com>
> > Sent: vendredi 19 juin 2020 20:05
> >=20
> > On Fri, Jun 19, 2020 at 02:14:00PM +0000, Patrick DELAUNAY wrote:
> > > Hi Tom and Marek,
> > >
> > > > From: Tom Rini <trini@konsulko.com>
> > > > Sent: jeudi 18 juin 2020 21:16
> > > >
> > > > On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrote:
> > > >
> > > > > Don't return error with ret=3D-ENOENT when the optional ops
> > > > > drv->init is absent but only if env_driver_lookup doesn't found d=
river.
> > > > >
> > > > > This patch correct an issue for the code
> > > > >   if (!env_init())
> > > > >      env_load()
> > > > > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the
> > > > > backend env/ext4.c doesn't define an ops .init
> > > > >
> > > > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > > ---
> > > > >
> > > > > (no changes since v1)
> > > > >
> > > > >  env/env.c | 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/env/env.c b/env/env.c index dcc25c030b..819c88f729
> > > > > 100644
> > > > > --- a/env/env.c
> > > > > +++ b/env/env.c
> > > > > @@ -295,7 +295,10 @@ int env_init(void)
> > > > >  	int prio;
> > > > >
> > > > >  	for (prio =3D 0; (drv =3D env_driver_lookup(ENVOP_INIT, prio));=
 prio++) {
> > > > > -		if (!drv->init || !(ret =3D drv->init()))
> > > > > +		ret =3D 0;
> > > > > +		if (drv->init)
> > > > > +			ret =3D drv->init();
> > > > > +		if (!ret)
> > > > >  			env_set_inited(drv->location);
> > > > >
> > > > >  		debug("%s: Environment %s init done (ret=3D%d)\n", __func__,
> > > >
> > > > I'm adding in Marek here because this reminds me of similar
> > > > questions / concerns I had looking in to his series.  At root, I
> > > > think we're not being consistent in each of our env backing
> > > > implementations about where flags such as ENV_VALID are set, and re=
turn
> > values / checks of functions.
> > > >
> > > > Just outside of the start of the patch context here, we set ret to
> > > > -ENOENT and just past this, if still -ENOENT we say ENV_VALID and
> > > > point at the default environment.
> > > >
> > > > But, I don't follow the patch commit message here.  If we don't have
> > > > drv->init we call env_set_inited(drv->location) but we won't have
> > > > drv->change
> > > > ret to 0, which means that later on down the function we go back to
> > > > default environment.
> > >
> > > The cause of the issue is because the init() ops is optional in "stru=
ct
> > env_driver".
> >=20
> > Right.
> >=20
> > > When this opt is absent, I assume that the initialization is not
> > > mandatory but this inititialization need to be tagged in
> > > gd->env_has_init with the call of
> > > env_set_inited() function
> >=20
> > So when drv->init isn't set we are already calling env_set_inited(...).
> > If that's not the case, what's going on?
> >=20
> > > And the ENV backend is FOUND (don't return -ENOENT)
> > >
> > > else the next call of env_has_inited(drv->location) always failed : in
> > > env_load()
> > >
> > > I see the error  in EXT4 env backend,.all the other backend as a
> > > env_init() function
> > >
> > > But some othe backend don't define the .init operation and have the
> > > issue
> > >
> > > eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) =3D {
> > > ext4.c:135:U_BOOT_ENV_LOCATION(ext4) =3D {
> > > fat.c:128:U_BOOT_ENV_LOCATION(fat) =3D {
> > > mmc.c:393:U_BOOT_ENV_LOCATION(mmc) =3D {
> > > onenand.c:108:U_BOOT_ENV_LOCATION(onenand) =3D {
> > > sata.c:117:U_BOOT_ENV_LOCATION(sata) =3D {
> > > ubi.c:179:U_BOOT_ENV_LOCATION(ubi) =3D {
> > >
> > > The other don't have issue:
> > >
> > > flash.c:358:U_BOOT_ENV_LOCATION(flash) =3D {
> > > flash.c:368:	.init		=3D env_flash_init,
> > > nand.c:382:U_BOOT_ENV_LOCATION(nand) =3D {
> > > nand.c:389:	.init		=3D env_nand_init,
> > > nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) =3D {
> > > nowhere.c:32:	.init		=3D env_nowhere_init,
> > > nvram.c:117:U_BOOT_ENV_LOCATION(nvram) =3D {
> > > nvram.c:122:	.init		=3D env_nvram_init,
> > > remote.c:54:U_BOOT_ENV_LOCATION(remote) =3D {
> > > remote.c:59:	.init		=3D env_remote_init,
> > > sf.c:306:U_BOOT_ENV_LOCATION(sf) =3D {
> > > sf.c:312:	.init		=3D env_sf_init,
> >=20
> > Right, there should be a problem showing up on a ton of locations, not =
just ext4
> > which is why I'm concerned / confused here.  While ext4 isn't as widely=
 used yet
> > as I would expect, FAT/MMC are.
> >=20
> > > > So isn't this a problem in most environment cases then?  Thanks!
> > >
> > > I don't sure which environment configuration can case issue (only one
> > > ENV without drc->init() function) But no issue if at least one
> > > CONFIG_ENV_IS_ is activated with driver implementing init ops
> > >
> > > But I see the issue in SANDBOX when I activate EXT4 only target.
> > > (CONFIG_ENV_IS_IN_EXT4), And no more issue when I add
> > CONFIG_ENV_IS_NOWHERE.
> > >
> > > PS: no direct issue if env_init result is not checked
> > >        but I check this result in the sandbox tests in next patches:
> > > 	if (!env_init())
> > > 	     env_load()
> > >
> > >        but anyway inconsistent value of gd->env_has_init
> > >        which can be a problem for any env_has_inited() calls
> >=20
> > Right.  I think there's some bigger inconsistency going on here that ne=
eds to be
> > fixed.  I'm also confused / concerned how you're not seeing
> > env_set_inite(..) being called.  if (!NULL) is true.  Thanks!
>=20
> I  was confused also...
> and I check again the code

Thanks.  It's a very tricky section of the code and I think I got some
part of it wrong too.  What got me off-track was unrolling the test
isn't required in what you tried, just adding:
	ret =3D 0; // We found at least one env exits.
before if (!drv->init || !(ret =3D drv->init()))
would do the same.  That said...

> And I make a error in my first analysis.
>=20
> For the case where init ops is not defined in only one backend.
>=20
> 	ret =3D -ENOENT
>=20
> And the last test is true
>=20
> 	if (ret =3D=3D -ENOENT) {
> 		gd->env_addr =3D (ulong)&default_environment[0];
> 		gd->env_valid =3D ENV_VALID;
>=20
> 		return 0;
> 	}
>=20
> In  fact this function return the LAST result for 'drv->init()' call and
> that it is strange when several backend are activated.

Yes.  Things are very fragile in the multi-env case.  There being
underlying bugs would not surprise me.

> So this function have no issue when only one ENV backend is activated,
> and it is the configuration today for most of boards...

Right, the common case is the way things have worked historically, env
exists in one defined location and when that fails (device not
present), we get the built-in environment and saveenv needs to fail
rather than crash the board (due to writing to non-existent HW, etc).

> I will change my patch in the V3 serie:
> env_init() return 0 if, at least, one backend is correctly initialized
> (when no ops init  or the ops init result is OK)
> =20
> But I don't understood 2 thinks in the last test
>=20
> 1/ Why set ENV Is set to VALID:
>=20
> 	gd->env_valid =3D ENV_VALID;
>=20
> 	in nowhere backend, for same case of default env, it is set ENV_INVALID.=
=2E..

A good question.  I see:
commit eeba55cb4a8a29a47d0d26692c188b47ba6bf396
Author: Tom Rini <trini@konsulko.com>
Date:   Sat Aug 19 22:27:57 2017 -0400

    env: Correct case of no sub-init function

changed that from setting it to 0 to setting it to ENV_VALID, where 0
meant ENV_INVALID at the time, but the comments in that commit say it
used to be setting it to valid.  Which brings us back to:
commit 203e94f6c9ca03e260175ce240f5856507395585
Author: Simon Glass <sjg@chromium.org>
Date:   Thu Aug 3 12:21:56 2017 -0600

    env: Add an enum for environment state

as adding a enum for 0 =3D ENV_INVALID, 1 =3D ENV_VALID, 2 =3D redundant.

And there's basically part of a longer series to clean up the
environment code.  In particular:
commit 7938822a6b75b69fff9793b6b1769dddf1249525
Author: Simon Glass <sjg@chromium.org>
Date:   Thu Aug 3 12:22:02 2017 -0600

    env: Drop common init() function

is the root of this particular question.  Before this change, the logic
was "For the init function in of an env location, point at the in-memory
default environment, declare it valid".  With this change the new common en=
v init
function (now env_init() then env_init_new() as functionality migrated
to it) when we did not have an explicit drv->init() call we need to
point at the in-memory default environment and (was wrong at the time,
later fixed to...) mark env as valid.

So today, ret =3D -ENOENT is for the case of no explicit drv->init()
function so do what those env drivers were doing before of just pointing
gd->env_addr to the default environment and mark it valid.

What we're doing today works but feels too clever, given the amount of
time it takes to dig in to see what is supposed to be going on.

In the case of one environment location, this logic works as expected.
In the case of multiple environments, I would need to write down all of
the possible combinations and walk the code to be sure what happens,
especially since it's link-order dependent on the order we try drivers
in.

> 2/ Why flags is not update
> =20
> 	gd->flags |=3D GD_FLG_ENV_DEFAULT;
>=20
>=20
> But as it s error case, in should never occurs=20
> And I will sent a separate patch for this part to review.

With all of the above in mind, it's not an error case, but being clever
with variable names and our errno meanings.  So we don't set this flag
here because the "default" drv->init() that we're making this snippet of
code act like never did that.  We only set this flag later on when we're
at the point where we know that we cannot get at a stored environment.
the "default_environment" variable plays the role of both being the
literal default environment as well as being the allocated space we use
and move around as gd->env_addr in many cases.  The env_init() code
block for -ENOENT is to set things up for that case.

Please let me know if this makes sense, or if you think I misread
something (which is quite possible).  Thanks!

--=20
Tom

--pd63dsUMqOR/a9gp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7yHMwACgkQFHw5/5Y0
tywT8Qv/TnRSYXHAk0dxKmvjxPobuWhWy6UunI3fhrzNh1Y1ykd/bKP3WYdycR8+
HieAbFQsRlvfchXQX/ynKc8D4lB1Matris1n8aLG2hyqJHiov+lVqVVhXDwcvC2m
usG7crt+YN4dozc+ZjS8Uw9sbEublpLq7b9GR0SfzwWbOmJzyM3BqEBYE1UwzVr1
82it2Zs0X+XCcNealsqqkZ4cjv+4raUSvhi+/mQIZeeDMJfK6Tz+byK1vCLlc+f9
gZZ4dwTLDsn21e7wkQjSWDtUAtiY2Ib7MvFVphRArTZTw7H3a9C9NH8BbRqdW+vF
W5RIxkTlxcOZE5ugWMTJKs6N+V3Tht9VV9hRlijZqNT12+9D3pZIh/VcF4KOyzq9
l2Bwy2u6zFHcwB00Do01tM6Oq3CWLUG63N/5Ue4SqQCQD4EpEbWFwTuEup5CAkDQ
KaAnBv0o6pNlscqXMToj0oYFn0RDsZFVFbyUS3WY208ypPQVqlAOL5onBPK84pDq
rRldXqGr
=+sH2
-----END PGP SIGNATURE-----

--pd63dsUMqOR/a9gp--

--===============4169896024757145318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4169896024757145318==--
