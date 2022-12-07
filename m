Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E568645CCC
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 15:40:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AECDEC6411C;
	Wed,  7 Dec 2022 14:40:15 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB0CDC64107
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 14:40:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id d1so28355526wrs.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Dec 2022 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1/XvdAZK92mtc7UpO9SvtYfnaAxdpyd8jzl/aehCu2k=;
 b=nsbw/B06U1ybIJfXUzJhhhYOJ3Vyb0GNDzSCHeqFfILKlTSOfHYdBrgxv9+wEGANTm
 dNKVuCemAn7Dv97LivQ0BSwmk5cN8aZPGpjfyD18F6Wnl5A2Ix2nrEbJ3qetQgZkN6tJ
 3BeslKNUfi/AnYURAQNPRzYNbSYmrdDbEYn88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/XvdAZK92mtc7UpO9SvtYfnaAxdpyd8jzl/aehCu2k=;
 b=JmWT/4QqzHqe3RyzK6gP+aJ0vmCp1+crnT0+9nliubN+WJWn5+r+RhcXQRcIi+68r4
 HeGIJGHqp4oYstPiNvEIMw0eSUlFy40/XTtkOR6kW1bUtfsRoZ+w3L+7ylmmQ2BRCrb8
 wopfT++dBS3wQCefk6qRtMMtM8xpZeCTENpelC04hjCMvYrPU1PTqQNUar2yzEpvrodB
 y9L2qxjrDXZBJ+gBOuOKfnXJXRLoLKZjscwV0NyVkjz7iOKoHe2zqqiu8VwlCJVHOSEr
 +mfCvJUlMu9l0TfvaZiCGmUO2irn1bnG+1tzWdFIGfcQLRZbKA5J+dDUuyOiLPjAR0hi
 iMRw==
X-Gm-Message-State: ANoB5plzVa8aJvj+hQa+9G4XKSZELSxKPVBtW+fCSGRNXP+yBAH20frj
 KzMLpNtZ9hbrUtAr/oj0RHxZOg==
X-Google-Smtp-Source: AA0mqf72m/CGo/wLGA9s4fRyIZ+1aQossYh0Mmkr7Y504PgePqUxXOU8qcXQX+8PoMEtLwuuF2Gx2A==
X-Received: by 2002:a5d:52d0:0:b0:241:c340:d1ea with SMTP id
 r16-20020a5d52d0000000b00241c340d1eamr49059626wrv.434.1670424014258; 
 Wed, 07 Dec 2022 06:40:14 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-158f-15c0-8c6a-f9d3.res6.spectrum.com.
 [2603:6081:7b00:6400:158f:15c0:8c6a:f9d3])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d4f8f000000b0024246991121sm14125387wru.116.2022.12.07.06.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:40:13 -0800 (PST)
Date: Wed, 7 Dec 2022 09:40:10 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <20221207144010.GR3787616@bill-the-cat>
References: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <20221207082644.3515486-1-patrick.delaunay@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Govindaraji Sivanantham <Govindaraji.Sivanantham@in.bosch.com>,
 Hiremath Gireesh <Gireesh.Hiremath@in.bosch.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot@lists.denx.de,
 Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 0/5] Complete the migration of
 MTDPARTS_DEFAULT / MTDIDS_DEFAULT
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
Content-Type: multipart/mixed; boundary="===============8202437169859529678=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============8202437169859529678==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HbFx+PhHHd6+QKHD"
Content-Disposition: inline


--HbFx+PhHHd6+QKHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 09:26:39AM +0100, Patrick Delaunay wrote:

> Addition for previous commit a331017c237c ("Complete migration of
> MTDPARTS_DEFAULT / MTDIDS_DEFAULT, include in environment")
>=20
> Remove the remaining defines MTDPARTS_DEFAULT and MTDIDS_DEFAULT
> in the configuration files (include/configs/*.h).
>=20
> After this serie, the only remaining references of these 2 defines are
> located in cmd/mtdparts.c and only for local purpose when
> CONFIG_MTDIDS_DEFAULT or CONFIG_MTDPART_DEFAULT are not defined.

Thanks for doing this! I suspect this means I can follow-up and remove
the defaults from cmd/mtparts.c later.

--=20
Tom

--HbFx+PhHHd6+QKHD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmOQpcoACgkQFHw5/5Y0
tyyLLwv/byguP5XtNijlQEhPsBY+EZR8TalwwQ3bGV5o480J9j2V3O+Ploo7LO3Q
QDDmvj4k7K7sKWgGvi0Gm7omS/C5KXxqwt6suYyJUCFMNovHXix74uVW3S837pa3
zXCuSO86lGEIsLaIvbzz3o6Opk2I7Zl98/bw2CpuWuQZmsjvIW2pymE7cAPpGTqO
2Ma9YXbUVqQF6rnalun1c/x4M2KWxps+BLXnarKGm0jzrFvsM2dwTNQs+KGaCg/l
i2CaCBil1s6zYt+CC+XrtnVPfy3HUQA1qwSkzRQcrjFAHg4G8M29ktzUK6PiKXcW
xDjnpGlOntj+Z00Ila2ctExEg5W55gvSMJvyZLcI5oHU54t0K0wSGdzfIaYsfPuP
vvRczZOoa/9cs/ozdR5cU7liPiPorO4axdeLDQbwD0h3JnN0jEQi+JqIIhMf5Wu+
zbXAOUedzsfnybqROw+e+6aR9yGCEhwV+S7XHaLWTl9NQskdoW9iYeItTGU1MYUk
uEc3uTml
=80lp
-----END PGP SIGNATURE-----

--HbFx+PhHHd6+QKHD--

--===============8202437169859529678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============8202437169859529678==--
