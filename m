Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC878207B34
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 20:07:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB2EC36B0B
	for <lists+uboot-stm32@lfdr.de>; Wed, 24 Jun 2020 18:07:57 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE1F9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 18:07:56 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id e2so1479488qvw.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5t2cfHO42frV3Go1xNVoxGINK/lkOMPFeUv9S051KFk=;
 b=ZC/Qf+9QfCxSCqAiciBPLUX6RLuaoA2uMigwxpBmiNUZ3rpO9R5eZMpWP1D5f6ZjQf
 SrBUXxQHiQ7YEsB3ZHU8DNwuWFiu0I19ar2EN1JtSMNpvgq5eA0+3N7GMuufI0WLA5EE
 xgUKI8VY6CfyNTShlIZY6RvCdXCPijO+XcoQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5t2cfHO42frV3Go1xNVoxGINK/lkOMPFeUv9S051KFk=;
 b=OfrGt9T+6GMW1L8Ifi9p1F0m7Di7w0FklGP5+folHswVOQXWZTejElX8pf/1zTka1X
 u4TuWHyyTNn2BhybCPcjcyBGTnpT3259K9CE1xR1BtsEXBv5lcOZq4fywKqlBprHxefH
 U8un3U03/36ls5YNfASHS2vH+zz8IdRXYxEzE0+Ts1SHNuEuuUdCO+wbIX/l2Wp+i4qs
 AlicnEMq8Qm40A0KJlt0jS1i8MGe5LcW5KsqJprgmLL+hRGVVVMcVYE/zFYRo8sqc9e+
 jX+9Va/ebLC6ZK8HB7W9poBgRatW1N9bSY47II4G0L3cxx8ftAB9G/kl49gqnZLkhLvP
 B1cw==
X-Gm-Message-State: AOAM531cvLsRvbeJsxg8YMzaAJDla2ulF6jaX8ny5JY6PYfj3YBh1w5K
 pgZWIUQhUnruSHB9N9dYS1O9sw==
X-Google-Smtp-Source: ABdhPJxIqXdKNs4e/OdaY17yR7CTXKOFIK2o9edaXBO09szQpJVxnOQr8nVtuohXefd5FKbqEDUa3g==
X-Received: by 2002:a0c:e551:: with SMTP id n17mr16650422qvm.151.1593022074933; 
 Wed, 24 Jun 2020 11:07:54 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-5990-5700-adef-d602.inf6.spectrum.com.
 [2606:a000:1401:8080:5990:5700:adef:d602])
 by smtp.gmail.com with ESMTPSA id f22sm4794945qko.89.2020.06.24.11.07.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Jun 2020 11:07:53 -0700 (PDT)
