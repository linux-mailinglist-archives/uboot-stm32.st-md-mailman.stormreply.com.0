Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE31F7BC949
	for <lists+uboot-stm32@lfdr.de>; Sat,  7 Oct 2023 19:25:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D37FC6C82E;
	Sat,  7 Oct 2023 17:25:22 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4101AC65E4F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Oct 2023 17:25:21 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5a2478862dbso39496697b3.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 07 Oct 2023 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1696699520; x=1697304320;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fzJZDjPIEN93DWLlEuMsaZ37M+q/vUw3ByM+b8f8A0c=;
 b=AjDnBNGSVw1IH9Juw5fRkm+FcVRCBOg/iqkmxBI/LV8GoGuuXt0vYCEd1LrCtMa0FU
 uil8+9FNf+ps2BU+qMi77DawAdHVOs4SbzCxC5vN7B2f7g3juV5867MSXHPpiscLIJZT
 X2TcIXxc6kgrfjIxP9UucyL5EXEz6deWPAjis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696699520; x=1697304320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzJZDjPIEN93DWLlEuMsaZ37M+q/vUw3ByM+b8f8A0c=;
 b=wPr/ZpMOtUErFcl/Z9cHIGw4F74/bDHbT6E8VLeK9wFNZ3lb/14azT3kGAKvoXEs5C
 DrywjHlEmoscblVbGlcbaztTDdVy+CQg0raP5pLDFCLEIcOWWmTE2q/ruyGcfu/HVRcg
 u4Ao5LT1pR3Exo1KgUbkos2YpUsvl96AuJj/gAb4Dyvzs9ecb4JaW8FOAwDnhXcZ9Mbj
 461iaXcEMfFGHDii4bhJiWd4PBHfPrioj4/jCqX6jsO9MLlBP7VgKKwVsZGUCVn8b1Gq
 wo8J00grpl15IE8bC8/Drz5xgykdoT6L43fvfl6nE/O057qkr7aKMwHyWNZGOQ9AS81A
 3W/Q==
X-Gm-Message-State: AOJu0YwyIz+ogYMPRGTxi1elgTuUoL6HRTw2LoXDO0kwNuZ7lUzHAiPF
 xUs1LAgPMoWZzvCCMqO2Fg8aXg==
X-Google-Smtp-Source: AGHT+IGewKQvjyIORdJzLCP8uDlX7D/HdZ6XmMUwDvZBbdUoY2l/Qe+WzsSgFbNzMHYjxaIEoZlgUw==
X-Received: by 2002:a81:52c2:0:b0:59b:1bf9:b2db with SMTP id
 g185-20020a8152c2000000b0059b1bf9b2dbmr13018192ywb.13.1696699520030; 
 Sat, 07 Oct 2023 10:25:20 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b00-6400-429b-02e7-f294-8f62.res6.spectrum.com.
 [2603:6081:7b00:6400:429b:2e7:f294:8f62])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a81de4d000000b0057a44e20fb8sm2171347ywl.73.2023.10.07.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 10:25:19 -0700 (PDT)
Date: Sat, 7 Oct 2023 13:25:16 -0400
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20231007172516.GH2227687@bill-the-cat>
References: <20230924232658.GM305624@bill-the-cat>
 <CAPnjgZ2-ORog-+Onh1McptpMDrzccVc+BfByCMjp93wLqAms6w@mail.gmail.com>
 <20231005145350.GQ8465@bill-the-cat>
 <CAPnjgZ2Mbx9H_ve_F_gq_eqt2hvwmYF455-0PHB31fV5m9HN2A@mail.gmail.com>
 <20231006021616.GB2227687@bill-the-cat>
 <CAPnjgZ3sTQNQJCpuZ4doJJH=t=mLxXaAYQR8kVXorOfqn2t5CA@mail.gmail.com>
 <20231006165504.GC2227687@bill-the-cat>
 <CAPnjgZ1GZ+Ryt2=_Sf0Z+XM+V58Ty4UmdrAo2bW-Ubs9s19=Ww@mail.gmail.com>
 <20231007010053.GE2227687@bill-the-cat>
 <CAPnjgZ3Pss6uOhnopo4Yn0digdNs1niNqqrJHRmnrbDvehT1hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3Pss6uOhnopo4Yn0digdNs1niNqqrJHRmnrbDvehT1hg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2957747358502717261=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2957747358502717261==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9g6HhpWIqkh4e52b"
Content-Disposition: inline


