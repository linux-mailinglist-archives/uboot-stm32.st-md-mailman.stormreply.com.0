Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DD62961CC
	for <lists+uboot-stm32@lfdr.de>; Thu, 22 Oct 2020 17:41:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4878C3FAE0;
	Thu, 22 Oct 2020 15:41:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 943EDC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 15:41:29 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id k9so1876987qki.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Oct 2020 08:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0wW3FQ8YFGhzjTEViW9f4F3XyDnjtQU5xWh4Dj3XqvU=;
 b=QU0Zy4VK9W6X8U6Z8LIhV75of1UXP8I2JAw0w/AnZnvrRcagRCbvprrldFAgbKtLwf
 Z6jIxxVNvluGFqeRIjMOFvSkUqP3er1HfcD4kORjTfmTinwuZibmUA+UPMD2W9yXpMaG
 5BeDPdvi9jrKt52AT+hY/LWgjA8lSfbjA383s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0wW3FQ8YFGhzjTEViW9f4F3XyDnjtQU5xWh4Dj3XqvU=;
 b=jrDHu9uO+CTk0Nu2lbIZ2IUcIV1lcjSaa45qpPfMfhmRJFI/BvXBg/ImpVE1bkfqeH
 TZDmanHC8QBWw9NVYQClhlBcly+9WSn/rRX3wTUsdH1ybJVg4c5COMyfby0c8P55hUD9
 vq8oCx1oChmeWs6PHT0H6nqm88nNsCrHe9a9T44Vmiy4joHdWby5j5uxIpncBxYP0kpR
 RFcU8h4QXRnOTYfixwLLc1EjLgn69kFnl8Ypl1Phzq+fy+qG+9sRERa6sEdza4Prl1x9
 p1jQEpf2zjauTO1eXbqsR0dFaYtuDrowhFs6snnaW8iTv5CSUrvHv9HIfglx0h+YKSTM
 95GA==
X-Gm-Message-State: AOAM530u7KpQbB5IQjho/ZAXHfBO7RY8zNhQVlvxEYh1GI3FpRaLsIxJ
 XdxRcC+d07v9xFRci6uL9wgLYQ==
X-Google-Smtp-Source: ABdhPJxXcEfAteO9TDWOejmbM7x5nCdtbIqbUBqy9v/k08rlmBiRvICgkFdyjqgfBNxDXgp0sFcrhw==
X-Received: by 2002:a05:620a:5e9:: with SMTP id
 z9mr3120580qkg.275.1603381288145; 
 Thu, 22 Oct 2020 08:41:28 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-c561-3ead-25a2-b802.inf6.spectrum.com.
 [2606:a000:1401:8ebe:c561:3ead:25a2:b802])
 by smtp.gmail.com with ESMTPSA id d56sm1314752qte.34.2020.10.22.08.41.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Oct 2020 08:41:27 -0700 (PDT)
Date: Thu, 22 Oct 2020 11:41:25 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20201022154125.GL14816@bill-the-cat>
References: <727b802f645e4e779ae5b6b3cd250e85@SFHDAG2NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <727b802f645e4e779ae5b6b3cd250e85@SFHDAG2NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>,
 Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master =
	u-boot-stm32-20201021
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
Content-Type: multipart/mixed; boundary="===============6693911787452197394=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6693911787452197394==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8niZZQT61yyyENVh"
Content-Disposition: inline


--8niZZQT61yyyENVh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 07:32:44AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.01: u-boot=
-stm32-20201021
>=20
> - Activate CMD_EXPORTENV/CMD_IMPORTENV/CMD_ELF for STM32MP15 defconfig
> - Fix stm32prog command: parsing of FlashLayout without partition
> - Update MAINTAINERS for ARM STM STM32MP
> - Manage eth1addr on dh board with KS8851
> - Limit size of cacheable DDR in pre-reloc stage in stm32mp1
> - Use mmc_of_parse() to read host capabilities in mmc:sdmmc2 driver
>=20
> CI status:
>     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5066
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/mastert https://gitlab.denx.de/u-boot/custodians/=
u-boot-stm.git u-boot-stm32-20201021
>=20
> The following changes since commit 7ec87e4192215815b658c3f8b34e4be0101031=
49:
>=20
>   Merge tag 'u-boot-atmel-2021.01-b' of https://gitlab.denx.de/u-boot/cus=
todians/u-boot-atmel (2020-10-19 09:29:05 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20201021
>=20
> for you to fetch changes up to 53de79fecc53338b544b4d2c2d88daba9d82b007:
>=20
>   stm32mp: stm32prog: accept device without partition (2020-10-21 18:12:2=
0 +0200)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--8niZZQT61yyyENVh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl+RqCUACgkQFHw5/5Y0
tywlVgv/Slt7Tgowvbh6UiE5adQvws3iU+39f09rdZ8aS6Gs+RnjhqlqPT8JTXi+
lfMXl6qMNmrMqiL8Q/P0+Qbh8F8gspJjKF4rp4TRnoZ5+N/vTYiFSVSXTt4olt21
XTOLcqDdgLGd6kPHfXzm8F3kuuJCVG1Ao4n+Cl/B6Ng/Saa5AzKi+3iRyrF8HHqC
3WgZZpu84lTi6pAbElpm8FKLcBKleoC0iwJRfdeEOH+bJiGVgSGS1D1ahR0e7MFV
UPJIZ0PwDT4eZbQzhPKp/qVTfjFjpVf438g2Q0Di2EqKV3zjwUZg2QE8FKoW+Fvq
SDTUJ/gob6VJB3FbpbEli/F6j96nGoVPbkKydb+Xf9/7MJMuxGtN6q+1VY71ElCa
a4y9l1R+dNsRfN9sLQyKUAHAVJDsPg+xIxDjRh+6+FGF7Ly2fZxez6+fgDPSC/vO
GQOZzkbpdLG3GdoxXuyEbBS2HpBdD6BnjMMxU/bdQlLb0B71sSpqsVzihbgILcGK
bOrPzX+I
=NFRm
-----END PGP SIGNATURE-----

--8niZZQT61yyyENVh--

--===============6693911787452197394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6693911787452197394==--
