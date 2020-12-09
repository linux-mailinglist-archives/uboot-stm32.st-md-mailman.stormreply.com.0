Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D782D4AFB
	for <lists+uboot-stm32@lfdr.de>; Wed,  9 Dec 2020 20:52:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECDFFC3FADA;
	Wed,  9 Dec 2020 19:52:30 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A192EC32E90
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 19:52:28 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id f14so1863334qto.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Dec 2020 11:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xJyJLWoe+1ZxbN5TFId0S/UUTB4TKCtd/QESkMa5pgI=;
 b=MCVz9K5yzjeF7kbpCszcKpY0NEcfDow6wo18oiPst2qGBj0WZoxQBxyIsI2UxwzBFx
 TEDpnNWmYDmusS63PLFRYK5siqJdossUf9IjDNnUME45QKlCZ2H63YchKSl5402moUwp
 lmXG4/zpmea6Oygv+N/ULB5V3E7aBDeBGm23I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xJyJLWoe+1ZxbN5TFId0S/UUTB4TKCtd/QESkMa5pgI=;
 b=obgrEgoCIOCAh/N6PtdJAl1hshJ58K5yiXuhlgfBgdk3KSW3dU7lJlXjQlVe/h6mJy
 diboh+XxsN6C7w6cl4isBZ0mKivKkA8Gb3K6xH0LNX6WGWUTQ//ziKYByBcS8AiNvwcj
 LJkjTU9Lc2eXUF0JmdhfG0e2gleLB1QyQKZOP25s5qKOANQeYd6H4SI1XJmpC+eCISIt
 dmzawxE6H73yThWte/FU78XW+awE5bBYwBX5QUSIjJ0Ojl8dYQ7C/TgN6RNXNgC09clo
 MBqah07aBt3m97vBzF8U4EMu98y7trLZlHIEU+OrJvN1Svp6f7wYvJV3bv6l4YbEMXnj
 PhPw==
X-Gm-Message-State: AOAM533a6TtP8bV86eXlevdBAO7YMDQGQbd/N5uosqDAQkCfNB4vkTqI
 NM67vZja+fgsF7YwyDqejBAy1A==
X-Google-Smtp-Source: ABdhPJz+JqWLRO4kg6wT9xu5qReenEGpMKPWqnZiSImTGf5oZ57JRU0UZ03slSa4fao5CrBEsVRKog==
X-Received: by 2002:ac8:454e:: with SMTP id z14mr4800159qtn.120.1607543547850; 
 Wed, 09 Dec 2020 11:52:27 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-135-175.ec.res.rr.com.
 [65.184.135.175])
 by smtp.gmail.com with ESMTPSA id b19sm1703878qtr.39.2020.12.09.11.52.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 09 Dec 2020 11:52:27 -0800 (PST)
Date: Wed, 9 Dec 2020 14:52:24 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20201209195224.GU32272@bill-the-cat>
References: <470f1711-3a45-9490-d561-6b34d11d5b63@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <470f1711-3a45-9490-d561-6b34d11d5b63@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marek Vasut <marex@denx.de>, u-boot@lists.denx.de,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Manuel Reis <mluis.reis@gmail.com>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master =
	u-boot-stm32-20201209
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
Content-Type: multipart/mixed; boundary="===============7250846225994390258=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============7250846225994390258==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y9sq6d1BrjS7gjNl"
Content-Disposition: inline


--y9sq6d1BrjS7gjNl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 09, 2020 at 04:11:06PM +0100, Patrick DELAUNAY wrote:

>=20
> Hi Tom,
>=20
> Please pull the STM32 related patches for u-boot/master, v2021.01:
> u-boot-stm32-20201209
>=20
> - Manage CONFIG_ENV_EXT4_DEVICE_AND_PART in stm32mp1 board
> - Update ARM STI and ARM STM STM32MP Arch maintainers emails
> - Enable internal pull-ups for SDMMC1 on DHCOM SoM
>=20
> CI status:
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/5518
>=20
> Thanks,
> Patrick
>=20
> git request-pull origin/master
> https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> u-boot-stm32-20201209
>=20
> The following changes since commit ec79f5ce2202cf6c56e5eb1eb755604b534ae0=
8b:
>=20
> =A0 Merge https://gitlab.denx.de/u-boot/custodians/u-boot-marvell (2020-1=
2-07
> 11:46:12 -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> tags/u-boot-stm32-20201209
>=20
> for you to fetch changes up to 9b36b7dc96baedc0ed506246a9822c745cc65b45:
>=20
> =A0 ARM: dts: stm32: Add USB OTG ID pin on DH AV96 (2020-12-09 10:57:50 +=
0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--y9sq6d1BrjS7gjNl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAl/RKvUACgkQFHw5/5Y0
tyzZqgv/SdoS/JO6c+LRQHT/jbQjd9sTPyfZYHTvfB6DSN0l3hjriEus4BZgzTnC
JQojoTuAL5qWYboDa4B/Jvxb/3Ir4u+tQJ6eh8g+9ulda0hudQI6EMJ2nLIeo6Pg
BEwssjU3l8D8rjCVsVvC8o8Ha76iXd8yk3QZLBvQPLvyib6Bj68VC1bW9XNVaTqf
u2MKqQhz8eTvUzFLN4CbMWDcMjpQBIcohc8tVnQVtINIbOxVB8QCUduHVgkFMUf/
olvxHrjR6gCOgTxMy2ptZpWHzrFR87tv5a0uDIORYDgPFU/0vsgZrz2O66SvOSFt
hUr0WFTYXxglqN+JYQhgIP2D1tkyNf1NTKOJ/nA2wvRB1eZBYIyTNjaNhZE51rUB
1WXLriSe8pfMRI6B3v0ZU6AEQ1eG0AH3M2FhFxxwbLQcgZdSC+Bg41kTiMyvr/MT
njs7usD7FOqUehhhxPbDwo4u/kHrilmK5voXwB+NHk22thtmpFaBAl33E11lzIQe
DhwT3vkn
=Qfhc
-----END PGP SIGNATURE-----

--y9sq6d1BrjS7gjNl--

--===============7250846225994390258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============7250846225994390258==--
