Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2F22019F3
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 20:07:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 862B5C36B0C
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Jun 2020 18:07:59 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8257DC36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 18:07:55 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z2so5810632qts.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jun 2020 11:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=olsQ+MFl9t3e/i0ln6wo1x6n3EJ5bFBi3DP3ZbDJfuE=;
 b=Art5IbX8/pjfrYGNLZD+Aa5jQiURnMoKyTI3Tgwl03a8LATPzfxpRwMPLVg53T2M3J
 J1oKgmHoXak2Dv0WGq5CkP1s3CtOTz9PRU5yAIje+QHqvYM5knhwmDxA2CYoDZ/D7NYc
 1U/yMcgLviRt8x6lRB6vj+5VtVS5KIhOXWEmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=olsQ+MFl9t3e/i0ln6wo1x6n3EJ5bFBi3DP3ZbDJfuE=;
 b=X9QHlNZi/LgrZ0xn2gLBsMz3DlPTt2W1PRoE3woFS7aSJuHmi3i6DoHOVRTOseVFI3
 XSK2hXueMSyDushhlM3HzamGO/ga71Blzm9xuUOJB0v+uPaBMAYm3JbfQj7eGaNROVYU
 NC7J7vSvvOuH37eWyzVyGB5URdIxVF06H21ZGCrw1DHu3ypW4C3FLKwnZInmG+ReUM5O
 uVlBODAcJ1eP9YshLkVveDldSY1+Q4i52uyutW8p+Xt94GeCfew4m4IZAIsSu0LhVwxG
 Y9oIu3r9DpixSRSevNktHUNXklQKUi7y81N8+5zXoUEgWSRHVMFkeFYTFImc3wPsiYs1
 t49A==
X-Gm-Message-State: AOAM532xf/IuZ8tHg9IOiPZRNCM21caQdKz1CIzIPa3sp7ntrbqioe96
 azfPCGNir4d3GBM4VlKUskfwSg==
X-Google-Smtp-Source: ABdhPJynR9Bfed/T+bbk4G/oRuaq52qFU+WK/ffjHqfw6POvNhQyphvg2O8xBJ6Kjz1dwH/4zdrr7Q==
X-Received: by 2002:ac8:6746:: with SMTP id n6mr4691998qtp.307.1592590074383; 
 Fri, 19 Jun 2020 11:07:54 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-8c25-1271-b281-e614.inf6.spectrum.com.
 [2606:a000:1401:8080:8c25:1271:b281:e614])
 by smtp.gmail.com with ESMTPSA id y40sm6076923qtc.29.2020.06.19.11.07.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Jun 2020 11:07:53 -0700 (PDT)
Date: Fri, 19 Jun 2020 14:07:51 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200619180751.GQ27801@bill-the-cat>
References: <20200616074048.7898-1-patrick.delaunay@st.com>
 <20200616074048.7898-6-patrick.delaunay@st.com>
 <20200618191719.GV27801@bill-the-cat>
 <817efefe407341aa98d6a80f037a1610@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <817efefe407341aa98d6a80f037a1610@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>
Subject: Re: [Uboot-stm32] [PATCH v2 5/9] sandbox: support the change of env
	location
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
Content-Type: multipart/mixed; boundary="===============2499017320625439845=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============2499017320625439845==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g3gKGiRpvPEwrzWv"
Content-Disposition: inline


--g3gKGiRpvPEwrzWv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 19, 2020 at 02:40:06PM +0000, Patrick DELAUNAY wrote:
> Hi,
>=20
> > From: Tom Rini <trini@konsulko.com>
> > Sent: jeudi 18 juin 2020 21:17
> >=20
> > On Tue, Jun 16, 2020 at 09:40:44AM +0200, Patrick Delaunay wrote:
> >=20
> > > Add support of environment location with a new sandbox command
> > > 'env_loc'.
> > >
> > > When the user change the environment location with the command
> > > 'env_loc <location>' the env is reinitialized and saved; the
> > > GD_FLG_ENV_DEFAULT flag is also updated.
> > >
> > > When the user set the same env location, the environment is re-loaded.
> > >
> > > Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > ---
> > >
> > > Changes in v2:
> > > - change cmd_tbl_t to struct cmd_tbl
> > >
> > >  board/sandbox/sandbox.c | 42
> > > ++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 41 insertions(+), 1 deletion(-)
> >=20
> > This is for testing, which is why it's on sandbox?  But I think we shou=
ld have this
> > be a generic opt-in feature as changing where environment is saved at r=
un time
> > has use cases when we have multiple available.  Thanks!
>=20
> Yes in my mind it was only for testing on sandbox....
>=20
> But  I agree, I can a add a opt-in generic command to select and load ENV=
 on one target.
>=20
> Someting as "env load [<target>] " which loads with the request backend a=
nd update gd->env_load_prio
>=20
> With <target> =3D name of the name define in backend with ENV_NAME macro
> And using the default location gd->env_load_prio when absent.
>=20
> Or split in 2 new commands
>=20
> - env select <target>
> - env load
>=20
> Perhaps this last proposal with 2 command is more flexible....=20
> to be combined with other command (env save / env erase)
>=20
> if this proposal is OK, I will work on it.....

Sounds good to me, thanks!

--=20
Tom

--g3gKGiRpvPEwrzWv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl7s/vYACgkQFHw5/5Y0
tyzg2wwAjve6JVVypBzoD6fKOF22fdHocaClC5v86aA2MVYV+VL2vF/DjrIp0Rn1
SafRKTTsZVQWwiSqZlah8UbMcOLRBx6Q+z0bOescuA4gCJYhTGB1ma9OcOs0VVaX
SPOqXe7d58EFHwvRtiXQ5rNgdlN4XLaPvjmlrPAKTNUUCSmvrlYvDChvGaee36wl
XBy1SHJLiXCID/jtCsCwskzipE9wp68AJRScqUTks2+GBYA747Fw1ByulNCFDSBT
uJraLtfzhSiW96EkisjNbYsASb+Psu6fe3S0rIhWz4DbLAj4Fxav6HVt10cX6YsC
AueUQsjOJdMyMJKv45ro4b04fv6ichO/+RMnQAYcVCN0WG0znSyENMJ920EHofYw
kEIN7SIPRm9AFFb5jiIfcosGHsAzoJUrrJPhL3xPm0vG/+Lcpt1PHZRI+HiIwNA6
07u5QAF/RNQofCa4pQY518ZaU/IZJug2jSaNgE6TtnXScJEY+TglhIXoAZL7izpH
U4cwEE5p
=w8Nw
-----END PGP SIGNATURE-----

--g3gKGiRpvPEwrzWv--

--===============2499017320625439845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============2499017320625439845==--
