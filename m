Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD366051A
	for <lists+uboot-stm32@lfdr.de>; Fri,  6 Jan 2023 17:52:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67487C69060;
	Fri,  6 Jan 2023 16:52:55 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E140FC6905D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jan 2023 16:52:53 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id a16so2442217qtw.10
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Jan 2023 08:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=d68kbFeWw68nc5Se9UJRHNLXOz6kH9dzv3+K5mGBSRM=;
 b=h7qmeB46SvzqmNK7il4MjcQ8zuJbAF/neeF6SsuckZZGan6u4Z6l8SJkVC2KDGZQQ8
 AxQWP4Framje90fSAwIMpfNaknspOr5/5q0kQDWj7C71ImFaiGO7Z+ctwh4tYXCYTR1H
 1zDXd9tK8caVKI5uzX3KX5e7waThGmOHvYKUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d68kbFeWw68nc5Se9UJRHNLXOz6kH9dzv3+K5mGBSRM=;
 b=SJyFfek2NLK85WzPzgDqJluKsIPMRMvDwnhS9AyiHMeYYxt+kXLMGOMEggTAa84Zlq
 /6/RL4lPe9TeYsihKZrhqOKq66Zbj7kFKo91BmIkiAylCxrCE57R3qd+6qO59Rx/tYK+
 IBguOG7txtbO4c16GyyKa9dtzG0/PgEwyo6BExzdlIfhupqcPH9Plfc22RnfXGkA8cqC
 Qg79Zx7oihQ38RiPIKGa+9bOUZKzhlbqCQNfsPsNFAdlteF7q2/t42vp0J0BBqlM4Fic
 76NizF6Vi28CkFP3jaF2VSJCn/cQLmXIXn9bZcY+fSYp5H7Tvuh7L1iXtNQ1dLinGy00
 Sc4A==
X-Gm-Message-State: AFqh2kpo1xp5r1d9EpGOE6fG1KBlHjoS7fjE61zkoQEYSnnNERGWlXSn
 wpXW9ag0m0eTpa0n9MOZX2AO7BRKDgElBb3qPPo=
X-Google-Smtp-Source: AMrXdXs3+q2QzjLXSuhXoB9M4K3yBel8vEnIOhNG9DsX/n4Pq22kGrogAfX76XdYELT1p867tDcXDw==
X-Received: by 2002:ac8:4705:0:b0:3ab:5a62:453b with SMTP id
 f5-20020ac84705000000b003ab5a62453bmr71215120qtp.53.1673023972818; 
 Fri, 06 Jan 2023 08:52:52 -0800 (PST)
Received: from bill-the-cat
 (2603-6081-7b00-6400-9162-adb5-1773-34c0.res6.spectrum.com.
 [2603:6081:7b00:6400:9162:adb5:1773:34c0])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05620a440700b006fb112f512csm771218qkp.74.2023.01.06.08.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 08:52:52 -0800 (PST)
Date: Fri, 6 Jan 2023 11:52:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <20230106165250.GD3787616@bill-the-cat>
References: <348bc74e-fb7c-3911-680a-b6dff96a70b4@foss.st.com>
MIME-Version: 1.0
In-Reply-To: <348bc74e-fb7c-3911-680a-b6dff96a70b4@foss.st.com>
X-Clacks-Overhead: GNU Terry Pratchett
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Marek Vasut <marex@denx.de>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PULL] Pull request for u-boot master / v2023.01
 = u-boot-stm32-20230106
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
Content-Type: multipart/mixed; boundary="===============6058624783272327172=="
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


--===============6058624783272327172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ArpPm2uaigKwCCI4"
Content-Disposition: inline


--ArpPm2uaigKwCCI4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 11:48:54AM +0100, Patrick DELAUNAY wrote:

> Hi Tom,
>=20
> Please pull the STM32 related fixes for u-boot/master, v2023.01:
> u-boot-stm32-20230106
>=20
>=20
> - stm32mp: Fix board_get_usable_ram_top(): workaround to avoid issue after
> the
>=20
> =A0 commit 777aaaa706b ("common/memsize.c: Fix get_effective_memsize() to
> check
>=20
> =A0 for overflow") because the effective DDR effective size is reduce by =
4KiB
> =A0 and sometime the board hang on boot
>=20
>=20
> CI status:
> https://source.denx.de/u-boot/custodians/u-boot-stm/-/pipelines/14623
>=20
>=20
> This last patch for v2023.01 avoids a hang on 1GB DDR STM32MP15 board
> detected
>=20
> by Marek and caused by Pali patch.
>=20
>=20
> For my point a view , this patch is an acceptable workaround for master
> branch and v2023.01 delivery
>=20
> but the initial patch should be revisited or reverted (in master or in ne=
xt
> ?).
>=20
>=20
> For details see comments in patch
>=20
> "arm: stm32mp: Fix board_get_usable_ram_top() again"
>=20
> http://patchwork.ozlabs.org/project/uboot/patch/20230105012222.238075-1-m=
arex@denx.de/
>=20
> https://lore.kernel.org/u-boot/20230105012222.238075-1-marex@denx.de/

Yes, I want to see how this progresses, thanks for taking a work-around
for now.  But for now I have also posted a revert, to help spur
discussion.

>=20
> Thanks,
> Patrick
>=20
> =3D=3D=3D=3D=3D
>=20
>=20
> The following changes since commit 8d6cbf5e6bc4e10e38b954763fa025caed517c=
c2:
>=20
> =A0 Merge tag 'efi-2023-01-rc5-3' of
> https://source.denx.de/u-boot/custodians/u-boot-efi (2023-01-04 08:50:24
> -0500)
>=20
> are available in the Git repository at:
>=20
> =A0 https://gitlab.denx.de/u-boot/custodians/u-boot-stm.git
> tags/u-boot-stm32-20230106
>=20
> for you to fetch changes up to a2e0b041d662e4c80502cd5c9a8326d026f9deb1:
>=20
> =A0 arm: stm32mp: Fix board_get_usable_ram_top() again (2023-01-06 11:02:=
17
> +0100)
>=20

Applied to u-boot/master, thanks!

--=20
Tom

--ArpPm2uaigKwCCI4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmO4UeIACgkQFHw5/5Y0
tywCrAv/aE4/XGLAeSIhWuwe6mXHEhCFkQlTTlsseQiyOgYwbNWCQX8mb5JwBNpR
Aycgx9yvQjU1+DCe6Is9KETlZE58n+aZV21z2tG6CG4bfoukR+E4YeZnQi887jgH
rUhUBG/R0fsjWgB8G0+ZDuh466Pwbm7QGEipQ2rNeblMdwKxQfJspckm3n4Q7keG
jeU0gKvNLxaBIEYmbK2WsvDCIeMVREK8W7U8o2EglFKZQ9tuwEE1AYYWBo7a43SS
a6ZB2NULQ3bEKqBzxViBphNOPzuRU7hsUIefZGRJHlyYIpAodx58zFCyKugA41XD
CB3dYyxK2kPrVv87p4kdaZHBCKELXQPr6H17cjJ6RAcuWIAHU+HF/yxFlZDqWno6
TekphBRnbRXPSEdt26YapLqaYaBvb23Vym3Xg4vvHOMblm8qidm58sKSZFyIOgEa
P1LkqUX6MQkoLpoefni8Jr9wztZBdiu8Kiuj0cSgZV5crDn+CYjDJ5x+wGOf50pe
b6CP8hSW
=79I6
-----END PGP SIGNATURE-----

--ArpPm2uaigKwCCI4--

--===============6058624783272327172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

--===============6058624783272327172==--