Date: Wed, 24 Jun 2020 14:07:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200624180751.GC8432@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-4-patrick.delaunay@st.com>
 <20200618191530.GU27801@bill-the-cat>
 <50087f47d8c44cb8930940c6de7ae360@SFHDAG6NODE3.st.com>
 <20200619180511.GP27801@bill-the-cat>
 <fd7c790062454362bf9d3153046144a9@SFHDAG6NODE3.st.com>
 <20200623151631.GT27801@bill-the-cat>
 <8c5426d871bf454eb5d6efc6ba6f9d6b@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <8c5426d871bf454eb5d6efc6ba6f9d6b@SFHDAG6NODE3.st.com>
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
Content-Type: multipart/mixed; boundary="===============0876180579345086896=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0876180579345086896==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 11:19:50AM +0000, Patrick DELAUNAY wrote:
> Hi Tom,
>=20
> > From: Tom Rini <trini@konsulko.com>
> > Sent: mardi 23 juin 2020 17:17
> >=20
> > On Tue, Jun 23, 2020 at 01:13:55PM +0000, Patrick DELAUNAY wrote:
> > > Hi Tom,
> > >
> > > > From: Tom Rini <trini@konsulko.com>
> > > > Sent: vendredi 19 juin 2020 20:05
> > > >
> > > > On Fri, Jun 19, 2020 at 02:14:00PM +0000, Patrick DELAUNAY wrote:
> > > > > Hi Tom and Marek,
> > > > >
> > > > > > From: Tom Rini <trini@konsulko.com>
> > > > > > Sent: jeudi 18 juin 2020 21:16
> > > > > >
> > > > > > On Tue, Jun 16, 2020 at 09:40:42AM +0200, Patrick Delaunay wrot=
e:
> > > > > >
> > > > > > > Don't return error with ret=3D-ENOENT when the optional ops
> > > > > > > drv->init is absent but only if env_driver_lookup doesn't fou=
nd driver.
> > > > > > >
> > > > > > > This patch correct an issue for the code
> > > > > > >   if (!env_init())
> > > > > > >      env_load()
> > > > > > > When only ext4 is supported (CONFIG_ENV_IS_IN_EXT4), as the
> > > > > > > backend env/ext4.c doesn't define an ops .init
> > > > > > >
> > > > > > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > > > > ---
> > > > > > >
> > > > > > > (no changes since v1)
> > > > > > >
> > > > > > >  env/env.c | 5 ++++-
> > > > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/env/env.c b/env/env.c index
> > > > > > > dcc25c030b..819c88f729
> > > > > > > 100644
> > > > > > > --- a/env/env.c
> > > > > > > +++ b/env/env.c
> > > > > > > @@ -295,7 +295,10 @@ int env_init(void)
> > > > > > >  	int prio;
> > > > > > >
> > > > > > >  	for (prio =3D 0; (drv =3D env_driver_lookup(ENVOP_INIT, pri=
o));
> > prio++) {
> > > > > > > -		if (!drv->init || !(ret =3D drv->init()))
> > > > > > > +		ret =3D 0;
> > > > > > > +		if (drv->init)
> > > > > > > +			ret =3D drv->init();
> > > > > > > +		if (!ret)
> > > > > > >  			env_set_inited(drv->location);
> > > > > > >
> > > > > > >  		debug("%s: Environment %s init done (ret=3D%d)\n",
> > __func__,
> > > > > >
> > > > > > I'm adding in Marek here because this reminds me of similar
> > > > > > questions / concerns I had looking in to his series.  At root, I
> > > > > > think we're not being consistent in each of our env backing
> > > > > > implementations about where flags such as ENV_VALID are set, and
> > > > > > return
> > > > values / checks of functions.
> > > > > >
> > > > > > Just outside of the start of the patch context here, we set ret
> > > > > > to -ENOENT and just past this, if still -ENOENT we say ENV_VALID
> > > > > > and point at the default environment.
> > > > > >
> > > > > > But, I don't follow the patch commit message here.  If we don't
> > > > > > have
> > > > > > drv->init we call env_set_inited(drv->location) but we won't
> > > > > > drv->have change
> > > > > > ret to 0, which means that later on down the function we go back
> > > > > > to default environment.
> > > > >
> > > > > The cause of the issue is because the init() ops is optional in
> > > > > "struct
> > > > env_driver".
> > > >
> > > > Right.
> > > >
> > > > > When this opt is absent, I assume that the initialization is not
> > > > > mandatory but this inititialization need to be tagged in
> > > > > gd->env_has_init with the call of
> > > > > env_set_inited() function
> > > >
> > > > So when drv->init isn't set we are already calling env_set_inited(.=
=2E.).
> > > > If that's not the case, what's going on?
> > > >
> > > > > And the ENV backend is FOUND (don't return -ENOENT)
> > > > >
> > > > > else the next call of env_has_inited(drv->location) always failed
> > > > > : in
> > > > > env_load()
> > > > >
> > > > > I see the error  in EXT4 env backend,.all the other backend as a
> > > > > env_init() function
> > > > >
> > > > > But some othe backend don't define the .init operation and have
> > > > > the issue
> > > > >
> > > > > eeprom.c:235:U_BOOT_ENV_LOCATION(eeprom) =3D {
> > > > > ext4.c:135:U_BOOT_ENV_LOCATION(ext4) =3D {
> > > > > fat.c:128:U_BOOT_ENV_LOCATION(fat) =3D {
> > > > > mmc.c:393:U_BOOT_ENV_LOCATION(mmc) =3D {
> > > > > onenand.c:108:U_BOOT_ENV_LOCATION(onenand) =3D {
> > > > > sata.c:117:U_BOOT_ENV_LOCATION(sata) =3D {
> > > > > ubi.c:179:U_BOOT_ENV_LOCATION(ubi) =3D {
> > > > >
> > > > > The other don't have issue:
> > > > >
> > > > > flash.c:358:U_BOOT_ENV_LOCATION(flash) =3D {
> > > > > flash.c:368:	.init		=3D env_flash_init,
> > > > > nand.c:382:U_BOOT_ENV_LOCATION(nand) =3D {
> > > > > nand.c:389:	.init		=3D env_nand_init,
> > > > > nowhere.c:30:U_BOOT_ENV_LOCATION(nowhere) =3D {
> > > > > nowhere.c:32:	.init		=3D env_nowhere_init,
> > > > > nvram.c:117:U_BOOT_ENV_LOCATION(nvram) =3D {
> > > > > nvram.c:122:	.init		=3D env_nvram_init,
> > > > > remote.c:54:U_BOOT_ENV_LOCATION(remote) =3D {
> > > > > remote.c:59:	.init		=3D env_remote_init,
> > > > > sf.c:306:U_BOOT_ENV_LOCATION(sf) =3D {
> > > > > sf.c:312:	.init		=3D env_sf_init,
> > > >
> > > > Right, there should be a problem showing up on a ton of locations,
> > > > not just ext4 which is why I'm concerned / confused here.  While
> > > > ext4 isn't as widely used yet as I would expect, FAT/MMC are.
> > > >
> > > > > > So isn't this a problem in most environment cases then?  Thanks!
> > > > >
> > > > > I don't sure which environment configuration can case issue (only
> > > > > one ENV without drc->init() function) But no issue if at least one
> > > > > CONFIG_ENV_IS_ is activated with driver implementing init ops
> > > > >
> > > > > But I see the issue in SANDBOX when I activate EXT4 only target.
> > > > > (CONFIG_ENV_IS_IN_EXT4), And no more issue when I add
> > > > CONFIG_ENV_IS_NOWHERE.
> > > > >
> > > > > PS: no direct issue if env_init result is not checked
> > > > >        but I check this result in the sandbox tests in next patch=
es:
> > > > > 	if (!env_init())
> > > > > 	     env_load()
> > > > >
> > > > >        but anyway inconsistent value of gd->env_has_init
> > > > >        which can be a problem for any env_has_inited() calls
> > > >
> > > > Right.  I think there's some bigger inconsistency going on here that
> > > > needs to be fixed.  I'm also confused / concerned how you're not
> > > > seeing
> > > > env_set_inite(..) being called.  if (!NULL) is true.  Thanks!
> > >
> > > I  was confused also...
> > > and I check again the code
> >=20
> > Thanks.  It's a very tricky section of the code and I think I got some =
part of it
> > wrong too.  What got me off-track was unrolling the test isn't required=
 in what you
> > tried, just adding:
> > 	ret =3D 0; // We found at least one env exits.
> > before if (!drv->init || !(ret =3D drv->init())) would do the same.  Th=
at said...
> >=20
> > > And I make a error in my first analysis.
> > >
> > > For the case where init ops is not defined in only one backend.
> > >
> > > 	ret =3D -ENOENT
> > >
> > > And the last test is true
> > >
> > > 	if (ret =3D=3D -ENOENT) {
> > > 		gd->env_addr =3D (ulong)&default_environment[0];
> > > 		gd->env_valid =3D ENV_VALID;
> > >
> > > 		return 0;
> > > 	}
> > >
> > > In  fact this function return the LAST result for 'drv->init()' call
> > > and that it is strange when several backend are activated.
> >=20
> > Yes.  Things are very fragile in the multi-env case.  There being under=
lying bugs
> > would not surprise me.
>=20
> I dig deeper in the code and I agree: I will just sent a v3 with minimal =
update.=20
>=20
> The multi-env cases it could be  long story.
>=20
> > > So this function have no issue when only one ENV backend is activated,
> > > and it is the configuration today for most of boards...
> >=20
> > Right, the common case is the way things have worked historically, env =
exists in
> > one defined location and when that fails (device not present), we get t=
he built-in
> > environment and saveenv needs to fail rather than crash the board (due =
to writing
> > to non-existent HW, etc).
>=20
> Yes tested today on sandbox
> env save failed to avoid crash but without any trace.
>=20
> =3D> I push a patch to add trace is that make sense.
> [PATCH] env: add failing trace in env_save
> http://patchwork.ozlabs.org/project/uboot/list/?series=3D185459
>=20
>=20
> > > I will change my patch in the V3 serie:
> > > env_init() return 0 if, at least, one backend is correctly initialized
> > > (when no ops init  or the ops init result is OK)
> > >
> > > But I don't understood 2 thinks in the last test
> > >
> > > 1/ Why set ENV Is set to VALID:
> > >
> > > 	gd->env_valid =3D ENV_VALID;
> > >
> > > 	in nowhere backend, for same case of default env, it is set
> > ENV_INVALID....
> >=20
> > A good question.  I see:
> > commit eeba55cb4a8a29a47d0d26692c188b47ba6bf396
> > Author: Tom Rini <trini@konsulko.com>
> > Date:   Sat Aug 19 22:27:57 2017 -0400
> >=20
> >     env: Correct case of no sub-init function
> >=20
> > changed that from setting it to 0 to setting it to ENV_VALID, where 0 m=
eant
> > ENV_INVALID at the time, but the comments in that commit say it used to=
 be
> > setting it to valid.  Which brings us back to:
> > commit 203e94f6c9ca03e260175ce240f5856507395585
> > Author: Simon Glass <sjg@chromium.org>
> > Date:   Thu Aug 3 12:21:56 2017 -0600
> >=20
> >     env: Add an enum for environment state
> >=20
> > as adding a enum for 0 =3D ENV_INVALID, 1 =3D ENV_VALID, 2 =3D redundan=
t.
> >=20
> > And there's basically part of a longer series to clean up the environme=
nt code.  In
> > particular:
> > commit 7938822a6b75b69fff9793b6b1769dddf1249525
> > Author: Simon Glass <sjg@chromium.org>
> > Date:   Thu Aug 3 12:22:02 2017 -0600
> >=20
> >     env: Drop common init() function
> >=20
> > is the root of this particular question.  Before this change, the logic=
 was "For the
> > init function in of an env location, point at the in-memory default env=
ironment,
> > declare it valid".  With this change the new common env init function (=
now
> > env_init() then env_init_new() as functionality migrated to it) when we=
 did not have
> > an explicit drv->init() call we need to point at the in-memory default =
environment
> > and (was wrong at the time, later fixed to...) mark env as valid.
> >=20
> > So today, ret =3D -ENOENT is for the case of no explicit drv->init() fu=
nction so do
> > what those env drivers were doing before of just pointing
> > gd->env_addr to the default environment and mark it valid.
> >=20
> > What we're doing today works but feels too clever, given the amount of =
time it
> > takes to dig in to see what is supposed to be going on.
> >=20
> > In the case of one environment location, this logic works as expected.
> > In the case of multiple environments, I would need to write down all of=
 the possible
> > combinations and walk the code to be sure what happens, especially sinc=
e it's
> > link-order dependent on the order we try drivers in.
>=20
> I check the code deeper and
> I see many incoherency in multi-env support
>=20
> For example sometime the global ENV configuration=20
> 	gd->env_valid =3D ENV_VALID;
>=20
> is initialiazed in init function of each backend...
> for me it should be initialzed only on the load ops when the ENV is reall=
y valid.
>=20
> and for default ENV configuration
>=20
> we have
> 	gd->env_addr	=3D (ulong)&default_environment[0];
> 	gd->env_valid	=3D ENV_INVALID;
>=20
> 	in this case set gd->env_addr with ENV_INVALID is not necessary=20
>=20
> or
> 	gd->env_addr	=3D (ulong)&default_environment[0];
> 	gd->env_valid	=3D ENV_VALID;
>=20
> it seems incoherent or uneeded with
>=20
> int env_get_char(int index)
> {
> 	if (gd->env_valid =3D=3D ENV_INVALID)
> 		return default_environment[index];
> 	else
> 		return env_get_char_spec(index);
> }
>=20
> I will continue to check the code deeper but it seems=20
> out of the scope for this serie.
>=20
> I will sent a v3 soon.
>=20
> > > 2/ Why flags is not update
> > >
> > > 	gd->flags |=3D GD_FLG_ENV_DEFAULT;
> > >
> > >
> > > But as it s error case, in should never occurs And I will sent a
> > > separate patch for this part to review.
> >=20
> > With all of the above in mind, it's not an error case, but being clever=
 with variable
> > names and our errno meanings.  So we don't set this flag here because t=
he
> > "default" drv->init() that we're making this snippet of code act like n=
ever did that.
> > We only set this flag later on when we're at the point where we know th=
at we
> > cannot get at a stored environment.
> > the "default_environment" variable plays the role of both being the lit=
eral default
> > environment as well as being the allocated space we use and move around=
 as gd-
> > >env_addr in many cases.  The env_init() code block for -ENOENT is to s=
et
> > things up for that case.
> >=20
> > Please let me know if this makes sense, or if you think I misread somet=
hing
> > (which is quite possible).  Thanks!
>=20
> Yes that make sense: it is fallback to default ENV when all .init failed,=
 I will update
> my patch in V3 with minimal update of this part and with a new comment.
>=20
> The env code use many gloabal tag, sometime managed by common code,
> sometime managed by backend... it is difficult to know the responsibility=
 of each
> part in multi-env context.
>=20
> I will continue check of ENV code in background (and perhaps activate and=
 test a other
> ENV backend in sandbox)
>=20
> Thanks for your time.

Thanks for looking here as well.  Any patches you can add to clarify
things or make them more consistent are greatly appreciated.

--=20
Tom

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7zlnAACgkQFHw5/5Y0
tyyZiQv+Mv4kX9gjfAxXje9nvkCVmRyUVeReyeL0IT3i6RuaK3oMaA9wMy5ow/hM
TGy/lX+CVmKXWe/+X5Sp2MT4TJlQULN7i+jFCbX51lBQ4wVWe5LEJPNLKQ/tAbp1
wdrypFk6pcZsfZYjo97P7+qOdySBhZWLNOYajV7akHDujlC89qcd5+sOm7t2dWXn
qsCojSUMETiZRp9euYJPinShhlu5PCWQPo17NoGEoYdn7iHrbW7BsfC08wjQ12bo
QYWn3sYy9I51gHFSodj96Rpsyz1nrjOedN09xRxq5YUhcIba/xQZPLncjQguRMuc
TT95TQ8SX0EFbcl+h+h8F36ARf0oWW6DbNmbaPc8ujdzWrrkIPPk5znn91wwngUJ
ruqHcJl16l58T1ZeBM4N9QYcsv0LE4GcupnQ3B8OeRjRFrtu3zNon7jPOHNaPcdF
c7yDapQy71c8vcpNEsPgeVc1bXWre6bSudJWlFDYXc3+9HbhcFUrHV+PAD62O8Y9
i+KAJoNJ
=Luhs
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--

--===============0876180579345086896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0876180579345086896==--
