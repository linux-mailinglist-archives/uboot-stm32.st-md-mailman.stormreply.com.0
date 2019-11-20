Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2B1044AF
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 20:56:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11F1CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 Nov 2019 19:56:25 +0000 (UTC)
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
 [209.85.161.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39D7EC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 19:56:24 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id q140so441732ywg.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2PmApPxi7bV48VUg8L8hXNMpvtnReUu/qKX2fnlt55Q=;
 b=qw2Ae3K2yAyPLf/mDFzQogGEKI7IOKPdqkXsFLcGUGIWfAqrlhocyY1KJHOAJPFQYq
 9koYF2031xTQ4PQyVkSV/1iOwnD0h4iqEMBMcWuNrXcneufaK/A4AKlV8v4W0s2K4jgG
 BdtkIam6GkHRZr6Lm4rPbknG5ipBvpP4/ydBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2PmApPxi7bV48VUg8L8hXNMpvtnReUu/qKX2fnlt55Q=;
 b=EcoCQ55LmmSFRM3nHt3huAc3mrVtHx7x908PyTahqxzEOf1rx8RsK6mUzti3IypfTf
 TrxHDsy3vcEYh4ZEWRhN91szC4XshAw0D6LkP889/EkVCb5gdn16wJOpTW9uCI6dxA18
 jj+CDz+pWVkCc2wCRG8dRsD7o+RKRCGqW91DZDEbI16uyjGiqrxcs5pU80CbZuSe4Sy3
 IFN/fbHuuxdNcAjlgoCq6na5HL+G7OUb675D2ykGSKzUOda0/TqtXE6vO69oF+RWj0G+
 XOQE2+d1pQawT+fAW34dCmNQli4+u2SD7dsEru0JjKaiIOcZa8aPvjk+RtVQWXFvxFow
 nHBQ==
X-Gm-Message-State: APjAAAUEwzkC5ECh0Gxojy6pExtkDxH2dd86dpdRPozddWYfrKbvEw5W
 f4+aHnqhAzY/X+v+Bvf/5rERAQ==
X-Google-Smtp-Source: APXvYqz9QOBwkQgsDYcI9jYs5hbcC/VmFdxNB2p2VJa/+ve7Wa/EPgkaQptk1sFFGy5AE6FWiOWMJw==
X-Received: by 2002:a81:3a58:: with SMTP id h85mr2981421ywa.498.1574279782615; 
 Wed, 20 Nov 2019 11:56:22 -0800 (PST)
Received: from bill-the-cat
 (2606-a000-1401-86dd-4822-cbc9-ba3d-ee00.inf6.spectrum.com.
 [2606:a000:1401:86dd:4822:cbc9:ba3d:ee00])
 by smtp.gmail.com with ESMTPSA id v5sm192112ywi.95.2019.11.20.11.56.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Nov 2019 11:56:21 -0800 (PST)
Date: Wed, 20 Nov 2019 14:56:19 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <20191120195619.GH19317@bill-the-cat>
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
 <54bb624a-5d80-71e9-4c5a-f5bd4aa20851@gmail.com>
 <20191119215230.GJ19317@bill-the-cat>
 <7a18d891-3fc4-ed16-65df-f83bc36c748e@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7a18d891-3fc4-ed16-65df-f83bc36c748e@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Joe Hershberger <joe.hershberger@ni.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCHv2 5/5] env: Finish migration of
 common ENV options
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
Content-Type: multipart/mixed; boundary="===============5643461085344586740=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============5643461085344586740==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VfLXJQA4c19Br4dq"
Content-Disposition: inline


