Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A901102EA1
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Nov 2019 22:52:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4912C36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 Nov 2019 21:52:36 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC14AC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 21:52:34 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id a11so9490365ybc.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2019 13:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Q+GBixg7vywvxkOr7oIGZQsLyJ6SbKKMHj32THbfIDQ=;
 b=K29jEhqpUqJqUtm4xNPazCMophy1q8Ewd/6WSaUKQgr/b5tqsQdtmzv5eIISZsePN3
 ZQ7+H9NrexWrUeL1F+fUtxfOGmO0UO7yUDuo5E3Jys9LhirMXjI/qblJNRQxg3uetvGy
 3Z3he5CfaqeBTB4y3R2Qpl8ElaC1yts/9cBEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Q+GBixg7vywvxkOr7oIGZQsLyJ6SbKKMHj32THbfIDQ=;
 b=XCbEcOtxdfqtnEtV66Di3GIb2KslOm+5XwkUU0bkIkl4n18d0MjLE+zqxAIFXgZ0G9
 zvx0phcNVyokbDX3qaEeEbXJMwEhNy+l5BG7O4FaJQb3IXH9ShK9l1Rpw9q2XwXVUYf2
 gKnDwapcUk0Nau4mfB2rXZDgrJ1LpLtXZro2hVdYaRz/c26EHwYQ1N0Bgdlg1rCZfVz4
 Z6tYzI4nBT/O1Dkw8aWieUYDVR2P5tD22lUPQcmQ+CGS0UKCUSqgx2Gg75s8ti+XaNSM
 1hkc0ZKDhZ67ByNe9+hHKF6P2hxk0qiB18w/uRoKSGN1EzxLQbJggeL5w68QrPOioE1w
 C5xQ==
X-Gm-Message-State: APjAAAWTjqxHr0R2k23IIYbz8cKdYXORalp0885XHxe5d+CW2ut+v3lJ
 qoJF/F0z26X2uWxF6PwoFTQBvg==
X-Google-Smtp-Source: APXvYqxfXZpgBAUBHvztl4XM6BWd/Cbv5IkfMmj2ILrMUMbDh8/MfuMZW3mJsN+ROlPtupmdop2dQA==
X-Received: by 2002:a25:840c:: with SMTP id u12mr126361ybk.148.1574200353227; 
 Tue, 19 Nov 2019 13:52:33 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
 by smtp.gmail.com with ESMTPSA id j3sm10492983ywb.10.2019.11.19.13.52.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Nov 2019 13:52:32 -0800 (PST)
Date: Tue, 19 Nov 2019 16:52:30 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
Message-ID: <20191119215230.GJ19317@bill-the-cat>
References: <20191119010210.24477-1-trini@konsulko.com>
 <20191119010210.24477-5-trini@konsulko.com>
 <54bb624a-5d80-71e9-4c5a-f5bd4aa20851@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54bb624a-5d80-71e9-4c5a-f5bd4aa20851@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3456883071201365602=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============3456883071201365602==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyCeQdzmoBo8zbAN"
Content-Disposition: inline


