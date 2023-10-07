Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527B7BC372
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Oct 2023 03:01:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2DC1C6C837;
	Sat,  7 Oct 2023 01:00:59 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3817EC6A613
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Oct 2023 01:00:58 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-579de633419so32592347b3.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Oct 2023 18:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1696640457; x=1697245257;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mA/TrRiMMonkeByqkROFEz17Z+E1pGwh2Xl4Smv+BA4=;
 b=kEv4PTHUUFHKHs796kOTVyPEdb/IW4VCDZmnKlZJv/OZn+hIqPXMo4tfaZgrUO4Tsh
 n3hiLfSUNgQH8JgtnO2CGLoJi35cfhj6X1Ujw8k5+ch++JSIcicgO9k2CFapPFiApfgU
 e3puf1TgpGEcQVCIhUAUWIsLThpB72KHuj3vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696640457; x=1697245257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mA/TrRiMMonkeByqkROFEz17Z+E1pGwh2Xl4Smv+BA4=;
 b=EIS3c/PaLT8HKTfGNyPWHdlxNwsQ9J7YVn+5tcVU3PvuLoLGOm6x5wPYiJxzlvluZ5
 8FxuLpDJC/CPLS6Quzkx/arLQq+q+1LHZk3X/estHJNsTcKiXPZAtjx1OzbOa5SsYWDQ
 /DO/clegUMA/Fo7VwGq+Tv/OHCR4/9P7wTbbuY4Qy6UaXLV0eCSFqlX+3C0N3Rnjqzli
 2/I8dU3m/y0Gb5KHshZJsIlvuMdKq6//DbM3my3f8RjXU/lS6Bt94jjOBgjc/PL4i2Py
 BER+i8K2SqqGnYk5HEmYO1STO9Bk7QidIMKKHBdRCgy6RCwEuT358GbbNRmG98dBTzYI
 qhxQ==
X-Gm-Message-State: AOJu0YzaFLx3KxV8+09CX5B+uCvUN0XLiDmwKRu25bG2GbisDxOCLDIN
 zvtAG0L+zMapoIUYrhrjDx9MGg==
X-Google-Smtp-Source: AGHT+IGNTfUhnCRjGPXT7tRL53sQGZQL0eQTNChcc0FcimnzTWZlnZxKLqKIiqfDx+M8U57Z74zoEA==
X-Received: by 2002:a81:a182:0:b0:59f:63fb:2261 with SMTP id
 y124-20020a81a182000000b0059f63fb2261mr11155646ywg.19.1696640457043; 
 Fri, 06 Oct 2023 18:00:57 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-429b-02e7-f294-8f62.res6.spectrum.com.
 [2603:6081:7b00:6400:429b:2e7:f294:8f62])
 by smtp.gmail.com with ESMTPSA id
 u206-20020a8147d7000000b0059b4e981fe6sm1662046ywa.102.2023.10.06.18.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Oct 2023 18:00:56 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:00:53 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20231007010053.GE2227687@bill-the-cat>
References: <20230924203953.1829820-1-sjg@chromium.org>
 <20230924203953.1829820-6-sjg@chromium.org>
 <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
 <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
 <20231006021616.GB2227687@bill-the-cat>
 <CAPnjgZ3sTQNQJCpuZ4doJJH=t=mLxXaAYQR8kVXorOfqn2t5CA@mail.gmail.com>
 <20231006165504.GC2227687@bill-the-cat>
 <CAPnjgZ1GZ+Ryt2=_Sf0Z+XM+V58Ty4UmdrAo2bW-Ubs9s19=Ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ1GZ+Ryt2=_Sf0Z+XM+V58Ty4UmdrAo2bW-Ubs9s19=Ww@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Michal Suchanek <msuchanek@suse.de>,
 Leo <ycliang@andestech.com>, Stefan Roese <sr@denx.de>,
 Rick Chen <rick@andestech.com>, uboot-stm32@st-md-mailman.stormreply.com,
 U-Boot Mailing List <u-boot@lists.denx.de>, Michael Walle <michael@walle.cc>,
 Stefano Babic <sbabic@denx.de>, "NXP i.MX U-Boot Team" <uboot-imx@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Bin Meng <bmeng.cn@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 05/25] treewide: Correct use of long help
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
Content-Type: multipart/mixed; boundary="===============2959182906302003768=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2959182906302003768==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yCKvSITMoLyWiRv1"
Content-Disposition: inline


