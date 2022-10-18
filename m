Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B5603244
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Oct 2022 20:23:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F42CC64104;
	Tue, 18 Oct 2022 18:23:06 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83EF8C64101
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 18:23:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id l19so9846918qvu.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Oct 2022 11:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2Xtw/KUim5PjBbRb9lSUiK+LJkIbDChM0jGb0pMaVDg=;
 b=OmajqD1OLycvjzT0lWH0u612i+DAx+r935/1OkqREaJbjexV2MX5f3kAShyJBzNonf
 NJzdVE5ZOXpnt5jB8M+KJdbPQZY6llyqVEyTiHTkfQcpGY3J7kSG054miQR2Hm/evNuK
 yxjDc5ClvNdSI/V7pKbaGsKpZzYWdphtA8+qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Xtw/KUim5PjBbRb9lSUiK+LJkIbDChM0jGb0pMaVDg=;
 b=YjYZSkgYkG34n1G8LGNdmeNyNQIqp9XDjeJSkisUfwdafHhumWlZpqYCwn7RfLltUT
 zuSE8YR6CzWlV256qUN4pRZDLw04m4Z05mOSSsyyFpzbLgAvsHYHrYL0gjSqD7Zt9JQq
 2EzhybXE4yV/Vts07aOLTlCCED9tvqDaIFrqmUS9wy0gxnfG5lNktGXQlqcyFxmlWFFL
 7PWMy8S7edIA2x8bWeOzghcJjN2aPa8ewTYP3dCMO58aNdxQ3MxGhpnikUyoatYGx1Ks
 jF6coaG3OLUIFe92sjXFo9Qp/+qFh1h+LeVjobBjIkU6Q0Z3imh8EcOCtvcKjudixo9l
 QgLw==
X-Gm-Message-State: ACrzQf10U/gseQ8csxEY0pNNgJrDBTQ0IQuq2e/j9YIzjiAYyjAOzDv5
 86gQEYRNHGRup/s8gykefmIYoA==
X-Google-Smtp-Source: AMsMyM5t7s8eXqHN3AgdixJNNcauJnsyGFBtoy6L3SBQrQ+5OyHTMROnKkgFoF9kSFNOJmENtiO6wA==
X-Received: by 2002:ad4:5bad:0:b0:4b4:7d98:7ed0 with SMTP id
 13-20020ad45bad000000b004b47d987ed0mr3216859qvq.21.1666117384382; 
 Tue, 18 Oct 2022 11:23:04 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9c58-0588-a5a5-a6b0.res6.spectrum.com.
 [2603:6081:7b00:6400:9c58:588:a5a5:a6b0])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a05620a40c300b006ee8874f5fasm3014334qko.53.2022.10.18.11.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 11:23:03 -0700 (PDT)
Date: Tue, 18 Oct 2022 14:23:01 -0400
From: Tom Rini <trini@konsulko.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Message-ID: <20221018182301.GR2020586@bill-the-cat>
References: <20221018174827.1393211-1-max.oss.09@gmail.com>
 <20221018180331.sgsufsip2p2544ip@pali>
 <20221018180446.GP2020586@bill-the-cat>
 <20221018180627.eezooyqb2yyhyodu@pali>
 <20221018181723.GQ2020586@bill-the-cat>
 <20221018181923.4vuaskvw3bkfil7b@pali>
MIME-Version: 1.0
In-Reply-To: <20221018181923.4vuaskvw3bkfil7b@pali>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Max Krummenacher <max.oss.09@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, u-boot@lists.denx.de,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Adam Ford <aford173@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] Makefile: fix u-boot-initial-env target
	if lto is enabled
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
Content-Type: multipart/mixed; boundary="===============0053885806015939148=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0053885806015939148==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H6fQM4Loq/u8aogQ"
Content-Disposition: inline


--H6fQM4Loq/u8aogQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 08:19:23PM +0200, Pali Roh=E1r wrote:
> On Tuesday 18 October 2022 14:17:23 Tom Rini wrote:
> > On Tue, Oct 18, 2022 at 08:06:27PM +0200, Pali Roh=E1r wrote:
> > > On Tuesday 18 October 2022 14:04:46 Tom Rini wrote:
> > > > On Tue, Oct 18, 2022 at 08:03:31PM +0200, Pali Roh=E1r wrote:
> > > > > On Tuesday 18 October 2022 19:48:27 Max Krummenacher wrote:
> > > > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > >=20
> > > > > > With LTO enabled the U-Boot initial environment is no longer st=
ored
> > > > > > in an easy accessible section in env/common.o. I.e. the section=
 name