--pyCeQdzmoBo8zbAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2019 at 10:39:18PM +0100, Simon Goldschmidt wrote:
> Am 19.11.2019 um 02:02 schrieb Tom Rini:> - In ARMv8 NXP Layerscape
> platforms we also need to make use of
> >    CONFIG_SYS_RELOC_GD_ENV_ADDR now, do so.
> > - On ENV_IS_IN_REMOTE, CONFIG_ENV_OFFSET is never used, drop the define
> >    to 0.
> > - Add Kconfig entry for ENV_ADDR.
> > - Make ENV_ADDR / ENV_OFFSET depend on the env locations that use it.
> > - Add ENV_xxx_REDUND options that depend on their primary option and
> >    SYS_REDUNDAND_ENVIRONMENT
> > - On a number of PowerPC platforms, use SPL_ENV_ADDR not CONFIG_ENV_ADDR
> >    for the pre-main-U-Boot environment location.
> > - On ENV_IS_IN_SPI_FLASH, check not for CONFIG_ENV_ADDR being set but
> >    rather it being non-zero, as it will now be zero by default.
> > - Rework the env_offset absolute in env/embedded.o to not use
> >    CONFIG_ENV_OFFSET as it was the only use of ENV_OFFSET within
> >    ENV_IS_IN_FLASH.
> > - Migrate all platforms.
> >
> > Cc: Wolfgang Denk <wd@denx.de>
> > Cc: Joe Hershberger <joe.hershberger@ni.com>
> > Cc: Patrick Delaunay <patrick.delaunay@st.com>
> > Cc: uboot-stm32@st-md-mailman.stormreply.com
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
>=20
> <snip>
>=20
> > diff --git a/include/configs/socfpga_common.h
> b/include/configs/socfpga_common.h
> > index baa214399ff9..05bfef75c0df 100644
> > --- a/include/configs/socfpga_common.h
> > +++ b/include/configs/socfpga_common.h
> > @@ -157,21 +157,13 @@ unsigned int cm_get_qspi_controller_clk_hz(void);
> >   /*
> >    * U-Boot environment
> >    */
> > -#if !defined(CONFIG_ENV_SIZE)
> > -#define CONFIG_ENV_SIZE			(8 * 1024)
> > -#endif
> >
> >   /* Environment for SDMMC boot */
> > -#if defined(CONFIG_ENV_IS_IN_MMC) && !defined(CONFIG_ENV_OFFSET)
> > +#if defined(CONFIG_ENV_IS_IN_MMC)
> >   #define CONFIG_SYS_MMC_ENV_DEV		0 /* device 0 */
> > -#define CONFIG_ENV_OFFSET		(34 * 512) /* just after the GPT */
> >   #endif
> >
> >   /* Environment for QSPI boot */
> > -#if defined(CONFIG_ENV_IS_IN_SPI_FLASH) && !defined(CONFIG_ENV_OFFSET)
> > -#define CONFIG_ENV_OFFSET		0x00100000
> > -#define CONFIG_ENV_SECT_SIZE		(64 * 1024)
> > -#endif
>=20
> Removing paragraphs like this one will break configs that haven't made it=
 to
> a mainline defconfig. E.g. for socfpga_socrates_defconfig, you can chose =
for
> the ENV to be saved in SPI instead of MMC as the config supports booting
> from all sources.
>=20
> How do we proceed with such things? I know that might be non-mainline, bu=
t I
> think throwing this info away is a step-back, not an improvement.
>=20
> [And don't get me wrong: this doesn't affect my downstream boards, they
> don't save/load env due to secure boot reasons anyway.]

So, I would be happy to see follow up series that add default values for
locations for various SoCs.  That would address the type of problem
you're talking about, I believe.

I'd be even happier if someone looked at how Zephyr takes a dts file and
generates a header and adapt that to a way for us to have some values be
read from a dts* file and turned into a define we can use at build time
(not just the OF_PLAT data).  That would be a real nice step forward :)

--=20
Tom

--pyCeQdzmoBo8zbAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl3UZBoACgkQh/n2NdMd
dlK06A//QbN/lVpe5vyUO1uCosuoyrUYz1G0T3NEQMoWnXNw+3Did1uZk0jnJY5N
rAQp7z5anmmPKrtty8VvlmrQJ7KVSJQZP8hSHIicCVFG4spdb3mApSbp9LjFT0QG
MXMmEysNZhoDqS2WMqzxFWOl/FfAvmkIP9xJzXrJMR21BxOfkBpv1eBafj4bZGwu
paQjm3avwtT5Qr4w6YU7c6X24pLw8hiHTxxpqHkbfyMprsMDKrCPD9YzraZj2+hw
mcGtCemmK8zwPN1S9tEOvY5hZ8so88fKoNBaQ+PxVtlMzz8H4/aR3AyhYIJ4ZhaN
xXbYkLAsFLe65JwVEW1gfFvC3auO3rImtoMlrnuFl4AxsW/QN+BzJcf720eigH4Y
vKJUnmmrfaauEjRWU7jVuU/9s/72vztqYhDna61ycCvsZ7eWlmLG5Atf3DAKcqCR
uFMdFl4sN6VCXJ0OPLUAp19U28+CpUaJY/ExGbAgOP3AcvNioIjO3/pBX4ntngB/
sVIJluuaFfyrUxT6ZJO1VZabyUHvkoz9HUSN6N6EnMZAW8wp561qaNa7QuuI7vTO
O6N5U6A1+sKEpaSjE8/JuWJIzK9YV8m8+m9STzF1hFW7e+wNUDDmXP+mFL23O4UV
3GeLY0VMp7Yxji338rZRFpavbFAYz4GaXUDy0NnWX965JHCpnUw=
=tXca
-----END PGP SIGNATURE-----

--pyCeQdzmoBo8zbAN--

--===============3456883071201365602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============3456883071201365602==--
