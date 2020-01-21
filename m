Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1508514482A
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 Jan 2020 00:18:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C94AFC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Jan 2020 23:18:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58C51C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 23:18:16 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id p2so2351984qvo.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 15:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8XxgMqds6qjRYlzjMDxKg34Ajk8kFxX2o4629OrGaHI=;
 b=Mjcq589oy2KVBw1loQHnBjUKwKOLNvL6SOn7IGhqBRZU5BBtAd/dKTrcZuuwMR1LrA
 +lSFDthli4pG71wKHZPh5DyEAwPUheKCyvWB5DY3oith/23pCPRzHDGrU9V5bOoFrMbJ
 vvkRIarK9mriaSl9yr8CjemsmGY3d8NAvLTs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8XxgMqds6qjRYlzjMDxKg34Ajk8kFxX2o4629OrGaHI=;
 b=pOPIFfC90WUJOFRPWXUsEd7RPPVTmMdzB/AkQFR1wKjiU1Qc2qj3m4YfzpPTmB1Lt5
 54NLeDZK4gc7jzemJZSMwHOBFdpnyTooOY0r5qqVkV1gY9KcE0ejYNZHzDsYjmevLIJO
 VF5iXGvFU3zz1KVlbh7QmWaWi60iCaRksropcyAZfXpIJWpX8TcauK711nSpjqDzqFxK
 vSyb7w+1Ak/uF4izq8l7+9HHUAEQKAsFtFOvM6byXRzD/iiFp20Q7pGBK/Uu1Ko0Fim0
 kRB31v1yEcEyQz/iNjtPXtM+a2Uh5SvBLx2UHVTiDVpmiM3XmLn6A0eqCyH8VEcQ3veP
 2/fg==
X-Gm-Message-State: APjAAAW+VGHXINWJlmjXFFWKlYQjeNKWAqFAF33Jx3PXcT5JH0GV5lsp
 uIodlp/PI6pllc/F2t8Vjhq2rg==
X-Google-Smtp-Source: APXvYqyXPEsMiyn3Cl/UwB+SQ3P2wVYWBbLCfI0NqEtGNejoqHQUzlw6oe8ZQJqaSAtiixod1Fbmag==
X-Received: by 2002:a05:6214:2a1:: with SMTP id
 m1mr7451788qvv.125.1579648695111; 
 Tue, 21 Jan 2020 15:18:15 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-cd68-b719-836d-d60b.inf6.spectrum.com.
 [2606:a000:1401:86dd:cd68:b719:836d:d60b])
 by smtp.gmail.com with ESMTPSA id m68sm17898919qke.17.2020.01.21.15.18.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jan 2020 15:18:14 -0800 (PST)