--9g6HhpWIqkh4e52b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 07, 2023 at 09:37:07AM -0600, Simon Glass wrote:
> Hi Tom,
>=20
> On Fri, 6 Oct 2023 at 19:01, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Fri, Oct 06, 2023 at 04:42:44PM -0600, Simon Glass wrote:
> > > Hi Tom,
> > >
> > > On Fri, 6 Oct 2023 at 10:55, Tom Rini <trini@konsulko.com> wrote:
> > > >
> > > > On Fri, Oct 06, 2023 at 07:03:17AM -0600, Simon Glass wrote:
> > > > > Hi Tom,
> > > > >
> > > > > On Thu, 5 Oct 2023 at 20:16, Tom Rini <trini@konsulko.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 05, 2023 at 07:41:49PM -0600, Simon Glass wrote:
> > > > > > > Hi Tom,
> > > > > > >
> > > > > > > On Thu, 5 Oct 2023 at 08:53, Tom Rini <trini@konsulko.com> wr=
ote:
> > > > > > > >
> > > > > > > > On Wed, Oct 04, 2023 at 07:23:47PM -0600, Simon Glass wrote:
> > > > > > > > > Hi Tom,
> > > > > > > > >
> > > > > > > > > On Sun, 24 Sept 2023 at 17:27, Tom Rini <trini@konsulko.c=
om> wrote:
> > > > > > > > > >
> > > > > > > > > > On Sun, Sep 24, 2023 at 02:39:23PM -0600, Simon Glass w=
rote:
> > > > > > > > > > > Some commands assume that CONFIG_SYS_LONGHELP is alwa=
ys defined.
> > > > > > > > > > > Declaration of long help should be bracketed by an #i=
fdef to avoid an
> > > > > > > > > > > 'unused variable' warning.
> > > > > > > > > > >
> > > > > > > > > > > Fix this treewide.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > > > > > > > > > [snip]
> > > > > > > > > > > diff --git a/arch/arm/mach-imx/cmd_dek.c b/arch/arm/m=
ach-imx/cmd_dek.c
> > > > > > > > > > > index 6fa5b41fcd38..25ea7d3b37da 100644
> > > > > > > > > > > --- a/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > > > > +++ b/arch/arm/mach-imx/cmd_dek.c
> > > > > > > > > > > @@ -393,11 +393,12 @@ static int do_dek_blob(struct c=
md_tbl *cmdtp, int flag, int argc,
> > > > > > > > > > >       return blob_encap_dek(src_addr, dst_addr, len);
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > -/***************************************************/
> > > > > > > > > > > +#if IS_ENABLED(CONFIG_SYS_LONGHELP)
> > > > > > > > > > >  static char dek_blob_help_text[] =3D
> > > > > > > > > > >       "src dst len            - Encapsulate and creat=
e blob of data\n"
> > > > > > > > > > >       "                         $len bits long at add=
ress $src and\n"
> > > > > > > > > > >       "                         store the result at a=
ddress $dst.\n";
> > > > > > > > > > > +#endif
> > > > > > > > > > >
> > > > > > > > > > >  U_BOOT_CMD(
> > > > > > > > > > >       dek_blob, 4, 1, do_dek_blob,
> > > > > > > > > >
> > > > > > > > > > This really doesn't read nicely.  I would rather (globa=
lly and fix
> > > > > > > > > > existing users) __maybe_unused this instead.  I think t=
here's just one
> > > > > > > > > > example today that isn't "foo_help_text".
> > > > > > > > >
> > > > > > > > > Hmm, what do you think about adding a __longhelp symbol t=
o cause the
> > > > > > > > > linker to discard it when not needed?
> > > > > > > >
> > > > > > > > Well, I don't think we need linker list magic when __maybe_=
unused will
> > > > > > > > just have them be discarded normally.
> > > > > > >
> > > > > > > Yes, perhaps things are in a better state than they used to b=
e, but
> > > > > > > there is a linker discard for commands at present.
> > > > > >
> > > > > > Yes, but __maybe_unused means we don't get a warning about it, =
and it's
> > > > > > literally discarded as part of --gc-sections as it done everywh=
ere with
> > > > > > maybe 3 exceptions?
> > > > >
> > > > > Actually with this series we get a lot closer to that. The problem
> > > > > with the status quo is that disabling CMDLINE doesn't disable most
> > > > > commands, relying instead on discarding them at link time.
> > > >
> > > > I don't follow you here.  We're talking only about the long help.
> > >
> > > I was actually talking about how the command code is removed. This
> > > series allows that to happen via Kconfig rather than needing a
> > > linker-script discard rule, something I only just fully appreciated.
> >
> > OK.  But this series as-is has a lot of problems and I don't see it as
> > more than a proof of concept.
>=20
> Probably I need to send a few version as this discussion is becoming a
> bit theoretical.
>=20
> >
> > > > There's already an option to enable/disable it.  When disabled all =
of
> > > > the long help text should be discarded, because we reference it via
> > > > U_BOOT_CMD macro which in turn cares about it, or not.  What's miss=
ing
> > > > is a U_BOOT_LONGHELP macro so that instead of:
> > > > #ifdef CONFIG_SYS_LONGHELP
> > > > static char cat_help_text[] =3D
> > > >         "<interface> <dev[:part]> <file>\n"
> > > >         "  - Print file from 'dev' on 'interface' to standard outpu=
t\n";
> > > > #endif
> > > >
> > > > We do:
> > > > U_BOOT_LONGHELP(cat,
> > > >         "<interface> <dev[:part]> <file>\n"
> > > >         "  - Print file from 'dev' on 'interface' to standard outpu=
t\n"
> > > > );
> > > >
> > > > Which then does:
> > > > static __maybe_unused char cat_help_text[] =3D
> > > > ...
> > > > ;
> > > >
> > > > And we discard the text automatically due to --gc-sections.  We pos=
sibly
> > > > haven't already been doing this since back when we first started us=
ing
> > > > --gc-sections there was a bug in binutils that caused text like the
> > > > above to still get combined in to other objects and not discarded.
> > > > That's been fixed for ages.
> > > >
> > > > And the above macro would also let us clean up U_BOOT_CMD macro sli=
ghtly
> > > > to just omit the longhelp option and instead always do _CMD_HELP(_n=
ame)
> > > > inside the macros.  It'll also make it harder to add new commands
> > > > without a long help by accident.
> > >
> > > Gosh this is complicated.
> > >
> > > At present the U_BOOT_CMD() macro just drops the strings...the problem
> > > with the unused var only happens in a small number of cases where an
> > > explicit var is used. I don't see why creating a var (when none is
> > > there today) helps anything? It doesn't detect missing longhelp, since
> > > this is already an error (missing argument). Sure,  "" can be
> > > provided, but your macro doesn't stop that either.
> >
> > The problem today is that 95% of the cases surround the help text with
> > #ifdef CONFIG_SYS_LONGHELP ... #endif.  That's why the rest of the
> > macros are the way they are today.  And that in turn is due to (in part
> > at least) old compiler bugs.
>=20
> I see about 46 #idefs for that and nearly 300 commands that don't have on=
e.
>=20
> >
> > > If you are suggesting a new U_BOOT_LONGHELP() macro, bear in mind that
> > > we already have quite a lot...each new 'top-level' macro results in
> > > more combinations.
> >
> > It really should just be a single macro.  I think I'll make an attempt
> > at this, to show what I'm talking about.
>=20
> OK thanks.
>=20
> >
> > > > > With this series, it looks like we can in fact do that, so I shou=
ld
> > > > > remove the discards as well.
> > > > >
> > > > > The one proviso is that this does drop a lot of things we want...=
e.g.
> > > > > BOOTSTD_DEFAULTS cannot be enabled due to its use of 'select', me=
aning
> > > > > that common filesystems are dropped. So we'll need more effort af=
ter
> > > > > this, to allow (for example) bootmeths that don't need commands to
> > > > > work correctly. But I think this series at least provides a better
> > > > > starting point for teasing things apart.
> > > > >
> > > > > So OK I'll go with __maybe_unused for the ones that need it, which
> > > > > isn't too many given that many of the strings are just included
> > > > > directly in the macro. It is considerably easier than trying to b=
e to
> > > > > clever about things.
> > > >
> > > > Yes, this series itself has a lot of problems that need to be addre=
ssed
> > > > before reposting because I don't like "hiding" that network stuff no
> > > > longer works, and I also saw that DFU also silently failing.
> > >
> > > Yes I saw your other comments. But I think this patch is the big area
> > > of confusion.
> >
> > This isn't the tricky part of the series that I'm saying has problems,
> > that part is all of the functionality that's not being untangled and I
> > think leads to the question of what exactly is the use case where we do
> > remove the command line but don't need some of that functionality still.
>=20
> For security and code-size reasons it is useful to disable commands,
> perhaps all of them. Quite a few features don't need it, but it
> certainly would take more effort to get a usable version. The goal of
> this series is to avoid people adding Kconfig mistakes which need to
> be cleaned up later.

