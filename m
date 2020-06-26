Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC620BAB2
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 22:54:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E12FC36B0B
	for <lists+uboot-stm32@lfdr.de>; Fri, 26 Jun 2020 20:54:53 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B12DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:54:51 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id p7so5112072qvl.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 13:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=z9DAriiD9RMisLCe9NXZODzIVTml3Rkqz2cEVfSgiYA=;
 b=M2AKIHvxwlnTGF1yYwjCXAAVt+PnMC/nMB3ISltZ6x3N3PBlzdZPB8IuEaTvIHRpeP
 OmiVH0iqYaUG+Hu1LO+YtHY2iN+mrocalIG4RcxtXXK9IUwJgkUAmiDz8cPL82lQt0ly
 QzwhHC1vyXnBy0w4yM6ClR9lmZA1UKN40BwQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=z9DAriiD9RMisLCe9NXZODzIVTml3Rkqz2cEVfSgiYA=;
 b=KcrGAx2UgT1/1GZ/iai6ZweYzoqVMa2z2nB7doI7QY4x8nu0uwrsP8nQy1ayyTtCE4
 BDx0Y0DHJWjrkhZcK6nNC7RqaWxAw35PZSLVbG7BpkKlVYSF1VXNWaYJKi84MRv213po
 W4yQG7xcG4Cm8pZIEmi5IRlupIEGnoJN2H6zApjl65aJQUAxtDIaaiM/xH7EldBfEpC0
 i7wu5y8SuDRabVEEIQtk/YhySOe5LC7mbwEGftr1vs13obAoFquJEugx6iRA67+Hq3ZJ
 /Mbd9vJzjwkazxilcMrGqRuULDe6yop59Hz6v+Zvw5X2lF8fhGqREDkCdtR6KBM685LA
 43cA==
X-Gm-Message-State: AOAM533MbqUdnospQ7y6OHyE5uNqcYTK43qfcVtvxs0oFryqRMVsdt+d
 GL/GBkIYen9fLUkjgQYck6u/CQ==
X-Google-Smtp-Source: ABdhPJxlFz4ah0RtcZGfsF24A92U+2jVbd1oqBnUxXzeYmCrV2+DpzRd0BRkORxHRENGV/fm7DtmAA==
X-Received: by 2002:a05:6214:a0a:: with SMTP id
 dw10mr5174106qvb.200.1593204890842; 
 Fri, 26 Jun 2020 13:54:50 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8080-bd3e-bf60-4b70-2dd4.inf6.spectrum.com.
 [2606:a000:1401:8080:bd3e:bf60:4b70:2dd4])
 by smtp.gmail.com with ESMTPSA id p128sm7388571qka.47.2020.06.26.13.54.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Jun 2020 13:54:49 -0700 (PDT)
Date: Fri, 26 Jun 2020 16:54:47 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick Delaunay <patrick.delaunay@st.com>
Message-ID: <20200626205447.GE8432@bill-the-cat>
References: <20200625075958.9868-1-patrick.delaunay@st.com>
 <20200625075958.9868-9-patrick.delaunay@st.com>
MIME-Version: 1.0
In-Reply-To: <20200625075958.9868-9-patrick.delaunay@st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Joel Johnson <mrjoel@lixil.net>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>, Wolfgang Denk <wd@denx.de>,
 Frank Wunderlich <frank-w@public-files.de>,
 Joe Hershberger <joe.hershberger@ni.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Anup Patel <Anup.Patel@wdc.com>, Lukasz Majewski <lukma@denx.de>,
 Patrice Chotard <patrice.chotard@st.com>, u-boot@lists.denx.de,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Ramon Fried <rfried.dev@gmail.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Sam Protsenko <joe.skb7@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Uboot-stm32] [PATCH v3 08/14] cmd: env: add env select command
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
Content-Type: multipart/mixed; boundary="===============1055726296804325696=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============1055726296804325696==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ytgo/kJyDF3J5kSH"
Content-Disposition: inline


--Ytgo/kJyDF3J5kSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:59:52AM +0200, Patrick Delaunay wrote:

> Add the new command 'env select' to force the persistent storage
> of environment, saved in gd->env_load_prio.
>=20
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
[snip]
> +	/* search priority by driver */
> +	for (prio =3D 0; (drv =3D env_driver_lookup(ENVOP_INIT, prio)); prio++)=
 {
> +		if (entry->location =3D=3D env_get_location(ENVOP_LOAD, prio)) {
> +			/* when priority change, reset the ENV flags */
> +			if (gd->env_load_prio !=3D prio) {
> +				gd->env_load_prio =3D prio;
> +				gd->env_valid =3D ENV_INVALID;
> +				gd->flags &=3D ~GD_FLG_ENV_DEFAULT;
> +			}
> +			printf("OK\n");
> +			return 0;
> +		}
> +	}

So, after we do this, is some follow up env command required to
initialize the environment to now exist somewhere else?  Or will we have
initialized all configured locations during boot, and don't have to?
But what will happen if we select say "nand" but it's not present so
didn't init.  Will things fail gracefully (not panic) ?  Thanks!

--=20
Tom

--Ytgo/kJyDF3J5kSH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl72YJAACgkQFHw5/5Y0
tywRpQv+MlwLh9gDK+jysir4GUOsTMFxD/4lqbenYJ5STYGauRVLcDRZzwGvyIrB
Beo2bNHCTOmPpo3rqRzrhD5rM4ncMAJdMGutA4SbJeB3uGM1DxbPO2WUQIsKmQ0M
SdD+QoVgVvYse7BJX6Y0QH6CZQzkh4IJy6sKfKplr4ENXJSITpwpBBCdMw1fp4Iy
MorXbebESZZsap2wJLaS8yZj8cc6vvkoKAeAbrn2D9OFIsm0HIxU4xI8xMOJF0y4
NbQuoHBuBojL4mBC7c9D2krMZa3V+zfutaa7MjB2KNmMtCxF2ikS/MQ71lOs0rqv
quARJPIcvZL8ReteuewZC/wG7ThRyOQ9sVBd+UT2WLZ90CICbjOIPr9Ra4QFXU56
VF/15O95Et3MgwrZyNbFVfJyvrv2m+SLDtcpsaXKQHw6tok0FRhR9MfjUNr9v0Zw
Vf1B+03R6MF0FrZnmtJUDj1NjID2RHSuOHByi9oCo6f9VC1O6LNe01XKPaWjQvi5
Q+B7Dnrw
=xamK
-----END PGP SIGNATURE-----

--Ytgo/kJyDF3J5kSH--

--===============1055726296804325696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============1055726296804325696==--
