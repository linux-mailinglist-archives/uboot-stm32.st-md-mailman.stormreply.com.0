Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB3626B3A
	for <lists+uboot-stm32@lfdr.de>; Sat, 12 Nov 2022 20:21:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59EE1C65056;
	Sat, 12 Nov 2022 19:21:22 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC7E0C65050
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Nov 2022 19:21:20 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id x13so5563526qvn.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Nov 2022 11:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eZXXTHVONVgYsH7OiKgAcvIRfAgNQPJ41PhXXjyF/dI=;
 b=X3DHccgAIU5Q6iaoYLTCSbqdzJgSPlCHPMi3IOAvZ+27Y4ixAfvaGbj3eUL2iemmAg
 MgtRFXBUXLXIUIlDUASIkCbhVt/wBK9JrYmk7mNrOy57aveIEYXecSdU7Cbwy1yDxvDT
 cWNllZ6IPFUUiyzEsjraM6C5rxCgFNP3cOBoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZXXTHVONVgYsH7OiKgAcvIRfAgNQPJ41PhXXjyF/dI=;
 b=jyF5UW40w1WG0OYI4pgXD92Y/ORPPOG5/8MrgxZKYGX/oYm8Jt0G4ZBhMGAZSs5Wp9
 EWgRuXcv/vE7F9l0p6y4R6AQwx+o1d6GzXlj5ia4kUdMs3pQfFbqgEyvklhvIlFGK9k2
 Fv5zXKEZ5i4eIkVDxYOCy+Dr0eXvnPmwH4F0vQussHfiW1Jf4ZnpTonDmGXUYVtmKtZt
 CefUNHvlhQOr2r1Ku5ui5eQKBAXQy4DNvR8gG07HGRGXTyoOgICHMvJ0fzJFOyLq8Whr
 lh7WHvx2CVZCfMaf/dF6Iu2bZiKvolBp6tX89YslWO0heI3VFPDUTBgjUG7FN9gQMza5
 8kog==
X-Gm-Message-State: ANoB5pmcRfEnPXlULcKLIkDQOJL8cWi4p4TXw+afJTFHtRJDt0pPjRfp
 vs5pQ8DIgDDodMY5gqVaGYvUJzj+qfW6ng==
X-Google-Smtp-Source: AA0mqf4x8dIyxnsNmBcYfUGalCdPmngdJvuKLLjkGVAgwtGcYuie6jxpYtyBqF4Rh3+GqdaX1c19sA==
X-Received: by 2002:a0c:b38d:0:b0:4b1:a69f:e958 with SMTP id
 t13-20020a0cb38d000000b004b1a69fe958mr6820072qve.107.1668280879553; 
 Sat, 12 Nov 2022 11:21:19 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-d5d0-b110-a961-621d.res6.spectrum.com.
 [2603:6081:7b00:6400:d5d0:b110:a961:621d])
 by smtp.gmail.com with ESMTPSA id
 cm26-20020a05622a251a00b0039cc82a319asm3181479qtb.76.2022.11.12.11.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Nov 2022 11:21:19 -0800 (PST)
Date: Sat, 12 Nov 2022 14:21:16 -0500
From: Tom Rini <trini@konsulko.com>
To: Simon Glass <sjg@chromium.org>
Message-ID: <20221112192116.GK7282@bill-the-cat>
References: <20221110104905.3076915-1-patrick.delaunay@foss.st.com>
 <CAPnjgZ2TKaQZJk4bGnLVZ9uqFLEfMQt+qm=q5FBn-sJKhaOKPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ2TKaQZJk4bGnLVZ9uqFLEfMQt+qm=q5FBn-sJKhaOKPw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Peng Fan <peng.fan@nxp.com>, Wolfgang Denk <wd@denx.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, u-boot@lists.denx.de,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 0/8] env: mmc: improvements and corrections
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
Content-Type: multipart/mixed; boundary="===============4159588476865844595=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4159588476865844595==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4VrXvz3cwkc87Wze"
Content-Disposition: inline