--yCKvSITMoLyWiRv1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 06, 2023 at 04:42:44PM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Fri, 6 Oct 2023 at 10:55, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Fri, Oct 06, 2023 at 07:03:17AM -0600, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Thu, 5 Oct 2023 at 20:16, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Thu, Oct 05, 2023 at 07:41:49PM -0600, Simon Glass wrote:
> > > > > Hi Tom,
> > > > >
> > > > > On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wrote:
> > > > > >
> > > > > > On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > > > > > > Hi Tom,
> > > > > > >
> > > > > > > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.com> =
wrote:
> > > > > > > >
> > > > > > > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass wrote:
> > > > > > > > > Some commands assume that CONFIG_SYS_LONGHELP is always d=
efined.
> > > > > > > > > Declaration of long help should be bracketed by an #ifdef=
 to avoid an
> > > > > > > > > 'unused variable' warning.
> > > > > > > > >
> > > > > > > > > Fix this treewide.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > > > [snip]
> > > > > > > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/mach-=
imx/cmd_dek.c
> > > > > > > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > > > > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct cmd_t=
bl *cmdtp, int flag, int argc,
> > > > > > > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > -/***************************************************/
> > > > > > > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > > > > > > >  static char dek_blob_help_text[] =3D
> > > > > > > > >       "src dst len            - Encapsulate and create bl=
ob of data\n"
> > > > > > > > >       "                         $len bits long at address=
 $src and\n"
> > > > > > > > >       "                         store the result at addre=
ss $dst.\n";
> > > > > > > > > +#endif
> > > > > > > > >
> > > > > > > > >  U_BOOT_CMD(
> > > > > > > > >       dek_blob, 4, 1, do_dek_blob,
> > > > > > > >
> > > > > > > > This really doesn't read nicely.  I would rather (globally =
and fix
> > > > > > > > existing users) __maybe_unused this instead.  I think there=
's just one
> > > > > > > > example today that isn't "foo_help_text".
> > > > > > >
> > > > > > > Hmm, what do you think about adding a __longhelp symbol to ca=
use the
> > > > > > > linker to discard it when not needed?
> > > > > >
> > > > > > Well, I don't think we need linker list magic when __maybe_unus=
ed will
> > > > > > just have them be discarded normally.
> > > > >
> > > > > Yes, perhaps things are in a better state than they used to be, b=
ut
> > > > > there is a linker discard for commands at present.
> > > >
> > > > Yes, but __maybe_unused means we don't get a warning about it, and =
it's
> > > > literally discarded as part of --gc-sections as it done everywhere =
with
> > > > maybe 3 exceptions?
> > >
> > > Actually with this series we get a lot closer to that. The problem
> > > with the status quo is that disabling CMDLINE doesn't disable most
> > > commands, relying instead on discarding them at link time.
> >
> > I don't follow you here.  We're talking only about the long help.
>=20
> I was actually talking about how the command code is removed. This
> series allows that to happen via Kconfig rather than needing a
> linker-script discard rule, something I only just fully appreciated.

OK.  But this series as-is has a lot of problems and I don't see it as
more than a proof of concept.