--VfLXJQA4c19Br4dq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 08:39:27PM +0100, Simon Goldschmidt wrote:
> Am 19.11.2019 um 22:52 schrieb Tom Rini:
> > On Tue, Nov 19, 2019 at 10:39:18PM +0100, Simon Goldschmidt wrote:
> > > Am 19.11.2019 um 02:02 schrieb Tom Rini:> - In ARMv8 NXP Layerscape
> > > platforms we also need to make use of
> > > >     CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
> > > > - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the de=
fine
> > > >     to 0.
> > > > - Add Kconfig entry for ENV_ADDR.
> > > > - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use i=
t.
> > > > - Add ENV_xxx_REDUND options that depend on their primary option and
> > > >     SYS_REDUNDAND_ENVIRONMENT
> > > > - On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV=
_ADDR
> > > >     for the pre-main-U-Boot environment location.
> > > > - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set b=
ut
> > > >     rather it being non-zero, as it will now be zero by default.
> > > > - Rework the env_offset absolute in env/embedded.o to not use
> > > >     CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
> > > >     ENV_IS_IN_FLASH.
> > > > - Migrate all platforms.
> > > >=20
> > > > Cc: Wolfgang Denk <wd@denx.de>
> > > > Cc: Joe Hershberger <joe.hershberger@ni.com>
> > > > Cc: Patrick Delaunay <patrick.delaunay@st.com>
> > > > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > >=20
> > > <snip>
> > >=20
> > > > diff --git a/include/configs/socfpga_common.h
> > > b/include/configs/socfpga_common.h
> > > > index baa214399ff9..05bfef75c0df 100644
> > > > --- a/include/configs/socfpga_common.h
> > > > +++ b/include/configs/socfpga_common.h
> > > > @@ -157,21 +157,13 @@ unsigned int cm_get_qspi_controller_clk_hz(vo=
id);
> > > >    /*
> > > >     * U-Boot environment
> > > >     */
> > > > -#if !defined(CONFIG_ENV_SIZE)
> > > > -#define CONFIG_ENV_SIZE			(8 * 1024)
> > > > -#endif
> > > >=20
> > > >    /* Environment for SDMMC boot */
> > > > -#if defined(CONFIG_ENV_IS_IN_MMC) && !defined(CONFIG_ENV_OFFSET)
> > > > +#if defined(CONFIG_ENV_IS_IN_MMC)
> > > >    #define CONFIG_SYS_MMC_ENV_DEV		0 /* device 0 */
> > > > -#define CONFIG_ENV_OFFSET		(34 * 512) /* just after the GPT */
> > > >    #endif
> > > >=20
> > > >    /* Environment for QSPI boot */
> > > > -#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFF=
SET)
> > > > -#define CONFIG_ENV_OFFSET		0x00100000
> > > > -#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
> > > > -#endif
> > >=20
> > > Removing paragraphs like this one will break configs that haven't mad=
e it to
> > > a mainline defconfig. E.g. for socfpga_socrates_defconfig, you can ch=
ose for
> > > the ENV to be saved in SPI instead of MMC as the config supports boot=
ing
> > > from all sources.
> > >=20
> > > How do we proceed with such things? I know that might be non-mainline=
, but I
> > > think throwing this info away is a step-back, not an improvement.
> > >=20
> > > [And don't get me wrong: this doesn't affect my downstream boards, th=
ey
> > > don't save/load env due to secure boot reasons anyway.]
> >=20
> > So, I would be happy to see follow up series that add default values for
> > locations for various SoCs.  That would address the type of problem
> > you're talking about, I believe.
>=20
> You mean adding lines like this to env/Kconfig at config ENV_OFFSET
> 	default 0x00100000 if ARCH_SOCFPGA && ENV_IS_IN_SPI_FLASH
>=20
> Does that even work? And how well does it scale? I know it's a more
> fundamental problem, but in my opinion, scattering those defaults for eve=
ry
> arch or board throughout all Kconfig files is not the best solution.
> Although I have to admit I don't have an idea of how to solve it better
> right now...

That does work, it's about what we do for other platforms today, it's
not the best and doesn't scale well.

> > I'd be even happier if someone looked at how Zephyr takes a dts file and
> > generates a header and adapt that to a way for us to have some values be
> > read from a dts* file and turned into a define we can use at build time
> > (not just the OF_PLAT data).  That would be a real nice step forward :)
> >=20
>=20
> If we have that ENV information in the devicetree, we could just use it a=
nd
> dump the defines. No need to convert dts to defines beforehand. Only if d=
ts
> cannot be used, we need something different. But in that case (mostly real
> small SPL, I guess), do we really enable the ENV loading code?

I mention the above mainly because there's a lot of other examples of
this type of problem where yes, we can put a value in Kconfig and have a
default but it's really not the best way forward.

> Anyway, thinking this over, I don't see a way out to keep the SPI env
> locations for socfpga when moving to Kconfig, so for socfpga:
>=20
> Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>

Thanks!

> BTW: From looking at the include/configs/* changes, CONFIG_SYS_MMC_ENV_DEV
> could be moved to Kconfig, too...

Yes, there's a bunch of other changes that could/should be moved as
well.  I'm going down this particular rabbit hole so that I can take the
MTD Makefile/Kconfig clean-up and verify that those changes are still
size neutral.  I want to circle back to the env stuff to change a few
things soon including seeing about getting the rest of the easy
migrations done.

--=20
Tom

--VfLXJQA4c19Br4dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3VmmAACgkQh/n2NdMd
dlK1cxAAqNZrmd1JIJ++/wm/lLAfpy1nCH87l3ImA9eWA8YtrHVG6unzvcwIDfJh
KAzmg4r2IqwpVndEoMbeaoHa3Hb3+XXD9aZavR5urgh2z6pamEgDQqNTVw3TDDr/
zPQKV4dJpLiHfmBKqA1J5def1KhKPvVpvZ+i7hBGy6TOCKMHPTQN36h9vVvYv2sV
ZZEHvYXUbap+IEJcrZN6gF2qen6/KK+AD4nGQi2UBPjnEvjeaR5RPPTlGHiERZ2X
XAuf2KZbzfm5wHYWnsZR94pmdZDvJipyqx2A5YH+bGJb9Gjqcw4XldTy24/RJDGE
KZcX/1132vfEk5mYU9L5VtLzsSjasHIEasmoVeh6Xsu66SMDNgCcJdUwxBW4xrTr
tb81k/L8Jl99tYar2pg/619Sg3RhGE7/BwFwi/pwKaTSjmmkarV9hlAu9lJn/bUf
9007vIznfOZCOSDlYjHCkFdmr2gdbZMJ/WW1rknFmk4PO21LoBQdbG2uvwUsNNce
lzqg2dHyDz8LNeU1qpxmMv33NtDHtbnAcdnSBPyBt2eXZjdQI/1CYAujwiXiHZcl
nlEwnh58yoPi/KDsX7iP0MQwifuoxSd+OqqBHbkPnvHn02s4z1D0UJmr80uIH1Xv
9v2uK1yYDIpQUQKwFCIVXcHxItlyWSg/WKkcvI9cgwmfCB+mhYY=
=IfJW
-----END PGP SIGNATURE-----

--VfLXJQA4c19Br4dq--

--===============5643461085344586740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============5643461085344586740==--
