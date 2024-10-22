Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F49AB04F
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Oct 2024 16:02:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6261BC6DD9F;
	Tue, 22 Oct 2024 14:02:20 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D60F2C6DD6B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 14:02:13 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6cbf340fccaso45389926d6.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1729605733; x=1730210533;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MDqrSAgLtquIIl5qrpQ5H4AIocG47vtogseRe9yFmqU=;
 b=W0pRacMcv50ntok1Jga5GHzGqLvvnS9hVnlCa//ZpWdQIlZ32tAtznZMbcJ2ff5Ufs
 2cUEZbJQqdxT3aMQ9BTDcNr9QrawDz60dFM3NLBArROtz2cULvISqfX4XfIkJzeYNPkk
 NOGzitNVI2AEmRfGHT0M4eDizQQiDNhWSxKxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729605733; x=1730210533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MDqrSAgLtquIIl5qrpQ5H4AIocG47vtogseRe9yFmqU=;
 b=UwtitkdwwBLiF6Ok5SkAQI4mn+imSfkVuexOwcOv1yIRt3rXznDarF42ZUeA4G+MCh
 XI5GP1PsSdKDZuhkFsGAaF8rG3t/6xf6M2MJ/31HZaX0FQo8H/qxFwduH/TVIBhehFUi
 9CpvsQzyXQRxvYt6SYpdPEpd3o4Oc5s1eakzDh7WyoM8JV7sp2cg4TCgM+K90ex3X3SL
 eqSa2rBorTuInYB2idxgNWgekYC9Il5XFxIsgnteyHdSA7vaXa8CCpEQ38SzAoUrD3C7
 gnS+kpEwGJHxexII77mOiDAsAAnsZPCGA4k407XOvzAmiT7lf2l0DYxJhI8D4Ur6IsSP
 QQmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaaBw4GZK/i+wdFyyaP0CkSAPuoIycJdeJya3cDrzqPP2rT7nljdHgDj4NYrTXnli6clFSvkFZc5ILMQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVUucgd55sE4Nj0t5ZYvoRHqam6eeK8NOfASo01jIu7I2q9OwR
 hfMxOCU85ZwuaMDzCaEPVvnDEXFGPxiWCa7doz+xC/sKZ9eIiIqdOxaW/M8J8Gc=
X-Google-Smtp-Source: AGHT+IFu6v2NjXktFApedEIQ/6I0F4wo+kp7JCiI//65x5p3IfpdhE+AXsDyo3myjaVp2Q/8+NGcDw==
X-Received: by 2002:a05:6214:130c:b0:6c3:6477:16e7 with SMTP id
 6a1803df08f44-6ce21a03cb7mr56812126d6.11.1729605732270; 
 Tue, 22 Oct 2024 07:02:12 -0700 (PDT)
Received: from bill-the-cat ([187.144.65.244])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b1659ffb88sm280087785a.54.2024.10.22.07.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2024 07:02:11 -0700 (PDT)
Date: Tue, 22 Oct 2024 08:02:04 -0600
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20241022140204.GY4959@bill-the-cat>
References: <20241021113839.318572-1-sjg@chromium.org>
 <20241021172613.GN4959@bill-the-cat>
 <CAFLszTguu7hRpsSLxADsBkMgTzA_-fAR0t8Axv+8=OvxJvSRCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFLszTguu7hRpsSLxADsBkMgTzA_-fAR0t8Axv+8=OvxJvSRCw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Wan Yee Lau <wan.yee.lau@intel.com>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Devarsh Thakkar <devarsht@ti.com>, Sean Edmond <seanedmond@microsoft.com>,
 Sam Edwards <CFSworks@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 Charles Hardin <ckhardin@gmail.com>, Alexander Gendin <agendin@matrox.com>,
 This contributor prefers not to receive mails <noreply@example.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Andy Fleming <afleming@gmail.com>,
 Stefan Roese <sr@denx.de>, Johan Jonker <jbx6244@gmail.com>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tien Fong Chee <tien.fong.chee@intel.com>, Angelo Dureghello <angelo@sysam.it>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Doug Zobel <douglas.zobel@climate.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Angelo Dureghello <angelo@kernel-space.org>,
 Ramon Fried <rfried.dev@gmail.com>, Christian Marangi <ansuelsmth@gmail.com>,
 Michael Polyntsov <michael.polyntsov@iopsys.eu>, Marek Vasut <marex@denx.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Wolfgang Denk <wd@denx.de>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Enric Balletbo i Serra <eballetbo@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Maxim Moskalets <maximmosk4@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Okhunjon Sobirjonov <okhunjon72@gmail.com>,
 Sughosh Ganu <sughosh.ganu@linaro.org>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Jens Scharsig <esw@bus-elektronik.de>,
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michal Simek <michal.simek@amd.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Raymond Mao <raymond.mao@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Samuel Holland <samuel@sholland.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Kamil Lulko <kamil.lulko@gmail.com>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Richard Weinberger <richard@nod.at>, Artur Rojek <artur@conclusive.pl>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [Uboot-stm32] [PATCH v2 00/25] led: Remove old status-LED code
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
Content-Type: multipart/mixed; boundary="===============1257048079113376717=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1257048079113376717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dBr9ok7ui4CCab8g"
Content-Disposition: inline