> > There's already an option to enable/disable it.  When disabled all of
> > the long help text should be discarded, because we reference it via
> > U_BOOT_CMD macro which in turn cares about it, or not.  What's missing
> > is a U_BOOT_LONGHELP macro so that instead of:
> > #ifdef CONFIG_SYS_LONGHELP
> > static char cat_help_text[] =3D
> >         "<interface> <dev[:part]> <file>\n"
> >         "  - Print file from 'dev' on 'interface' to standard output\n";
> > #endif
> >
> > We do:
> > U_BOOT_LONGHELP(cat,
> >         "<interface> <dev[:part]> <file>\n"
> >         "  - Print file from 'dev' on 'interface' to standard output\n"
> > );
> >
> > Which then does:
> > static __maybe_unused char cat_help_text[] =3D
> > ...
> > ;
> >
> > And we discard the text automatically due to --gc-sections.  We possibly
> > haven't already been doing this since back when we first started using
> > --gc-sections there was a bug in binutils that caused text like the
> > above to still get combined in to other objects and not discarded.
> > That's been fixed for ages.
> >
> > And the above macro would also let us clean up U_BOOT_CMD macro slightly
> > to just omit the longhelp option and instead always do _CMD_HELP(_name)
> > inside the macros.  It'll also make it harder to add new commands
> > without a long help by accident.
>=20
> Gosh this is complicated.
>=20
> At present the U_BOOT_CMD() macro just drops the strings...the problem
> with the unused var only happens in a small number of cases where an
> explicit var is used. I don't see why creating a var (when none is
> there today) helps anything? It doesn't detect missing longhelp, since
> this is already an error (missing argument). Sure,  "" can be
> provided, but your macro doesn't stop that either.

The problem today is that 95% of the cases surround the help text with
#ifdef CONFIG_SYS_LONGHELP ... #endif.  That's why the rest of the
macros are the way they are today.  And that in turn is due to (in part
at least) old compiler bugs.

> If you are suggesting a new U_BOOT_LONGHELP() macro, bear in mind that
> we already have quite a lot...each new 'top-level' macro results in
> more combinations.

It really should just be a single macro.  I think I'll make an attempt
at this, to show what I'm talking about.

> > > With this series, it looks like we can in fact do that, so I should
> > > remove the discards as well.
> > >
> > > The one proviso is that this does drop a lot of things we want...e.g.
> > > BOOTSTD_DEFAULTS cannot be enabled due to its use of 'select', meaning
> > > that common filesystems are dropped. So we'll need more effort after
> > > this, to allow (for example) bootmeths that don't need commands to
> > > work correctly. But I think this series at least provides a better
> > > starting point for teasing things apart.
> > >
> > > So OK I'll go with __maybe_unused for the ones that need it, which
> > > isn't too many given that many of the strings are just included
> > > directly in the macro. It is considerably easier than trying to be to
> > > clever about things.
> >
> > Yes, this series itself has a lot of problems that need to be addressed
> > before reposting because I don't like "hiding" that network stuff no
> > longer works, and I also saw that DFU also silently failing.
>=20
> Yes I saw your other comments. But I think this patch is the big area
> of confusion.

This isn't the tricky part of the series that I'm saying has problems,
that part is all of the functionality that's not being untangled and I
think leads to the question of what exactly is the use case where we do
remove the command line but don't need some of that functionality still.

--=20
Tom

--yCKvSITMoLyWiRv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUgrcIACgkQFHw5/5Y0
tyx1/gwAhJ4NTRA7kfhOJQc3cDVUl+1dTS8/E9T1Lwemvd44O7ZlN2x2REc8lgn1
tMr8quSDio+mnLf+DSo+tmCGXMRmC+GQ0tg+iO35fG9SzSnlJKqC6YCdnC7JrROv
o0YOg7swNxL2sKghuXl0EUB2m0S8M1R0+q4/lkXOoT7uTVcES/AKG5aZM1ufVnir
KnJmdobJU+oKIzk831f4eo2gRiGjsn1WX0z6R5XXIyKt6ESKE73SaUxKgLNRaMeR
gVy/S3zmAEjaoiv1m2j24BKYVMRrGOQISPU36uY6lwxNxC3Jr0vILeAG00KwpXaR
YUAec+NmcBzMobelkTDzOcjKy5IpXvgfyIdn1vd/wR/xFpWJu8BjwLpXvHZvTZ2c
7Z7hmYuvJzfXI2efJUITl5IJmoyhZBVPM0lDZ93rKeFC3ljcJ2XRSqBCCork6eNe
5TwdZBueNzrZvKHRnulcEJf+BIDpVXd9s0ue//uPF5Ak7gVUXgrqA+xRm3ceg91/
GtAsnB2D
=J/kF
-----END PGP SIGNATURE-----

--yCKvSITMoLyWiRv1--

--===============2959182906302003768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2959182906302003768==--