Maybe the biggest take away should be to do things smaller.  DFU
intentionally and fundamentally constructs something for the CLI parser
to use.  Rework that.  Same for the network stack.  Do some slight
re-org / fixing of more intentional dependencies on their own.

--=20
Tom

--9g6HhpWIqkh4e52b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmUhlHkACgkQFHw5/5Y0
tyz0ggv+MfTck/ewZWdKQMJQSbnH4B16KrxdRiADQobvoz68CT9KkFqKCqcWFtlX
cIPPa4WwLhGaemH+oc6JjMqiypdqKszLxWmECdMHySAJQaxpGEpUhEsXWzvijyx7
HZbS9kQmaiRFrvN7PaAETzsBSvmT/LTi2HZDE7QB45fMiFSaPPDiPEdaByFRh953
FNp6dizmEE17bTf8bBRO51tZcyl3oQlZvYt2u1BpGz8P6qZm+9/7mFI74cjCHWFE
2BZFsqfuk5AUcVweG9w+5ShKNxuIKlqNZWsx78ud9UWriLooGFxhqJSQv9hduD6/
tRghd1JOIhV9eSkVuEI4ffSNxKuJxXcEDaV5REnffYNB2YRbCm8g6vBzK51NROR6
zRbbFWt8/YP0SedJ4jpWKOUg7PAT3dYd2HPy8jwNhFq3yjzoo8KCkRH5+errrCGu
rX5WsROsRbZo/YLZWMnHGJWXaKC6q8q8kgHWm2HI0ChokxIV43wj7N9DbRsfKT+E
lhOL6SRJ
=5tgV
-----END PGP SIGNATURE-----

--9g6HhpWIqkh4e52b--

--===============2957747358502717261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2957747358502717261==--
