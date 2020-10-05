Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5A283D03
	for <lists+uboot-stm32@lfdr.de>; Mon,  5 Oct 2020 19:05:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC99CC32EA6;
	Mon,  5 Oct 2020 17:05:41 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 698DBC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 17:05:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id q26so4994795qtb.5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 10:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cXk42LJ0LgiBZUt6gykW/DBPVi6T+vnUbjvKrPd0ut8=;
 b=rbvvV02bFbdnw6zioypp/roR0Nr6/FneyDl0tqO2PnbC2u9tfjDZaNCpLUGj0ofIBI
 K5tDqEBjvqwk6AZKNTQecNTFNUnCDSsKRT3TLKcUG9UsGZ5ropapnVwgWN7+2J6wXw8+
 FoboJZkZ2PGgZClbrF90iB54Xh46Lhab+343s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cXk42LJ0LgiBZUt6gykW/DBPVi6T+vnUbjvKrPd0ut8=;
 b=AQd2CK2xulHwyt0uvQFFgDhKCu0fmInZBK1pO0gGDBmbFYhHHFFBg9fX+az+0Vh7bi
 9zL86/qUj6MML0yvAVK7iGOASo1HunqdYqU73iV1DlZZPuUXtdRrBvdwW0cNDQV+HfHr
 bkh9lHRqponG9NiSgE0AZbuWhCEo96JZUfppdjbcca3fFevXVLN5giQdTZYs7CD+gC/T
 D6ncZHB62K38MQSHLCCluuNuPP56zYWDmemc78g3Zz7dSYM5jwfp8PnbEfNwmS8XzmCT
 42UwBWoFYey1TH1VQg5kgp636f/3BHl19ooVEw2UwD005IRtXTx7PW6sa58o61dqvibK
 uM7A==
X-Gm-Message-State: AOAM530KGRHQJAWxH16vM/PCGs56jvGq6FnxMukXp64742m8SrrzNog8
 UaMFIutO75wo/Qr7BTm8AQKY3A==
X-Google-Smtp-Source: ABdhPJy1t5a3YnF13ZIZQGtgBbpNRLE5n/pTRXMlsGt7i/PYfOyXb63XuzlyldfaiajS/Y2ZgBWDLg==
X-Received: by 2002:ac8:24cb:: with SMTP id t11mr890437qtt.264.1601917539214; 
 Mon, 05 Oct 2020 10:05:39 -0700 (PDT)
Received: from bill-the-cat
 (2606-a000-1401-8ebe-8561-a59a-80cb-9765.inf6.spectrum.com.
 [2606:a000:1401:8ebe:8561:a59a:80cb:9765])
 by smtp.gmail.com with ESMTPSA id u90sm244756qtd.29.2020.10.05.10.05.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Oct 2020 10:05:38 -0700 (PDT)
Date: Mon, 5 Oct 2020 13:05:36 -0400
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>
Message-ID: <20201005170536.GN14816@bill-the-cat>
References: <bf117b87ae7e491ea725c59f70280410@SFHDAG6NODE3.st.com>
MIME-Version: 1.0
In-Reply-To: <bf117b87ae7e491ea725c59f70280410@SFHDAG6NODE3.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot-stm/next =
	u-boot-stm32-20201003
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
Content-Type: multipart/mixed; boundary="===============4655176774420412069=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============4655176774420412069==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rVPS4UCb/fKT3936"
Content-Disposition: inline


--rVPS4UCb/fKT3936
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 05, 2020 at 08:44:45AM +0000, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/next: u-boot-stm32-20201=
003
>=20
> With STM32 updates for v2021.01-rc1:
> - stm32mp: DT alignment with Linux 5.9-rc4
> - stm32mp: convert drivers to APIs which support live DT
> - stm32mp: gpio: minor fixes
>=20
> CI status:
>     https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/4880
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/next https://gitlab.denx.de/u-boot/custodians/u-b=
oot-stm.git u-boot-stm32-20201003
>=20
>=20
> The following changes since commit 7e373a1a6ac27492ffebba146d70c4d39a9b9f=
36:
>=20
>   Merge branch 'next' of git://git.denx.de/u-boot-usb into next (2020-10-=
01 14:52:56 -0400)
>=20
> are available in the Git repository at:
>=20
>   https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git tags/u-boot-stm=
32-20201003
>=20
> for you to fetch changes up to 04e29ca5bbb82f15d7a32d4130214c6a15db69aa:
>=20
>   mailbox: stm32_ipcc: Convert to use APIs which support live DT (2020-10=
-02 15:05:14 +0200)
>=20

Applied to u-boot/next, thanks!

--=20
Tom

--rVPS4UCb/fKT3936
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl97Ul0ACgkQFHw5/5Y0
tyyp9gv/Tt+ekhImxBzaCbWzg2isejZEH3RPum0ZeMCKK+sxqWoSREU2UCMVr5ts
RVSE8xD5hlPL08KL0K+L2hxDLsm8ypBL7iJC5e9NkRmfo+Vf1S4VF4IplCcg14O9
wmBNTRfqINiejPhVLP8ek8lDPF3tkqiR4nYobpAxmuf2hZE5F5X9RC6sEeSR1pqV
xdn0Z0lw+GKWUz/hs44U/06jb8f4zHkVDl8dawS7yp4ZdU8Bj92+ju3D+tTpmisS
+TQBNyxGXdgfThCzlsT66hYmmeQSqTwTsk1tro/rfiet9DVNEolwB63nDtgEhDqE
G+VtAxIVegZp8mULmpb36zkqmf2FkzAMsVrsGVsrRDc6X+TT11Rp7JFi8KI307Wk
IF1pnsunTi0LRn5yFyDU39XZsWz2398/T3bHwR4IvMosAQsoJAwi9C1PlOlzDGu0
9BzGEUiCDhkwUSAH3E049RQrX53EEY5aGxXKe6bXlsltgu88G01MQoBKll6K3KEf
feC1IVW/
=V9RR
-----END PGP SIGNATURE-----

--rVPS4UCb/fKT3936--

--===============4655176774420412069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============4655176774420412069==--