--4VrXvz3cwkc87Wze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2022 at 01:40:32PM -0700, Simon Glass wrote:
> Hi Patrick,
>=20
> On Thu, 10 Nov 2022 at 03:49, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
> >
> >
> > Update in U-Boot env mmc backend with several cosmetic changes or
> > corrections and 2 new features:
> >
> > 1/ CONFIG_ENV_MMC_USE_DT =3D no more use CONFIG_ENV_OFFSET
> >    in the mmc ENV backend when this config is activated.
> >
> >    Requested by the STM32MP STMicroelectronics boards which activate
> >    several ENV_IS_IN_XXX; the value of CONFIG_ENV_OFFSET is invalid for
> >    SD-Card / eMMC boot; this offset should only used in SPIFlash backend
> >    (sf.c) for SPI-NOR boot.
> >
> >    If this offset is used on mmc backend, when partition name in GPT is
> >    not aligned with  U-Boot DT: "u-boot,mmc-env-partition", the behavior
> >    is difficult to debug: a partition is corrupted on 'env save' comman=
d.
> >
> > 2/ selects the GPT env partition by the "u-boot-env" type GUID introduc=
ed
> >    by the commit c0364ce1c695 ("doc/README.gpt: define partition
> >    type GUID for U-Boot environment")
> >
> >    This feature can also avoid issue when 'u-boot-env' partition name
> >    change in GPT partitioning but not in the U-Boot DT with
> >    "u-boot,mmc-env-partition"
> >
> > Few check patch warnings remained in the series,
> > but after check I can't remove them :
> >
> > - IS_ENABLED(ENV_MMC_HWPART_REDUND) is normally used as
> >   IS_ENABLED(CONFIG_ENV_MMC_HWPART_REDUND)
> >   =3D> ENV_MMC_HWPART_REDUND is locally defined in this file it is not
> >      a real CONFIG but I can use the IS_ENABLED() macro as it is defined
> >      to 1
> >
> > - Use 'if (IS_ENABLED(CONFIG...))' instead of '#if or #ifdef' where
> >   possible
> >   + CONFIG_PARTITION_TYPE_GUID =3D> info.type_guid existence
> >   + CONFIG_ENV_OFFSET_REDUND and CONFIG_ENV_MMC_USE_DT =3D> only for de=
fine
> >
> > As I miss the merge window, not targeted for v2023.01 but for next
> > v2023.04.
>=20
> Shouldn't this all move to device tree? Using CONFIG options is such a
> mess. We have the devices in DT so can indicate which ones have an
> environment and what the parameters are for each.

And there's already the
Documentation/devicetree/bindings/nvmem/u-boot,env.yaml to build upon.

--=20
Tom

--4VrXvz3cwkc87Wze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmNv8ikACgkQFHw5/5Y0
tyxE/gwAikp3K2ebjtKJILfiWA3SdsqpTQ36EMs0l1XAL8cIl59T18n5btaHuJnn
GTAuTD6gSb+xfnQcFbr/Is22ABo9uInrllkCuXv58ohqOpoGAnyyfxAhVkbcMRBZ
t5HnZ/MOxu8eAfqf1J/eLpDCtcwHshzaH8/+uR837n3c8vVsmdGzPzmA88vm8Vwj
74H3YCXS0CLQOFu2kjd568LSEkznpJpXqznAWXQzc+KQ/vMHqUEwBnFXKNcVydnR
2zqkzXkjIZ5SyiVkaJbNAyHv+n/45yxI5yGhMGon4dESbPe0BVcIPhvAyup0HvhP
9SC+6zf2KNIs86h+sywbENK5CAmMrDTGLt2Ij1XwedWq//Cfrw+a3L6UzpdtTBHd
AzhDJLE2Xck0VNw4iFZwosQn6/iB4cpYLaxVrM5DuUkH5osi1HdC2ChX78xK40mU
aChwUjhyZZcd0wa9MKXDPpJQBa/L/krVBx+qlsd9qWW2Xemx/WvpHvAH0Oye8fyC
8jdmbZ6X
=yqkK
-----END PGP SIGNATURE-----

--4VrXvz3cwkc87Wze--

--===============4159588476865844595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4159588476865844595==--