> > > > > > changes from build to build, its content maybe compressed and i=
t is
> > > > > > annotated with additional data.
> > > > > >=20
> > > > > > For GCC adding the option '-ffat-lto-objects' when compiling co=
mmon.o
> > > > > > adds additionally the traditional sections in the object file a=
nd
> > > > > > 'make u-boot-initial-env' would work also for the LTO enabled c=
ase.
> > > > > > However clang doesn't have that option.
> > > > > >=20
> > > > > > Fix this by recompiling common.o into a object file only used f=
or
> > > > > > the creation of u-boot-initial-env if LTO is enabled.
> > > > > >=20
> > > > > > See also:
> > > > > > https://lore.kernel.org/all/927b122e-1f62-e790-f5ca-30bae4332c7=
7@foss.st.com/
> > > > > >=20
> > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > >=20
> > > > > > ---
> > > > > >=20
> > > > > >  Makefile | 8 ++++++++
> > > > > >  1 file changed, 8 insertions(+)
> > > > > >=20
> > > > > > diff --git a/Makefile b/Makefile
> > > > > > index 3866cc62f9a..cd45c720d23 100644
> > > > > > --- a/Makefile
> > > > > > +++ b/Makefile
> > > > > > @@ -2451,9 +2451,17 @@ endif
> > > > > >  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> > > > > > =20
> > > > > >  quiet_cmd_genenv =3D GENENV  $@
> > > > > > +ifeq ($(LTO_ENABLE),y)
> > > > > > +cmd_genenv =3D $(CC) $(filter-out $(LTO_CFLAGS),$(c_flags)) -c=
 -o env/initial_env.o env/common.c; \
> > > > > > +	$(OBJCOPY) --dump-section .rodata.default_environment=3D$@ en=
v/initial_env.o; \
> > > > > > +	sed --in-place -e 's/\x00/\x0A/g' $@; sed --in-place -e '/^\s=
*$$/d' $@; \
> > > > > > +	sort --field-separator=3D=3D -k1,1 --stable $@ -o $@; \
> > > > > > +	rm -f env/initial_env.o env/initial_env.su
> > > > > > +else
> > > > > >  cmd_genenv =3D $(OBJCOPY) --dump-section .rodata.default_envir=
onment=3D$@ env/common.o; \
> > > > >=20
> > > > > This code is still broken because in some cases section name is n=
ot RO.
> > > >=20
> > > > Wait, when does that happen?
> > >=20
> > > E.g. for mvebu_espressobin-88f3720_defconfig
> >=20
> > Erm, ugh. I see 44be835d25ba ("arm: mvebu: Espressobin: Set default
> > value for $ethNaddr env variable") and c4df0f6f315c ("arm: mvebu:
> > Espressobin: Set default value for $fdtfile env variable") I guess we
> > couldn't solve this any other way? The platforms aren't unique in
> > needing / wanting to set MAC or fdtfile variables.
>=20
> Yes, we can solve it. Marek was working on solution for setting default
> variables at runtime but seems it is not finished yet.

OK, then lets not assume DEFAULT_ENV_IS_RW is something we need to worry
about long term.

--=20
Tom

--H6fQM4Loq/u8aogQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNO7wUACgkQFHw5/5Y0
tyx2/Av8DEo0YuWpCjBtzDc8YGOgjsAWqJaN0UBmyyqSOrX3zTSH0bTP0BacIwT4
CC3e6dNh6Y9LZnPZRknHN9svktQ/HiGi5/WI607GH7YObvaP4OOdMCfxFMJfuPnf
51SdvIw5U+C+qdtGxGyz8sM5vCxvvKinOcXGT9+4qTpGwBp3ykMsNtceMeOCKyPT
6/PYP2VKop1OjOus0+Fd1Ex1xOxGsyoX6agIN/xCQ56Vqe8RhxreYsf9qIpOCHG7
Q+WJjCRfLF83yDASI1P8FZyGRgvU6i3m/azDLaFPVVh0I5KF+JB6X7l90gyuedVC
34GRBcTiMg+iHIDRpTqdUnVxR7cLfivF6gk8nAELfgsoPF+o9wp/kwiP2p4i10+3
4bUPLylFSL9Ud/JJ0JsFRnCFN5K7egkez1iZJHPFGpT0ZL3WZtYLU48tTFuihqkb
m9Q+ZNV0Oywpkhxn3TlpftM7+CCGlFlQrBXhWly1RQ3Z06jfruzPyOiWNWCxCZJD
dIH0ALJc
=QLIj
-----END PGP SIGNATURE-----

--H6fQM4Loq/u8aogQ--

--===============0053885806015939148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0053885806015939148==--