--dBr9ok7ui4CCab8g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 02:15:34PM +0200, Simon Glass wrote:
> Hi Tom,
>=20
> On Mon, 21 Oct 2024 at 19:26, Tom Rini <trini@konsulko.com> wrote:
> >
> > On Mon, Oct 21, 2024 at 01:38:08PM +0200, Simon Glass wrote:
> > > There has been an LED framework in U-Boot which uses driver model for
> > > about 9 years now. Recent work is underway to improve it and provide
> > > more features. It is probably a good time to drop the old code, which
> > > is only used by 5 boards:
> > >
> > >    ./tools/qconfig.py -f LED_STATUS
> > >    5 matches
> > >    eb_cpu5282 eb_cpu5282_internal mx23_olinuxino pinephone
> > >    socfpga_vining_fpga
> > >
> > > This series attempts that.
> > >
> > > Changes in v2:
> > > - Combine code-removal and defconfig changes
> > > - Add a patch to enable LED and LED_BOOT for these boards
> > > - Add a patch to enable LED and LED_BOOT for these boards
> > > - Enable LED on the 5 affected platforms
> > > - Reorder patches for bisectability
> >
> > So I believe this means you missed the feedback of just doing the blind
> > migration rather than disabling the feature, like we used to often do
> > for cases where it's just a matter of changing CONFIG options. It
> > should:
> > - Not introduce a failure to build
> > - Just work on platforms with either OF_UPSTREAM or semi-recent device
> >   trees
> > - Just start working on those platforms when they do move to
> >   OF_UPSTREAM.
>=20
> Perhaps I didn't understand what you were saying. I thought you meant
> to enable LED and LED_BOOT on these 5 boards?

Ah, OK, I see the disconnects now, sorry. The first comment I saw was
Marek's on patch #2. So yes, along with Peter's request instead of one
commit to disable and another commit to enable, just do 5 commits to
migrate from one to the other please, thanks.

--=20
Tom

--dBr9ok7ui4CCab8g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmcXsFwACgkQFHw5/5Y0
tyxtXwv+Ky9PV2HGnoDchOK7/EpFyH8eD86zQAfJbQSGuvK7pIrAl6M7hmGhkS10
NUozxYCf+/7hlC7Jn4LvbP14O62dZYL5GfAaz2cVT6BIvJYO+5L0fqsYnIfxg5pY
w8zfNilwyER1JyegsW/bkcstL1WPXKTolweM7/INHodtYsu+nwZGPhG+5Jy2J4cv
0aRnZRAt+TS1xHJbH+nuG4dF2gHn0TU0WolH7YQuSuji+8Vp/BM/IPbmtZrZZiZ7
15Ajh6ghjKvqpv2DX2EaG0FwkxyvboTo/D0respk4saFpFpOsNdAq5Vqy9VcGm3Y
lPduj81dy39fb4Pnt8gwtRm2cGrFLWGWMkQl2X513MDlT2ZYVXk0UB8A3ZvR7u+e
alxVnHVJ2E5hEyFML9StG9XF+VmPGXvXT2k3RaRawimpD3X6/8eJR+DYTMQjRZUX
+zzb6WbOogPye70EVD3WO3rmOBNCwYBftTBXXl3GaC8PPe/Ndf6LrCWDSu3/VHBx
e0UDXTK2
=YQIr
-----END PGP SIGNATURE-----

--dBr9ok7ui4CCab8g--

--===============1257048079113376717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1257048079113376717==--