Date: Tue, 21 Jan 2020 18:18:12 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20200121231812.GC26536@bill-the-cat>
References: <ce453f43d50442a48588ba3a1004fd9b@SFHDAG6NODE3.st.com>
 <b781d83eb3ec445a882db1064573d38e@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <b781d83eb3ec445a882db1064573d38e@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Stephen Warren <swarren@nvidia.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3] board_f.c: Insure
	gd->new_bootstage	alignment
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
Content-Type: multipart/mixed; boundary="===============0552823728351585289=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============0552823728351585289==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2020 at 05:23:51PM +0000, Patrick DELAUNAY wrote:
> Hi,
>=20
> > From: Patrick DELAUNAY
> > Sent: mardi 7 janvier 2020 13:07
> >=20
> > Hi Patrice and Tom
> >=20
> > > Sent: mercredi 18 d=E9cembre 2019 10:10
> > >
> > > Hi Simon,
> > >
> > > > From: Simon Glass <sjg@chromium.org>
> > > > Sent: mardi 17 d=E9cembre 2019 16:46
> > > >
> > > > Hi Patrice,
> > > >
> > > > On Wed, 27 Nov 2019 at 02:11, Patrice Chotard
> > > > <patrice.chotard@st.com>
> > > wrote:
> > > > >
> > > > > In reserve_bootstage(), in case size is odd, gd->new_bootstage is
> > > > > not aligned. In bootstage_relocate(), the platform hangs when
> > > > > getting access to data->record[i].name.
> > > > > To avoid this issue, make gd->new_bootstage 16 byte aligned.
> > > > >
> > > > > To insure that new_bootstage is 16 byte aligned (at least needed
> > > > > for
> > > > > x86_64 and ARMv8) and new_bootstage starts down to get enough
> > > > > space, ALIGN_DOWN macro is used.
> > > > >
> > > > > Fixes: ac9cd4805c8b ("bootstage: Correct relocation algorithm")
> > > > >
> > > > > Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> > > > > Reviewed-by: Vikas MANOCHA <vikas.manocha@st.com>
> > > > > Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>
> > > > > Tested-by: Patrick Delaunay <patrick.delaunay@st.com>
> > >
> > > For information, Patrice is absent for personal reason up to beginnin=
g next year.
> > > Don't wait a fast answer.
> > >
> > > > For this patch I think it would be better to update reserve_fdt() to
> > > > keep things aligned, assuming that is the problem.
> > >
> > > I don't sure that solve the issue,
> > > for me the problem is only for the bootstage struct (gd->bootstage)
> > > And
> > > reserve_fdt() already alligne size on 32 bytes
> > >
> > > If I remember the Patrice analysis:
> > >
> > > 1- bootstage_get_size return a odd value (or at least not 16 bytes
> > > aligned I don't remember).
> > >
> > > 2- In reserve_bootstage()
> > > 	int size =3D bootstage_get_size();
> > > 	gd->start_addr_sp -=3D size
> > > 	=3D> it is a unaligned address even if gd->start_addr_sp is 32 bytes
> > > alligned
> > >
> > > 	gd->new_bootstage =3D map_sysmem(gd->start_addr_sp, size);
> > > 	=3D> also unaligned
> > >
> > > 3- Then during relocation, in reloc_bootstage()
> > > 	gd->bootstage =3D gd->new_bootstage;
> > >
> > >
> > > 4- crash occur because in next bootstage function beaucse the boostage
> > > address don't respect pointer to struct allignement...
> > >
> > > 	struct bootstage_data *data =3D gd->bootstage
> > >
> > >
> > > > At some point we should also document that reservations must keep
> > > > things aligned.
> > > >
> > > > Perhaps this should be handled by a separate function called from
> > > > all these places, which subtracts gd->start_addr_sp and ensures 16-=
byte
> > alignment.
> > >
> > > Yes that can be a improvement,  but perhaps ia a second step / second=
 serie....
> > >
> > > Do you think about a function called in all reversed_ functions (when
> > > start_addr_sp is modified)...
> > >
> > > static int reserved_allign_check(void) {
> > > 	/* make stack pointer 16-byte aligned */
> > > 	if (gd->start_addr_sp & 0xf) {
> > > 		gd->start_addr_sp -=3D 16;
> > > 		gd->start_addr_sp &=3D ~0xf;
> > > 	 }
> > > }
> > >
> > > I prefer a function to reserved a size wich replace in any reserve_
> > > function  the line
> > > :
> > > 	gd->start_addr_sp -=3D ...
> > >
> > > /* reserve size and make stack pointer 16-byte aligned */  static int
> > > reserve(size_t size) {
> > > 	gd->start_addr_sp -=3D size;
> > > 	/* make stack pointer 16-byte aligned */
> > > 	gd->start_addr_sp =3D ALIGN_DOWN(gd->start_addr_sp, 16); }
> > >
> > > I think I will push it, when the patrice patch will be accepted.
> >=20
> > I am preparing this patch....
> >=20
> > Do you think it is ok to merge the Patrice v3 proposal first on master =
branch for
> > v2020.04 release (he just align the reserved memory for bootstage), and=
 after I
> > make my patch (16-byte align all reserved area).
> >=20
> > or it is better to make a more generic patch v4 to replace the Patrice =
one.
>=20
> I push a  serie, with my proposal:
> [3/3] board_f.c: Insure 16 alignment of start_addr_sp and reserved memory
>=20
> http://patchwork.ozlabs.org/project/uboot/list/?series=3D152226
>=20
> As I found issue for ARM32 (I need to modify arch/arm/lib/crt0.S)
> I think it is preferable that the Patrice Patch is merged in v2020.04, an=
d my serie can live  independently.
> But I can also squash of the 2 series.

Sorry for the delay.  Yes, please put together a single series that
takes care of everything.  Thanks!

--=20
Tom

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl4nhrQACgkQh/n2NdMd
dlKIMQ//SRuUQyRsqkU51/vtdlAocPcK3zEoE0EVxHp+MO1VTnpvRnmCVqLcMndN
b5E2OtXCrVA8ahvgOvQAmOvGGAmxH8kTw6ohof+8EkasoWsfatjUXLtVdgmfysU7
oidyqnsyAPYA9OhMJy+fnxvg6F7iAfYkNihdi1OhVwX7piBNadc3IW/D9tVGHsJJ
/KbsGX0jAMbAJRJABvCUokerNAT6QHpwYxjsdgCZw6h+iEnDcJChPn3Zvoy7Zp1H
DvRy1brzxQnpP0UkGQBPmTc47QHGQxKuWQ3nJB2OZWold1Hm3FVESJby0QdC52Ld
sjraNU0bWGbZAJmFE4BhTb/YUgMy2aKTz5dDrzm6Q574uqFCaZF5/+iu+dWNeZJK
mFXn1Rb0Qkv2pOKdvnTYwEeOzlALQtePsg5QAMq3vnNS4MTx6ftOcQJ1t+01Kfe+
d5y66sKuaDD7865NnT78wiacr2+dyFtGRsWINsMWEGqjSvU0fJCDwHj9Ftqho5vw
iFQlfoie9xi4CV16khpttiIB1EhfK3EoiPq6IYu6fZEr+brv4T+MJIQeHWvCwzeE
ioY02vxayORypvWChuhed135SbjFiR4lcwGztqbFGqtceUc1y9BYKepphikRpk/B
8X54jLT8NnVWdZLLsvmDbMLzZom91XHPdg4FnSsqogq1Vyz/JKw=
=oZrx
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--

--===============0552823728351585289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============0552823728351585289==--
